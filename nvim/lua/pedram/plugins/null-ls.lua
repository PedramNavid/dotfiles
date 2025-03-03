return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
  },
  lazy = false,
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,

        require('none-ls.formatting.ruff').with {
          command = vim.fn.expand '$HOME/.pyenv/shims/ruff',
        },

        require('none-ls.formatting.ruff_format').with {
          command = vim.fn.expand '$HOME/.pyenv/shims/ruff',
        },

        null_ls.builtins.formatting.prettier.with {
          only_local = 'node_modules/.bin',
          filetypes = {
            'javascript',
            'typescript',
            'css',
            'scss',
            'html',
            'json',
            'yaml',
            'markdown',
            'graphql',
            'md',
            'txt',
            'astro',
          },
        },
      },
    }
  end,
  keys = { { '<LocalLeader>f', vim.lsp.buf.format } },
}
