-- Autoformat on save
if vim.lsp.buf.format == nil then
    vim.api.nvim_exec(
        [[
    augroup NullLsFormatAutogroup
      autocmd!
      autocmd BufWritePre *.js,*.mjs,*.cjs,*.jsx,*.ts,*.mts,*.cts,*.tsx,*.rs,*.css,*.scss,*.lua,*.astro,*.py,*.tf,*.ml,*.res,*.json,*.c,*.cpp,*.sh,*.glsl,*.wgsl,*.gd,*.go,*.html lua vim.lsp.buf.formatting_sync(nil, 3000)
    augroup END
    ]],
        true
    )
else
    vim.api.nvim_exec(
        [[
    augroup NullLsFormatAutogroup
      autocmd!
      autocmd BufWritePre *.js,*.mjs,*.cjs,*.jsx,*.ts,*.mts,*.cts,*.tsx,*.rs,*.css,*.scss,*.lua,*.astro,*.py,*.tf,*.ml,*.res,*.json,*.c,*.cpp,*.sh,*.glsl,*.wgsl,*.gd,*.go,*.html lua vim.lsp.buf.format({ timeout_ms = 1000 })
    augroup END
    ]],
        true
    )
end

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

require("helpers/qf")

vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("lazyvim_autoupdate", { clear = true }),
    callback = function()
        if require("lazy.status").has_updates then
            require("lazy").update({ show = false })
        end
    end,
})

---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
    ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local value = ev.data.params
        .value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
        if not client or type(value) ~= "table" then
            return
        end
        local p = progress[client.id]

        for i = 1, #p + 1 do
            if i == #p + 1 or p[i].token == ev.data.params.token then
                p[i] = {
                    token = ev.data.params.token,
                    msg = ("[%3d%%] %s%s"):format(
                        value.kind == "end" and 100 or value.percentage or 100,
                        value.title or "",
                        value.message and (" **%s**"):format(value.message) or ""
                    ),
                    done = value.kind == "end",
                }
                break
            end
        end

        local msg = {} ---@type string[]
        progress[client.id] = vim.tbl_filter(function(v)
            return table.insert(msg, v.msg) or not v.done
        end, p)

        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        vim.notify(table.concat(msg, "\n"), "info", {
            id = "lsp_progress",
            title = client.name,
            opts = function(notif)
                notif.icon = #progress[client.id] == 0 and " "
                    or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
        })
    end,
})
