require("telescope").setup({
    defaults = {
        layout_config = {
            width = 0.75,
        },
   },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    },
})
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>qf", builtin.quickfix, {})
vim.keymap.set("n", "<leader>fs", builtin.lsp_workspace_symbols, {})
vim.keymap.set("n", "<leader>ds", builtin.diagnostics, {})

require("telescope").load_extension("fzf")
