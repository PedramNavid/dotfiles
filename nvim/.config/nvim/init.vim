" Basic Settings {{{1
" ----------

set clipboard+=unnamedplus   " use system clipboard
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
set colorcolumn=80
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c            " don't pass messages on ins completion menu
set signcolumn=yes
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set cmdheight=3
set statusline=%02n\ %<%f\ %H%M%R%W%q%=%-14.(%y\ %l\\%L,%c%V%)\ %P

colorscheme onedark

"  Filetype Mappings {{{1
"  ---------
augroup init_vim
  autocmd!
  autocmd! BufWritePost init.vim source %
augroup end

augroup filetype_python
  autocmd!
  autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup end

augroup file_read
  autocmd!
  autocmd VimEnter * :match Error /\v +$/
augroup end

augroup ft_lua  
  autocmd!
augroup end

" Mappings {{{1
" ----------
let mapleader = ','
let maplocalleader = '\'

" Normal mode mappings {{{2
nnoremap <leader>, ,
nnoremap <leader>ev :vsplit $myvimrc<cr>
nnoremap <leader>u ddkp
nnoremap <leader>d ddp
nnoremap <leader>s :write<cr>

" Highlight trailing spaces as errors
nnoremap <silent> <leader>w :match Error /\v +$/<CR>
nnoremap <silent> <leader>W :match none<CR>

nnoremap / /\v

" Window Movements
noremap <M-j> <c-w>j
noremap <M-k> <c-w>k
noremap <M-l> <c-w>l
noremap <M-h> <c-w>h

" Enable Fold Column Toggles
nnoremap <Leader>fc :call FoldColumnToggle()<CR>
function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=4
  endif
endfunction

" Quickfix Toggles
nnoremap <Leader>q :call QuickfixToggle()<CR>

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

" Insert mode mappings {{{2
inoremap <c-u> <esc>viwu<esc>ea
inoremap jj <esc>

" Plugin Mappings {{{2
" fzf
nnoremap <Leader>ff :Files<cr>
nnoremap <Leader>gf :GFiles<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>l :BLines<cr>
nnoremap <Leader>/ :Rg<cr>

" Terminal Mode {{{2
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

" Abbreviations {{{2
iabbrev adn and
iabbrev teh the
iabbrev tehn then

" Plugins {{{1
" --------
function! PackInit()

  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('PedramNavid/vim-dbt')
  call minpac#add('andrejlevkovitch/vim-lua-format')
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
  call minpac#add('vim-test/vim-test')
endfunction


" Commands {{{2
command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

" Plugin Settings {{{2
"
" vim-test {{{3
let test#strategy = 'dispatch'
let test#python#runner = 'pytest'
nmap <silent> <LocalLeader>tn :TestNearest<CR>
nmap <silent> <LocalLeader>tf :TestFile<CR>
nmap <silent> <LocalLeader>ts :TestSuite<CR>
nmap <silent> <LocalLeader>tl :TestLast<CR>
nmap <silent> <LocalLeader>tv :TestVisit<CR>
" Python Globals {{{3
" Create a py3nvim virtual env and install nvim from pip
let g:python3_host_prog = '$HOME/.pyenv/versions/py3nvim/bin/python'


" LanguageClient Options {{{3
" Use the same venv to install pyls
"
" Coc.nvim Plugin Settings {{{3
"
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-emmet',
      \ 'coc-highlight',
      \ 'coc-lists',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ 'coc-r-lsp',
      \ 'coc-json',
      \ 'coc-git',
      \ 'coc-tsserver',
      \ 'coc-python'
      \ ]

" Trigger completion and select from popup
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <Nul> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Jump to quick keys
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Other helpful shortcuts
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)
nmap <leader>e  :CocCommand explorer<CR>

" Text Objects in/all function in/all class
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Popup navigation
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Functions  {{{4
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" }}}

autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
