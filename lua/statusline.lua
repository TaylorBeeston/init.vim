local gl = require("galaxyline")
local gls = gl.section

gl.short_line_list = {
    "LuaTree",
    "vista",
    "dbui",
    "startify",
    "term",
    "nerdtree",
    "fugitive",
    "fugitiveblame",
    "plug"
}

-- Tokyo Night
local colors = {
    bg = "#1a1b26",
    line_bg = "#292e42",
    fg = "#c0caf5",
    fg_green = "#545c7e",
    yellow = "#e0af68",
    cyan = "#7dcfff",
    green = "#9ece6a",
    orange = "#e0af68",
    purple = "#bb9af7",
    blue = "#7aa2f7",
    red = "#f7768e"
}

-- Tomorrow Night
--[[ local colors = {
    bg = "#1d1f21",
    line_bg = "#282a2e",
    fg = "#c5c8c6",
    fg_green = "#b4b7b4",
    yellow = "#f0c674",
    cyan = "#8abeb7",
    green = "#b5bd68",
    orange = "#f0c674",
    purple = "#b294bb",
    blue = "#81a2be",
    red = "#cc6666"
} ]]
local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

local function trailing_whitespace()
    local trail = vim.fn.search("\\s$", "nw")
    if trail ~= 0 then
        return " "
    else
        return nil
    end
end

TrailingWhiteSpace = trailing_whitespace

local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
        return true
    end
    return false
end

gls.left[1] = {
    FirstElement = {
        provider = function()
            return " "
        end,
        highlight = {colors.blue, colors.line_bg}
    }
}
gls.left[2] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local alias = {
                n = "NORMAL",
                i = "INSERT",
                c = "COMMAND",
                V = "VISUAL",
                [""] = "VISUAL",
                v = "VISUAL",
                ["r?"] = ":CONFIRM",
                rm = "--MORE",
                R = "REPLACE",
                Rv = "VIRTUAL",
                s = "SELECT",
                S = "SELECT",
                ["r"] = "HIT-ENTER",
                [""] = "SELECT",
                t = "TERMINAL",
                ["!"] = "SHELL"
            }
            local mode_color = {
                n = colors.green,
                i = colors.blue,
                v = colors.purple,
                [""] = colors.blue,
                V = colors.blue,
                c = colors.red,
                no = colors.purple,
                s = colors.orange,
                S = colors.orange,
                [""] = colors.orange,
                ic = colors.yellow,
                R = colors.purple,
                Rv = colors.purple,
                cv = colors.red,
                ce = colors.red,
                r = colors.cyan,
                rm = colors.cyan,
                ["r?"] = colors.cyan,
                ["!"] = colors.green,
                t = colors.green,
                c = colors.purple,
                ["r?"] = colors.red,
                ["r"] = colors.red,
                rm = colors.red,
                R = colors.yellow,
                Rv = colors.purple
            }
            local vim_mode = vim.fn.mode()
            vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim_mode])
            return alias[vim_mode] .. " "
        end,
        highlight = {colors.red, colors.line_bg, "bold"}
    }
}

gls.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.line_bg}
    }
}
gls.left[4] = {
    FileName = {
        provider = {"FileName", "FileSize"},
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.line_bg, "bold"}
    }
}
gls.left[5] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {"#81a2be", colors.line_bg, "bold"}
    }
}
gls.left[6] = {
    Space = {
        provider = function()
            return " "
        end,
        highlight = {colors.fg, colors.line_bg}
    }
}

gls.left[7] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.green, colors.line_bg}
    }
}
gls.left[8] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.orange, colors.line_bg}
    }
}
gls.left[9] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.red, colors.line_bg}
    }
}
gls.left[10] = {
    TrailingWhiteSpace = {
        provider = TrailingWhiteSpace,
        icon = "  ",
        highlight = {colors.yellow, colors.line_bg}
    }
}

gls.left[11] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, colors.line_bg}
    }
}

gls.left[12] = {
    Space = {
        provider = function()
            return " "
        end,
        highlight = {colors.fg, colors.line_bg}
    }
}

gls.left[13] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.yellow, colors.line_bg}
    }
}

gls.left[14] = {
    Space = {
        provider = function()
            return " "
        end,
        highlight = {colors.fg, colors.line_bg}
    }
}

gls.left[15] = {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = " ⓘ ",
        highlight = {colors.fg, colors.line_bg}
    }
}

gls.right[1] = {
    FileFormat = {
        provider = "FileFormat",
        highlight = {colors.fg, colors.line_bg, "bold"}
    }
}
gls.right[2] = {
    LineInfo = {
        provider = "LineColumn",
        separator = " | ",
        separator_highlight = {colors.blue, colors.line_bg},
        highlight = {colors.fg, colors.line_bg}
    }
}
gls.right[3] = {
    PerCent = {
        provider = "LinePercent",
        separator = " ",
        separator_highlight = {colors.line_bg, colors.line_bg},
        highlight = {colors.bg, colors.cyan, "bold"}
    }
}

gls.short_line_left[1] = {
    FileName = {
        provider = "FileName",
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.line_bg, "bold"}
    }
}

gls.short_line_right[1] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.line_bg}
    }
}
