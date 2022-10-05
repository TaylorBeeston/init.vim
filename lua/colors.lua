local colors = require("kanagawa.colors").setup()

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
local colorOverrides = {
    CmpItemKindDefault = { fg = colors.dep },

    CmpItemKindField = { bg = colors.oniViolet },
    CmpItemKindProperty = { bg = colors.autumnRed },
    CmpItemKindEvent = { bg = colors.autumnYellow },

    CmpItemKindText = { bg = colors.fujiGray },
    CmpItemKindEnum = { bg = colors.autumnRed },
    CmpItemKindKeyword = { bg = colors.autumnYellow },

    CmpItemKindConstant = { bg = colors.springGreen },
    CmpItemKindConstructor = { bg = colors.autumnRed },
    CmpItemKindReference = { bg = colors.autumnYellow },

    CmpItemKindFunction = { bg = colors.samuraiRed },
    CmpItemKindStruct = { bg = colors.autumnRed },
    CmpItemKindClass = { bg = colors.autumnYellow },
    CmpItemKindModule = { bg = colors.dragonBlue },
    CmpItemKindOperator = { bg = colors.winterGreen },

    CmpItemKindVariable = { bg = colors.autumnGreen },
    CmpItemKindFile = { bg = colors.autumnRed },

    CmpItemKindUnit = { bg = colors.autumnGreen },
    CmpItemKindSnippet = { bg = colors.autumnRed },
    CmpItemKindFolder = { bg = colors.autumnYellow },

    CmpItemKindMethod = { bg = colors.roninYellow },
    CmpItemKindValue = { bg = colors.autumnRed },
    CmpItemKindEnumMember = { bg = colors.autumnYellow },

    CmpItemKindInterface = { bg = colors.autumnGreen },
    CmpItemKindColor = { bg = colors.autumnRed },
    CmpItemKindTypeParameter = { bg = colors.autumnYellow },
}

require("kanagawa").setup({ overrides = colorOverrides, dimInactive = true, globalStatus = true })

-- Set colorscheme
vim.cmd("colorscheme kanagawa")
