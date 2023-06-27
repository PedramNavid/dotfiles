return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },
        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "L3MON4D3/LuaSnip" },
    },
    config = function()
        local lsp = require("lsp-zero").preset({})

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        -- (Optional) Configure lua language server for neovim
        require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()
    end,
}
