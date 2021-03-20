let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd /mnt/01D322563C532490/dev_project/Python/NLP/cv_ranking
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +119 utils/ranking.py
argglobal
%argdel
edit utils/ranking.py
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 68 + 69) / 138)
exe '2resize ' . ((&lines * 21 + 23) / 46)
exe 'vert 2resize ' . ((&columns * 69 + 69) / 138)
exe '3resize ' . ((&lines * 21 + 23) / 46)
exe 'vert 3resize ' . ((&columns * 69 + 69) / 138)
argglobal
balt utils/extraction.py
let s:l = 138 - ((25 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 138
normal! 034|
wincmd w
argglobal
if bufexists("utils/ranking.py") | buffer utils/ranking.py | else | edit utils/ranking.py | endif
if &buftype ==# 'terminal'
  silent file utils/ranking.py
endif
balt FAR\ 7
let s:l = 31 - ((15 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 31
normal! 018|
wincmd w
argglobal
if bufexists("utils/ranking.py") | buffer utils/ranking.py | else | edit utils/ranking.py | endif
if &buftype ==# 'terminal'
  silent file utils/ranking.py
endif
balt utils/extraction.py
let s:l = 119 - ((13 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 119
normal! 017|
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 68 + 69) / 138)
exe '2resize ' . ((&lines * 21 + 23) / 46)
exe 'vert 2resize ' . ((&columns * 69 + 69) / 138)
exe '3resize ' . ((&lines * 21 + 23) / 46)
exe 'vert 3resize ' . ((&columns * 69 + 69) / 138)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=30 winminheight=1 winminwidth=10 shortmess=aFcI
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
