let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/projects/nvim-plugins/dbt.nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit plugin/dbt.vim
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 30 + 32) / 64)
exe 'vert 1resize ' . ((&columns * 55 + 72) / 144)
exe '2resize ' . ((&lines * 29 + 32) / 64)
exe 'vert 2resize ' . ((&columns * 55 + 72) / 144)
exe '3resize ' . ((&lines * 30 + 32) / 64)
exe 'vert 3resize ' . ((&columns * 88 + 72) / 144)
exe '4resize ' . ((&lines * 29 + 32) / 64)
exe 'vert 4resize ' . ((&columns * 88 + 72) / 144)
argglobal
balt lua/dbt.lua
setlocal fdm=marker
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=3
setlocal fdn=5
setlocal fen
let s:l = 10 - ((8 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 10
normal! 035|
wincmd w
argglobal
if bufexists("autoload/dbt.vim") | buffer autoload/dbt.vim | else | edit autoload/dbt.vim | endif
if &buftype ==# 'terminal'
  silent file autoload/dbt.vim
endif
balt plugin/dbt.vim
setlocal fdm=marker
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=3
setlocal fdn=5
setlocal fen
let s:l = 4 - ((1 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 010|
wincmd w
argglobal
if bufexists("lua/dbt.lua") | buffer lua/dbt.lua | else | edit lua/dbt.lua | endif
if &buftype ==# 'terminal'
  silent file lua/dbt.lua
endif
balt plugin/dbt.vim
setlocal fdm=marker
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=3
setlocal fdn=5
setlocal fen
let s:l = 35 - ((16 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 35
normal! 0
wincmd w
argglobal
if bufexists("~/projects/jaffle_shop/models/customers.sql") | buffer ~/projects/jaffle_shop/models/customers.sql | else | edit ~/projects/jaffle_shop/models/customers.sql | endif
if &buftype ==# 'terminal'
  silent file ~/projects/jaffle_shop/models/customers.sql
endif
balt /usr/local/Cellar/neovim/HEAD-eece073/share/nvim/runtime/doc/map.txt
setlocal fdm=marker
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=3
setlocal fdn=5
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
4wincmd w
exe '1resize ' . ((&lines * 30 + 32) / 64)
exe 'vert 1resize ' . ((&columns * 55 + 72) / 144)
exe '2resize ' . ((&lines * 29 + 32) / 64)
exe 'vert 2resize ' . ((&columns * 55 + 72) / 144)
exe '3resize ' . ((&lines * 30 + 32) / 64)
exe 'vert 3resize ' . ((&columns * 88 + 72) / 144)
exe '4resize ' . ((&lines * 29 + 32) / 64)
exe 'vert 4resize ' . ((&columns * 88 + 72) / 144)
tabnext 1
badd +2 autoload/dbt.vim
badd +11 lua/dbt.lua
badd +1 plugin/dbt.vim
badd +1 man://concat(ntcl)
badd +1 man://basename(1)
badd +1 man://split(1)
badd +1 /usr/local/Cellar/neovim/HEAD-eece073/share/nvim/runtime/doc/map.txt
badd +0 ~/projects/jaffle_shop/models/customers.sql
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFc
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
