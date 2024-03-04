return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'https://github.com/nvim-lua/plenary.nvim',
    'nvimtools/none-ls-extras.nvim',
  },
  lazy = false,
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      debug = false,
      sources = {
        null_ls.builtins.formatting.stylua,
      },
    }
  end,
  keys = { { '<LocalLeader>f', vim.lsp.buf.format } },
}
