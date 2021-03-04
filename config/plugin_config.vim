" Python-Syntax
let g:python_highlight_all = 1

" Blamer
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
let g:blamer_date_format = '%m/%d/%y %H:%M'
let g:blamer_relative_time = 1

" Git Messenger
let g:git_messenger_always_into_popup = 1

" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" Vim-Test
let test#strategy = "dispatch"

" Which Key
let g:which_key_use_floating_win = 1

" Airline
let g:airline#extensions#tabline#enabled = 1

" Anyfold
autocmd Filetype * AnyFoldActivate
let g:anyfold_fold_comments=1

" Goyo/Limelight
function! s:goyo_enter()
    Limelight 0.7
    BlamerToggle
endfunction

function! s:goyo_leave()
    Limelight!
    BlamerToggle
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Vim Lightbulb
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

" FZF
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m

" OmniSharp
let g:OmniSharp_server_stdio = 1

" rnvimr (Ranger)
let g:rnvimr_enable_ex = 1
let g:rnvimr_enable_picker = 1
