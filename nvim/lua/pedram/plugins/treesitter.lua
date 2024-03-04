return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() vim.cmd.TSUpdate() end,
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'c',
          'lua',
          'vim',
          'vimdoc',
          'python',
          'bash',
          'dockerfile',
          'json',
          'html',
          'make',
          'typescript',
          'sql',
          'yaml',
        },
        ignore_install = {},
        sync_install = false,
        modules = {},
        auto_install = true,
        highlight = { enable = true },
        incremental_selection = { enable = true },
        textobjects = { enable = true },
        indent = { enable = true },
      }
      vim.o.foldmethod = 'expr'
      vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
    end,
  },
}
