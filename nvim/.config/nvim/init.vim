" Global Configurations

set hidden
set noswapfile

set shiftwidth=4    " number of spaces to use for each indent
set tabstop=4       " tabs appear as 4 spaces
set softtabstop=4   " pressing tab inserts 4 spaces
set expandtab       " pressing tab uses spaces instead of tabs
set smartindent     " auto-indent on new lines

set colorcolumn=80
set termguicolors   " enables 24-bit color support

colorscheme afterglow

" Packages
function! PackInit() abort
    packadd minpac

    call minpac#init()
    call minpac#add('k-takata/minpac', {'type': 'opt'})

    call minpac#add('danilo-augusto/vim-afterglow')
    call minpac#add('Shougo/deoplete.nvim')
    call minpac#add('autozimu/LanguageClient-neovim', {'branch': 'next', 'do': '!bash install.sh'})
endfunction

" Commands for updating packages
command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

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
