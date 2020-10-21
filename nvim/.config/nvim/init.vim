" Basic Settings {{{1
" ----------

set clipboard=unnamedplus   " use system clipboard
set foldlevelstart=0        " 0 is fold everything, -1 is fold nothing
set hidden
set icm=split               " show live preview of substitute command
set mouse=nv
set noswapfile
set number
set relativenumber
set shiftround              " round indent when using > and <
set splitbelow
set splitright
set termguicolors           " enables 24-bit color support

colorscheme afterglow
set statusline=%02n\ %<%f\ %H%M%R%W%q%=%-14.(%y\ %l\\%L,%c%V%)\ %P

"  Filetype Mappings {{{1
"  ---------
augroup init_vim
  autocmd!
  autocmd! BufWritePost init.vim source %
augroup end

augroup filetype_python
  autocmd!
  autocmd FileType python   :iabbrev <buffer> iff if:<left>
augroup end


" Mappings {{{1
" ----------
let mapleader = ','
let maplocalleader = '\\'

" Normal mode mappings {{{2
nnoremap <leader>, ,
nnoremap <leader>u ddkp
nnoremap <leader>ev :vsplit $myvimrc<cr>
nnoremap <leader>d ddp
nnoremap <leader>s :write<cr>

" vim-unimpaired like shortcuts
nnoremap <silent> [b :bprevious<cr>
nnoremap <silent> ]b :bnext<cr>
nnoremap :yoh set hlsearch!<cr>

" vim-surround like shortcuts
" surrounds word with quotes. example gave lel as the last command but E
" seems to work fine?
nnoremap <Leader>" viw<esc>a"<esc>bi"<esc>E
nnoremap <Leader>' viw<esc>a'<esc>bi'<esc>E

" Window Movements
noremap <M-j> <c-w>j
noremap <M-k> <c-w>k
noremap <M-l> <c-w>l
noremap <M-h> <c-w>h

" Insert mode mappings {{{2
inoremap <c-u> <esc>viwu<esc>ea
inoremap jj <esc>

" Plugin Mappings {{{2
" fzf
nnoremap <Leader>f :GFiles<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>l :BLines<cr>
nnoremap <Leader>/ :Rg<cr>

" Terminal Mode {{{2
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

" Abbreviations {{{2
iabbrev @@ Pedram Navid
iabbrev adn and
iabbrev teh the
iabbrev tehn then

" Plugins {{{1
" --------
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

" Commands {{{2
command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

" Plugin Settings {{{2
"
" Python Globals {{{3
" Need to make sure this venv exists!
let g:python3_host_prog = '/Users/pedram.navid/.pyenv/versions/py3nvim/bin/python'

" Deoplete Options {{{3
" Deoplete provides async completion
let g:deoplete#enable_at_startup = 1

" LanguageClient Options {{{3
let g:LanguageClient_serverCommands = {
      \ 'python': ['/usr/local/bin/pyls'],
      \ 'vim': ['/usr/local/lib/node_modules/vim-language-server/bin/index.js', '--stdio'],
      \ }
nnoremap <silent> K :call LanguageClient#textDocument_hover()<cr>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<cr>
