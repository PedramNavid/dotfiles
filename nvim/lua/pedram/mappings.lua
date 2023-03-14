vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local nnoremap = function(keys)
    vim.keymap.set('n', keys[1], keys[2], { noremap = true })
end

local tnoremap = function(keys)
    vim.keymap.set('t', keys[1], keys[2], { noremap = true })
end

local vnoremap = function(keys)
    vim.keymap.set('v', keys[1], keys[2], { noremap = true })
end

-- General Shortcuts
nnoremap { '<Leader>s', ':write<CR>' }
nnoremap { '<Leader>cw', ':bd<CR>' }
nnoremap { '<Leader>pv', vim.cmd.Ex }

-- Visual move blocks
vnoremap { "J", ":m '>+1<CR>gv=gv" }
vnoremap { "K", ":m '<-2<CR>gv=gv" }

nnoremap { "J", "mzJ`z" }
nnoremap { "<C-d>", "<C-d>zz" }
nnoremap { "<C-u>", "<C-u>zz" }
nnoremap { "<Leader>d", [["_d]] }

nnoremap { "Q", "<Nop>" }

nnoremap { "<LocalLeader>f", vim.lsp.buf.format }
nnoremap { "<Leader>so", ":source<CR>" }

nnoremap { "<C-k>", "<cmd>cnext<CR>zz" }
nnoremap { "<C-j>", "<cmd>cprev<CR>zz" }

-- Window Movements
nnoremap { '<M-j>', '<c-w>j' }
nnoremap { '<M-k>', '<c-w>k' }
nnoremap { '<M-l>', '<c-w>l' }
nnoremap { '<M-h>', '<c-w>h' }

-- Terminal Remaps
tnoremap { '<Esc>', '<C-\\><C-n>' }
tnoremap { '<C-v><Esc>', '<Esc>' }


-- Development Remaps
nnoremap { '<LocalLeader>t', '<Plug>PlenaryTestFile'}
