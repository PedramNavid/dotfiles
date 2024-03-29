require 'pedram.mappings'
require 'pedram.settings'
require 'pedram.mdx'
require 'pedram.augroups'

-- Bootstrap Lazy Plugin Manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('pedram.plugins', {
  dev = {
    path = '~/projects',
    patterns = {}, -- For example {"folke"}
    fallback = false, -- Fallback to git when local plugin doesn't exist
  },
})
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
