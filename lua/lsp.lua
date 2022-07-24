-- LSP
local lsp_installer = require("nvim-lsp-installer")
local nvim_lsp = require("lspconfig")

lsp_installer.setup({ automatic_installation = true, ui = { border = "rounded" } })

-- cmp
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Generic LSP Settings
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "double" })
	vim.diagnostic.config({ virtual_text = { source = "if_many", prefix = "●", border = "rounded" } })

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
	},
	capabilities = capabilities,
})

-- JS/TS
nvim_lsp.tsserver.setup({
	capabilities = capabilities,
	init_options = require("nvim-lsp-ts-utils").init_options,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)

		-- Let NullLs handle formatting
		if client.server_capabilities.document_formatting == nil then
			client.resolved_capabilities.document_formatting = false
		else
			client.server_capabilities.document_formatting = false
		end

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
})

-- Astro
nvim_lsp.astro.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)

		-- Let NullLs handle formatting
		if client.server_capabilities.document_formatting == nil then
			client.resolved_capabilities.document_formatting = false
		else
			client.server_capabilities.document_formatting = false
		end
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
--[[ nvim_lsp.tailwindcss.setup({
	capabilities = capabilities,
	on_attach = on_attach,
}) ]]

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

-- Lua
local lspconfig = {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)

		-- Let NullLs handle formatting
		if client.server_capabilities.document_formatting == nil then
			client.resolved_capabilities.document_formatting = false
		else
			client.server_capabilities.document_formatting = false
		end
	end,
	settings = {
		Lua = {
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
}

local luadev = require("lua-dev").setup({ lspconfig = lspconfig })

nvim_lsp.sumneko_lua.setup(luadev)

-- Rust
require("rust-tools").setup({
	server = {
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)

			-- Let NullLs handle formatting
			if client.server_capabilities.document_formatting == nil then
				client.resolved_capabilities.document_formatting = false
			else
				client.server_capabilities.document_formatting = false
			end
		end,
	},
})
