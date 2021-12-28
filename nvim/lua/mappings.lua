local nnoremap = function(keys)
    vim.api.nvim_set_keymap('n', keys[1], keys[2], {noremap = true})
end

local tnoremap = function(keys)
    vim.api.nvim_set_keymap('t', keys[1], keys[2], {noremap = true})
end

vim.g.mapleader = ' '

-- General Shortcuts
nnoremap {'<Leader>s', ':write<CR>'}
nnoremap {'<Leader>ff', '<cmd>Telescope find_files<CR>'}
nnoremap {'<Leader>fb', '<cmd>Telescope file_browser<CR>'}
nnoremap {'<Leader>fg', '<cmd>Telescope live_grep<CR>'}
nnoremap {'<Leader>fb', '<cmd>Telescope buffers<CR>'}
nnoremap {'<Leader>gr', '<cmd>Telescope lsp_references<CR>'}
nnoremap {'<Leader>gd', '<cmd>Telescope lsp_definitions<CR>'}
nnoremap {'<Leader>gi', '<cmd>Telescope lsp_implementations<CR>'}
nnoremap {'<Leader>gs', '<cmd>Telescope lsp_document_symbols<CR>'}
nnoremap {'<Leader>gws', '<cmd>Telescope lsp_workspace_symbols<CR>'}
nnoremap {'<Leader>q', '<cmd>Telescope diagnostics<CR>'}

-- Window Movements
nnoremap {'<M-j>', '<c-w>j'}
nnoremap {'<M-k>', '<c-w>k'}
nnoremap {'<M-l>', '<c-w>l'}
nnoremap {'<M-h>', '<c-w>h'}

-- Terminal Remaps
tnoremap {'<Esc>', '<C-\\><C-n>'}
tnoremap {'<C-v><Esc>', '<Esc>'}
