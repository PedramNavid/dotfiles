return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "L3MON4D3/LuaSnip" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "onsails/lspkind.nvim" },
    },
    config = function()
        local lsp = require("lsp-zero").preset("recommended")

        lsp.ensure_installed({
            "lua_ls",
            "pyright",
        })
        lsp.on_attach(function(_, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()
        local cmp = require("cmp")
        local cmp_action = require("lsp-zero").cmp_action()
        local cmp_buffer = require("cmp_buffer")
        local lspkind = require("lspkind")
        vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
        cmp.setup({
            sources = {
                { name = "buffer",  option = { keyword_length = 3 } },
                { name = "copilot" },
                { name = "luasnip" },
                { name = "path" },
                { name = "nvim_lsp" },
            },
            sorting = {
                priority_weight = 2,
                comparators = {
                    require("copilot_cmp.comparators").prioritize,
                    cmp.config.compare.offset,
                    function(...)
                        return cmp_buffer:compare_locality(...)
                    end,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
            mapping = {
                ["<cr>"] = cmp.mapping.confirm({ select = false }),
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<c-f>"] = cmp.mapping.scroll_docs(4),
                ["<c-b>"] = cmp.mapping.scroll_docs(-4),
                ["<c-space>"] = cmp.mapping.complete(),
                ["<c-e>"] = cmp.mapping.abort(),

                ["Tab"] = cmp_action.tab_complete(),
                --[[
                ["Tab"] = vim.schedule_wrap(function(fallback)
                    if cmp.visible() and has_words_before() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    else
                        fallback()
                    end
                end),
                ]]
                --
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    max_width = 90,
                    symbol_map = { Copilot = "" },
                }),
            },
            experimental = {
                ghost_text = {
                    hl_group = "CmpGhostText",
                },
            },
        })
    end,
}
