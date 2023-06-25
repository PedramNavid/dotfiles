local dbt = require("dbtpal")

dbt.setup({
    path_to_dbt = "dbt",
    path_to_dbt_project = "",
    path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),
    extended_path_search = true,
    protect_compiled_files = true,
})

vim.keymap.set("n", "<leader>dr", dbt.run)
vim.keymap.set("n", "<leader>dra", dbt.run_all)
vim.keymap.set("n", "<leader>drc", dbt.run_children)
vim.keymap.set("n", "<leader>db", dbt.build)
vim.keymap.set("n", "<leader>dt", dbt.test)
vim.keymap.set("n", "<leader>dm", require("dbtpal.telescope").dbt_picker)

require("telescope").load_extension("dbtpal")
