return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/nvim-cmp' },
      { 'L3MON4D3/LuaSnip' },
      { 'folke/neodev.nvim' },
      { 'folke/neoconf.nvim' },
      { 'j-hui/fidget.nvim', opts = {} },
    },
    event = { 'BufReadPre', 'BufNewFile' },
    lazy = false,
    config = function()
      require('neoconf').setup {}
      require('neodev').setup {}
      local lsp_zero = require 'lsp-zero'

      require('mason-lspconfig').setup {
        ensure_installed = {
          'tsserver',
          'rust_analyzer',
          'pyright',
          'lua_ls',
          'ruff_lsp',
        },
        handlers = {
          lsp_zero.default_setup,
          tsserver = function()
            require('lspconfig').tsserver.setup {
              single_file_support = false,
              ---@diagnostic disable-next-line: missing-fields
              settings = {},
            }
          end,
          ruff_lsp = function() require('lspconfig').ruff_lsp.setup {} end,
          pyright = function()
            require('lspconfig').pyright.setup {
              settings = {
                ---@diagnostic disable-next-line: missing-fields
                pyright = {
                  disableOrganizeImports = true,
                },
                python = {
                  analysis = {
                    ignore = { '*' },
                  },
                },
              },
            }
          end,
        },
      }

      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

      lsp_zero.on_attach(function(client, bufnr)
        if client.name == 'ruff_lsp' then client.server_capabilities.hoverProvider = false end

        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds {
            group = augroup,
            buffer = bufnr,
          }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function() vim.lsp.buf.format { async = false } end,
          })
        end

        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps { buffer = bufnr }
      end)
    end,
  },
}
