
" See plugin/bufkill.vim
" use emacs keybind
nmap <C-x>k :BD<CR>
nmap <silent> <Leader>bn    <Plug>BufKillBack
nmap <silent> <Leader>bp    <Plug>BufKillForward
nmap <silent> <Leader>bd    <Plug>BufKillBd
nmap <silent> <Leader>bu    <Plug>BufKillUndo
"Write buffer (save)
nnoremap <C-s> :<C-u>write<CR>
"yank to end
nnoremap Y y$
" Whitespace jump (see plugin/whitespace.vim)
nnoremap ]w :<C-u>WhitespaceNext<CR>
nnoremap [w :<C-u>WhitespacePrev<CR>
" Remove spaces at the end of lines
nnoremap <silent> <Space>cw :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" insert keymap like emacs
inoremap <C-w> <C-[>diwi
" inoremap <C-BS> <C-[>diwa
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k>  <ESC>d$a
inoremap <C-u> <C-G>u<C-U>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <ESC>^i
inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"
"insert a newline
inoremap <C-O> <Esc>o
inoremap <C-L> <Esc>O

imap <C-S> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>

" command line alias
cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

tnoremap <A-[> <C-\><C-n>

function! s:QuiteVim() abort
  if empty(expand('%:t'))
    execute ":wqa"
  else
    execute ":wqa!"
  endif
endfunction
" Quiet
nnoremap <leader>qq :call <SID>QuiteVim()<CR>
nnoremap <leader>qw <esc>:q!<CR>

"switch window
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" window
nnoremap <leader>ws :<C-u>sp<CR>
nnoremap <leader>wv :<C-u>vs<CR>

" Session management shortcuts (see plugin/sessions.vim)
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>


"----------------------"
"Yilin-Yang/vim-markbar"
"----------------------"
" Jump to marks using <Enter>,
"    Move the cursor to the next mark in the markbar using n,
"    Move the cursor to the previous mark in the markbar using N,
"    Rename marks using r,
"    Clear the name of a mark using c,
"    Delete marks entirely using d.
nmap <Leader>M <Plug>ToggleMarkbar


"-----------------"
"simeji/winresizer"
"-----------------"
" Shortkeys for open interactive console: <C-e>
"

" nmap <Leader>hm :FloatermNew! --height=1.0 --width=0.5 --wintype=float --name=key_map --position=right cd $HOME/.config/nvim/core && nvim -c \"e pmap.vim\|sp vmap.vim\"<CR>

