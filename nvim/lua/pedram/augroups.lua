local cmd = vim.cmd
local api = vim.api

-- Highlight on yank

local yankHighlight = api.nvim_create_augroup('YankHighlight', { clear = true })

api.nvim_create_autocmd('TextYankPost', {
  command = "lua vim.highlight.on_yank({higroup = 'IncSearch', timeout = 100})",
  group = yankHighlight,
})
