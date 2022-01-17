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

require"lspconfig".efm.setup {
    init_options = {
        documentFormatting = true
    },
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=80 --break-after-table-lb",
                    formatStdin = true
                }
            }
        }
    }
}

local servers = {
    'pyright', 'dockerls', 'jsonls', 'sumneko_lua', 'eslint', 'tsserver', 'rls'
}

for _, lsp in ipairs(servers) do
    if lsp == 'sumneko_lua' then
        nvim_lsp[lsp].setup {
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {'vim'}
                    }
                }
            }
        }
    else
        nvim_lsp[lsp].setup {
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150
            }
        }
    end
end
