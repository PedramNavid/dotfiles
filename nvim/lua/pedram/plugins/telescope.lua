return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',

		{
			'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
		},
	},
	config = function()
		local telescope = require('telescope')
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope Files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope Grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope Buffers' })
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope keymaps' })
		vim.keymap.set('n', '<leader>fh', builtin.oldfiles, { desc = 'Telescope history' })

		telescope.setup({
			defaults = {
				wrap_results = true,
				sorting_strategy = 'ascending',
				layout_strategy = 'flex',
				layout_config = {
					flex = {
						prompt_position = 'top',
					},
					horizontal = {
						preview_cutoff = 40,
					},
					vertical = {
						prompt_position = 'top',
						mirror = true,
						preview_height = 0.45,
						preview_cutoff = 40,
					},
				},
				mappings = {},
			},
		})
		require('telescope').load_extension('fzf')
	end,
}
