" *** Vim-Plug  ***

" Make sure to run
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" prior to using
"
call plug#begin('~/.local/share/nvim/plugged')
" Fuzzy searching
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-github.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'mhartington/formatter.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate' }
Plug 'nvim-treesitter/playground'

" Autocompletion
Plug 'hrsh7th/nvim-compe'

" This requires running
" sudo npm -g install instant-markdown-d
" prior to use
Plug 'suan/vim-instant-markdown', {'for': 'markdown'} " Good Markdown support
Plug 'SidOfc/mkdx'

" Async Test Running
Plug 'tpope/vim-dispatch'
Plug 'vim-test/vim-test'

" Documentation
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" UI
Plug 'sainnhe/sonokai'
Plug 'sainnhe/edge'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'dawikur/base16-vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kevinhwang91/rnvimr'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'kevinhwang91/nvim-bqf'
Plug 'fladson/vim-kitty'

" use :SCROLL to test color schemes
Plug 'https://github.com/vim-scripts/ScrollColors'

" Show Indent Guides
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }

" Code folding
Plug 'pseewald/vim-anyfold' " Enter to cycle folds
Plug 'arecarn/vim-fold-cycle'
" Try it out!
" za: toggle folds at current line
" zo: open fold
" zc: close fold
" zR: open all folds
" zM: close all folds

" Close things like { and [ and "
Plug 'cohama/lexima.vim'

" Underline word under cursor
Plug 'itchyny/vim-cursorword'

" Syntax checking/highlighting
Plug 'justinmk/vim-syntax-extra'
Plug 'vim-python/python-syntax'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'mboughaba/i3config.vim'

" Motions
Plug 'chaoren/vim-wordmotion'

" HTML
Plug 'mattn/emmet-vim'

" Code snippets plugin
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
Plug 'epilande/vim-react-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'SirVer/ultisnips'

" Smooth scrolling with <C u> and <C d>
Plug 'psliwka/vim-smoothie'

" Exchange text objects with cx
Plug 'tommcdo/vim-exchange'

" Toggle comments with gcc
Plug 'tomtom/tcomment_vim'

" Work with surrounds e.g. cs"' will change double quotes to single quotes
" ysiw" will surround the current word with double quotes
Plug 'tpope/vim-surround'

" Unimpaired
Plug 'tpope/vim-unimpaired'

" Git Commands
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
Plug 'rhysd/git-messenger.vim'

" Github Commands
" Open GH with <leader>gh
" Open GH blame with <leader>gb
" Open GH Repo with <leader>go
Plug 'ruanyl/vim-gh-line'

" Repeat more than just native commands
Plug 'tpope/vim-repeat'

" Personal wiki!
" See https://github.com/vimwiki/vimwiki
Plug 'vimwiki/vimwiki'

" View Mappings
Plug 'liuchengxu/vim-which-key'
call plug#end()
