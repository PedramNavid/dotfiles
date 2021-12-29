local mappings = {}

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

-- LSP Keymaps

mappings.lsp_keymaps = function(bufnr, opts)

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                   opts)
    buf_set_keymap('n', '<space>wa',
                   '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr',
                   '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl',
                   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                   opts)
    buf_set_keymap('n', '<space>D',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
                   opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>',
                   opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>',
                   opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>',
                   opts)

end

return mappings
