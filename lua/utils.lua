--[[ -- Basics
vim.cmd "syntax on"
vim.cmd "filetype plugin indent on"

vim.o.encoding = "utf-8"
vim.o.shell = "/bin/bash"
vim.o.showcmd = true
vim.o.scrolloff = 999
vim.o.rnu = true
vim.wo.rnu = true
vim.o.hidden = true
vim.o.tags = "./tags;"

vim.o.wrap = false
vim.wo.wrap = false
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.backspace = "indent,eol,start"
vim.o.cc = "80,100" ]]
-- Basics
vim.cmd("filetype plugin indent on") -- required?
vim.cmd("set nocompatible") -- be iMproved
vim.cmd("set encoding=utf-8") -- use UTF-8 Encoding
vim.cmd("set shell=/bin/bash") -- use bash, not fish or zsh
vim.cmd("set showcmd") -- display incomplete commands
vim.opt.scrolloff = 999 -- keep the cursor in the middle of the screen
vim.cmd("set nu rnu") -- relative line numberes
vim.cmd("set hidden") -- if hidden is not set, TextEdit might fail.
vim.cmd("set tags=./tags;") -- Search for CTags

-- Whitespace
vim.cmd("set nowrap") -- don't wrap lines
vim.cmd("set tabstop=4 shiftwidth=4") -- a tab is four spaces
vim.cmd("set expandtab") -- use spaces, not tabs
vim.cmd("set backspace=indent,eol,start") -- backspace through everything in insert mode
vim.cmd("set cc=80,100") -- show column border

-- Searching
vim.cmd("set nohlsearch") -- highlight matches
vim.cmd("set incsearch") -- incremental searching
vim.cmd("set ignorecase") -- searches are case insensitive...
vim.cmd("set smartcase") -- ... unless they contain at least one capital letter

-- UI Stuff
vim.cmd("set noshowmode") -- let airline show the current mode
vim.cmd("set nolazyredraw") -- don't render half of the screen
vim.cmd("set completeopt=menu,menuone,noselect") -- Set completeopt to have a better completion experience
vim.cmd("set shortmess+=c") -- don't give |ins-completion-menu| messages.
vim.cmd("set cmdheight=2") -- Better display for messages
vim.cmd("set updatetime=300") -- You will have bad experience for diagnostic messages when it's default 4000.
vim.cmd("set signcolumn=yes") -- always show signcolumns

vim.wo.foldcolumn = "1"
vim.wo.foldlevel = 99 -- unfold everything
vim.wo.foldenable = true -- enable folds

vim.cmd("set mouse+=a")
vim.cmd("set guifont=Fira\\ Code\\ Nerd\\ Font:h18") -- set font for graphical frontends

-- Some servers have issues with backup files (I think this is from a plugin?)
vim.cmd("set nobackup")
vim.cmd("set nowritebackup")

vim.opt.pumblend = 20

-- Persistent Undos
vim.cmd([[
if has('persistent_undo')
    let myUndoDir = expand('$HOME/.vim' . '/undodir')
    :silent call system('mkdir -p ' , myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
]])

-- Syntax highlighting for embedded lua in vimscript
vim.g.vimsyn_embed = "l"

-- Neovide stuff
vim.g.neovide_refresh_rate = 120
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"

-- AutoCompile
vim.cmd("au BufWritePost pluginList.lua PackerCompile")

-- filetype.nvim
vim.g.did_load_filetypes = 1
