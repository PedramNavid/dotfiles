return {
	"nvimtools/none-ls.nvim",
	dependencies = "https://github.com/nvim-lua/plenary.nvim",
	lazy = false,
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			-- set root directory to cwd
			root_dir = function()
				return nil
			end,
			sources = { null_ls.builtins.formatting.stylua },
		})
	end,
	keys = { { "<LocalLeader>f", vim.lsp.buf.format } },
}
