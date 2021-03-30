-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

return require("packer").startup(
    function()
        use {"wbthomason/packer.nvim", opt = true}
        use {"kyazdani42/nvim-web-devicons"}

        -- Tree Explorer
        use {"kyazdani42/nvim-tree.lua"}
        -- A Lua module to interactive with system processes. 
        -- Pass in your command, the desired args, env and cwd. 
        -- Define optional callbacks for on_stdout, on_stderr and on_exit and start your Job.

        -- nerdTree
        use {"preservim/nerdtree"}

        use {"romgrk/barbar.nvim", 
            require = {"kyazdani42/nvim-web-devicons"}}
        use {"nvim-lua/plenary.nvim"}
        use {"lewis6991/gitsigns.nvim"}
        use {"glepnir/galaxyline.nvim"}
        -- use {"akinsho/nvim-bufferline.lua"}
        use {"907th/vim-auto-save"}
        use {"nvim-treesitter/nvim-treesitter"}
        use {"chriskempson/base16-vim"}

        use {"norcalli/nvim-colorizer.lua"}
        -- use {'Yggdroot/indentLine'}
        use {"ryanoasis/vim-devicons"}


        -- A (Neo)vim plugin for formatting code.
        -- :Neoformat! python
        -- :Neoformat! python yapf
        use {"sbdchd/neoformat"}
        use {"neovim/nvim-lspconfig"}
        -- Auto completion plugin for nvim.
        use {"hrsh7th/nvim-compe"}
        use {"windwp/nvim-autopairs"}
        use {"alvan/vim-closetag"}
        use {"tweekmonster/startuptime.vim"}
        use {"onsails/lspkind-nvim"}

        -- highly extendable fuzzy finder over lists
        use {"nvim-telescope/telescope.nvim"}
        use {"nvim-telescope/telescope-media-files.nvim"}
        use {"nvim-lua/popup.nvim"}

-- UI
        use {"sainnhe/sonokai"}
    -- Highlight current line
        use {'DanilaMihailov/beacon.nvim'}
        use {'Xuyuanp/scrollbar.nvim'}
        use {'editorconfig/editorconfig-vim'}
  --[[ vim.cmd("CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()")
  vim.cmd("WinEnter,FocusGained           * silent! lua require('scrollbar').show()")
  vim.cmd("WinLeave,FocusLost             * silent! lua require('scrollbar').clear()") ]]
--        use {"tanvirtin/monokai.nvim"}
-- Faster motion
        use { 'easymotion/vim-easymotion'}
        use {"rhysd/accelerated-jk"}

        -- It's called vim-visual-multi in analogy with visual-block, but the plugin works mostly from normal mode.
        -- use {"mg979/vim-visual-multi"}

        -- use {"romainl/vim-qf"}


  -- Assign mark, rename
        use {'Yilin-Yang/vim-markbar'}
        -- width of a vertical split markbar
	vim.g.markbar_width = 40
	vim.g.markbar_enable_peekaboo = false
	--let g:markbar_peekaboo_backtick_mapping = ''

-- Version Control
        use {"simnalamburt/vim-mundo",
          cmd = 'MundoToggle'}

-- Check missing parentheses
        use {"Yggdroot/hiPairs"}

        -- Focus reading
        use {"junegunn/goyo.vim", 
          cmd = 'Goyo'}

        use {'junegunn/Limelight.vim',
          cmd = 'Limelight'}
          -- Auto close parentheses
        use {'jiangmiao/auto-pairs'}
        
        -- Resize windos by Ctrl-e
        use {'simeji/winresizer'}
        use {'rmagatti/auto-session'}
        -- vim.g.auto_session_root_dir = os.getenv("HOME") .. "./vim-session/"

-- clever-f.vim extends f, F, t and T mappings for more convenience. 
-- Instead of ;, f is available to repeat after you type f{char} or F{char}. 
--F after f{char} and F{char} is also available to undo a jump. t{char} and T{char} are ditto. 
--This extension makes a repeat easier and makes you forget the existence of ;
        use {'rhysd/clever-f.vim'}

-- help you read complex code by showing diff level of parentheses in diff color !!
        use {'luochen1990/rainbow',
        ft = { 'html', 'css', 'javascript', 'javascriptreact', 'go', 'python', 'lua', 'rust', 'vim', 'less', 'stylus', 'sass', 'scss', 'json', 'ruby', 'toml' }
        }

-- Float terminal
        use {'voldikss/vim-floaterm'}

        --sandwich.vim is a set of operator and textobject plugins to add/delete/replace 
        --surroundings of a sandwiched textobject, like (foo), "bar".
        --use {'machakann/vim-sandwich'}
        use {'blackcauldron7/surround.nvim'}
        use { 'brooth/far.vim'}

-- Outline
        use {'liuchengxu/vista.vim'}

-- Prettier splits and joins patterns inside (), {}, [],...
        use {'AndrewRadev/splitjoin.vim'}
-- Python coding
        use {'jpalardy/vim-slime',
          ft = {'python'}}
        use {'hanschen/vim-ipython-cell',
          ft = {'python'},
          requires={'jpalardy/vim-slime',
          ft = {'python'}}}
        use {'sakhnik/nvim-gdb',
          ft = {'python'}}

        
    --[[ zo: Open a fold
    zc: Close a fold
    zk: Jump to the previous fold.
    zj: Jump to the next fold.
    zR: Open every fold.
    zM: Close every fold. ]]
        use {'kalekundert/vim-coiled-snake',
          ft = {'python'},
          requires={'Konfekt/FastFold'}}

        -- Vim code inspection plugin for finding defitinitionshammer_and_pick and references/usagesmicroscope
        use {'pechorin/any-jump.vim'}
	vim.g.any_jump_disable_default_keybindings = 1
	--Custom ignore files
	--default is: ['*.tmp', '*.temp']
	vim.g.any_jump_ignored_files = {'*.tmp', '*.temp', '*.toml', '*.lua', '*.txt', '*.json'}
	--Prefered search engine: rg or ag
	vim.g.any_jump_search_prefered_engine = 'rg'


  -- Generate docstring
        use {'kkoomen/vim-doge',
          ft = {'python'}}
        vim.g.doge_doc_standard_python = 'numpy'
-- Neovim plugin to comment text in and out, written in lua. Supports commenting out the current line, a visual selection and a motion.
        use {'b3nj5m1n/kommentary'}

        -- 
        use {'thiagoalessio/rainbow_levels.vim'}

        -- nvim-hlslens helps you better glance searched information, seamlessly jump matched instances.
    -- 3 ways to start hlslens
      --[[ Press / or ? to search text
      Press n or N to jump to the instance matched by last pattern
      Press *, #, g* or g# to search word nearest to the cursor ]]
        use {'kevinhwang91/nvim-hlslens'}
        use {"lukas-reineke/indent-blankline.nvim", branch = 'lua'}

    end
)

