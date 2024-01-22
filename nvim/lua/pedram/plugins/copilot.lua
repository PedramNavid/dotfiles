return {
	{
		'zbirenbaum/copilot-cmp',
		config = function() require('copilot_cmp').setup() end,
	},
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = 'InsertEnter',
		config = function()
			require('copilot').setup({
				suggestion = {
					enabled = false,
					auto_trigger = false,
					debounce = 75,
					keymap = {
						accept = '<M-l>',
						accept_word = false,
						accept_line = false,
						next = '<M-]>',
						prev = '<M-[>',
						dismiss = '<C-]>',
					},
				},
				panel = { enabled = false },
				filetypes = {
					yaml = true,
					markdown = false,
					help = false,
					gitcommit = true,
					plaintext = false,
				},
			})
		end,
	},
}
