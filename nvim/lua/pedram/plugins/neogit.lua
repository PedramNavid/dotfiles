return {
  'NeogitOrg/neogit',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    'nvim-telescope/telescope.nvim', -- optional
  },
  config = true,
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>' },
    { '<leader>gc', '<cmd>Neogit commit<cr>' },
    { '<leader>gs', function() require('neogit').open { kind = 'split' } end },
  },
}
