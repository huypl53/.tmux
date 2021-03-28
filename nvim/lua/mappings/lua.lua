local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function split (inputstr, sep)
        local t={}
        if inputstr == nil or inputstr == '' then
          t[0] = ''
          return t
        end
        if sep == nil then
                sep = "%s"
        end
        local i = 0
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
          t[i] = str
          i = i+1
        end
        return t
end


-- keybind list
map("", "<leader>c", '"+y')

-- open terminals  
map("n", "<C-b>" , [[<Cmd> vnew term://bash<CR>]] , opt) -- split term vertically , over the right  
map("n", "<C-x>" , [[<Cmd> split term://bash | resize 10 <CR>]] , opt) -- split term vertically , over the right  

--------------------
--------pmap--------
--------------------
--switch window
map("n", "<C-h>" , "<C-w>h")
map("n", "<C-l>" , "<C-w>l")
map("n", "<C-j>" , "<C-w>j")
map("n", "<C-k>" , "<C-w>k")


--------------
--EasyMotion--
--------------
vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_prompt = 'Jump to → '
vim.g.EasyMotion_keys = 'fjdkswbeoavn'
vim.g.EasyMotion_smartcase = 1
vim.g.EasyMotion_use_smartsign_us = 1

vim.api.nvim_set_keymap("n", "gsj", "<Plug>(easymotion-w)", {})
vim.api.nvim_set_keymap("n", "gsk", "<Plug>(easymotion-b)", {})
vim.api.nvim_set_keymap("n", "gsf", "<Plug>(easymotion-overwin-f)", {})
vim.api.nvim_set_keymap("n", "gss", "<Plug>(easymotion-overwin-f2)", {})

---------
--Mundo--
---------
map("n", "md", ":MundoToggle<CR>")


------------------------
--rhysd/accelerated-jk--
------------------------
vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})


---------
--Gogyo--
---------
vim.api.nvim_set_keymap('n', '<leader>G', ":Goyo<CR>", {})

---------------------------
---junegunn/Limelight.vim--
---------------------------
vim.api.nvim_set_keymap('n', '<Leader>L', ':Limelight!!<CR>', {})
-- for selected
vim.api.nvim_set_keymap('n', '<Leader>l', '<Plug>(Limelight)', {})
vim.api.nvim_set_keymap('x', '<Leader>l', '<Plug>(Limelight)', {})

vim.g.limelight_conceal_ctermfg = 'gray'
vim.g.limelight_conceal_ctermfg = 240
vim.g.limelight_conceal_guifg = 'DarkGray'
vim.g.limelight_conceal_guifg = '#777777'
-----------
--rainbow--
-----------
vim.g.rainbow_active = 1

-------------------------
--voldikss/vim-floaterm--
-------------------------
vim.g.floaterm_position = 'center'
vim.g.floaterm_wintype = 'floating'

--    " Set floaterm window's background to black
--    hi Floaterm guibg=black
--    " Set floating window border line color to cyan, and background to orange
--    hi FloatermBorder guibg=none guifg=cyan
vim.api.nvim_set_keymap('n', '<F7>', ':FloatermNew<CR>', { silent = true})
vim.api.nvim_set_keymap('t', '<F7>', '<C-\\><C-n>:FloatermNew<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<F8>' , ':FloatermPrev<CR>', {silent = true})
vim.api.nvim_set_keymap('t', '<F8>' , '<C-\\><C-n>:FloatermPrev<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<F9>' , ':FloatermNext<CR>', {silent = true})
vim.api.nvim_set_keymap('t', '<F9>' , '<C-\\><C-n>:FloatermNext<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<F12>', ':FloatermToggle<CR>', {silent = true})
vim.api.nvim_set_keymap('t', '<F12>', '<C-\\><C-n>:FloatermToggle<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-_>', ':FloatermNew --height=0.5 --width=0.5 --wintype=floating --position=bottomright<CR>', {silent = true})
vim.api.nvim_set_keymap('t', '<localleader>b', '<C-\\><C-n><C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<localleader>b', ':FloatermToggle<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<localleader>cp', ':call coc#float#close_all() <CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ot', ':<C-u>FloatermToggle<CR>', {silent = true})
vim.api.nvim_set_keymap('t', '<Leader>ot', '<C-\\><C-n>:FloatermToggle<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>gz', ':<C-u>FloatermNew height=0.7 width=0.8 lazygit<CR>', {silent = true})

--------------------------
--machakann/vim-sandwich--
--------------------------
vim.g.sandwich_no_default_key_mappings = 1
vim.g.operator_sandwich_no_default_key_mappings = 1
vim.g.textobj_sandwich_no_default_key_mappings = 1
vim.api.nvim_set_keymap('n', 'sa', '<Plug>(operator-sandwich-add)', {silent= true})
vim.api.nvim_set_keymap('x', 'sa', '<Plug>(operator-sandwich-add)', {silent= true})
vim.api.nvim_set_keymap('o', 'sa', '<Plug>(operator-sandwich-g@)', {silent= true})
vim.api.nvim_set_keymap('n', 'sd', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)', {silent= true})
vim.api.nvim_set_keymap('x', 'sd', '<Plug>(operator-sandwich-delete)', {silent= true})
vim.api.nvim_set_keymap('n', 'sr', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)  xmap <silent> sr <Plug>(operator-sandwich-replace)', {silent= true})
vim.api.nvim_set_keymap('n', 'sdb', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)', {silent= true})
vim.api.nvim_set_keymap('x', 'srb', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)', {silent= true})
--
-- key-seq starts with 'i' make insert mode delayed
--vim.api.nvim_set_keymap('n', 'ib', '<Plug>(textobj-sandwich-auto-i)', {nowait = true} )
--vim.api.nvim_set_keymap('x', 'ib', '<Plug>(textobj-sandwich-auto-i)', {nowait = true} )
--vim.api.nvim_set_keymap('o', 'ab', '<Plug>(textobj-sandwich-auto-a)', {nowait = true} )
--vim.api.nvim_set_keymap('x', 'ab', '<Plug>(textobj-sandwich-auto-a)', {nowait = true} )
--vim.api.nvim_set_keymap('o', 'is', '<Plug>(textobj-sandwich-query-i)', {nowait = true} )
--vim.api.nvim_set_keymap('x', 'is', '<Plug>(textobj-sandwich-query-i)', {nowait = true} )
--vim.api.nvim_set_keymap('o', 'as', '<Plug>(textobj-sandwich-query-a)', {nowait = true} )
--vim.api.nvim_set_keymap('x', 'as', '<Plug>(textobj-sandwich-query-a)', {nowait = true} )
----------------
--far.vim----
------------
vim.g.lazyredraw = true        --improve scrolling performance when navigating through large results
vim.g.regexpengine=1       --use old regexp engine
--set ignorecase smartcase  " ignore case only when the pattern contains no capital letters
vim.g.ignore = 'smartcase'
vim.g.far = {
  source = 'rg',
  window_width = 50,
  preview_window_width = 50,
}
vim.api.nvim_set_var('prompt_mapping', 
    { 
      quit           = { key = '<esc>', prompt = 'Esc' },
      regex          = { key = '<C-x>', prompt = '^X'  },
      case_sensitive = { key = '<C-a>', prompt = '^A'  },
      word           = { key = '<C-w>', prompt = "^W"  },
      substitute     = { key = '<C-f>', prompt = '^F'  },
    }
)
--shortcut for far.vim find
vim.api.nvim_set_keymap('n', '<localleader>f', ':Farf<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<localleader>f', ':Farf<cr>', { noremap = true, silent = true })

-- shortcut for far.vim replace
vim.api.nvim_set_keymap('n', '<localleader>r', ':Farr<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<localleader>r', ':Farr<cr>', { noremap = true, silent = true })

------------------------
--liuchengxu/vista.vim--
------------------------

vim.api.nvim_set_keymap('n', '<Leader>i', ':<C-u>Vista!!<CR>', {silent = true})

-----------------------------
--AndrewRadev/splitjoin.vim--
-----------------------------
vim.g.splitjoin_join_mapping = ''
vim.g.splitjoin_split_mapping = ''
vim.api.nvim_set_keymap('n', 'sj', ':SplitjoinJoin<CR>', {})
vim.api.nvim_set_keymap('n', 'sk', ':SplitjoinSplit<CR>', {})

----------------------
--jpalardy/vim-slime--
----------------------

vim.g.slime_target = 'tmux'
vim.g.slime_python_ipython = 1
vim.g.slime_default_config = {
	socket_name= split(os.getenv('TMUX'), ',')[0],
	target_pane= '{top-right}' 
      }
vim.g.slime_dont_ask_default = 1
	-- socket_name= "get(split($TMUX, ','), 0)",
	-- target_pane= '{top-right}' 

------------------------------
--hanschen/vim-ipython-cell--
------------------------------
vim.api.nvim_set_keymap('n', '<leader>as', ':SlimeSend1 ipython --matplotlib<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ar', ':IPythonCellRun<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>aR', ':IPythonCellRunTime<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ac', ':IPythonCellExecuteCell<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>aC', ':IPythonCellExecuteCellJump<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ae', ':IPythonCellExecuteCellVerbose<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>aE', ':IPythonCellExecuteCellVerboseJump<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>al', ':IPythonCellClear<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ax', ':IPythonCellClose<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '[c', ':IPythonCellPrevCell<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', ']c', ':IPythonCellNextCell<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ah', '<Plug>SlimeLineSend', {})
vim.api.nvim_set_keymap('x', '<leader>ah', '<Plug>SlimeRegionSend', {})
vim.api.nvim_set_keymap('n', '<leader>ap', ':IPythonCellPrevCommand<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>aQ', ':IPythonCellRestart<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ad', ':SlimeSend1 %debug<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>aq', ':SlimeSend1 exit<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F2>', ':SlimeSend1 python % <CR>', {noremap = true})
--let g:ipython_cell_tag = ['# %%', '#%%', '# <codecell>', '##']
--
--

vim.api.nvim_command('hi! RainbowLevel0 ctermbg=240 guibg=#585858')
vim.api.nvim_command('hi! RainbowLevel1 ctermbg=239 guibg=#4e4e4e')
vim.api.nvim_command('hi! RainbowLevel2 ctermbg=238 guibg=#444444')
vim.api.nvim_command('hi! RainbowLevel3 ctermbg=237 guibg=#3a3a3a')
vim.api.nvim_command('hi! RainbowLevel4 ctermbg=236 guibg=#303030')
vim.api.nvim_command('hi! RainbowLevel5 ctermbg=235 guibg=#262626')
vim.api.nvim_command('hi! RainbowLevel6 ctermbg=234 guibg=#1c1c1c')
vim.api.nvim_command('hi! RainbowLevel7 ctermbg=233 guibg=#121212')
vim.api.nvim_command('hi! RainbowLevel8 ctermbg=232 guibg=#080808')


-------------------------
--pechorin/any-jump.vim--
-------------------------
-- Normal mode: Jump to definition under cursore
vim.api.nvim_set_keymap('n', '<leader>j', ':AnyJump<CR>', {noremap = true})

-- Visual mode: jump to selected text in visual mode
vim.api.nvim_set_keymap('x', '<leader>j', ':AnyJumpVisual<CR>', {noremap = true})

-- Normal mode: open previous opened file (after jump)
vim.api.nvim_set_keymap('n', '<leader>ab', ':AnyJumpBack<CR>', {noremap = true})

-- Normal mode: open last closed search window again
vim.api.nvim_set_keymap('n', '<leader>al', ':AnyJumpLastResults<CR>', {noremap = true})
--[[ Mappings for popup search window
o/<CR>     open
s          open in split
v          open in vsplit
t          open in new tab
p/<tab>    preview
q/x        exit
r          references
b          back to first result
T          group by file
a          load next N results
A          load all results
L          toggle results lists ui style ]]

--------------------------
--Yilin-Yang/vim-markbar--
--------------------------
vim.api.nvim_set_keymap('n', '<Leader>M', '<Plug>ToggleMarkbar', {})
