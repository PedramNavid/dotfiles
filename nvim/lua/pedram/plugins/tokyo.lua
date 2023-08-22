return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 50,
    config = function()
        vim.cmd([[colorscheme tokyonight-moon]])
    end,

}
