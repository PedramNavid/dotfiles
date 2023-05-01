local lsp = require("lsp-zero").preset({})
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
    },
    preselect = "item",
    completion = {
        competeopt = "menu,menuone,noinsert",
    },
    mapping = {
        ["<Tab>"] = cmp_action.tab_complete(),
        ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({select = true}),
        ["<C-j>"] = cmp.mapping(function(fallback)
          vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), "n", true)
        end)
    },
    experimental = {
        ghost_text = false,
    },
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set({ "n", "x" }, "<Leader>\\", function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end)
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
    -- Replace these with whatever servers you want to install
    "pyright",
    "lua_ls",
    "vimls",
    "rust_analyzer",
})

require("lspconfig").pyright.setup({
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
})

lsp.format_on_save({
    servers = {
        ["lua_ls"] = { "null_ls" },
        ["rust_analyzer"] = { "rust" },
        ["pyright"] = { "python" },
        ["vimls"] = { "vim" },
    },
})

lsp.setup()

local nls = require("null-ls")
local b = nls.builtins

nls.setup({
    debug = false,
    default_timeout = 10000,
    sources = {
        b.code_actions.gitsigns,
        b.code_actions.shellcheck,

        b.diagnostics.ruff,
        b.diagnostics.shellcheck,
        b.formatting.sqlfluff.with({
            extra_args = { "--dialect", "snowflake" },
        }),
        b.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
        b.formatting.black.with({
            command = "/Users/pedram/.pyenv/versions/neovim/bin/black",
        }),
        b.formatting.ruff,
    },
})
