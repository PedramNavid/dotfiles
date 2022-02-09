require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.sql = {
	install_info = {
		url = "~/projects/tree-sitter-sql", -- local path or git repo
		files = { "src/parser.c" },
	},
	filetype = "sql", -- if filetype does not agrees with parser name
	used_by = { "bar", "baz" }, -- additional filetypes that use this parser
}
