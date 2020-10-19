" ----------
" Global Configurations {{{1
" ----------
set hidden
set noswapfile
set termguicolors         " enables 24-bit color support
set clipboard=unnamedplus " use system clipboard
set number
set relativenumber
set shiftround            " round indent when using > and <
set mouse=nv
set icm=split       " show live preview of substitute command

colorscheme afterglow

"
" Shortcuts
"
let mapleader = ','

" vim-unimpaired like movements
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

" fzf-shortcuts
nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>/ :Rg<CR>

" Window Movements
map <M-j> <c-w>j
map <M-k> <c-w>k
map <M-l> <c-w>l
map <M-h> <c-w>h


"
" Packages
"
function! PackInit() abort

  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('danilo-augusto/vim-afterglow')
  call minpac#add('Shougo/deoplete.nvim')
  call minpac#add('autozimu/LanguageClient-neovim',
  \  {'branch': 'next', 'do': '!bash install.sh'})
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
endfunction

" Commands for updating packages
command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

" Python Globals
let g:python3_host_prog = '/Users/pedram.navid/.pyenv/versions/py3nvim/bin/python'

" Deoplete Options
" Deoplete provides async completion
let g:deoplete#enable_at_startup = 1

" LanguageClient Options
let g:LanguageClient_serverCommands = {
  \ 'python': ['/usr/local/bin/pyls'],
  \ 'vim': ['/usr/local/lib/node_modules/vim-language-server/bin/index.js', '--stdio'],
  \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
