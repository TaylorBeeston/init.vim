-- Nvim Lua Completion
require("neodev").setup()

-- LSP
require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })
local nvim_lsp = require("lspconfig")

-- cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Generic LSP Settings
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    if vim.lsp.inlay_hint and client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint(bufnr, true)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "double" })
    -- vim.diagnostic.config({ virtual_text = false })

    -- Mappings.
    local opts = { noremap = true, silent = true }
    buf_set_keymap("n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "<leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<leader>cd", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
    buf_set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ popup_opts = { border = "double" }})<CR>', opts)
    buf_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ popup_opts = { border = "double" }})<CR>', opts)
    buf_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)
end

-- NullLS
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            extra_args = { "--plugin-search-dir=." },
            extra_filetypes = { "astro" },
        }),
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.rustfmt.with({ filetypes = { "rust" } }),
        null_ls.builtins.code_actions.gitrebase,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.terraform_fmt,
    },
    capabilities = capabilities,
})

require("mason-null-ls").setup({ automatic_installation = true })

-- JS/TS
nvim_lsp.tsserver.setup({
    capabilities = capabilities,
    init_options = require("nvim-lsp-ts-utils").init_options,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        -- Let NullLs handle formatting
        client.server_capabilities.document_formatting = false

        -- Better TS Experience
        local ts_utils = require("nvim-lsp-ts-utils")

        ts_utils.setup({
            update_imports_on_move = true,
            require_confirmation_on_move = true,
            auto_inlay_hints = true,
            inly_hints_highlight = "Comment",
        })

        ts_utils.setup_client(client)
    end,
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
})

-- Astro
nvim_lsp.astro.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        -- Let NullLs handle formatting
        client.server_capabilities.document_formatting = false
    end,
})

-- ESLint
--[[ nvim_lsp.eslint.setup {
    capabilities = capabilities,
    on_attach = on_attach
} ]]
-- CSS
nvim_lsp.cssls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Tailwind
nvim_lsp.tailwindcss.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- JSON
nvim_lsp.jsonls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Svelte
nvim_lsp.svelte.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- GraphQL
--[[ nvim_lsp.graphql.setup {
    capabilities = capabilities,
    on_attach = on_attach
} ]]
-- Docker
nvim_lsp.dockerls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Python
local util = require("lspconfig/util")

local path = util.path
local function get_python_path(workspace)
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
    end

    -- Find and use virtualenv in workspace directory.
    for _, pattern in ipairs({ "*", ".*" }) do
        local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
        if match ~= "" then
            return path.join(path.dirname(match), "bin", "python")
        end
    end

    -- Fallback to system Python.
    return exepath("python3") or exepath("python") or "python"
end

nvim_lsp.pyright.setup({
    before_init = function(_, config)
        config.settings.python.pythonPath = get_python_path(config.root_dir)
    end,
    capabilities = capabilities,
    on_attach = on_attach,
})

-- VimL
nvim_lsp.vimls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Solidity
nvim_lsp.solidity_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Terraform
nvim_lsp.terraformls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
nvim_lsp.tflint.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Lua
nvim_lsp.lua_ls.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        -- Let NullLs handle formatting
        client.server_capabilities.document_formatting = false
    end,
    settings = {
        Lua = {
            hint = { enable = true },
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                enable = true,
                -- Get the language server to recognize the awesome globals
                globals = { "awesome", "client", "root", "screen" },
            },
            telemetry = {
                enable = false,
            },
            workspace = {
                ignoreSubmodules = false,
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("/usr/share/awesome/lib")] = true,
                },
            },
        },
    },
})

-- Rust
require("rust-tools").setup({
    server = {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)

            -- Let NullLs handle formatting
            client.server_capabilities.document_formatting = false
        end,
    },
})

-- DAP
require("mason-nvim-dap").setup({ ensure_installed = { "python", "js", "chrome", "firefox" }, automatic_setup = true })
