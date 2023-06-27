vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local nnoremap = function(keys)
    vim.keymap.set("n", keys[1], keys[2], { noremap = true })
end

local tnoremap = function(keys)
    vim.keymap.set("t", keys[1], keys[2], { noremap = true })
end

local vnoremap = function(keys)
    vim.keymap.set("v", keys[1], keys[2], { noremap = true })
end

-- General Shortcuts
nnoremap({ "<Leader>s", ":write<CR>" })
nnoremap({ "<Leader>cw", ":bd<CR>" })
nnoremap({ "<Leader>pv", vim.cmd.Ex })

-- Visual move blocks
vnoremap({ "J", ":m '>+1<CR>gv=gv" })
vnoremap({ "K", ":m '<-2<CR>gv=gv" })

nnoremap({ "J", "mzJ`z" })
nnoremap({ "<C-d>", "<C-d>zz" })
nnoremap({ "<C-u>", "<C-u>zz" })
nnoremap({ "<Leader>d", [["_d]] })

nnoremap({ "Q", "<Nop>" })

nnoremap({ "<LocalLeader>f", vim.lsp.buf.format })
nnoremap({ "<Leader>so", ":source<CR>" })

nnoremap({ "<C-k>", "<cmd>cnext<CR>zz" })
nnoremap({ "<C-j>", "<cmd>cprev<CR>zz" })

-- Window Movements
nnoremap({ "<M-j>", "<c-w>j" })
nnoremap({ "<M-k>", "<c-w>k" })
nnoremap({ "<M-l>", "<c-w>l" })
nnoremap({ "<M-h>", "<c-w>h" })

-- Terminal Remaps
tnoremap({ "<Esc>", "<C-\\><C-n>" })
tnoremap({ "<C-v><Esc>", "<Esc>" })

-- Development Remaps
nnoremap({ "<LocalLeader>t", "<Plug>PlenaryTestFile" })
nnoremap({
    "rr",
    function()
        require("plenary.reload").reload_module("dbtpal")
    end,
})

-- Config Editing
nnoremap({ "<LocalLeader>e", ":e ~/dotfiles/nvim/init.lua<CR>" })

-- LSP
vim.keymap.set("n", "<s-tab>", "<c-o>", { desc = "go to older position in the jump list" })
vim.keymap.set("n", "j", "gj", { desc = "go down one display line" })
vim.keymap.set("n", "k", "gk", { desc = "go up to one display line" })
vim.keymap.set("i", "<cr>", function()
    local pum_info = vim.fn.complete_info({ "mode", "selected" })
    if pum_info.mode ~= "" and pum_info.selected == -1 then
        return "<c-e><cr>"
    else
        return "<cr>"
    end
end, {
    expr = true,
    desc = "workaround for pop-up menu issue in vim",
    -- https://github.com/vim/vim/issues/1653
})
