" Set colorscheme
let base16colorspace=256               " use all the colors
colorscheme base16-tomorrow-night
set background=dark                    " i am the batman
let g:airline_theme='base16_tomorrow_night'

" True Color Support if it's available in terminal
if has("termguicolors")
  set termguicolors
endif

" i3 Config Syntax Highlighting
aug i3config_ft_detection
    au!
    au BufNewFile,BufRead ~/.i3/config set filetype=i3config
aug end

" Indent Lines
let g:indent_blankline_char_highlight = 'DevIconAwk'
