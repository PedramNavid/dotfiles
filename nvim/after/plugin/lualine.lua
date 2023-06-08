require("lualine").setup({
    options = {
        theme = "nord",

        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = { "encoding", "fileformat", "filetype", "filesize" },
            lualine_y = { "buffers", "progress" },
            lualine_z = { "location" },
        },

        extensions = {
            "fugitive",
            "quickfix",
            "symbols-outline",
            "nvim-tree",
        },
    },
})
