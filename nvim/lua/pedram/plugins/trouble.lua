return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        position = 'bottom',
        height = 10,
        width = 50,
        icons = true,
        mode = 'workspace_diagnostics',
        severity = nil,
        fold_open = '',
        fold_closed = '',
        group = true,
        padding = true,
        cycle_results = true,
        action_keys = {
            close = 'q',                           -- close the list
            cancel = '<esc>',                      -- cancel the preview and get back to your last window / buffer / cursor
            refresh = 'r',                         -- manually refresh
            jump = { '<cr>', '<tab>', '<2-leftmouse>' }, -- jump to the diagnostic or open / close folds
            open_split = { '<c-x>' },              -- open buffer in new split
            open_vsplit = { '<c-v>' },             -- open buffer in new vsplit
            open_tab = { '<c-t>' },                -- open buffer in new tab
            jump_close = { 'o' },                  -- jump to the diagnostic and close the list
            toggle_mode = 'm',                     -- toggle between "workspace" and "document" diagnostics mode
            switch_severity = 's',                 -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
            toggle_preview = 'P',                  -- toggle auto_preview
            hover = 'K',                           -- opens a small popup with the full multiline message
            preview = 'p',                         -- preview the diagnostic location
            open_code_href = 'c',                  -- if present, open a URI with more information about the diagnostic error
            close_folds = { 'zM', 'zm' },          -- close all folds
            open_folds = { 'zR', 'zr' },           -- open all folds
            toggle_fold = { 'zA', 'za' },          -- toggle fold of current file
            previous = 'k',                        -- previous item
            next = 'j',                            -- next item
            help = '?',                            -- help menu
        },
        multiline = true,
        indent_lines = true,
        win_config = { border = 'single' },
        auto_open = false,
        auto_close = false,
        auto_preview = true,
        auto_fold = false,
        auto_jump = { 'lsp_definitions' },
        include_declaration = { 'lsp_references', 'lsp_implementations', 'lsp_definitions' },
        signs = {
            error = '',
            warning = '',
            hint = '',
            information = '',
            other = '',
        },
        use_diagnostic_signs = false,
    },
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>xQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },

    },
}
