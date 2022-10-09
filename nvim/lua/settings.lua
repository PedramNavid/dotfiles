vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 2
vim.o.colorcolumn = '80'
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.listchars = 'tab:▸\\ ,eol:↲,trail:·'
vim.o.list = true
vim.o.mouse = "nv"
vim.o.number = true
vim.o.relativenumber = true

vim.o.foldlevelstart = 0
vim.o.foldminlines = 3
vim.o.completeopt = "menu,menuone,noselect"

vim.go.termguicolors = true
vim.cmd [[
try
    colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry

]]
vim.cmd [[autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab]]
