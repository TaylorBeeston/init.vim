set nocompatible              " be iMproved, required
filetype off                  " required
set shell=/bin/bash           " use bash, not fish or zsh
syntax on                     " enable syntax highlighting

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
Plug 'kosayoda/nvim-lightbulb'
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
Plug 'christoomey/vim-conflicted'

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

filetype plugin indent on " required
set encoding=utf-8        " use UTF-8 Encoding
set showcmd               " display incomplete commands
set scrolloff=999         " keep the cursor in the middle of the screen

" Persistent Undos
if has('persistent_undo')
    let myUndoDir = expand('$HOME/.vim' . '/undodir')
    " Create dirs
    :silent call system('mkdir -p ' , myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Use space as leader key
nnoremap <Space> <Nop>
let mapleader="\<Space>"

" Open current file with Chrome with <Leader>h
nnoremap <leader>h :exe ':silent !google-chrome-stable %'<CR>

" Quickly check JSDoc Types
nnoremap <leader>tt maggo// @ts-check<Esc>`a
nnoremap <leader>tT maggjdd`a

" Tabs
nnoremap <leader>ts :tab split<CR>
nnoremap <leader>tq :tab close<CR>
nnoremap <leader>tc :tab new<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>tb :tabp<CR>

" Windows
nnoremap <leader>wv :vs<CR>
nnoremap <leader>ws :sp<CR>
nnoremap <leader>wq :wincmd q<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wH :wincmd H<CR>
nnoremap <leader>wJ :wincmd J<CR>
nnoremap <leader>wK :wincmd K<CR>
nnoremap <leader>wL :wincmd L<CR>
nnoremap <leader>w= :wincmd =<CR>

" Buffers
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <leader><Tab> :bd<CR>
nnoremap <leader><S-Tab> :bd!<CR>

" FZF
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m

" Telescope
nnoremap <leader>ef <cmd>Telescope find_files<cr>
nnoremap <leader>rg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ch <cmd>Telescope command_history<cr>
nnoremap <leader>km <cmd>Telescope keymaps<cr>
nnoremap <leader>sb <cmd>Telescope current_buffer_fuzzy_find<cr>

nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>bc <cmd>Telescope git_bcommits<cr>
nnoremap <leader>br <cmd>Telescope git_branches<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>

nnoremap <leader>gr <cmd>Telescope lsp_references<cr>
nnoremap gr <cmd>Telescope lsp_references<cr>
nnoremap <leader>ds <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>dws <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>trs <cmd>Telescope treesitter<cr>

nnoremap <leader>gti <cmd>Telescope gh issues<cr>
nnoremap <leader>gtp <cmd>Telescope gh pull_request<cr>
nnoremap <leader>gtg <cmd>Telescope gh gist<cr>

" Saga
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> gs :Lspsaga signature_help<CR>
nnoremap <silent><leader>rn :Lspsaga rename<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>

" Key Mappings
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Merge Conflicts
set stl+=%{ConflictedVersion()}

" Escape from terminal
:tnoremap <Esc> <C-\><C-n>

set rnu " relative line numberes

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Write as sudo with w!!
cmap w!! w !sudo tee %

nmap <leader>l :Goyo<CR>

let g:OmniSharp_server_stdio = 1

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is four spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set cc=80,100                   " show column border

"" Searching
set nohlsearch                  " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" UI Stuff
set noshowmode    " let airline show the current mode
set nolazyredraw  " don't render half of the screen

" Set colorscheme
let base16colorspace=256               " use all the colors
colorscheme base16-tomorrow-night
set background=dark                  " i am the batman
let g:airline_theme='base16_tomorrow_night'

" True Color Support if it's available in terminal
if has("termguicolors")
  set termguicolors
endif

" Plugin flags
let g:javascript_plugin_jsdoc = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:python_highlight_all = 1
let g:vim_jsx_pretty_colorful_config = 1
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
let g:blamer_date_format = '%m/%d/%y %H:%M'
let g:blamer_relative_time = 1
let g:git_messenger_always_into_popup = 1
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
let g:airline#extensions#tabline#enabled = 1
let g:gtm_plugin_status_enabled = 1
let test#strategy = "dispatch"
let g:which_key_use_floating_win = 1

" Show time
function! AirlineInit()
  if exists('*GTMStatusline')
    call airline#parts#define_function('gtmstatus', 'GTMStatusline')
    let g:airline_section_b = airline#section#create([g:airline_section_b, ' ', '[', 'gtmstatus', ']'])
  endif
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" Search for CTags
set tags=./tags;

" Anyfold
autocmd Filetype * AnyFoldActivate
set foldlevel=99
let g:anyfold_fold_comments=1

" Syntax Highlighting
aug i3config_ft_detection
    au!
    au BufNewFile,BufRead ~/.i3/config set filetype=i3config
aug end

" Goyo
function! s:goyo_enter()
    Limelight 0.7
    BlamerToggle
endfunction

function! s:goyo_leave()
    Limelight!
    BlamerToggle
endfunction

" Ranger
nnoremap <leader>ex <cmd>RnvimrToggle<cr>

let g:rnvimr_enable_ex = 1
let g:rnvimr_enable_picker = 1

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

lua << EOF
local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end

local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

nvim_lsp.tsserver.setup {
    on_attach = on_attach
}

nvim_lsp.cssls.setup {
    on_attach = on_attach
}

nvim_lsp.graphql.setup {
    on_attach = on_attach
}

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
}

nvim_lsp.efm.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.goto_definition = false
    set_lsp_config(client)
  end,
  root_dir = function()
    if not eslint_config_exists() then
      return nil
    end
    return vim.fn.getcwd()
  end,
  settings = {
    languages = {
      javascript = {eslint},
      javascriptreact = {eslint},
      ["javascript.jsx"] = {eslint},
      typescript = {eslint},
      ["typescript.tsx"] = {eslint},
      typescriptreact = {eslint}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact"
  },
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persit_queries = false
  }
}

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
    nvim_lua = true;
    ultisnips = true;
    treesitter = true;
  };
}

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
    },
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
augroup END
]], true)

require('lspkind').init()

require('telescope').load_extension('gh')

require'nvim-web-devicons'.setup {
    default = true;
}

require 'colorizer'.setup(nil, { css = true; })
EOF

" NOTE: Order is important. You can't lazy loading lexima.vim.
let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Set completeopt to have a better completion experience
set completeopt=menuone,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Vim Lightbulb
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

" Lua
let g:vimsyn_embed = 'l'

" Indent Lines
let g:indent_blankline_char_highlight = 'DevIconAwk'
