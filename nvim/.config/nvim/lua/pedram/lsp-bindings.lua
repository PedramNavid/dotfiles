local nvim_lsp = require('lspconfig')
local lua_ls = require('pedram.lua-ls')

local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

            -- For `luasnip` user.
            -- require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            select = true
        })
    },
    sources = {
        {
            name = 'nvim_lsp'
        }, -- For vsnip user.
        -- { name = 'vsnip' },
        -- For luasnip user.
        -- { name = 'luasnip' },
        -- For ultisnips user.
        -- { name = 'ultisnips' },
        {
            name = 'buffer'
        }
    }
})

local on_attach = function(_, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end
    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {
        noremap = true,
        silent = true
    }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>e',
                   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>q',
                   '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>td',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>wa',
                   '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl',
                   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                   opts)
    buf_set_keymap('n', '<leader>wr',
                   '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
                   opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
                   opts)
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol
                                                                   .make_client_capabilities()),
    settings = {
        python = {
            analysis = {
                extraPaths = "~/some_path",
                typeCheckingModel = "strict"
            }
        }
    }

}

local library = {}
local path = vim.split(package.path, ';')

table.insert(path, "lua/?.lua")
table.insert(path, "lua/?/init.lua")

local function add(lib)
    for _, p in pairs(vim.fn.expand(lib, false, true)) do
        p = vim.loop.fs_realpath(p)
        library[p] = true
    end
end

add("$VIMRUNTIME")
add("~/.config/nvim")
add("~/build/neovim/src/nvim/lua")

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol
                                                                   .make_client_capabilities()),
    cmd = {lua_ls.sumneko_binary, "-E", lua_ls.sumneko_root_path .. "/main.lua"},
    diagnostics = {
        enable = true
    },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = path
            },
            completion = {
                callSnippet = "Both"
            },
            diagnostics = {
                enable = true,
                globals = {"vim", "P"}
            },
            workspace = {
                library = library,
                maxPreload = 1000,
                preloadFileSize = 51000
            }
        }
    }
}

-- Setup nvim-cmp.
