" Use space as leader key
nnoremap <Space> <Nop>
let mapleader="\<Space>"

" Open current file with Chrome with <Leader>h
nnoremap <leader>h :exe ':silent !google-chrome-stable %'<CR>

" Quickly check JSDoc Types
nnoremap <leader>tt maggo// @ts-check<Esc>`a
nnoremap <leader>tT maggjdd`a

" Escape from terminal
:tnoremap <Esc> <C-\><C-n>

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
nnoremap <silent>gd :Lspsaga preview_definition<CR>
nnoremap <silent> gs :Lspsaga signature_help<CR>
nnoremap <silent><leader>rn :Lspsaga rename<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent><leader>tt :Lspsaga open_floaterm fish<CR>
tnoremap <silent><Esc> <C-\><C-n>:Lspsaga close_floaterm<CR>
tnoremap <silent><C-c><C-c> <C-\><C-n>:Lspsaga close_floaterm<CR>

" WhichKey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Goyo
nmap <leader>l :Goyo<CR>

" Ranger
nnoremap <leader>ex <cmd>RnvimrToggle<cr>

" Vim-Compe
" NOTE: Order is important. You can't lazy loading lexima.vim.
let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
