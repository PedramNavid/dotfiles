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
        },
        handlers = {
          lsp_zero.default_setup,
          tsserver = function()
            require('lspconfig').tsserver.setup {
              settings = {
                completions = { completeFunctionCalls = true },
              },
            }
          end,
        },
      }

      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

      lsp_zero.on_attach(function(client, bufnr)
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
