vim.api.nvim_set_keymap("n", "<leader>n", ":NERDTreeFocus<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-n>", ":NERDTree<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-t>", ":NERDTreeToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-f>", ":NERDTreeFind<CR>", {noremap=true})



-- nerdTree
vim.api.nvim_command([[
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" autocmd VimEnter * NERDTree
" autocmd VimEnter * NERDTreeToggle

" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * silent NERDTreeMirror

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
]])
-- vim.api.nvim_command('autocmd VimEnter * NERDTreeToggle')
vim.api.nvim_command('autocmd StdinReadPre * let s:std_in=1')
vim.api.nvim_command('autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif')

-- vim.g.nerdtree_tabs_open_on_gui_startup=0
