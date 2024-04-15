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

    -- init.lua helpers
    { "folke/neodev.nvim",                 event = "VeryLazy",                     opts = {} },

    -- Fuzzy searching
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
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
        event = { "BufReadPost", "BufNewFile " },
        dependencies = "nvim-telescope/telescope.nvim",
        config = function()
            require("telescope").load_extension("gh")
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        event = { "BufReadPost", "BufNewFile " },
        config = function()
            require("telescope").load_extension("fzf")
        end,
        dependencies = "nvim-telescope/telescope.nvim",
        build = "make",
    },

    -- LSP
    { "neovim/nvim-lspconfig",             event = "VeryLazy",                     dependencies = "folke/neodev.nvim" },
    { "williamboman/mason.nvim",           dependencies = "neovim/nvim-lspconfig", event = "VeryLazy" },
    { "williamboman/mason-lspconfig.nvim", dependencies = "neovim/nvim-lspconfig", event = "VeryLazy" },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = "VeryLazy",
        dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
    },
    {
        "onsails/lspkind-nvim",
        dependencies = "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
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
    },
    {
        "pmizio/typescript-tools.nvim",
        ft = { "js", "ts", "jsx", "tsx", "javascript", "typescript", "javascriptreact", "typescriptreact" },
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("typescript-tools").setup({
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
    },
    {
        "tjdevries/ocaml.nvim",
        ft = { "ocaml", "dune", "opam", "oasis", "omake", "ocamlbuild_tags", "sexplib" },
        build = ":lua require('ocaml').update()",
        config = function()
            require("ocaml").setup()
        end,
    },
    { "simrat39/rust-tools.nvim", ft = "rust" },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        dependencies = "neovim/nvim-lspconfig",
        config = function()
            require("symbols-outline").setup()
        end,
    },
    {
        "weilbith/nvim-code-action-menu",
        dependencies = "neovim/nvim-lspconfig",
        cmd = "CodeActionMenu",
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        init = function() end,
        config = function() end,
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
                playground = {
                    enable = true,
                    disable = {},
                    updatetime = 25,
                    persist_queries = false,
                },
                indent = { enable = true },
                rainbow = { enable = true },
                autotag = { enable = true },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile" },
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
    {
        "nvim-treesitter/playground",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPost", "BufNewFile" },
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
        event = { "BufReadPost", "BufNewFile" },
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
    },
    {
        "haringsrob/nvim_context_vt",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
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

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-emoji",
            "saadparwaiz1/cmp_luasnip",
            "ray-x/cmp-treesitter",
            {
                "tzachar/cmp-fuzzy-buffer",
                dependencies = { "tzachar/fuzzy.nvim" },
                event = { "BufReadPost", "BufNewFile" },
            },
            "windwp/nvim-autopairs",
            {
                "L3MON4D3/LuaSnip",
                event = { "BufReadPost", "BufNewFile" },
                config = function()
                    require("luasnip.loaders.from_snipmate").load()
                end,
                build = "make install_jsregexp",
            },
            {
                "danymat/neogen",
                config = function()
                    require("neogen").setup({ enabled = true })
                end,
                dependencies = "nvim-treesitter/nvim-treesitter",
            },
        },
        config = function()
            local neogen = require("neogen")
            local luasnip = require("luasnip")
            local cmp = require("cmp")
            local compare = require("cmp.config.compare")

            cmp.setup({
                window = {
                    completion = {
                        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                        col_offset = -3,
                        side_padding = 0,
                    },
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind = require("lspkind").cmp_format({
                            mode = "symbol_text",
                            maxwidth = 50,
                            menu = {
                                nvim_lsp = "LSP",
                                nvim_lsp_document_symbol = "LSP",
                                buffer = "BUF",
                                fuzzy_buffer = "FUZ",
                                path = "PATH",
                                -- cmp_tabnine = "AI",
                                luasnip = "SNIP",
                                emoji = "EMOJI",
                                cmdline = "CMD",
                            },
                        })(entry, vim_item)

                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = " " .. strings[1] .. " "
                        kind.menu = "    " .. (kind.menu or "") .. " (" .. (strings[2] or "") .. ")"

                        return kind
                    end,
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
                    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                    ["<C-e>"] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = function(fallback)
                        if luasnip.expand_or_jumpable() then
                            vim.fn.feedkeys(
                                vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                                ""
                            )
                        elseif neogen.jumpable() then
                            vim.fn.feedkeys(
                                vim.api.nvim_replace_termcodes(
                                    "<cmd>lua require('neogen').jump_next()<CR>",
                                    true,
                                    true,
                                    true
                                ),
                                ""
                            )
                        else
                            fallback()
                        end
                    end,
                    ["<S-Tab>"] = function(fallback)
                        if luasnip.jumpable(-1) then
                            vim.fn.feedkeys(
                                vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
                                ""
                            )
                        elseif neogen.jumpable() then
                            vim.fn.feedkeys(
                                vim.api.nvim_replace_termcodes(
                                    "<cmd>lua require('neogen').jump_prev()<CR>",
                                    true,
                                    true,
                                    true
                                ),
                                ""
                            )
                        else
                            fallback()
                        end
                    end,
                }),
                sorting = {
                    priority_weight = 2,
                    comparators = {
                        compare.score,
                        require("cmp_fuzzy_buffer.compare"),
                        compare.offset,
                        compare.exact,
                        compare.recently_used,
                        compare.kind,
                        compare.sort_text,
                        compare.length,
                        compare.order,
                    },
                },
                sources = cmp.config.sources({
                    { name = "jupynium",     priority = 1000 },
                    { name = "nvim_lsp",     priority = 100 },
                    { name = "luasnip",      priority = 99 },
                    { name = "path" },
                    -- {name = "cmp_tabnine"},
                    { name = "treesitter" },
                    { name = "fuzzy_buffer", max_item_count = 5, priority = 1 },
                    { name = "emoji" },
                }),
            })

            cmp.setup.cmdline("/", {
                sources = cmp.config.sources({ { name = "nvim_lsp_document_symbol" } }, { { name = "buffer" } }),
                mapping = cmp.mapping.preset.cmdline(),
            })
            cmp.setup.cmdline(":", {
                sources = cmp.config.sources({ { name = "path" }, { name = "buffer" }, { name = "cmdline" } }),
                mapping = cmp.mapping.preset.cmdline(),
            })

            -- Autopairs
            require("nvim-autopairs").setup()
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
        end,
    },
    { "SidOfc/mkdx",              ft = "markdown" },
    {
        "kiyoon/jupynium.nvim",
        ft = "python",
        build = "pip install --user .",
    },

    -- Test Running
    { "tpope/vim-dispatch", event = { "BufReadPost", "BufNewFile" } },
    { "vim-test/vim-test",  event = { "BufReadPost", "BufNewFile" } },
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
    {
        "moozd/aidoc.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("aidoc").setup({ width = 65, keymap = "<leader>d" })
        end,
    },

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
        "b0o/incline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("inclineSetup")
        end,
    },
    "MunifTanjim/nui.nvim",
    { "stevearc/dressing.nvim", event = { "BufReadPost", "BufNewFile" } },
    "rcarriga/nvim-notify",
    { "numtostr/FTerm.nvim",    event = "VeryLazy" },
    "rebelot/kanagawa.nvim",
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
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
    { "kevinhwang91/rnvimr",    cmd = "RnvimrToggle" },
    { "kevinhwang91/nvim-bqf",  event = { "BufReadPost", "BufNewFile" } },
    { "fladson/vim-kitty",      event = { "BufReadPost", "BufNewFile" } },
    {
        "romgrk/barbar.nvim",
        event = { "BufReadPost", "BufNewFile" },
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
    { "arkav/lualine-lsp-progress", event = "VeryLazy" },
    { "pocco81/HighStr.nvim",       event = { "BufReadPost", "BufNewFile" } },
    {
        "folke/drop.nvim",
        event = "VimEnter",
        config = function()
            local colors = require("kanagawa.colors").setup()

            require("drop").setup({
                theme = "spring",
            })
        end,
    },
    { "goolord/alpha-nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },
    {
        "nvim-focus/focus.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("focus").setup({
                autoresize = { minwidth = 30 },
                ui = { hybridnumber = true, absolutenumber_unfocussed = true },
            })
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("ibl").setup()
        end,
    },
    {
        "yamatsum/nvim-cursorline",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-cursorline").setup({
                cursorword = { enable = true, min_length = 3, hl = { underline = true } },
            })
        end,
    },
    { "chrisbra/csv.vim",   ft = "csv" },
    {
        "petertriho/nvim-scrollbar",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("scrollbar").setup()
        end,
    },
    {
        "ErichDonGubler/lsp_lines.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            vim.diagnostic.config({ virtual_text = false })
            require("lsp_lines").setup()
        end,
    },

    -- Fun and Games
    { "tamton-aquib/duck.nvim",          event = "VeryLazy" },
    { "eandrju/cellular-automaton.nvim", event = { "BufNewFile", "BufReadPost" } },

    -- F u n c t i o n a l i t y

    -- Tab in insert mode to escape parentheses hell
    {
        "abecodes/tabout.nvim",
        event = { "BufNewFile", "BufReadPost" },
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
        dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
    },

    -- Syntax checking/highlighting
    { "mboughaba/i3config.vim",  ft = "i3config" },

    -- Motions
    { "chaoren/vim-wordmotion",  event = { "BufReadPost", "BufNewFile" } },
    { "ggandor/lightspeed.nvim", event = { "BufNewFile", "BufReadPost" } },

    -- HTML
    {
        "mattn/emmet-vim",
        ft = { "html", "css", "scss", "javascriptreact", "typescriptreact", "jsx", "tsx", "astro" },
    },

    -- Lua
    { "tjdevries/nlua.nvim",   ft = "lua" },
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
    { "aspeddro/rescript-tools.nvim",   ft = "rescript" },
    { "nkrkv/nvim-treesitter-rescript", ft = "rescript" },

    -- Smooth scrolling with <C u> and <C d>
    { "psliwka/vim-smoothie",           event = { "BufReadPost", "BufNewFile" } },
    -- Exchange text objects with cx
    { "tommcdo/vim-exchange",           event = { "BufReadPost", "BufNewFile" } },

    -- Toggle comments with gcc
    -- use 'tomtom/tcomment_vim'
    { "b3nj5m1n/kommentary",            event = { "BufNewFile", "BufReadPost" } },

    -- Work with surrounds e.g. cs"' will change double quotes to single quotes
    -- ysiw" will surround the current word with double quotes
    { "tpope/vim-surround",             event = { "BufReadPost", "BufNewFile" } },

    -- Unimpaired
    { "tpope/vim-unimpaired",           event = { "BufReadPost", "BufNewFile" } },

    -- Git Commands
    { "tpope/vim-fugitive",             event = "VeryLazy" },
    { "tpope/vim-rhubarb",              dependencies = "tpope/vim-fugitive",    event = "VeryLazy" },
    { "rhysd/git-messenger.vim",        event = { "BufReadPost", "BufNewFile" } },

    -- Github Commands
    -- Open GH with <leader>gh
    -- Open GH blame with <leader>gb
    -- Open GH Repo with <leader>go
    { "ruanyl/vim-gh-line",             event = { "BufReadPost", "BufNewFile" } },

    -- Octo
    {
        "pwntester/octo.nvim",
        cmd = "Octo",
        config = function()
            require("octo").setup()
        end,
    },

    -- Repeat more than just native commands
    { "tpope/vim-repeat", event = { "BufReadPost", "BufNewFile" } },

    -- Personal wiki!
    -- See https://github.com/vimwiki/vimwiki
    { "vimwiki/vimwiki",  event = { "BufReadPost", "BufNewFile" } },

    -- View Mappings
    {
        "folke/which-key.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("which-key").setup()
        end,
    },
}, {
    checker = { enabled = true },
    defaults = { lazy = true },
})
