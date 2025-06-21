return {
  'PedramNavid/dbtpal',
  dependencies = 'nvim-lua/plenary.nvim',
  dev = true,
  enable = true,
  ft = { 'sql', 'yaml', 'markdown' },
  config = function()
    local dbt = require 'dbtpal'
    dbt.setup {
      -- Path to the dbt executable
      path_to_dbt = 'dbt',
      path_to_dbt_project = '',

      -- Search for ref/source files in macros and models folders
      custom_dbt_syntax_enabled = true,
      extended_path_search = true,

      -- Prevent modifying sql files in target/(compiled|run) folders
      protect_compiled_files = true,
    }

    require('telescope').load_extension 'dbtpal'
  end,
  keys = {
    {
      '<LocalLeader>drf',
      function() require('dbtpal').run() end,
    },
    {
      '<LocalLeader>drp',
      function() require('dbtpal').run_all() end,
    },
    {
      '<LocalLeader>dtf',
      function() require('dbtpal').test() end,
    },
    {
      '<LocalLeader>dm',
      function() require('dbtpal.telescope').dbt_picker() end,
    },
  },
}
