" Basic Settings {{{1
" ----------
set clipboard+=unnamedplus   " use system clipboard
set cmdheight=3
set colorcolumn=80
set expandtab
set foldlevelstart=0        " 0 is fold everything, -1 is fold nothing
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldminlines=3
set foldnestmax=5
set formatoptions-=ro
set hidden
set icm=split               " show live preview of substitute command
set ignorecase
set joinspaces
set list
set listchars=tab:▸\ ,eol:↲,trail:·
set mouse=nv
set nobackup
set noswapfile
set nowrap
set nowritebackup
set number
set relativenumber
set shiftround              " round indent when using > and <
set shiftwidth=4
set shortmess+=c            " don't pass messages on ins completion menu
set signcolumn=yes
set smartcase
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set termguicolors
set updatetime=300
set wildmode=list,longest
set rtp+=~/projects/nvim-plugins/neodbt.nvim
set statusline=%02n\ %<%f\ %H%M%R%W%q%=%-14.(%y\ %l\\%L,%c%V%)\ %P

" Lua-based Settings {{{1
let g:vimsyn_embed = 'l'

" }}}

colorscheme aquarium

"  Autogroups {{{1
"  ---------
function! TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

set list listchars=trail:.,extends:>

augroup trim_whitespace
    autocmd!
    autocmd FileWritePre * call TrimWhiteSpace()
    autocmd FileAppendPre * call TrimWhiteSpace()
    autocmd FilterWritePre * call TrimWhiteSpace()
    autocmd BufWritePre * call TrimWhiteSpace()
augroup end

augroup init_vim
  autocmd!
  autocmd BufWritePost init.vim :source $MYVIMRC
augroup end

augroup file_read
  autocmd!
  autocmd VimEnter * :match Error /\v +$/
augroup end

augroup lua_format
  autocmd!
  autocmd FileType lua nnoremap <buffer> <LocalLeader>f :call LuaFormat()<cr>
  autocmd BufWritePre *.lua call LuaFormat()
augroup end

" Mappings {{{1
" ----------
let mapleader = ','
let maplocalleader = '\'

" Normal mode mappings {{{2
nnoremap <leader>, ,
nnoremap / /\v
nnoremap <leader>s :write<cr>
nnoremap <leader>= :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Highlight trailing spaces as errors
nnoremap <silent> <leader>w :match Error /\v +$/<CR>
nnoremap <silent> <leader>W :match none<CR>

" Window Movements {{{3
noremap <M-j> <c-w>j
noremap <M-k> <c-w>k
noremap <M-l> <c-w>l
noremap <M-h> <c-w>h
" }}}

" Enable Fold Column Toggles {{{3
nnoremap <Leader>fc :call FoldColumnToggle()<CR>
function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=4
  endif
endfunction
" }}}

" Quickfix Toggles {{{3
nnoremap <LocalLeader>q :call QuickfixToggle()<CR>
let g:quickfix_is_open = 0
function! QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction
" }}}

" Insert mode mappings {{{2
inoremap jj <esc>

" Terminal Mode {{{2
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

" Abbreviations {{{1
iabbrev adn and
iabbrev teh the
iabbrev tehn then
iabbrev pigeoin pigeon


" Plugins {{{1
" --------
function! PackInit()

  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('andrejlevkovitch/vim-lua-format')
  call minpac#add('bfredl/nvim-luadev')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('euclidianAce/BetterLua.vim')
  call minpac#add('folke/lua-dev.nvim')
  call minpac#add('FrenzyExists/aquarium-vim')
  call minpac#add('hashivim/vim-terraform')
  call minpac#add('hrsh7th/cmp-nvim-lsp')
  call minpac#add('hrsh7th/cmp-buffer')
  call minpac#add('hrsh7th/nvim-cmp')
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('kyazdani42/nvim-web-devicons')
  call minpac#add('neovim/nvim-lspconfig')
  call minpac#add('norcalli/nvim-colorizer.lua')
  call minpac#add('nvim-lua/plenary.nvim')
  call minpac#add('nvim-lua/popup.nvim')
  call minpac#add('nvim-telescope/telescope.nvim')
  call minpac#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})
  call minpac#add('psf/black')
  call minpac#add('rafcamlet/nvim-luapad')
  call minpac#add('ryanoasis/vim-devicons')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')

endfunction

" Plugin Mappings {{{2
"
nnoremap <LocalLeader>s :source<CR>
" Telescope {{{3
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>fbh <cmd>lua require('telescope.builtin').file_browser({hidden=true})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <Leader>gf <cmd>Telescope live_grep<cr>

" Luadev
nnoremap <LocalLeader>rl <Plug>(Luadev-RunLine)
nnoremap <LocalLeader>rr <Plug>(Luadev-Run)

" Plugin Commands {{{2
command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
" }}}

" Plugin Settings {{{2
"
lua require'colorizer'.setup()

nnoremap <LocalLeader>vs :source $MYVIMRC<cr>

lua require('pedram.startup')

" nvim-completion
" https://github.com/nvim-lua/completion-nvim
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menu,menuone,noselect
set shortmess+=c
let g:completion_enable_auto_hover = 1
" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
" let g:completion_enable_snippet = 'UltiSnips'


" Python Globals {{{3
" Create a py3nvim virtual env and install nvim from pip
let g:python3_host_prog = '$HOME/.pyenv/versions/py3nvim/bin/python'


