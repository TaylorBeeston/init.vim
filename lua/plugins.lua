-- Autoformat on save
if vim.lsp.buf.format == nil then
    vim.api.nvim_exec(
        [[
    augroup NullLsFormatAutogroup
      autocmd!
      autocmd BufWritePre *.js,*.mjs,*.cjs,*.jsx,*.ts,*.mts,*.cts,*.tsx,*.rs,*.css,*.scss,*.lua,*.astro,*.py,*.tf,*.ml,*.res,*.json lua vim.lsp.buf.formatting_sync(nil, 3000)
    augroup END
    ]],
        true
    )
else
    vim.api.nvim_exec(
        [[
    augroup NullLsFormatAutogroup
      autocmd!
      autocmd BufWritePre *.js,*.mjs,*.cjs,*.jsx,*.ts,*.mts,*.cts,*.tsx,*.rs,*.css,*.scss,*.lua,*.astro,*.py,*.tf,*.ml,*.res,*.json lua vim.lsp.buf.format({ timeout_ms = 1000 })
    augroup END
    ]],
        true
    )
end

-- Telescope
require("telescope").setup({
    pickers = {
        live_grep = {
            additional_args = function(opts)
                return { "-g", "!pnpm-lock.yaml" }
            end,
        },
    },
})
require("telescope").load_extension("gh")
require("telescope").load_extension("fzf")

-- Colored Icons
require("nvim-web-devicons").setup({
    default = true,
})

-- CSS Colors
-- require "colorizer".setup(nil, {css = true})

-- Bufferline
require("bufferline").setup({
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
})

-- Git Messenger
vim.g.git_messenger_always_into_popup = 1

-- Vimwiki
vim.g.vimwiki_list = { { path = "~/vimwiki", syntax = "markdown", ext = ".md" } }
vim.g.vimwiki_global_ext = 0

-- Vim-Test
vim.cmd('let test#strategy = "dispatch"')

-- FZF
vim.cmd([[
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m
]])

-- rnvimr (Ranger)
vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_enable_picker = 1

-- mkdx
vim.g["mkdx#settings"] = {
    highlight = { enable = 1 },
    enter = { shift = 1 },
    links = { external = { enable = 1 } },
    toc = { text = "Table of Contents", update_on_write = 1 },
    fold = { enable = 1 },
}

-- Indent Blankline
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Dashboard
vim.g.dashboard_default_executive = "telescope"

-- hacky solution for telescope opening file in insert mode, see https://github.com/nvim-telescope/telescope.nvim/issues/2501#issuecomment-1561838990
vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
        if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
        end
    end,
})
