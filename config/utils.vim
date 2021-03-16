" Basics
syntax on                        " enable syntax highlighting
filetype plugin indent on        " required?
set nocompatible                 " be iMproved
set encoding=utf-8               " use UTF-8 Encoding
set shell=/bin/bash              " use bash, not fish or zsh
set showcmd                      " display incomplete commands
set scrolloff=999                " keep the cursor in the middle of the screen
set rnu                          " relative line numberes
set hidden                       " if hidden is not set, TextEdit might fail.
set tags=./tags;                 " Search for CTags

"" Whitespace
set nowrap                       " don't wrap lines
set tabstop=4 shiftwidth=4       " a tab is four spaces
set expandtab                    " use spaces, not tabs
set backspace=indent,eol,start   " backspace through everything in insert mode
set cc=80,100                    " show column border

"" Searching
set nohlsearch                   " highlight matches
set incsearch                    " incremental searching
set ignorecase                   " searches are case insensitive...
set smartcase                    " ... unless they contain at least one capital letter

" UI Stuff
set noshowmode                   " let airline show the current mode
set nolazyredraw                 " don't render half of the screen
set completeopt=menuone,noselect " Set completeopt to have a better completion experience
set shortmess+=c                 " don't give |ins-completion-menu| messages.
set cmdheight=2                  " Better display for messages
set updatetime=300               " You will have bad experience for diagnostic messages when it's default 4000.
set signcolumn=yes               " always show signcolumns
set foldlevel=99                 " unfold everything
set guifont=Fira\ Code\ Nerd\ Font:h18     " set font for graphical frontends

" Some servers have issues with backup files (I think this is from a plugin?)
set nobackup
set nowritebackup

" Persistent Undos
if has('persistent_undo')
    let myUndoDir = expand('$HOME/.vim' . '/undodir')
    " Create dirs
    :silent call system('mkdir -p ' , myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Write as sudo with w!!
cmap w!! w !sudo tee %

" Syntax highlighting for embedded lua in vimscript
let g:vimsyn_embed = 'l'

" Neovide stuff
let g:neovide_refresh_rate=144
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_vfx_mode="pixiedust"
