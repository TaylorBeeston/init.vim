local get_icon_color = require("nvim-web-devicons").get_icon_color
local get_buf_option = vim.api.nvim_buf_get_option

local diagnostic_map = {}
diagnostic_map[vim.diagnostic.severity.ERROR] = { "✗", guifg = "red" }
diagnostic_map[vim.diagnostic.severity.WARN] = { "!", guifg = "orange" }
diagnostic_map[vim.diagnostic.severity.INFO] = { "", guifg = "green" }
diagnostic_map[vim.diagnostic.severity.HINT] = { "", guifg = "blue" }

local function get_highest_diagnostic_severity(diagnostics)
    local highest_severity = 100
    for _, diagnostic in ipairs(diagnostics) do
        local severity = diagnostic.severity
        if severity < highest_severity then
            highest_severity = severity
        end
    end
    return highest_severity
end

local function get_status(filename)
    local diagnostics = vim.diagnostic.get()
    if vim.tbl_count(diagnostics) > 0 then
        local highest_severity = get_highest_diagnostic_severity(diagnostics)
        return diagnostic_map[highest_severity]
    else
        local filetype_icon, color = get_icon_color(filename)
        return { filetype_icon, guifg = color }
    end
end

require("incline").setup({
    debounce_threshold = { falling = 500, rising = 250 },
    window = { margin = { vertical = 0, horizontal = 0 }, padding = 2 },
    render = function(props)
        local bufname = vim.api.nvim_buf_get_name(props.buf)
        local filename = " " .. vim.fn.fnamemodify(bufname, ":t")
        local status = get_status(filename)
        local modified = get_buf_option(props.buf, "modified") and "⦁" or ""
        return {
            status,
            { " " },
            { filename },
            { " " },
            { modified, guifg = "grey" },
        }
    end,
})
