vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

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
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.completeopt = "menu,menuone,noselect"

vim.go.termguicolors = true
vim.cmd [[colorscheme dracula]]
vim.cmd [[autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab]]
