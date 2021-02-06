local vimp = require('vimp')
local util = require('util')

--- {{{ General settins
local indent = 4
vim.cmd 'colorscheme lena'
-- }}} 

-- {{{ Packages
vim.cmd 'packadd paq-nvim'
local paq =  require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true}
paq {'bfredl/nvim-luadev'}
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', hook = vim.fn['remote#host#UpdateRemotePlugins']}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
paq {'junegunn/fzf', hook = vim.fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'ojroques/nvim-lspfuzzy'}
paq {'rafcamlet/nvim-luapad'}
paq {'svermeulen/vimpeccable'}

vim.g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
--- }}}

--- {{{ VIM Options
vim.b.expandtab = true
vim.b.smartindent = true
vim.b.tabstop = indent
vim.b.swapfile = false
vim.b.formatoptions = 'tqj'

vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.foldlevelstart = 0
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
--- }}}

-- {{{ Reload Mapping 
vimp.nnoremap('<leader>r', function()
	vimp.unmap_all()
	util.unload_lua_namespace('vimrc')
	vim.cmd('silent wa')
	require('vimrc')
	print('Reloaded vimrc!')
end)
-- }}}

--- {{{ Plugin Settings 
vim.g.python3_host_prog = '$HOME/.pyenv/versions/py3nvim/bin/python'
--- }}}

-- {{{ General Keyboard Mappings 
vimp.nnoremap('<leader>,', ',')
vimp.nnoremap('<leader>s', function() vim.cmd('write') end)
vimp.nnoremap('/',  '/\\v')		-- better searching
-- }}}

-- {{{ Window Movements
vimp.nnoremap('<M-j>', '<C-w>j')
vimp.nnoremap('<M-k>', '<C-w>k')
vimp.nnoremap('<M-l>', '<C-w>l')
vimp.nnoremap('<M-h>', '<C-w>h')
-- }}

-- {{ Insert Mode  Mappings
vimp.inoremap('jj', '<ESC>')
-- vim: fdm=marker
