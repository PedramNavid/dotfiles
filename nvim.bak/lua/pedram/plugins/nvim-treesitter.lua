return {
	"https://github.com/nvim-treesitter/nvim-treesitter",
	dependencies = {
		-- not sure I get value from this plugin
		-- "nvim-treesitter/nvim-treesitter-context",
		"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		"https://github.com/nvim-treesitter/playground",
	},
	build = function()
		vim.cmd.TSUpdate()
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			ignore_install = { "diff", "gitcommit" },
			highlight = {
				enable = true,
				disable = { "make" },
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
						["aC"] = "@class.outer",
						["iC"] = "@class.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@conditional.outer",
						["ic"] = "@conditional.inner",
						["as"] = "@scope",
						["aS"] = "@statement.outer",
						["iS"] = "@statement.inner",
					},
				},
			},
		})
	end,
}
