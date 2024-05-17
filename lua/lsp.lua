-- Nvim Lua Completion
require("neodev").setup({
    override = function(_, library)
        library.enabled = true
        library.plugins = true
        library.types = true
        library.runtime = true
    end,
})

-- LSP
require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })
local nvim_lsp = require("lspconfig")

-- cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = require("helpers.lsp").global_on_attach

-- NullLS
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            extra_args = { "--plugin-search-dir=." },
            extra_filetypes = { "astro" },
        }),
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.actionlint,
        null_ls.builtins.diagnostics.clang_check,
        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.rustfmt.with({ filetypes = { "rust" } }),
        null_ls.builtins.code_actions.gitrebase,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.beautysh,
    },
    capabilities = capabilities,
})

require("mason-null-ls").setup({ automatic_installation = true })

-- Astro
nvim_lsp.astro.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        -- Let NullLs handle formatting
        client.server_capabilities.document_formatting = false
    end,
})

-- C/C++
nvim_lsp.clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Bash
nvim_lsp.bashls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

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
    return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
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

-- OCaml
--[[ nvim_lsp.ocamllsp.setup({
    capabilities = capabilities,
    on_attach = on_attach,
}) ]]

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
            diagnostics = {
                enable = true,
            },
            telemetry = {
                enable = false,
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

-- ReScript
--Setup rescript LSP
require("lspconfig").rescriptls.setup({
    -- Using mason.nvim plugin
    cmd = { "rescript-lsp", "--stdio" },
    -- or pass the path to server.js
    -- cmd = {
    --   'node',
    --   '/home/username/path/to/server/out/server.js',
    --   '--stdio'
    -- }
    on_attach = on_attach,
    commands = {
        ResOpenCompiled = {
            require("rescript-tools").open_compiled,
            description = "Open Compiled JS",
        },
        ResCreateInterface = {
            require("rescript-tools").create_interface,
            description = "Create Interface file",
        },
        ResSwitchImplInt = {
            require("rescript-tools").switch_impl_intf,
            description = "Switch Implementation/Interface",
        },
    },
})

-- DAP
require("mason-nvim-dap").setup({ ensure_installed = { "python", "js", "chrome", "firefox" }, automatic_setup = true })
