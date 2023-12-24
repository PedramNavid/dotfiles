local map = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

map('n', '<Leader>xx', ':Explore<cr>', { desc = 'Open File Explorer' })
