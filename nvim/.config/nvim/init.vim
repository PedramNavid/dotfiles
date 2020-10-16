" Global Configurations

set hidden
set noswapfile

set termguicolors   " enables 24-bit color support

colorscheme afterglow
" Shortcuts

" vim-unimpaired like movements
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

" Packages
function! PackInit() abort

  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('danilo-augusto/vim-afterglow')
  call minpac#add('Shougo/deoplete.nvim')
  call minpac#add('autozimu/LanguageClient-neovim',
  \  {'branch': 'next', 'do': '!bash install.sh'})
  call minpac#add('junegunn/fzf')
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
