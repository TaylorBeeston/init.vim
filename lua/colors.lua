-- Set colorscheme
-- vim.cmd('colorscheme base16-tomorrow-night')
-- vim.o.background = 'dark'
local base16 = require("base16")
base16(base16.themes["tomorrow-night"], true)

-- True Color Support if it's available in terminal
vim.o.termguicolors = true

-- i3 Config Syntax Highlighting
vim.cmd [[
" aug i3config_ft_detection
"    au!
    au BufNewFile,BufRead ~/.i3/config set filetype=i3config
" aug end
]]

-- Indent Lines
vim.g.indent_blankline_char_highlight = "DevIconAwk"

vim.g.indent_blankline_context_patterns = {
    "class",
    "function",
    "method",
    "^if",
    "^while",
    "^for",
    "^object",
    "^table",
    "block"
}

-- Rainbow Brackets (base16-tomorrow-night)
vim.cmd [[
hi rainbowcol1 guifg=#b5bd68
hi rainbowcol2 guifg=#81a2be
hi rainbowcol3 guifg=#cc6666
hi rainbowcol4 guifg=#f0c674
hi rainbowcol5 guifg=#b294bb
hi rainbowcol6 guifg=#8abeb7
hi rainbowcol7 guifg=#c5c8c6
]]
