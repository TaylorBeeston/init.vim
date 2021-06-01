local remap = vim.api.nvim_set_keymap

local inore = function(binding, command, options)
    local remapOptions = options or {}
    remapOptions.noremap = true
    remap("i", binding, command, remapOptions)
end

local nnore = function(binding, command, options)
    local remapOptions = options or {}
    remapOptions.noremap = true
    remap("n", binding, command, remapOptions)
end

local tnore = function(binding, command, options)
    local remapOptions = options or {}
    remapOptions.noremap = true
    remap("t", binding, command, remapOptions)
end

local vnore = function(binding, command, options)
    local remapOptions = options or {}
    remapOptions.noremap = true
    remap("v", binding, command, remapOptions)
end

local xnore = function(binding, command, options)
    local remapOptions = options or {}
    remapOptions.noremap = true
    remap("x", binding, command, remapOptions)
end

local cnore = function(binding, command, options)
    local remapOptions = options or {}
    remapOptions.noremap = true
    remap("c", binding, command, remapOptions)
end

-- Use space as leader key
-- nnore("<Space>", "<Nop>")
vim.g.mapleader = " "

-- Open current file with Chrome
nnore("<leader>h", ":exe ':silent !google-chrome-stable %'<CR>", {silent = true})

-- Tabs
--[[ nnore("<leader>ts", ":tab split<CR>")
nnore("<leader>tq", ":tab close<CR>")
nnore("<leader>tc", ":tab new<CR>")
nnore("<leader>tn", ":tabn<CR>")
nnore("<leader>tp", ":tabp<CR>")
nnore("<leader>tb", ":tabp<CR>") ]]
-- Windows
--[[ nnore("<leader>wv", ":vs<CR>")
nnore("<leader>ws", ":sp<CR>")
nnore("<leader>wq", ":wincmd q<CR>")
nnore("<leader>wh", ":wincmd h<CR>")
nnore("<leader>wj", ":wincmd j<CR>")
nnore("<leader>wk", ":wincmd k<CR>")
nnore("<leader>wl", ":wincmd l<CR>")
nnore("<leader>wH", ":wincmd H<CR>")
nnore("<leader>wJ", ":wincmd J<CR>")
nnore("<leader>wK", ":wincmd K<CR>")
nnore("<leader>wL", ":wincmd L<CR>")
nnore("<leader>w=", ":wincmd =<CR>") ]]
-- Buffers
nnore("<Tab>", ":bn<CR>")
nnore("<S-Tab>", ":bp<CR>")
nnore("<leader><Tab>", ":bd<CR>")
nnore("<leader><S-Tab>", ":bd!<CR>")

-- Package Management And Config Helpers
nnore("<leader>up", ":PackerUpdate<CR>")
nnore("<leader>pu", ":PackerUpdate<CR>")
nnore("<leader>rf", ":luafile %<CR>")
nnore("<leader>pr", ":luafile %<CR>:PackerUpdate<CR>")

-- Telescope
nnore("<leader>ef", "<cmd>Telescope find_files<cr>")
nnore("<leader>rg", "<cmd>Telescope live_grep<cr>")
nnore("<leader>fb", "<cmd>Telescope buffers<cr>")
nnore("<leader>fh", "<cmd>Telescope help_tags<cr>")
nnore("<leader>ch", "<cmd>Telescope command_history<cr>")
nnore("<leader>km", "<cmd>Telescope keymaps<cr>")
nnore("<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>")

nnore("<leader>gc", "<cmd>Telescope git_commits<cr>")
nnore("<leader>bc", "<cmd>Telescope git_bcommits<cr>")
nnore("<leader>br", "<cmd>Telescope git_branches<cr>")
nnore("<leader>gs", "<cmd>Telescope git_status<cr>")

nnore("gr", "<cmd>LspTroubleToggle lsp_references<cr>")
nnore("<leader>gr", "<cmd>Telescope lsp_references<cr>")
nnore("<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>")
nnore("<leader>dws", "<cmd>Telescope lsp_workspace_symbols<cr>")
nnore("<leader>trs", "<cmd>Telescope treesitter<cr>")

nnore("<leader>gti", "<cmd>Telescope gh issues<cr>")
nnore("<leader>gtp", "<cmd>Telescope gh pull_request<cr>")
nnore("<leader>gtg", "<cmd>Telescope gh gist<cr>")

-- Saga
nnore("gh", ":Lspsaga lsp_finder<CR>", {silent = true})
nnore("<leader>ca", ":Lspsaga code_action<CR>", {silent = true})
vnore("<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", {silent = true})
nnore("K", ":Lspsaga hover_doc<CR>", {silent = true})
nnore("<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", {silent = true})
nnore("<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", {silent = true})
nnore("gd", ":Lspsaga preview_definition<CR>", {silent = true})
nnore("gs", ":Lspsaga signature_help<CR>", {silent = true})
nnore("<leader>rn", ":Lspsaga rename<CR>", {silent = true})
nnore("<leader>cd", ":Lspsaga show_line_diagnostics<CR>", {silent = true})
nnore("[e", ":Lspsaga diagnostic_jump_next<CR>", {silent = true})
nnore("]e", ":Lspsaga diagnostic_jump_prev<CR>", {silent = true})
nnore("<leader>tt", ":Lspsaga open_floaterm fish<CR>", {silent = true})
tnore("<Esc>", "<C-\\><C-n>:Lspsaga close_floaterm<CR>", {silent = true})
tnore("<C-c><C-c>", "<C-\\><C-n>:Lspsaga close_floaterm<CR>", {silent = true})

-- Goyo
nnore("<leader>l", ":Goyo<CR>")

-- Ranger
nnore("<leader>ex", "<cmd>RnvimrToggle<cr>")

-- LspTrouble
nnore("<leader>cc", "<cmd>LspTroubleDocumentToggle<cr>")

-- Neoscroll
nnore("<C-u>", ":lua require('neoscroll').scroll(-0.19, true, 10)<CR>", {silent = true})
nnore("<C-d>", ":lua require('neoscroll').scroll(0.19, true, 10)<CR>", {silent = true})
xnore("<C-u>", ":lua require('neoscroll').scroll(-0.19, true, 8)<CR>", {silent = true})
xnore("<C-d>", ":lua require('neoscroll').scroll(0.19, true, 8)<CR>", {silent = true})

-- Vim-Compe
local npairs = require("nvim-autopairs")

-- skip it, if you use another global object
_G.Mutils = {}

vim.g.completion_confirm_key = ""
Mutils.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"](npairs.esc("<cr>"))
        else
            return npairs.esc("<cr>")
        end
    else
        return npairs.autopairs_cr()
    end
end

inore("<CR>", "v:lua.Mutils.completion_confirm()", {expr = true})
inore("<C-Space>", "compe#complete()", {silent = true, expr = true})
inore("<C-e>", "compe#close('<C-e>')", {silent = true, expr = true})
inore("<C-f>", "compe#scroll({ 'delta': +4})", {silent = true, expr = true})
inore("<C-d>", "compe#scroll({ 'delta': -4})", {silent = true, expr = true})

-- Symbols Outline
nnore("<leader>so", "<cmd>SymbolsOutline<CR>")

-- Generic
nnore("<leader>K", "<cmd>lua vim.lsp.buf.hover()<CR>")

-- Write as sudo with w!!
cnore("w!!", "w !sudo tee %")

-- Highlight Stuff
vnore("<F3>", ":<C-u>HSHighlight 1<CR>", {silent = true})
vnore("<F4>", ":<C-u>HSRmHighlight<CR>", {silent = true})
