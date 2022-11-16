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
