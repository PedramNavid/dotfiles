return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 50,
  config = function()
    vim.opt.termguicolors = true
    vim.cmd [[colorscheme tokyonight-moon]]
  end,
}
