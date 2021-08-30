-- LSP
local nvim_lsp = require("lspconfig")

-- Generic LSP Settings
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "<space>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

    require("lsp_signature").on_attach()
end

-- JS/TS
nvim_lsp.tsserver.setup {
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        -- Let Prettier do its job
        client.resolved_capabilities.document_formatting = false

        -- Better TS Experience
        local ts_utils = require("nvim-lsp-ts-utils")

        ts_utils.setup {
            eslint_enable_diagnostics = true,
            eslint_bin = "eslint_d",
            update_imports_on_move = true,
            require_confirmation_on_move = true
        }

        ts_utils.setup_client(client)

        -- Virtual Text Types!
        require("virtualtypes").on_attach(client, bufnr)

        -- no default maps, so you may want to define some here
        --[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":LspOrganize<CR>", {silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":LspFixCurrent<CR>", {silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":LspRenameFile<CR>", {silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":LspImportAll<CR>", {silent = true}) ]]
    end
}

-- CSS
nvim_lsp.cssls.setup {
    on_attach = on_attach
}

-- GraphQL
nvim_lsp.graphql.setup {
    on_attach = on_attach
}

-- Docker
nvim_lsp.dockerls.setup {
    on_attach = on_attach
}

-- VimL
nvim_lsp.vimls.setup {
    on_attach = on_attach
}

-- Lua
local sumneko_root_path = "/home/taylor/luaHelpers/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

local lspconfig = {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                enable = true,
                -- Get the language server to recognize the awesome globals
                globals = {"awesome", "client", "root", "screen"}
            },
            telemetry = {
                enable = false
            },
            workspace = {
                ignoreSubmodules = false,
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("/usr/share/awesome/lib")] = true
                }
            }
        }
    }
}

local luadev = require("lua-dev").setup {lspconfig = lspconfig}

nvim_lsp.sumneko_lua.setup(luadev)

-- Rust
nvim_lsp.rust_analyzer.setup({})
