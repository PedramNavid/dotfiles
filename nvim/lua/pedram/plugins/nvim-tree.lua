return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require('nvim-tree').setup()

        vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
    end

}
