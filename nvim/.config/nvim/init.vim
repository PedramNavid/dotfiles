" Basic Settings {{{1
" ----------
set clipboard+=unnamedplus   " use system clipboard
set cmdheight=3
set colorcolumn=80
set expandtab
set foldlevelstart=0        " 0 is fold everything, -1 is fold nothing
set foldmethod=manual
set formatoptions-=ro
set hidden
set icm=split               " show live preview of substitute command
set ignorecase
set joinspaces
set list
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

set statusline=%02n\ %<%f\ %H%M%R%W%q%=%-14.(%y\ %l\\%L,%c%V%)\ %P

" Lua-based Settings {{{1
lua require('tools')
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

  call minpac#add('andrejlevkovitch/vim-lua-format')
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('hashivim/vim-terraform')
" call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
  call minpac#add('neovim/nvim-lspconfig')
  call minpac#add('nvim-lua/plenary.nvim')
  call minpac#add('nvim-lua/popup.nvim')
  call minpac#add('nvim-telescope/telescope.nvim')
" call minpac#add('preservim/nerdtree')
  call minpac#add('rafcamlet/nvim-luapad')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-dispatch')
" call minpac#add('vim-test/vim-test')

  call minpac#add('ryanoasis/vim-devicons')
  call minpac#add('kyazdani42/nvim-web-devicons')
endfunction

" Plugin Mappings {{{2
" Telescope {{{3
nnoremap <Leader>ff <cmd>Telescope find_files<cr>
nnoremap <Leader>fb <cmd>Telescope file_browser<cr>
nnoremap <Leader>gf <cmd>Telescope live_grep<cr>
nnoremap <Leader>b <cmd>Telescope buffers<cr>

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
lua require('config.devicons')


" nvim-lspconfig {{{3

lua << EOF
require'lspconfig'.pyright.setup{}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>td', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

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
