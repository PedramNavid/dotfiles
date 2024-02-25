return {
	'PedramNavid/dbtpal',
	dependencies = 'https://github.com/nvim-lua/plenary.nvim',
	ft = { 'sql', 'yaml', 'markdown' },
	config = function()
		local dbt = require('dbtpal')
		dbt.setup({
			-- Path to the dbt executable
			path_to_dbt = 'dbt',

			-- Path to the dbt project, if blank, will auto-detect
			-- using currently open buffer for all sql,yml, and md files
			path_to_dbt_project = '',

			-- Path to dbt profiles directory
			path_to_dbt_profiles_dir = vim.fn.expand('~/.dbt'),

			-- Search for ref/source files in macros and models folders
			extended_path_search = true,

			-- Prevent modifying sql files in target/(compiled|run) folders
			protect_compiled_files = true,
		})

		require('telescope').load_extension('dbtpal')
	end,
	keys = {
		{ 'n', '<LocalLeader>drf', function() require('dbtpal').run() end },
		{ 'n', '<LocalLeader>drp', function() require('dbtpal').run_all() end },
		{ 'n', '<LocalLeader>dtf', function() require('dbtpal').test() end },
		{ 'n', '<LocalLeader>dm', function() require('dbtpal.telescope').dbt_picker() end },
	},
}
