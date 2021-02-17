local vimp = require('vimp')
local util = require('util')
-- {{{ General settins
local indent = 4
vim.cmd 'colorscheme lena'
-- }}}

-- {{{ Packages
vim.cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true}


paq {'anott03/nvim-lspinstall'}
paq {'bfredl/nvim-luadev'}
paq {'junegunn/fzf', hook = vim.fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'neoclide/coc.nvim'}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'preservim/nerdtree'}
paq {'rafcamlet/nvim-luapad'}
paq {'svermeulen/vimpeccable'}
paq {'tpope/vim-dispatch'}
paq {'tpope/vim-surround'}
paq {'tpope/vim-unimpaired'}

vim.g['deoplete#enable_at_startup'] = 1 -- enable deoplete at startup
--- }}}

-- {{{ VIM Options
vim.b.expandtab = true
vim.b.smartindent = true
vim.b.tabstop = indent
vim.b.swapfile = false

vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.foldlevelstart = 0
vim.o.formatoptions = string.gsub(vim.o.formatoptions, 'cro', '')
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.inccommand = 'split'
vim.o.joinspaces = false
vim.o.mouse = 'nv'
vim.o.scrolloff = 4
vim.o.shiftround = true
vim.o.sidescrolloff = 8
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wildmode = 'list:longest'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.updatetime = 300
vim.o.cmdheight = 3
vim.o.statusline = [[%02n\ %<%f\ %H%M%R%W%q%=%-14.(%y\ %l\\%L,%c%V%)\ %P]]
vim.o.number = true

vim.wo.colorcolumn = '80'
vim.wo.list = true
vim.wo.number = true 
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false

vim.g.mapleader = ','
vim.g.maplocalleader = '\\'
-- }}}

-- {{{ Reload Mapping 
vimp.nnoremap('<leader>r', function()
	vimp.unmap_all()
	util.unload_lua_namespace('vimrc')
	vim.cmd('silent wa')
	require('vimrc')
	print('Reloaded vimrc!')
end)
-- }}}

-- {{{ Plugin Settings 
vim.g.python3_host_prog = '$HOME/.pyenv/versions/py3nvim/bin/python'

local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = { enable = true }}
-- }}}

-- {{{ COC Settings
vim.g['coc_global_extensions'] = {'coc-json', 'coc-python'}

--  }}}

-- {{{ Key Mappings
-- {{{ General Keyboard Mappings 
vimp.nnoremap('<leader>,', ',')
vimp.nnoremap('<leader>s', function() vim.cmd('write') end)
vimp.nnoremap('/', '/\\v')		-- better searching
-- }}}

-- {{{ Window Movements
vimp.nnoremap('<M-j>', '<C-w>j')
vimp.nnoremap('<M-k>', '<C-w>k')
vimp.nnoremap('<M-l>', '<C-w>l')
vimp.nnoremap('<M-h>', '<C-w>h')
-- }}}

-- {{{ Insert Mode Mappings
vimp.inoremap('jj', '<ESC>')
vimp.inoremap('<expr> <c-space>', vim.fn['coc#refresh']())
-- }}}

-- {{{ Terminal Mode Mappings
vimp.tnoremap('<ESC>', '<C-\\><C-n>')
vimp.tnoremap('<C-v><ESC>', '<ESC>')


-- }}}

-- {{{ Plugin Mappings
vimp.nnoremap('<Leader>ff', ':Files<CR>')
vimp.nnoremap('<Leader>gf', ':GFiles<CR>')
vimp.nnoremap('<Leader>b', ':Buffers<CR>')
vimp.nnoremap('<Leader>l', ':Lines<CR>')
vimp.nnoremap('<Leader>/', ':Rg<CR>')

vimp.nnoremap('<Leader>n', ':NERDTreeFocus<CR>')
vimp.nnoremap('<C-n>', ':NERDTree<CR>')

-- }}}
-- }}}

-- vim: fdm=marker

