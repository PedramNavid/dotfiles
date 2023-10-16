return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        local function toggle()
            local api = require("nvim-tree.api")
            if api.tree.is_visible() then
                api.tree.close()
            else
                vim.cmd("NvimTreeFocus")
            end
        end
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require('nvim-tree').setup()

        vim.keymap.set('n', '<C-n>', toggle, { noremap = true, silent = true })
    end

}
