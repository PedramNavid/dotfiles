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
33
normal! zo
59
normal! zo
186
normal! zo
1587
normal! zo
let s:l = 97 - ((55 * winheight(0) + 41) / 82)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 97
normal! 057|
wincmd w
argglobal
if bufexists("term://~/projects/permifrost//12528:/bin/zsh") | buffer term://~/projects/permifrost//12528:/bin/zsh | else | edit term://~/projects/permifrost//12528:/bin/zsh | endif
if &buftype ==# 'terminal'
  silent file term://~/projects/permifrost//12528:/bin/zsh
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
let s:l = 35 - ((0 * winheight(0) + 41) / 82)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 35
normal! 027|
wincmd w
exe 'vert 1resize ' . ((&columns * 160 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 159 + 160) / 320)
tabnext 1
badd +48 src/permifrost/core/permissions/utils/snowflake_grants.py
badd +0 term://~/projects/permifrost//12528:/bin/zsh
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
