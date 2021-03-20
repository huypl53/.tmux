let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd /mnt/01D322563C532490/dev_project/Python/Data_Generator/validate
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +29 /mnt/01D322563C532490/dev_project/Python/Data_Generator/validate/dataset.py
argglobal
%argdel
edit /mnt/01D322563C532490/dev_project/Python/Data_Generator/validate/dataset.py
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 20 + 25) / 50)
exe '2resize ' . ((&lines * 27 + 25) / 50)
exe 'vert 2resize ' . ((&columns * 72 + 77) / 154)
exe '3resize ' . ((&lines * 27 + 25) / 50)
exe 'vert 3resize ' . ((&columns * 81 + 77) / 154)
argglobal
let s:l = 143 - ((12 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 143
normal! 08|
wincmd w
argglobal
if bufexists("/mnt/01D322563C532490/dev_project/Python/Data_Generator/validate/dataset.py") | buffer /mnt/01D322563C532490/dev_project/Python/Data_Generator/validate/dataset.py | else | edit /mnt/01D322563C532490/dev_project/Python/Data_Generator/validate/dataset.py | endif
if &buftype ==# 'terminal'
  silent file /mnt/01D322563C532490/dev_project/Python/Data_Generator/validate/dataset.py
endif
let s:l = 69 - ((23 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 69
normal! 0
wincmd w
argglobal
if bufexists("/mnt/01D322563C532490/dev_project/Python/Data_Generator/validate/dataset.py") | buffer /mnt/01D322563C532490/dev_project/Python/Data_Generator/validate/dataset.py | else | edit /mnt/01D322563C532490/dev_project/Python/Data_Generator/validate/dataset.py | endif
if &buftype ==# 'terminal'
  silent file /mnt/01D322563C532490/dev_project/Python/Data_Generator/validate/dataset.py
endif
let s:l = 30 - ((16 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 30
normal! 0
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 20 + 25) / 50)
exe '2resize ' . ((&lines * 27 + 25) / 50)
exe 'vert 2resize ' . ((&columns * 72 + 77) / 154)
exe '3resize ' . ((&lines * 27 + 25) / 50)
exe 'vert 3resize ' . ((&columns * 81 + 77) / 154)
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
