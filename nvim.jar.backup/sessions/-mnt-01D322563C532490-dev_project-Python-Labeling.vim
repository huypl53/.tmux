let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd /mnt/01D322563C532490/dev_project/Python/Labeling
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +4 /mnt/01D322563C532490/dev_project/Python/Labeling/cocc2voc.py
badd +17 /mnt/01D322563C532490/dev_project/Python/Labeling/coco_sample.json
argglobal
%argdel
edit /mnt/01D322563C532490/dev_project/Python/Labeling/cocc2voc.py
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 94 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 95 + 95) / 190)
argglobal
balt /mnt/01D322563C532490/dev_project/Python/Labeling/coco_sample.json
let s:l = 8 - ((7 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 04|
wincmd w
argglobal
if bufexists("/mnt/01D322563C532490/dev_project/Python/Labeling/coco_sample.json") | buffer /mnt/01D322563C532490/dev_project/Python/Labeling/coco_sample.json | else | edit /mnt/01D322563C532490/dev_project/Python/Labeling/coco_sample.json | endif
if &buftype ==# 'terminal'
  silent file /mnt/01D322563C532490/dev_project/Python/Labeling/coco_sample.json
endif
balt /mnt/01D322563C532490/dev_project/Python/Labeling/cocc2voc.py
let s:l = 17 - ((16 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 17
normal! 023|
wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 95 + 95) / 190)
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
