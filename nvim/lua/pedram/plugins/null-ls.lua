return {
	'nvimtools/none-ls.nvim',
	dependencies = 'https://github.com/nvim-lua/plenary.nvim',
	lazy = false,
	config = function()
		local null_ls = require('null-ls')
		null_ls.setup({
			debug = true,
			sources = {
				null_ls.builtins.diagnostics.ruff.with({
					command = '/home/pedram/.pyenv/shims/ruff',
				}),
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.ruff.with({
					command = '/home/pedram/.pyenv/shims/ruff',
				}),
				null_ls.builtins.formatting.ruff_format.with({
					command = '/home/pedram/.pyenv/shims/ruff',
				}),
			},
		})
	end,
	keys = { { '<LocalLeader>f', vim.lsp.buf.format } },
}
