-- *** Packer  ***

-- Make sure to run
-- git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- prior to using

vim.cmd([[packadd packer.nvim]])

local packer = require("packer")

packer.init({ git = { clone_timeout = 180 } })

return require("packer").startup(function(use)
	-- Let Packer manage itself
	use("wbthomason/packer.nvim")

	-- init.lua helpers
	use("folke/lua-dev.nvim")

	-- Fuzzy searching
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-github.nvim", requires = "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", requires = "nvim-telescope/telescope.nvim", run = "make" })

	-- LSP
	use("neovim/nvim-lspconfig")
	use({ "williamboman/nvim-lsp-installer", requires = "neovim/nvim-lspconfig" })
	use({
		"onsails/lspkind-nvim",
		requires = "neovim/nvim-lspconfig",
		config = function()
			require("lspkind").init({
				Text = "",
				Method = "",
				Function = "",
				Constructor = "",
				Field = "ﰠ",
				Variable = "",
				Class = "ﴯ",
				Interface = "",
				Module = "",
				Property = "ﰠ",
				Unit = "塞",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "פּ",
				Event = "",
				Operator = "",
				TypeParameter = "",
			})
		end,
	})
	use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "neovim/nvim-lspconfig" })
	use("simrat39/rust-tools.nvim")
	use({
		"simrat39/symbols-outline.nvim",
		requires = "neovim/nvim-lspconfig",
		config = function()
			require("symbols-outline").setup()
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		run = "cargo install stylua",
	})
	use({
		"weilbith/nvim-code-action-menu",
		requires = "neovim/nvim-lspconfig",
		cmd = "CodeActionMenu",
	})

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({
		"nvim-treesitter/nvim-treesitter-context",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("treesitter-context").setup({
				patterns = {
					default = {
						"class",
						"function",
						"method",
						"for",
						"while",
						"if",
						"else",
						"switch",
						"case",
						"object",
					},
				},
			})
		end,
	})
	use({ "nvim-treesitter/playground", requires = "nvim-treesitter/nvim-treesitter" })
	use({ "p00f/nvim-ts-rainbow", requires = "nvim-treesitter/nvim-treesitter" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", requires = "nvim-treesitter/nvim-treesitter" })
	use({
		"windwp/nvim-ts-autotag",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = {
					"html",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"astro",
					"svelte",
					"vue",
					"tsx",
					"jsx",
					"rescript",
					"xml",
					"php",
					"markdown",
					"glimmer",
					"handlebars",
					"hbs",
				},
			})
		end,
	})
	use({ "haringsrob/nvim_context_vt", requires = "nvim-treesitter/nvim-treesitter" })
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
				},
			})
		end,
	})

	-- Autocompletion
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lsp-document-symbol")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip")
	use("ray-x/cmp-treesitter")
	use({ "tzachar/cmp-fuzzy-buffer", requires = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" } })
	--[[ use {
            "tzachar/cmp-tabnine",
            run = "./install.sh",
            config = function()
                local tabnine = require("cmp_tabnine.config")
                tabnine:setup(
                    {
                        max_num_results = 20,
                        sort = true,
                        run_on_every_keystroke = true,
                        snippet_placeholder = ".."
                    }
                )
            end
        } ]]
	-- This requires running
	-- npm -g install instant-markdown-d
	-- prior to use
	use({ "suan/vim-instant-markdown", ft = "markdown" }) -- Good Markdown support
	use("SidOfc/mkdx")

	-- Test Running
	use("tpope/vim-dispatch")
	use("vim-test/vim-test")
	use({
		"David-Kunz/jester",
		config = function()
			require("jester").setup({ path_to_jest_run = "pnpm exec jest" })
		end,
	})

	-- Debugging
	use("mfussenegger/nvim-dap")

	-- Documentation
	-- use {"kkoomen/vim-doge", run = vim.fn["doge#install()"]}
	use({
		"danymat/neogen",
		config = function()
			require("neogen").setup({
				enabled = true,
			})
		end,
		requires = "nvim-treesitter/nvim-treesitter",
	})

	-- UI
	--[[ use {
            "sidebar-nvim/sidebar.nvim",
            config = function()
                require("sidebar-nvim").setup(
                    {
                        side = "right",
                        sections = {"git", "diagnostics"}
                    }
                )
            end
        } ]]
	use("MunifTanjim/nui.nvim")
	use("stevearc/dressing.nvim")
	use({
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	})
	use("numtostr/FTerm.nvim")
	use("chriskempson/base16-vim")
	use("norcalli/nvim-base16.lua")
	use("folke/tokyonight.nvim")
	use("rebelot/kanagawa.nvim")
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_formatter = function(name, blame_info)
					if blame_info.author == name then
						blame_info.author = "You"
					end

					local text

					if blame_info.author == "Not Committed Yet" then
						text = blame_info.author
					else
						text = string.format(
							"%s, %s • %s",
							blame_info.author,
							os.date("%m-%d-%Y", tonumber(blame_info["author_time"])),
							blame_info.summary
						)
					end

					return { { " " .. text, "GitSignsCurrentLineBlame" } }
				end,
			})
		end,
	})
	use("ryanoasis/vim-devicons")
	use("kyazdani42/nvim-web-devicons")
	use({ "yamatsum/nvim-nonicons", requires = "kyazdani42/nvim-web-devicons" })
	use("kevinhwang91/rnvimr")
	-- use "norcalli/nvim-colorizer.lua"
	use("kevinhwang91/nvim-bqf")
	use("fladson/vim-kitty")
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	-- use "glepnir/galaxyline.nvim"
	use("nvim-lualine/lualine.nvim")
	use("arkav/lualine-lsp-progress")
	-- use "folke/lsp-colors.nvim"
	use({
		"edluffy/specs.nvim",
		config = function()
			require("specs").setup({
				show_jumps = true,
				min_jump = 30,
				popup = {
					delay_ms = 0, -- delay before popup displays
					inc_ms = 2, -- time increments used for fade/resize effects
					blend = 80, -- starting blend, between 0-100 (fully transparent), see :h winblend
					width = 65,
					winhl = "IncSearch",
					fader = require("specs").pulse_fader,
					resizer = require("specs").slide_resizer,
				},
				ignore_filetypes = {},
				ignore_buftypes = {
					nofile = true,
				},
			})
		end,
	})
	use("pocco81/HighStr.nvim")
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").opts)
		end,
	})
	use({
		"beauwilliams/focus.nvim",
		config = function()
			require("focus").setup()
		end,
	})
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"yamatsum/nvim-cursorline",
		config = function()
			require("nvim-cursorline").setup({
				cursorword = { enable = true, min_length = 3, hl = { underline = true } },
			})
		end,
	})
	use("chrisbra/csv.vim")
	use({
		"bennypowers/nvim-regexplainer",
		config = function()
			require("regexplainer").setup({ auto = true })
		end,
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	})

	-- use :SCROLL to test color schemes
	use("https://github.com/vim-scripts/ScrollColors")

	-- Code folding
	-- use "arecarn/vim-fold-cycle" -- Enter to cycle folds
	-- use "pseewald/vim-anyfold"
	-- Try it out!
	-- za (or zz): toggle folds at current line
	-- zo: open fold
	-- zc: close fold
	-- zR: open all folds
	-- zM: close all folds
	--
	-- F u n c t i o n a l i t y

	-- Tab in insert mode to escape parentheses hell
	use({
		"abecodes/tabout.nvim",
		config = function()
			require("tabout").setup({
				tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
				act_as_tab = true, -- shift content if tab out is not possible
				act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
				enable_backwards = true, -- well ...
				completion = true, -- if the tabkey is used in a completion pum
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
				ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
				exclude = {}, -- tabout will ignore these filetypes
			})
		end,
		wants = { "nvim-treesitter" }, -- or require if not used so far
		after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
	})

	-- Close things like { and [ and --
	-- use 'cohama/lexima.vim'
	use("windwp/nvim-autopairs")

	-- Syntax checking/highlighting
	use("justinmk/vim-syntax-extra")
	use("vim-python/python-syntax")
	use({ "styled-components/vim-styled-components", branch = "main" })
	use("jparise/vim-graphql")
	use("mboughaba/i3config.vim")

	-- Motions
	use("chaoren/vim-wordmotion")
	use("ggandor/lightspeed.nvim")

	-- HTML
	use("mattn/emmet-vim")

	-- Lua
	use("tjdevries/nlua.nvim")
	use("rafcamlet/nvim-luapad")

	-- JS
	use({
		"vuki656/package-info.nvim",
		requires = "MunifTanjim/nui.nvim",
		config = function()
			require("package-info").setup()
		end,
	})

	-- Code snippets plugin
	use("epilande/vim-react-snippets")
	use("epilande/vim-es2015-snippets")
	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_snipmate").load()
		end,
	})

	-- Smooth scrolling with <C u> and <C d>
	use("psliwka/vim-smoothie")
	-- Exchange text objects with cx
	use("tommcdo/vim-exchange")

	-- Toggle comments with gcc
	-- use 'tomtom/tcomment_vim'
	use("b3nj5m1n/kommentary")

	-- Work with surrounds e.g. cs"' will change double quotes to single quotes
	-- ysiw" will surround the current word with double quotes
	use("tpope/vim-surround")

	-- Unimpaired
	use("tpope/vim-unimpaired")

	-- Git Commands
	use("tpope/vim-fugitive")
	use({ "tpope/vim-rhubarb", requires = "tpope/vim-fugitive" })
	use("rhysd/git-messenger.vim")

	-- Github Commands
	-- Open GH with <leader>gh
	-- Open GH blame with <leader>gb
	-- Open GH Repo with <leader>go
	use("ruanyl/vim-gh-line")

	-- Octo
	use({
		"pwntester/octo.nvim",
		config = function()
			require("octo").setup()
		end,
	})

	-- Repeat more than just native commands
	use("tpope/vim-repeat")

	-- Personal wiki!
	-- See https://github.com/vimwiki/vimwiki
	use("vimwiki/vimwiki")

	-- View Mappings
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	})

	-- Neorg
	use({
		"nvim-neorg/neorg",
		config = function()
			require("neorg").setup({
				-- Tell Neorg what modules to load
				load = {
					["core.defaults"] = {}, -- Load all the default modules
					["core.keybinds"] = { config = { default_keybinds = true, neorg_leader = "<Leader>o" } },
					["core.norg.concealer"] = {}, -- Allows for use of icons
					["core.norg.dirman"] = {
						-- Manage your directories with Neorg
						config = { workspaces = { main = "~/neorg" } },
					},
				},
			})
		end,
		requires = "nvim-lua/plenary.nvim",
	})

	-- Performance
	use("nathom/filetype.nvim")
end)
