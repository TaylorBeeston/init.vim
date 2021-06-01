-- *** Packer  ***

-- Make sure to run
-- git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- prior to using

vim.cmd [[packadd packer.nvim]]

local packer = require("packer")

packer.init {git = {clone_timeout = 180}}

return require("packer").startup(
    function(use)
        -- Let Packer manage itself
        use "wbthomason/packer.nvim"

        -- init.lua helpers
        use "folke/lua-dev.nvim"

        -- Fuzzy searching
        use {
            "nvim-telescope/telescope.nvim",
            requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
        }
        use {"nvim-telescope/telescope-github.nvim", requires = "nvim-telescope/telescope.nvim"}

        -- LSP
        use "neovim/nvim-lspconfig"
        use {
            "glepnir/lspsaga.nvim",
            requires = "neovim/nvim-lspconfig",
            config = function()
                require "lspsaga".init_lsp_saga()
            end
        }
        use {
            "onsails/lspkind-nvim",
            requires = "neovim/nvim-lspconfig",
            config = function()
                require "lspkind".init()
            end
        }
        use "mhartington/formatter.nvim"
        use {"jose-elias-alvarez/nvim-lsp-ts-utils", requires = "neovim/nvim-lspconfig"}
        use {
            "folke/lsp-trouble.nvim",
            config = function()
                require("trouble").setup {}
            end
        }
        use {
            "simrat39/symbols-outline.nvim",
            requires = "neovim/nvim-lspconfig",
            config = function()
                require("symbols-outline").setup()
            end
        }
        use {"jubnzv/virtual-types.nvim", requires = "neovim/nvim-lspconfig"}
        use {
            "folke/todo-comments.nvim",
            config = function()
                require("todo-comments").setup()
            end
        }

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use {"nvim-treesitter/playground", requires = "nvim-treesitter/nvim-treesitter"}
        use {"p00f/nvim-ts-rainbow", requires = "nvim-treesitter/nvim-treesitter"}
        use {"JoosepAlviste/nvim-ts-context-commentstring", requires = "nvim-treesitter/nvim-treesitter"}
        use {"windwp/nvim-ts-autotag", requires = "nvim-treesitter/nvim-treesitter"}
        use {
            "lewis6991/spellsitter.nvim",
            requires = "nvim-treesitter/nvim-treesitter",
            config = function()
                require("spellsitter").setup()
            end
        }
        use {"haringsrob/nvim_context_vt", requires = "nvim-treesitter/nvim-treesitter"}

        -- Autocompletion
        use "hrsh7th/nvim-compe"
        use {"tzachar/compe-tabnine", run = "./install.sh"}
        use "ray-x/lsp_signature.nvim"

        -- This requires running
        -- sudo npm -g install instant-markdown-d
        -- prior to use
        use {"suan/vim-instant-markdown", ft = "markdown"} -- Good Markdown support
        use "SidOfc/mkdx"

        -- Async Test Running
        use "tpope/vim-dispatch"
        use "vim-test/vim-test"

        -- Documentation
        use {"kkoomen/vim-doge", run = vim.fn["doge#install()"]}

        -- UI
        use "chriskempson/base16-vim"
        use {
            "lewis6991/gitsigns.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            config = function()
                require("gitsigns").setup(
                    {
                        current_line_blame = true,
                        current_line_blame_formatter = function(name, blame_info)
                            if blame_info.author == name then
                                blame_info.author = "You"
                            end

                            local text

                            if blame_info.author == "Not Committed Yet" then
                                text = blame_info.author
                            else
                                text =
                                    string.format(
                                    "%s, %s • %s",
                                    blame_info.author,
                                    os.date("%m-%d-%Y", tonumber(blame_info["author_time"])),
                                    blame_info.summary
                                )
                            end

                            return {{" " .. text, "GitSignsCurrentLineBlame"}}
                        end
                    }
                )
            end
        }
        use "junegunn/limelight.vim"
        use "junegunn/goyo.vim"
        use "ryanoasis/vim-devicons"
        use "kyazdani42/nvim-web-devicons"
        use "kevinhwang91/rnvimr"
        use "norcalli/nvim-colorizer.lua"
        use "kevinhwang91/nvim-bqf"
        use "fladson/vim-kitty"
        use "akinsho/nvim-bufferline.lua"
        use "glepnir/galaxyline.nvim"
        use "folke/lsp-colors.nvim"
        use {
            "edluffy/specs.nvim",
            config = function()
                require("specs").setup {
                    show_jumps = true,
                    min_jump = 30,
                    popup = {
                        delay_ms = 0, -- delay before popup displays
                        inc_ms = 2, -- time increments used for fade/resize effects
                        blend = 80, -- starting blend, between 0-100 (fully transparent), see :h winblend
                        width = 65,
                        winhl = "IncSearch",
                        fader = require("specs").pulse_fader,
                        resizer = require("specs").slide_resizer
                    },
                    ignore_filetypes = {},
                    ignore_buftypes = {
                        nofile = true
                    }
                }
            end
        }
        use "pocco81/HighStr.nvim"

        -- use :SCROLL to test color schemes
        use "https://github.com/vim-scripts/ScrollColors"

        -- Show Indent Guides
        use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}

        -- Code folding
        use "arecarn/vim-fold-cycle" -- Enter to cycle folds
        -- use "pseewald/vim-anyfold"
        -- Try it out!
        -- za: toggle folds at current line
        -- zo: open fold
        -- zc: close fold
        -- zR: open all folds
        -- zM: close all folds

        -- Close things like { and [ and --
        -- use 'cohama/lexima.vim'
        use "windwp/nvim-autopairs"

        -- Underline word under cursor
        use "yamatsum/nvim-cursorline"

        -- Syntax checking/highlighting
        use "justinmk/vim-syntax-extra"
        use "vim-python/python-syntax"
        use {"styled-components/vim-styled-components", branch = "main"}
        use "jparise/vim-graphql"
        use "mboughaba/i3config.vim"

        -- Motions
        use "chaoren/vim-wordmotion"

        -- HTML
        use "mattn/emmet-vim"

        -- Lua
        use "tjdevries/nlua.nvim"
        use "rafcamlet/nvim-luapad"

        -- Code snippets plugin
        use "epilande/vim-react-snippets"
        use "epilande/vim-es2015-snippets"
        use "SirVer/ultisnips"

        -- Smooth scrolling with <C u> and <C d>
        use {
            "karb94/neoscroll.nvim",
            config = function()
                require("neoscroll").setup(
                    {
                        mappings = {"<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb"},
                        hide_cursor = true,
                        easing = true,
                        easing_function = "cubic"
                    }
                )
            end
        }

        -- Exchange text objects with cx
        use "tommcdo/vim-exchange"

        -- Toggle comments with gcc
        -- use 'tomtom/tcomment_vim'
        use "b3nj5m1n/kommentary"

        -- Work with surrounds e.g. cs"' will change double quotes to single quotes
        -- ysiw" will surround the current word with double quotes
        use "tpope/vim-surround"

        -- Unimpaired
        use "tpope/vim-unimpaired"

        -- Git Commands
        use "tpope/vim-fugitive"
        use {"tpope/vim-rhubarb", requires = "tpope/vim-fugitive"}
        use "rhysd/git-messenger.vim"

        -- Github Commands
        -- Open GH with <leader>gh
        -- Open GH blame with <leader>gb
        -- Open GH Repo with <leader>go
        use "ruanyl/vim-gh-line"

        -- Repeat more than just native commands
        use "tpope/vim-repeat"

        -- Personal wiki!
        -- See https://github.com/vimwiki/vimwiki
        use "vimwiki/vimwiki"

        -- View Mappings
        use {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup()
            end
        }

        -- Video Games
        use "ThePrimeagen/vim-be-good"
    end
)
