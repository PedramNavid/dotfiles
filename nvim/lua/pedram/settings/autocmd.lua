vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
    group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
    callback = function()
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
    pattern = {"*.md", "*.txt"},
    group = vim.api.nvim_create_augroup("SPELL_CHECK", {}),
    callback = function()
        vim.cmd([[ setlocal spell ]])
    end,
})


vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = vim.api.nvim_create_augroup("StripTrailingWhitespace", {}),
    callback = function()
        vim.cmd([[ %s/\s\+$//e ]])
    end,
})
