local cmp = require("cmp")

cmp.setup(
    {
        formatting = {
            format = require("lspkind").cmp_format {
                with_text = false,
                maxwidth = 50,
                menu = {
                    nvim_lsp = "LSP",
                    nvim_lsp_document_symbol = "LSP",
                    buffer = "BUF",
                    fuzzy_buffer = "FUZ",
                    path = "PATH",
                    -- cmp_tabnine = "AI",
                    ultisnips = "SNIP",
                    emoji = "EMOJI",
                    cmdline = "CMD"
                }
            }
        },
        snippet = {
            expand = function(args)
                vim.fn["UltiSnips#Anon"](args.body)
            end
        },
        mapping = {
            ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
            ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<C-e>"] = cmp.mapping(
                {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                }
            ),
            ["<CR>"] = cmp.mapping.confirm({select = true}),
            ["<Tab>"] = cmp.mapping(
                function(fallback)
                    fallback()
                end
            )
        },
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp", priority = 1000},
                {name = "path"},
                -- {name = "cmp_tabnine"},
                {name = "treesitter"},
                {name = "fuzzy_buffer", max_item_count = 5},
                {name = "ultisnips"},
                {name = "emoji"}
            }
        )
    }
)

cmp.setup.cmdline(
    "/",
    {
        sources = cmp.config.sources({{name = "nvim_lsp_document_symbol"}}, {{name = "buffer"}})
    }
)
cmp.setup.cmdline(
    ":",
    {
        sources = cmp.config.sources({{name = "path"}, {name = "buffer"}, {name = "cmdline"}})
    }
)

-- Autocomplete Function Signatures
-- require "lsp_signature".on_attach()

-- Formatter (Run Prettier on save)
local prettier = function()
    return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end

require "formatter".setup(
    {
        logging = false,
        filetype = {
            scss = {prettier},
            lua = {
                -- luafmt
                function()
                    return {
                        exe = "luafmt",
                        args = {"--stdin", vim.api.nvim_buf_get_name(0)},
                        stdin = true
                    }
                end
            }
        }
    }
)

vim.api.nvim_exec(
    [[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost *.scss,*.lua FormatWrite
    augroup END
    ]],
    true
)

vim.api.nvim_exec(
    [[
    augroup NullLsFormatAutogroup
      autocmd!
      autocmd BufWritePre *.js,*.ts,*.tsx,*.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
    augroup END
    ]],
    true
)

-- Telescope
require "telescope".load_extension("gh")
require "telescope".load_extension("fzf")

-- Colored Icons
require "nvim-web-devicons".setup {
    default = true
}

-- CSS Colors
require "colorizer".setup(nil, {css = true})

-- Bufferline
require "bufferline".setup {
    options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and "  " or "  "
            return " " .. icon .. count
        end
    },
    highlights = {
        error_selected = {
            guifg = "#cc6666"
        }
    }
}

-- Autopairs
require("nvim-autopairs").setup()
-- require("nvim-autopairs.completion.compe").setup({map_cr = true, map_complete = true})
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))

-- Git Messenger
vim.g.git_messenger_always_into_popup = 1

-- Vimwiki
vim.g.vimwiki_list = {{path = "~/vimwiki", syntax = "markdown", ext = ".md"}}
vim.g.vimwiki_global_ext = 0

-- Vim-Test
vim.cmd('let test#strategy = "dispatch"')

-- Goyo/Limelight
vim.cmd [[
autocmd! User GoyoEnter nested LimeLight 0.7
autocmd! User GoyoLeave nested Limelight!
]]

-- FZF
vim.cmd [[
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m
]]

-- rnvirm (Ranger)
vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_enable_picker = 1

-- mkdx
vim.g["mkdx#settings"] = {
    highlight = {enable = 1},
    enter = {shift = 1},
    links = {external = {enable = 1}},
    toc = {text = "Table of Contents", update_on_write = 1},
    fold = {enable = 1}
}

-- Indent Blankline
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Dashboard
vim.g.dashboard_default_executive = "telescope"
