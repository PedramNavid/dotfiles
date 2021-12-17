local nnoremap = function(keys)
    vim.api.nvim_set_keymap('n', keys[1], keys[2], {noremap = true})
end

vim.g.mapleader = ' '
nnoremap {'<Leader>s', ':write<CR>'}
nnoremap {'<Leader>ff', '<cmd>Telescope find_files<CR>'}
