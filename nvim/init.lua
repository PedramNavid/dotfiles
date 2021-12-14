require('plugins.init')
require('plugins.lsp')
require('plugins.treesitter')

-- {{{ Display and Editor Settings
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
--
-- }}}
-- {{{ Colors 
vim.go.termguicolors = true
vim.cmd [[colorscheme dracula]]
-- }}}
-- {{{ Macros and Automation
vim.cmd [[
    augroup Lua_Formatting
        autocmd!
        autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
    augroup END
]]
-- }}}
