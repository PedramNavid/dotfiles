vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local nnoremap = function(keys, desc)
    vim.keymap.set("n", keys[1], keys[2], { noremap = true, desc = desc })
end

local tnoremap = function(keys, desc)
    vim.keymap.set("t", keys[1], keys[2], { noremap = true, desc = desc })
end

local vnoremap = function(keys, desc)
    vim.keymap.set("v", keys[1], keys[2], { noremap = true, desc = desc })
end

-- General Shortcuts
nnoremap({ "<Leader>s", ":write<CR>"},"Save file")
nnoremap({ "<Leader>cw", ":bd<CR>" }, "Close buffer")

-- Visual move blocks
vnoremap({ "J", ":m '>+1<CR>gv=gv" })
vnoremap({ "K", ":m '<-2<CR>gv=gv" })

nnoremap({ "J", "mzJ`z" })
nnoremap({ "<C-d>", "<C-d>zz" })
nnoremap({ "<C-u>", "<C-u>zz" })
nnoremap({ "<Leader>d", [["_d]] }, "Delete to empty buffer")
nnoremap({ "Q", "<Nop>" })

nnoremap({ "<LocalLeader>f", vim.lsp.buf.format })
nnoremap({ "<Leader>so", ":source<CR>" })

nnoremap({ "<C-k>", "<cmd>cnext<CR>zz" })
nnoremap({ "<C-j>", "<cmd>cprev<CR>zz" })
vnoremap({"<", "<gv"})
vnoremap({">", ">gv"})

-- Window Movements
nnoremap({ "<M-j>", "<c-w>j" })
nnoremap({ "<M-k>", "<c-w>k" })
nnoremap({ "<M-l>", "<c-w>l" })
nnoremap({ "<M-h>", "<c-w>h" })
nnoremap({ "<C-Up>", "<cmd>resize +2<CR>" }, "Resize window")
nnoremap({ "<C-Down>", "<cmd>resize -2<CR>" }, "Resize window")
nnoremap({ "<C-Left>", "<cmd>vertical resize +2<CR>" }, "Resize window")
nnoremap({ "<C-Right>", "<cmd>vertical resize -2<CR>" }, "Resize window")

-- Terminal Remaps
tnoremap({ "<Esc><Esc>", "<C-\\><C-n>" })
tnoremap({ "<C-v><Esc>", "<Esc>" })

-- Development Remaps
nnoremap({ "<LocalLeader>t", "<Plug>PlenaryTestFile" })
nnoremap({
    "<LocalLeader>rr",
    function()
        require("plenary.reload").reload_module("dbtpal")
    end,
})

-- Config Editing
nnoremap({ "<LocalLeader>e", ":e ~/dotfiles/nvim/init.lua<CR>" })
nnoremap({ "<LocalLeader>nd", vim.diagnostic.disable })
