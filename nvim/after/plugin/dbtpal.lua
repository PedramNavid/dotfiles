local dbt = require('dbtpal')

dbt.setup {
    path_to_dbt = "dbt",
    path_to_dbt_project = "",
    path_to_dbt_profiles_dir = vim.fn.expand "~/.dbt",
    extended_path_search = true,
    protect_compiled_files = true
}

vim.keymap.set('n', '<leader>drf', dbt.run)
vim.keymap.set('n', '<leader>drp', dbt.run_all)
vim.keymap.set('n', '<leader>dtf', dbt.test)
vim.keymap.set('n', '<leader>dm', require('dbtpal.telescope').dbt_picker)

require 'telescope'.load_extension('dbtpal')

vim.cmd [[nnoremap rr :call Reload()<CR>]]
