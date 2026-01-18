vim = vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Let Lazy manage itself
	"folke/lazy.nvim",

	-- init.lua helpers (lazydev replaces neodev for Neovim 0.11+)
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	-- Fuzzy searching
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		config = function()
			require("telescope").setup({
				pickers = {
					live_grep = {
						additional_args = function()
							return { "-g", "!pnpm-lock.yaml" }
						end,
					},
				},
			})
		end,
		dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	},
	{
		"nvim-telescope/telescope-github.nvim",
		lazy = false,
		dependencies = "nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").load_extension("gh")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = false,
		config = function()
			require("telescope").load_extension("fzf")
		end,
		dependencies = "nvim-telescope/telescope.nvim",
		build = "make",
	},

	-- LSP
	{ "neovim/nvim-lspconfig", event = "VeryLazy" },
	{ "williamboman/mason.nvim", dependencies = "neovim/nvim-lspconfig", event = "VeryLazy" },
	{ "williamboman/mason-lspconfig.nvim", dependencies = "neovim/nvim-lspconfig", event = "VeryLazy" },
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "nvimtools/none-ls-extras.nvim" },
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = "VeryLazy",
		dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
	},
	-- Note: lspkind-nvim removed - blink.cmp has built-in icons
	--[[ {
        "pmizio/typescript-tools.nvim",
        ft = { "js", "ts", "jsx", "tsx", "javascript", "typescript", "javascriptreact", "typescriptreact" },
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("typescript-tools").setup({
                on_attach = require("helpers.lsp").global_on_attach,
                settings = {
                    separate_diagnostic_server = true,
                    tsserver_file_preferences = {
                        includeInlayParameterNameHints = "all",
                        includeInlayEnumMemberValueHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayVariableTypeHints = true,
                    },
                },
            })
        end,
    }, ]]
	{
		"yioneko/nvim-vtsls",
		ft = { "js", "ts", "jsx", "tsx", "javascript", "typescript", "javascriptreact", "typescriptreact" },
		config = function()
			-- Configure vtsls using native vim.lsp.config (Neovim 0.11+)
			vim.lsp.config.vtsls = vim.tbl_deep_extend("force", require("vtsls").lspconfig, {
				on_attach = require("helpers.lsp").global_on_attach,
			})
			vim.lsp.enable("vtsls")

			require("vtsls").config({})
		end,
	},
	--[[ {
        "tjdevries/ocaml.nvim",
        ft = { "ocaml", "dune", "opam", "oasis", "omake", "ocamlbuild_tags", "sexplib" },
        build = ":lua require('ocaml').update()",
        config = function()
            require("ocaml").setup()
        end,
    }, ]]
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false, -- This plugin is already lazy
	},
	{
		"hedyhli/outline.nvim",
		cmd = { "Outline", "OutlineOpen" },
		keys = {
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline" },
		},
		opts = {},
	},
	-- Note: nvim-code-action-menu removed - use built-in vim.lsp.buf.code_action() instead
	{
		"mrcjkb/haskell-tools.nvim",
		version = "^3", -- Recommended
		lazy = false, -- This plugin is already lazy
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		init = function() end,
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				auto_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				rainbow = { enable = true },
				modules = {},
				ignore_install = {},
				sync_install = false,
				ensure_installed = {},
			})
		end,
		build = function()
			require("nvim-treesitter.install").update({ with_sync = false })()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				auto_install = true,
				ensure_installed = {
					"astro",
					"bash",
					"css",
					"dockerfile",
					"fish",
					"graphql",
					"html",
					"javascript",
					"jsdoc",
					"json",
					"json5",
					"lua",
					"markdown",
					"markdown_inline",
					"regex",
					"rust",
					"scss",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"yaml",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				rainbow = { enable = true },
				modules = {},
				ignore_install = { "org" }, -- Let nvim-orgmode handle the org parser
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = "nvim-treesitter/nvim-treesitter",
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
	},
	-- Note: nvim-treesitter/playground is deprecated, use built-in :InspectTree and :Inspect instead
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")

			require("rainbow-delimiters.setup")({
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					commonlisp = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					latex = "rainbow-blocks",
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			})
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("ts_context_commentstring").setup()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = {
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
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close_on_slash = false,
				},
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
				did_setup = function() end,
				setup = function() end,
				get_opts = function() end,
			})
		end,
	},
	{
		"haringsrob/nvim_context_vt",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
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
	},

	-- Autocompletion (blink.cmp - faster alternative to nvim-cmp)
	{
		"saghen/blink.cmp",
		lazy = false,
		version = "1.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"windwp/nvim-autopairs",
			{
				"danymat/neogen",
				config = function()
					require("neogen").setup({ enabled = true })
				end,
				dependencies = "nvim-treesitter/nvim-treesitter",
			},
		},
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<C-y>"] = { "select_and_accept" },
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = {
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_next()
						end
					end,
					"snippet_forward",
					"fallback",
				},
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			completion = {
				accept = { auto_brackets = { enabled = true } },
				menu = {
					draw = {
						columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
					},
				},
				documentation = { auto_show = true, auto_show_delay_ms = 200 },
			},
			cmdline = {
				sources = {},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
		config = function(_, opts)
			require("blink.cmp").setup(opts)
			-- Autopairs integration
			require("nvim-autopairs").setup()
		end,
	},

	-- AI
	{
		"NickvanDyke/opencode.nvim",
		dependencies = {
			-- Recommended for `ask()` and `select()`.
			-- Required for `snacks` provider.
			---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
			{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
		},
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {
				provider = {
					enabled = "snacks",
				},
			}

			-- Required for `opts.events.reload`.
			vim.o.autoread = true

			-- Recommended/example keymaps.
			vim.keymap.set({ "n", "x" }, "<C-a>", function()
				require("opencode").ask("@this: ", { submit = true })
			end, { desc = "Ask opencode…" })
			vim.keymap.set({ "n", "x" }, "<C-x>", function()
				require("opencode").select()
			end, { desc = "Execute opencode action…" })
			vim.keymap.set({ "n", "t" }, "<C-.>", function()
				require("opencode").toggle()
			end, { desc = "Toggle opencode" })

			vim.keymap.set({ "n", "x" }, "go", function()
				return require("opencode").operator("@this ")
			end, { desc = "Add range to opencode", expr = true })
			vim.keymap.set("n", "goo", function()
				return require("opencode").operator("@this ") .. "_"
			end, { desc = "Add line to opencode", expr = true })

			vim.keymap.set("n", "<S-C-u>", function()
				require("opencode").command("session.half.page.up")
			end, { desc = "Scroll opencode up" })
			vim.keymap.set("n", "<S-C-d>", function()
				require("opencode").command("session.half.page.down")
			end, { desc = "Scroll opencode down" })

			-- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o…".
			vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
			vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
		end,
	},

	{
		"Exafunction/windsurf.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({
				virtual_text = {
					enabled = true,
					default_filetype_enabled = true,
				},
			})
		end,
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			file_types = { "markdown" },
		},
	},
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		ft = { "org" },
		config = function()
			-- Setup orgmode
			require("orgmode").setup({
				win_split_mode = "float",
				win_border = "rounded",
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/orgfiles/refile.org",
			})
		end,
	},
	{
		"nvim-orgmode/telescope-orgmode.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-orgmode/orgmode",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("orgmode")
		end,
	},
	{
		"kiyoon/jupynium.nvim",
		ft = "python",
		build = "pip install --user .",
	},

	-- Test Running
	{ "tpope/vim-dispatch", event = { "BufReadPre", "BufNewFile" } },
	{ "vim-test/vim-test", event = { "BufReadPre", "BufNewFile" } },
	{
		"David-Kunz/jester",
		ft = { "js", "ts", "jsx", "tsx", "javascript", "typescript", "javascriptreact", "typescriptreact" },
		config = function()
			require("jester").setup({ path_to_jest_run = "pnpm exec jest" })
		end,
	},

	-- Debugging
	{
		"mfussenegger/nvim-dap",
		ft = {
			"js",
			"ts",
			"jsx",
			"tsx",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"python",
			"rust",
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		ft = {
			"js",
			"ts",
			"jsx",
			"tsx",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"python",
			"rust",
		},
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
	},

	-- Documentation
	--[[ {
        "moozd/aidoc.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("aidoc").setup({ width = 65, keymap = "<leader>d" })
        end,
    }, ]]

	-- UI
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("noice").setup({
				lsp = {
					hover = {
						enabled = false,
					},
					signature = {
						enabled = false,
					},
					message = {
						enabled = true,
					},
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					lsp_doc_border = true,
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dim = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scroll = {
				enabled = true,
				animate = {
					easing = "outQuad",
					duration = { step = 10, total = 150 },
				},
			},
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
		keys = {
			{
				"]]",
				function()
					Snacks.words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
				mode = { "n", "t" },
			},
			{
				"[[",
				function()
					Snacks.words.jump(-vim.v.count1)
				end,
				desc = "Prev Reference",
				mode = { "n", "t" },
			},
		},
	},
	{
		"b0o/incline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("inclineSetup")
		end,
	},
	"MunifTanjim/nui.nvim",
	{ "stevearc/dressing.nvim", event = { "BufReadPre", "BufNewFile" } },
	"rcarriga/nvim-notify",
	{ "numtostr/FTerm.nvim", event = "VeryLazy" },
	"rebelot/kanagawa.nvim",
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
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
	},
	"ryanoasis/vim-devicons",
	{
		"kyazdani42/nvim-web-devicons",
		event = "VeryLazy",
		config = function()
			require("nvim-web-devicons").setup({ default = true })
		end,
	},
	{ "yamatsum/nvim-nonicons", dependencies = "kyazdani42/nvim-web-devicons" },
	{ "kevinhwang91/rnvimr", cmd = "RnvimrToggle" },
	{ "kevinhwang91/nvim-bqf", event = { "BufReadPre", "BufNewFile" } },
	{ "fladson/vim-kitty", event = { "BufReadPre", "BufNewFile" } },
	{
		"romgrk/barbar.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "lewis6991/gitsigns.nvim", "kyazdani42/nvim-web-devicons" },
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			options = {
				show_buffer_close_icons = false,
				show_close_icon = false,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and "  " or "  "
					return " " .. icon .. count
				end,
			},
			-- highlight_alternate = true,
			maximum_padding = 5,
			icons = {
				pinned = { button = "車", filename = true, separator = { left = "", right = "" } },
				separator = { left = "", right = "" },
				inactive = { separator = { left = "", right = "" } },
			},
			highlights = {
				error_selected = {
					guifg = "#cc6666",
				},
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = "noice.nvim",
		config = function()
			require("statusline")
		end,
	},
	-- { "arkav/lualine-lsp-progress", event = "VeryLazy" },
	{ "pocco81/HighStr.nvim", event = { "BufReadPre", "BufNewFile" } },
	{
		"folke/drop.nvim",
		event = "VimEnter",
		config = function()
			require("drop").setup({
				theme = "spring",
				themes = {},
				max = 75,
				interval = 100,
				screensaver = 300000,
				filetypes = { "alpha" },
				winblend = 100,
			})
		end,
	},
	{ "goolord/alpha-nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },
	{
		"nvim-focus/focus.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("focus").setup({
				autoresize = { minwidth = 30 },
				ui = { hybridnumber = true, absolutenumber_unfocussed = true },
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"yamatsum/nvim-cursorline",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-cursorline").setup({
				cursorword = { enable = true, min_length = 3, hl = { underline = true } },
			})
		end,
	},
	{ "chrisbra/csv.vim", ft = "csv" },
	{
		"petertriho/nvim-scrollbar",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("scrollbar").setup()
		end,
	},
	{
		"ErichDonGubler/lsp_lines.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.diagnostic.config({ virtual_text = false })
			require("lsp_lines").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup({})
		end,
	},

	-- Fun and Games
	{ "tamton-aquib/duck.nvim", event = "VeryLazy" },
	{
		"eandrju/cellular-automaton.nvim",
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			local sand = require("animations.fallingsand")
			require("cellular-automaton").register_animation(sand)
		end,
	},

	-- F u n c t i o n a l i t y

	-- Tab in insert mode to escape parentheses hell
	{
		"abecodes/tabout.nvim",
		event = { "BufNewFile", "BufReadPre" },
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
				default_tab = "<Tab>",
				default_shift_tab = "<S-Tab>",
			})
		end,
		dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
	},

	-- Syntax checking/highlighting
	{ "mboughaba/i3config.vim", ft = "i3config" },

	-- Motions
	{ "chaoren/vim-wordmotion", event = { "BufReadPre", "BufNewFile" } },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},

	-- HTML
	{
		"mattn/emmet-vim",
		ft = { "html", "css", "scss", "javascriptreact", "typescriptreact", "jsx", "tsx", "astro" },
	},

	-- Lua
	{ "tjdevries/nlua.nvim", ft = "lua" },
	{ "rafcamlet/nvim-luapad", ft = "lua" },

	-- JS
	{
		"vuki656/package-info.nvim",
		ft = "json",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("package-info").setup()
		end,
	},

	-- ReScript
	{ "aspeddro/rescript-tools.nvim", ft = "rescript" },
	{ "nkrkv/nvim-treesitter-rescript", ft = "rescript" },

	-- Smooth scrolling with <C u> and <C d>
	-- { "psliwka/vim-smoothie",           event = { "BufReadPre", "BufNewFile" } },
	-- Exchange text objects with cx
	{ "tommcdo/vim-exchange", event = { "BufReadPre", "BufNewFile" } },

	-- Toggle comments with gcc
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},

	-- Work with surrounds e.g. cs"' will change double quotes to single quotes
	-- ysiw" will surround the current word with double quotes
	{ "tpope/vim-surround", event = { "BufReadPre", "BufNewFile" } },

	-- Unimpaired
	{ "tpope/vim-unimpaired", event = { "BufReadPre", "BufNewFile" } },

	-- Git Commands
	{ "tpope/vim-fugitive", event = "VimEnter" },
	{ "tpope/vim-rhubarb", dependencies = "tpope/vim-fugitive", event = "VeryLazy" },
	{ "rhysd/git-messenger.vim", event = { "BufReadPre", "BufNewFile" } },

	-- Github Commands
	-- Open GH with <leader>gh
	-- Open GH blame with <leader>gb
	-- Open GH Repo with <leader>go
	{ "ruanyl/vim-gh-line", event = { "BufReadPre", "BufNewFile" } },

	-- Octo
	{
		"pwntester/octo.nvim",
		cmd = "Octo",
		config = function()
			require("octo").setup()
		end,
	},

	-- Repeat more than just native commands
	{ "tpope/vim-repeat", event = { "BufReadPre", "BufNewFile" } },

	-- Personal wiki!
	-- See https://github.com/vimwiki/vimwiki
	{ "vimwiki/vimwiki", event = { "BufReadPre", "BufNewFile" } },

	-- View Mappings
	{
		"folke/which-key.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("which-key").setup({
				preset = "helix",
			})
		end,
	},
}, {
	checker = { enabled = true },
	defaults = { lazy = true },
})
