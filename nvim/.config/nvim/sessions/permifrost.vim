let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/projects/permifrost
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd tests/permifrost/core/permissions/test_snowflake_grants.py
edit src/permifrost/core/permissions/utils/snowflake_grants.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
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
exe 'vert 1resize ' . ((&columns * 105 + 105) / 210)
exe '2resize ' . ((&lines * 31 + 33) / 66)
exe 'vert 2resize ' . ((&columns * 104 + 105) / 210)
exe '3resize ' . ((&lines * 30 + 33) / 66)
exe 'vert 3resize ' . ((&columns * 104 + 105) / 210)
argglobal
balt tests/permifrost/core/permissions/test_snowflake_grants.py
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=3
setlocal fdn=5
setlocal fen
let s:l = 1664 - ((16 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1664
normal! 013|
wincmd w
argglobal
if bufexists("todo.txt") | buffer todo.txt | else | edit todo.txt | endif
if &buftype ==# 'terminal'
  silent file todo.txt
endif
balt src/permifrost/core/permissions/utils/snowflake_grants.py
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=3
setlocal fdn=5
setlocal fen
let s:l = 5 - ((4 * winheight(0) + 15) / 31)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 042|
wincmd w
argglobal
if bufexists("term://~/projects/permifrost//85929:/bin/zsh") | buffer term://~/projects/permifrost//85929:/bin/zsh | else | edit term://~/projects/permifrost//85929:/bin/zsh | endif
if &buftype ==# 'terminal'
  silent file term://~/projects/permifrost//85929:/bin/zsh
endif
balt todo.txt
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=3
setlocal fdn=5
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 023|
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 105 + 105) / 210)
exe '2resize ' . ((&lines * 31 + 33) / 66)
exe 'vert 2resize ' . ((&columns * 104 + 105) / 210)
exe '3resize ' . ((&lines * 30 + 33) / 66)
exe 'vert 3resize ' . ((&columns * 104 + 105) / 210)
tabnext 1
badd +1 tests/permifrost/core/permissions/test_snowflake_grants.py
badd +1606 src/permifrost/core/permissions/utils/snowflake_grants.py
badd +5 todo.txt
badd +0 term://~/projects/permifrost//85929:/bin/zsh
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
