local map = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

map('n', '<Leader>ex', ':Explore<cr>', { desc = 'Open File Explorer' })
map('n', '<Leader>s', ':write<CR>', { desc = 'Save file' })
