return {
    "https://github.com/neovim/nvim-lspconfig",
    branch = "master",
    dependencies = {
        "https://github.com/folke/neodev.nvim",
    },
    config = function()
        require("neodev").setup()

        local lspconfig = require("lspconfig")
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({})
            end,

            ["lua_ls"] = function()
                lspconfig.lua_ls.setup({
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = { callSnippet = "Replace" },
                            workspace = {
                                checkThirdParty = false,
                                library = vim.api.nvim_get_runtime_file("", true),
                            },
                            telemetry = { enable = false },
                        },
                    },
                })
            end,
            ["yamlls"] = function()
                lspconfig.yamlls.setup({
                    settings = {
                        yaml = { keyOrdering = false },
                    },
                })
            end,
        })
    end,
}
