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
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            elseif neogen.jumpable() then
                vim.fn.feedkeys(
                    vim.api.nvim_replace_termcodes("<cmd>lua require('neogen').jump_next()<CR>", true, true, true),
                    ""
                )
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if luasnip.jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            elseif neogen.jumpable() then
                vim.fn.feedkeys(
                    vim.api.nvim_replace_termcodes("<cmd>lua require('neogen').jump_prev()<CR>", true, true, true),
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
        { name = "luasnip",      priority = 1000000 },
        { name = "jupynium",     priority = 1000 },
        { name = "nvim_lsp",     priority = 100 },
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
-- require("nvim-autopairs.completion.compe").setup({map_cr = true, map_complete = true})
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
