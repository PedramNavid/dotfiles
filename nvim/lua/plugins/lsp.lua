local nvim_lsp = require('lspconfig')
local mappings = require('mappings')

local on_attach = function(client, bufnr)
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

    mappings.lsp_keymaps(bufnr, opts)

end

-- require"lspconfig".efm.setup {
--     init_options = {
--         documentFormatting = true
--     },
--     settings = {
--         rootMarkers = {".git/"},
--         filtypes = {"lua"},
--         languages = {
--             lua = {
--                 {
--                     formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=80 --break-after-table-lb",
--                     formatStdin = true
--                 }
--             }
--         }
--     }
-- }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())
local servers = {
    'pyright', 'dockerls', 'jsonls', 'sumneko_lua', 'tsserver', 'rust_analyzer'
}

local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.code_actions.gitsigns
}

null_ls.setup({
    sources = sources,
    on_attach = on_attach,
    capabilities = capabilities
})

for _, lsp in ipairs(servers) do

    if lsp == 'sumneko_lua' then
        nvim_lsp[lsp].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {'vim', 'use'}
                    }
                }
            }
        }
    elseif lsp == 'rust-analyzer' then
        nvim_lsp[lsp].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                ["rust-analyzer"] = {
                    assist = {
                        importGranularity = "module",
                        importPrefix = "by_self"
                    },
                    cargo = {
                        loadOutDirsFromCheck = true
                    },
                    procMacro = {
                        enable = true
                    }
                }
            }
        })
    elseif lsp == 'tsserver' then
        require('plugins.tsserver-settings')
    else
        nvim_lsp[lsp].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = {
                debounce_text_changes = 150
            }
        }
    end
end

-- Setup lspconfig.
