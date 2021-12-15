require('plugins.init')
require('plugins.lsp')
require('plugins.treesitter')

-- {{{ Display and Editor Settings
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 2
vim.o.colorcolumn = '80'
vim.o.listchars = 'tab:▸\\ ,eol:↲,trail:·'
vim.o.list = true
vim.o.mouse = "nv"
vim.o.number = true
vim.o.relativenumber = true

vim.o.foldlevelstart = 0
vim.o.foldminlines = 3

vim.go.termguicolors = true
vim.cmd [[colorscheme dracula]]
-- }}}
-- {{{ Keyboard Mappings
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<Leader>s', ':write<CR>', {noremap = true})

-- }}}
-- {{{ Macros and Automation
vim.cmd [[
    augroup Lua_Formatting
        autocmd!
        autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
    augroup END
]]
-- }}}
-- {{{ Functions
vim.cmd [[
function! TrimWhiteSpace()
    %s/\s*$//
    ''
endfunction
]]

vim.cmd [[
augroup Trim_Whitespace
    autocmd!
    autocmd BufWritePre * call TrimWhiteSpace()
augroup end
]]
--- }}}
-- vim: foldmethod=marker foldlevel=0:
