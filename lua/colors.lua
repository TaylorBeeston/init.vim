-- Set colorscheme
vim.cmd("colorscheme kanagawa")

-- True Color Support if it's available in terminal
vim.cmd([[
if exists('+termguicolors') && ($TERM == "st-256color" || $TERM == "tmux-256color")
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
]])

-- i3 Config Syntax Highlighting
vim.cmd([[
" aug i3config_ft_detection
"    au!
    au BufNewFile,BufRead ~/.i3/config set filetype=i3config
" aug end
]])

-- Indent Lines
-- vim.g.indent_blankline_char_highlight = "DevIconAwk"

vim.g.indent_blankline_context_patterns = {
    "class",
    "function",
    "method",
    "^if",
    "^while",
    "^for",
    "^object",
    "^table",
    "block",
}

-- Enable syntax highlighting in DiffAdd regions
vim.cmd("hi DiffAdd ctermfg=NONE guifg=NONE")

-- Pretty completion colors
local colorOverrides = function(colors)
    return {
        CmpItemKindDefault = { fg = colors.palette.dep },
        CmpItemKindField = { bg = colors.palette.oniViolet },
        CmpItemKindProperty = { bg = colors.palette.autumnRed },
        CmpItemKindEvent = { bg = colors.palette.autumnYellow },
        CmpItemKindText = { bg = colors.palette.fujiGray },
        CmpItemKindEnum = { bg = colors.palette.autumnRed },
        CmpItemKindKeyword = { bg = colors.palette.autumnYellow },
        CmpItemKindConstant = { bg = colors.palette.springGreen },
        CmpItemKindConstructor = { bg = colors.palette.autumnRed },
        CmpItemKindReference = { bg = colors.palette.autumnYellow },
        CmpItemKindFunction = { bg = colors.palette.samuraiRed },
        CmpItemKindStruct = { bg = colors.palette.autumnRed },
        CmpItemKindClass = { bg = colors.palette.autumnYellow },
        CmpItemKindModule = { bg = colors.palette.dragonBlue },
        CmpItemKindOperator = { bg = colors.palette.winterGreen },
        CmpItemKindVariable = { bg = colors.palette.autumnGreen },
        CmpItemKindFile = { bg = colors.palette.autumnRed },
        CmpItemKindUnit = { bg = colors.palette.autumnGreen },
        CmpItemKindSnippet = { bg = colors.palette.autumnRed },
        CmpItemKindFolder = { bg = colors.palette.autumnYellow },
        CmpItemKindMethod = { bg = colors.palette.roninYellow },
        CmpItemKindValue = { bg = colors.palette.autumnRed },
        CmpItemKindEnumMember = { bg = colors.palette.autumnYellow },
        CmpItemKindInterface = { bg = colors.palette.autumnGreen },
        CmpItemKindColor = { bg = colors.palette.autumnRed },
        CmpItemKindTypeParameter = { bg = colors.palette.autumnYellow },
        BufferCurrentSign = { fg = colors.palette.sumiInk6 },
        BufferVisibleSign = { fg = colors.palette.sumiInk6 },
        BufferVisible = { fg = colors.palette.sumiInk6 },
    }
end

require("kanagawa").setup({
    overrides = colorOverrides,
    dimInactive = true,
    globalStatus = true,
})

-- Set colorscheme
vim.cmd("colorscheme kanagawa")
