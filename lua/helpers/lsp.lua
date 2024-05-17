local M = {
    global_on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end

        if vim.lsp.inlay_hint and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end

        buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings.
        local opts = { noremap = true, silent = true }
        buf_set_keymap("n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
        buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
        buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_set_keymap("n", "<leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        buf_set_keymap("n", "<leader>cd", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
        buf_set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ popup_opts = { border = "double" }})<CR>', opts)
        buf_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ popup_opts = { border = "double" }})<CR>', opts)
        buf_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)
    end,
}

return M
