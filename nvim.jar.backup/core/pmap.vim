" File              : pmap.vim
" Author            : phamlehuy53 <unknownsol98@gmail>
" Date              : 22.01.2021
" Last Modified Date: 15.02.2021
" Last Modified By  : phamlehuy53 <unknownsol98@gmail>

"--------------------------"
"     vim-buffet Keymap    "
"--------------------------"
nnoremap  ]b :<C-u>bp<CR>
nnoremap  [b :<C-u>bn<CR>
nnoremap <silent> <Leader>bc :Bonly<CR>
nnoremap <silent> <Leader>bx :Bw<CR>
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

nmap <leader>e :CocCommand explorer<CR>
noremap <silent> <Leader>j :execute 'CocCommand explorer' .
		\ ' --toggle' .
		\ ' --position=floating' .
		\ ' --sources=file+'<CR>

nnoremap <silent> <Leader>od :DBUIToggle<CR>

"--------------------------"
"     vim-clap Keymap      "
"--------------------------"
nnoremap <silent> <Leader>tc :<C-u>Clap colors<CR>
nnoremap <silent> <Leader>bb :<C-u>Clap buffers<CR>
nnoremap <silent> <Leader>fa :<C-u>Clap grep2<CR>
nnoremap <silent> <Leader>fb :<C-u>Clap marks<CR>
"like emacs counsel-find-file
nnoremap <silent> <C-x><C-f> :<C-u>Clap filer<CR>
nnoremap <silent> <Leader>ff :<C-u>Clap files ++finder=rg --ignore --hidden --files<cr>
nnoremap <silent> <Leader>fg :<C-u>Clap gfiles<CR>
nnoremap <silent> <Leader>fw :<C-u>Clap grep ++query=<cword><cr>
nnoremap <silent> <Leader>fh :<C-u>Clap history<CR>
nnoremap <silent> <Leader>fW :<C-u>Clap windows<CR>
nnoremap <silent> <Leader>fl :<C-u>Clap loclist<CR>
nnoremap <silent> <Leader>fu :<C-u>Clap git_diff_files<CR>
nnoremap <silent> <Leader>fv :<C-u>Clap grep ++query=@visual<CR>
nnoremap <silent> <Leader>oc :<C-u>Clap personalconf<CR>

"--------------------------"
"     coc-clap Keymap      "
"--------------------------"
" Show all diagnostics
nnoremap <silent> <Leader>ce  :Clap coc_diagnostics<CR>
" Manage extensions
nnoremap <silent> <Leader>;   :Clap coc_extensions<CR>
" Show commands
nnoremap <silent> <Leader>,   :Clap coc_commands<CR>
" Search workspace symbols
nnoremap <silent> <Leader>cs  :Clap coc_symbols<CR>
nnoremap <silent> <Leader>cS  :Clap coc_services<CR>
nnoremap <silent> <leader>ct  :Clap coc_outline<CR>
" TODO
function! InitCaw() abort
	if ! (&l:modifiable && &buftype ==# '')
		silent! nunmap <buffer> gc
		silent! xunmap <buffer> gc
		silent! nunmap <buffer> gcc
		silent! xunmap <buffer> gcc
	else
		nmap <buffer> gc <Plug>(caw:prefix)
		xmap <buffer> gc <Plug>(caw:prefix)
		nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
		xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
	endif
endfunction
autocmd FileType * call InitCaw()
call InitCaw()

nnoremap <silent> <Leader>i :<C-u>Vista!!<CR>

nnoremap <silent> <Leader>cr :QuickRun<CR>

nnoremap <silent> <Leader>M :MundoToggle<CR>

nmap gsj <Plug>(easymotion-w)
nmap gsk <Plug>(easymotion-b)
nmap gsf <Plug>(easymotion-overwin-f)
nmap gss <Plug>(easymotion-overwin-f2)


nmap <silent> sa <Plug>(operator-sandwich-add)
xmap <silent> sa <Plug>(operator-sandwich-add)
omap <silent> sa <Plug>(operator-sandwich-g@)
nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap <silent> sd <Plug>(operator-sandwich-delete)
nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)  xmap <silent> sr <Plug>(operator-sandwich-replace)
nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
omap ib <Plug>(textobj-sandwich-auto-i)
xmap ib <Plug>(textobj-sandwich-auto-i)
omap ab <Plug>(textobj-sandwich-auto-a)
xmap ab <Plug>(textobj-sandwich-auto-a)
omap is <Plug>(textobj-sandwich-query-i)
xmap is <Plug>(textobj-sandwich-query-i)
omap as <Plug>(textobj-sandwich-query-a)
xmap as <Plug>(textobj-sandwich-query-a)

silent! xmap I  <Plug>(niceblock-I)
silent! xmap gI <Plug>(niceblock-gI)
silent! xmap A  <Plug>(niceblock-A)

xmap v <Plug>(expand_region_expand)
xmap V <Plug>(expand_region_shrink)

nmap dsf <Plug>DsfDelete
nmap csf <Plug>DsfChange

" Prettier splits and joins patterns inside (), {}, [],...
let g:splitjoin_join_mapping = ''
let g:splitjoin_split_mapping = ''
nmap sj :SplitjoinJoin<CR>
nmap sk :SplitjoinSplit<CR>

xmap p <Plug>(operator-replace)

omap <silent> ab <Plug>(textobj-multiblock-a)
omap <silent> ib <Plug>(textobj-multiblock-i)
xmap <silent> ab <Plug>(textobj-multiblock-a)
xmap <silent> ib <Plug>(textobj-multiblock-i)

omap <silent> af <Plug>(textobj-function-a)
omap <silent> if <Plug>(textobj-function-i)
xmap <silent> af <Plug>(textobj-function-a)
xmap <silent> if <Plug>(textobj-function-i)

nnoremap <silent> <Leader>ga :Git add %:p<CR>
nnoremap <silent> <Leader>gd :Gdiffsplit<CR>
nnoremap <silent> <Leader>gc :Git commit<CR>
nnoremap <silent> <Leader>gb :Git blame<CR>
nnoremap <silent> <Leader>gf :Gfetch<CR>
nnoremap <silent> <Leader>gs :Git<CR>
nnoremap <silent> <Leader>gp :Gpush<CR>

"--------------------------"
"     Coc Keymap           "
"--------------------------"
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <Leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <Leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" Do default action for next item.
nmap <silent> [a  :<C-u>CocNext<CR>
" Do default action for previous item.
nmap <silent> ]a  :<C-u>CocPrev<CR>
" Use [e and ]e for navigate diagnostics
nmap <silent> ]e <Plug>(coc-diagnostic-prev)
nmap <silent> [e <Plug>(coc-diagnostic-next)
" Remap for rename current word
nmap <Leader>cn <Plug>(coc-rename)
" Remap for format selected region
vmap <Leader>cf  <Plug>(coc-format-selected)
nmap <Leader>cf  <Plug>(coc-format-selected)
" Fix autofix problem of current line
nmap <Leader>cF  <Plug>(coc-fix-current)
" Remap keys for gotos
nmap <silent> gd :<C-u>call initself#definition_other_window()<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> <Leader>ci <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K for show documentation in float window
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
" use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nmap ]g <Plug>(coc-git-prevchunk)
nmap [g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap <Leader>gi <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap <Leader>gm <Plug>(coc-git-commit)
" float window scroll
nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
" Add :OR command for organize imports of the current buffer.
command! -nargs=0 OR  :call CocAction('runCommand', 'editor.action.organizeImport')
nnoremap <silent> <Leader>co :<C-u>OR<CR>
" multiple cursors
nmap <silent><M-s> <Plug>(coc-cursors-position)
nmap <expr> <silent><M-d> initself#select_current_word()
xmap <silent><M-d> <Plug>(coc-cursors-range)
nmap <silent><M-c>  <Plug>(coc-cursors-operator)

" Use :Format for format current buffer
command! -nargs=0 Format :call CocAction('format')

nnoremap  <Leader>fz :<C-u>CocSearch -w<Space>
" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
nmap gcj :execute 'CocCommand docthis.documentThis'<CR>


"--------------------------"
"     vim-floaterm Keymap  "
"--------------------------"

nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <C-_>  :FloatermNew --height=0.5 --width=0.5 --wintype=floating --position=bottomright<CR>
tnoremap <localleader>b <C-\><C-n><C-w>h
nnoremap <localleader>b :FloatermToggle<CR>
nmap <localleader>cp :call coc#float#close_all() <CR>
nnoremap <silent> <Leader>ot :<C-u>FloatermToggle<CR>
tnoremap <silent> <Leader>ot <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <Leader>gz :<C-u>FloatermNew height=0.7 width=0.8 lazygit<CR>

autocmd filetype cpp nnoremap <F2> :w <bar> FloatermSend g++ -std=c++14 % -o %:r <CR>
autocmd filetype cpp nnoremap <F3> :exec 'FloatermSend ./%:r' <bar> FloatermToggle<CR>
autocmd filetype cpp nnoremap <F4> :exec 'FloatermSend ./%:r < %:r.inp' <bar> FloatermToggle<CR>

" function! StartFloatermSilently() abort
"   FloatermNew
"   call timer_start(1, {-> execute('FloatermHide!')})
" endfunction
" autocmd VimEnter * call StartFloatermSilently()

nnoremap <silent> <C-i> <C-i>


"--------------------------"
"     Ipython-cell Keymap  "
"--------------------------"
" [hanschen/vim-ipython-cell]
autocmd FileType python nnoremap <leader>as :SlimeSend1 ipython --matplotlib<CR>
autocmd FileType python nnoremap <leader>ar :IPythonCellRun<CR>
autocmd FileType python nnoremap <leader>aR :IPythonCellRunTime<CR>
autocmd FileType python nnoremap <leader>ac :IPythonCellExecuteCell<CR>
autocmd FileType python nnoremap <leader>aC :IPythonCellExecuteCellJump<CR>
autocmd FileType python nnoremap <leader>ae :IPythonCellExecuteCellVerbose<CR>
autocmd FileType python nnoremap <leader>aE :IPythonCellExecuteCellVerboseJump<CR>
autocmd FileType python nnoremap <leader>al :IPythonCellClear<CR>
autocmd FileType python nnoremap <leader>ax :IPythonCellClose<CR>
autocmd FileType python nnoremap [c :IPythonCellPrevCell<CR>
autocmd FileType python nnoremap ]c :IPythonCellNextCell<CR>
autocmd FileType python nmap <leader>ah <Plug>SlimeLineSend
autocmd FileType python xmap <leader>ah <Plug>SlimeRegionSend
autocmd FileType python nnoremap <leader>ap :IPythonCellPrevCommand<CR>
autocmd FileType python nnoremap <leader>aQ :IPythonCellRestart<CR>
autocmd FileType python nnoremap <leader>ad :SlimeSend1 %debug<CR>
autocmd FileType python nnoremap <leader>aq :SlimeSend1 exit<CR>
autocmd FileType python autocmd filetype python nnoremap <F2> :SlimeSend1 python % <CR>
" let g:ipython_cell_tag = ['# %%', '#%%', '# <codecell>', '##']



" Goyo
nnoremap <Leader>G :Goyo<CR>

" Markdown preview
nnoremap <silent> <Leader>om  :<C-u>MarkdownPreview<CR>

" Open dashboard
nnoremap <silent> <Leader>os  :<C-u>Dashboard<CR>

"-------"
"Far.vim"
"-------"
"shortcut for far.vim find
nnoremap <silent> <localleader>f  :Farf<cr>
vnoremap <silent> <localleader>f  :Farf<cr>

" shortcut for far.vim replace
nnoremap <silent> <localleader>r  :Farr<cr>
vnoremap <silent> <localleader>r  :Farr<cr>


"---------------------"
"pechorin/any-jump.vim"
"---------------------"
" Normal mode: Jump to definition under cursore
nnoremap <leader>mj :AnyJump<CR>

" Visual mode: jump to selected text in visual mode
xnoremap <leader>mj :AnyJumpVisual<CR>

" Normal mode: open previous opened file (after jump)
nnoremap <leader>mb :AnyJumpBack<CR>

" Normal mode: open last closed search window again
nnoremap <leader>ml :AnyJumpLastResults<CR>


"----------------------------"
"jeetsukumaran/vim-indentwise"
"----------------------------"
" [- : Move to previous line of lesser indent than the current line.
" [+ : Move to previous line of greater indent than the current line.
" [= : Move to previous line of same indent as the current line that is separated from the current line by lines of different indents.
" ]- : Move to next line of lesser indent than the current line.
" ]+ : Move to next line of greater indent than the current line.
" ]= : Move to next line of same indent as the current line that is separated from the current line by lines of different indents.

" {count}[_ : Move to previous line with indent-level of {count}.
" {count}]_ : Move to next line with indent-level of {count}.

" [% : Move to beginning of indent-block scope (i.e., move to the line just after the previous line of lesser indent); repeat for {count} outer scopes.
" ]% : Move to end of indent-block scope (i.e., move to the line just before the next line of lesser indent); repeat for {count} outer scopes.

