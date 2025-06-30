return {
    'nvimtools/none-ls.nvim',
    dependencies = {
        'nvimtools/none-ls-extras.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local null_ls = require 'null-ls'
        local augroup = vim.api.nvim_create_augroup('NullLsFormatting', {})
        local sources = {}

        -- Add stylua if available
        if vim.fn.executable 'stylua' == 1 then table.insert(sources, null_ls.builtins.formatting.stylua) end

        -- Add ruff formatters if available
        local ruff_cmd = vim.fn.executable 'ruff' == 1 and 'ruff' or vim.fn.expand '$HOME/.pyenv/shims/ruff'
        if vim.fn.executable(ruff_cmd) == 1 then
            table.insert(
                sources,
                require('none-ls.formatting.ruff').with {
                    command = ruff_cmd,
                }
            )
            table.insert(
                sources,
                require('none-ls.formatting.ruff_format').with {
                    command = ruff_cmd,
                }
            )
        end

        -- Add prettier with fallback check
        table.insert(
            sources,
            null_ls.builtins.formatting.prettier.with {
                only_local = 'node_modules/.bin',
                condition = function(utils) return utils.root_has_file { 'package.json', '.prettierrc', '.prettierrc.json' } end,
                filetypes = {
                    'javascript',
                    'typescript',
                    'css',
                    'scss',
                    'html',
                    'json',
                    'yaml',
                    'markdown',
                    'graphql',
                    'md',
                    'txt',
                    'astro',
                },
            }
        )

        null_ls.setup {
            sources = sources,
            -- Only format if no LSP formatter is available
            on_attach = function(client, bufnr)
                if client.supports_method 'textDocument/formatting' then
                    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- Prefer LSP formatting over null-ls
                            local lsp_clients = vim.lsp.get_active_clients { bufnr = bufnr }
                            local has_lsp_formatter = false
                            for _, lsp_client in ipairs(lsp_clients) do
                                if lsp_client.supports_method 'textDocument/formatting' and lsp_client.name ~= 'null-ls' then
                                    has_lsp_formatter = true
                                    break
                                end
                            end

                            if not has_lsp_formatter then vim.lsp.buf.format { async = false } end
                        end,
                    })
                end
            end,
        }
    end,
    keys = { { '<LocalLeader>f', vim.lsp.buf.format } },
}
