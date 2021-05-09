
augroup common "{{{
  autocmd!
  " Reload vim config automatically
  autocmd BufWritePost $VIM_PATH/{*.vim,*.yaml,vimrc} nested
        \ source $MYVIMRC | redraw

  " Reload Vim script automatically if setlocal autoread
  autocmd BufWritePost,FileWritePost *.vim nested
        \ if &l:autoread > 0 | source <afile> |
        \   echo 'source ' . bufname('%') |
        \ endif

  " Update filetype on save if empty
  autocmd BufWritePost * nested
        \ if &l:filetype ==# '' || exists('b:ftdetect')
        \ |   unlet! b:ftdetect
        \ |   filetype detect
        \ | endif

  " Highlight current line only on focused window
  autocmd WinEnter,InsertLeave * if &ft !~# '^\(denite\|clap_\)' |
    \ set cursorline | endif

  autocmd WinLeave,InsertEnter * if &ft !~# '^\(denite\|clap_\)' |
    \ set nocursorline | endif

  " Automatically set read-only for files being edited elsewhere
  autocmd SwapExists * nested let v:swapchoice = 'o'

  " Equalize window dimensions when resizing vim window
  autocmd VimResized * tabdo wincmd =

  " Force write shada on leaving nvim
  autocmd VimLeave * if has('nvim') | wshada! | else | wviminfo! | endif

  " Check if file changed when its window is focus, more eager than 'autoread'
  autocmd FocusGained * checktime

  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

  autocmd Syntax * if line('$') > 5000 | syntax sync minlines=200 | endif

  " Make directory automatically.
  autocmd BufWritePre * call initself#mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)

  autocmd BufNewFile,BufRead coc-settings.json setlocal filetype=jsonc


	" Switch IBus dynamically
	function! IBusOff()
		" Lưu engine hiện tại
		let g:ibus_prev_engine = system('ibus engine')
		" Chuyển sang engine tiếng Anh
		" Nếu bạn thấy cái cờ ở đây
		" khả năng là font của bạn đang render emoji lung tung...
		" xkb : us :: eng (không có dấu cách)
		silent! execute '!ibus engine xkb:us::eng'
	endfunction


	function! IBusOn()
		let l:current_engine = system('ibus engine')
		" nếu engine được set trong normal mode thì
		" lúc vào insert mode duùn luôn engine đó
		if l:current_engine !~? 'xkb:us::eng'
			let g:ibus_prev_engine = l:current_engine
		endif
		" Khôi phục lại engine
		silent! execute '!ibus engine ' . g:ibus_prev_engine
	endfunction

	augroup IBusHandler
		" Khôi phục ibus engine khi tìm kiếm
		autocmd CmdLineEnter [/?] silent call IBusOn()
		autocmd CmdLineLeave [/?] silent call IBusOff()
		autocmd CmdLineEnter \? silent call IBusOn()
		autocmd CmdLineLeave \? silent call IBusOff()
		" Khôi phục ibus engine khi vào insert mode
		autocmd InsertEnter * silent call IBusOn()
		" Tắt ibus engine khi vào normal mode
		autocmd InsertLeave * silent call IBusOff()

augroup END "}}}
