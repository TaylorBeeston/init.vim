require("lualine").setup({
    options = {
        theme = "kanagawa",
        component_separators = "|",
        section_separators = { left = "", right = "" },
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { "filename", "branch" },
        lualine_c = {
            {
                require("noice").api.statusline.message.get,
                cond = require("noice").api.statusline.message.has,
            },
            {
                require("noice").api.statusline.mode.get,
                cond = require("noice").api.statusline.mode.has,
            },
            {
                require("noice").api.statusline.search.get,
                cond = require("noice").api.statusline.search.has,
            },
        },
        lualine_x = { "diagnostics", "lsp_progress" },
        lualine_y = { "filetype", "progress" },
        lualine_z = {
            { "location", separator = { right = "" }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
    },
    tabline = {},
    extensions = {},
})
