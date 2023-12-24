return {
	{
		"https://github.com/PedramNavid/dbtpal",
		init = function()
			require("dbtpal").setup({
				-- Path to the dbt executable
				path_to_dbt = "dbt",

				-- Path to the dbt project, if blank, will auto-detect
				-- using currently open buffer for all sql,yml, and md files
				-- tried hard coding to my dbt-fundamentals project but it didn't work either
				path_to_dbt_project = "",

				-- Path to dbt profiles directory
				path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),

				-- Search for ref/source files in macros and models folders
				extended_path_search = true,

				-- Prevent modifying sql files in target/(compiled|run) folders
				protect_compiled_files = true,
			})

			-- Setup key mappings

			vim.keymap.set("n", "<leader>drf", require("dbtpal").run)
			vim.keymap.set("n", "<leader>drp", require("dbtpal").run_all)
			vim.keymap.set("n", "<leader>dtf", require("dbtpal").test)
			vim.keymap.set("n", "<leader>dm", require("dbtpal.telescope").dbt_picker)

			-- Enable Telescope Extension
			require("telescope").load_extension("dbtpal")
		end,
	},
}
