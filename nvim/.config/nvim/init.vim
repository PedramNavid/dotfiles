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
set updatetime=300
set wildmode=list,longest
set rtp+=~/projects/nvim-plugins/neodbt.nvim
set statusline=%02n\ %<%f\ %H%M%R%W%q%=%-14.(%y\ %l\\%L,%c%V%)\ %P

" Lua-based Settings {{{1
lua require('pedram.globals')
let g:vimsyn_embed = 'l'

" }}}

colorscheme lena

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
  call minpac#add('hashivim/vim-terraform')
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('kristijanhusak/completion-tags')
  call minpac#add('kyazdani42/nvim-web-devicons')
  call minpac#add('neovim/nvim-lspconfig')
  call minpac#add('nvim-lua/completion-nvim')
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
" Nerdtree {{{3
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
"}}}


" Plugin Commands {{{2
command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
" }}}

" Plugin Settings {{{2

nnoremap <LocalLeader>vs :source $MYVIMRC<cr>

lua require('pedram.devicons')
lua require('pedram.lsp-bindings')
lua require('pedram.telescope')

" nvim-completion
" https://github.com/nvim-lua/completion-nvim
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_enable_auto_hover = 1
" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
" let g:completion_enable_snippet = 'UltiSnips'

" vim-test {{{3
" let test#strategy = 'dispatch'
" let test#python#runner = 'pytest'
" nmap <silent> <LocalLeader>tn :TestNearest<CR>
" nmap <silent> <LocalLeader>tf :TestFile<CR>
" nmap <silent> <LocalLeader>ts :TestSuite<CR>
" nmap <silent> <LocalLeader>tl :TestLast<CR>
" nmap <silent> <LocalLeader>tv :TestVisit<CR>

" Python Globals {{{3
" Create a py3nvim virtual env and install nvim from pip
let g:python3_host_prog = '$HOME/.pyenv/versions/py3nvim/bin/python'

" Dev Icons

" Coc.nvim Plugin Settings {{{3
"
" let g:coc_global_extensions = [
"       \ 'coc-highlight',
"       \ 'coc-lists',
"       \ 'coc-prettier',
"       \ 'coc-snippets',
"       \ 'coc-vimlsp',
"       \ 'coc-yaml',
"       \ 'coc-yank',
"       \ 'coc-json',
"       \ 'coc-git',
"       \ 'coc-tsserver'
"       \ ]
"
" " Trigger completion and select from popup
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <Nul> coc#refresh()
"
" " Diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" " Jump to quick keys
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" " Other helpful shortcuts
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" nmap <leader>rn <Plug>(coc-rename)
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format)
" nmap <leader>e  :CocCommand explorer<CR>
" nmap <leader>ac  <Plug>(coc-codeaction)
"
" " Text Objects in/all function in/all class
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
"
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)
"
" " Popup navigation
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Functions  {{{4
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction
"
" " }}}
"
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Remap <C-f> and <C-b> for scroll float windows/popups.
" " Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
"
" command! -nargs=0 Format :call CocAction('format')
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
