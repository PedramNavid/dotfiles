vim.cmd([[
augroup Lua_Formatting
    autocmd!
    autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
augroup END
]])

vim.cmd([[
function! TrimWhiteSpace()
    %s/\s*$//
    ''
endfunction
]])

vim.cmd([[
augroup Trim_Whitespace
    autocmd!
    autocmd BufWritePre * call TrimWhiteSpace()
augroup end
]])
