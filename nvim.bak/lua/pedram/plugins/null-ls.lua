return {
    "https://github.com/jose-elias-alvarez/null-ls.nvim",
    dependencies = "https://github.com/nvim-lua/plenary.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            -- set root directory to cwd
            root_dir = function()
                return nil
            end,
            sources = {
                null_ls.builtins.code_actions.gitsigns,
                null_ls.builtins.diagnostics.actionlint,
                null_ls.builtins.diagnostics.checkmake,
                null_ls.builtins.diagnostics.shellcheck,
                null_ls.builtins.diagnostics.trail_space,
                null_ls.builtins.diagnostics.zsh,

                null_ls.builtins.formatting.stylua.with({
                    condition = function(utils)
                        return utils.root_has_file_matches("stylua")
                    end,
                }),

                null_ls.builtins.formatting.beautysh,
                null_ls.builtins.formatting.sqlfluff.with({
                    extra_args = { "--config", vim.fn.expand("~/.sqlfluff") },
                }),
                null_ls.builtins.formatting.black,
            },
        })
    end,
}