-- LSP (Neovim 0.11+ native API)
-- Note: lazydev.nvim handles Lua LSP setup automatically via ftplugin
require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })

-- blink.cmp capabilities
local capabilities = require("blink.cmp").get_lsp_capabilities()

local on_attach = require("helpers.lsp").global_on_attach

-- NullLS
local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier.with({
			extra_args = { "--plugin-search-dir=." },
			extra_filetypes = { "astro" },
		}),
		require("none-ls.diagnostics.eslint_d"),
		null_ls.builtins.diagnostics.actionlint,
		-- null_ls.builtins.diagnostics.clang_check,
		null_ls.builtins.diagnostics.fish,
		null_ls.builtins.diagnostics.hadolint,
		-- null_ls.builtins.diagnostics.jsonlint,
		null_ls.builtins.diagnostics.selene,
		null_ls.builtins.diagnostics.markdownlint,
		-- null_ls.builtins.diagnostics.shellcheck,
		-- null_ls.builtins.code_actions.eslint_d,
		require("none-ls.code_actions.eslint_d"),
		-- null_ls.builtins.formatting.rustfmt.with({ filetypes = { "rust" } }),
		null_ls.builtins.code_actions.gitrebase,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.terraform_fmt,
		null_ls.builtins.formatting.clang_format.with({
			extra_filetypes = { "glsl", "wgsl" },
		}),
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.gdformat,
	},
	capabilities = capabilities,
})

require("mason-null-ls").setup({ automatic_installation = true })

-- Helper to get python path for virtualenvs
local function get_python_path(workspace)
	-- Use activated virtualenv.
	if vim.env.VIRTUAL_ENV then
		return vim.fs.joinpath(vim.env.VIRTUAL_ENV, "bin", "python")
	end

	-- Find and use virtualenv in workspace directory.
	for _, pattern in ipairs({ "*", ".*" }) do
		local match = vim.fn.glob(vim.fs.joinpath(workspace, pattern, "pyvenv.cfg"))
		if match ~= "" then
			return vim.fs.joinpath(vim.fs.dirname(match), "bin", "python")
		end
	end

	-- Fallback to system Python.
	return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

-- LSP Server Configurations using vim.lsp.config (Neovim 0.11+)

-- Astro
vim.lsp.config.astro = {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		client.server_capabilities.document_formatting = false
	end,
}

-- C/C++
vim.lsp.config.clangd = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Go
vim.lsp.config.gopls = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Bash
vim.lsp.config.bashls = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- CSS
vim.lsp.config.cssls = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Tailwind
vim.lsp.config.tailwindcss = {
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {
		"aspnetcorerazor",
		"astro",
		"astro-markdown",
		"blade",
		"clojure",
		"django-html",
		"htmldjango",
		"edge",
		"eelixir",
		"elixir",
		"ejs",
		"erb",
		"eruby",
		"gohtml",
		"gohtmltmpl",
		"haml",
		"handlebars",
		"hbs",
		"html",
		"html-eex",
		"heex",
		"jade",
		"leaf",
		"liquid",
		"markdown",
		"mdx",
		"mustache",
		"njk",
		"nunjucks",
		"php",
		"razor",
		"slim",
		"twig",
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		"sugarss",
		"javascript",
		"javascriptreact",
		"reason",
		"rescript",
		"typescriptreact",
		"vue",
		"svelte",
		"templ",
	},
}

-- JSON
vim.lsp.config.jsonls = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Svelte
vim.lsp.config.svelte = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Docker
vim.lsp.config.dockerls = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Python
vim.lsp.config.pyright = {
	before_init = function(_, config)
		config.settings.python.pythonPath = get_python_path(config.root_dir)
	end,
	capabilities = capabilities,
	on_attach = on_attach,
}

-- VimL
vim.lsp.config.vimls = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Solidity
vim.lsp.config.solidity_ls = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- GLSL
vim.lsp.config.glsl_analyzer = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- WGSL
vim.lsp.config.wgsl_analyzer = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- GD Shader
vim.lsp.config.gdshader_lsp = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- QML
vim.lsp.config.qmlls = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Hyprlang
vim.lsp.config.hyprls = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Terraform
vim.lsp.config.terraformls = {
	capabilities = capabilities,
	on_attach = on_attach,
}

vim.lsp.config.tflint = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Lua
vim.lsp.config.lua_ls = {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
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
}

-- ReScript
vim.lsp.config.rescriptls = {
	cmd = { "rescript-lsp", "--stdio" },
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
}

-- Enable all configured LSP servers
vim.lsp.enable({
	"astro",
	"clangd",
	"gopls",
	"bashls",
	"cssls",
	"tailwindcss",
	"jsonls",
	"svelte",
	"dockerls",
	"pyright",
	"vimls",
	"solidity_ls",
	"glsl_analyzer",
	"wgsl_analyzer",
	"gdshader_lsp",
	"qmlls",
	"hyprls",
	"terraformls",
	"tflint",
	"lua_ls",
	"rescriptls",
})

-- Rust: rustaceanvim handles LSP setup automatically via ftplugin
-- Configure via vim.g.rustaceanvim if needed (see :h rustaceanvim)
vim.g.rustaceanvim = {
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
}

-- DAP
require("mason-nvim-dap").setup({ ensure_installed = { "python", "js", "chrome", "firefox" }, automatic_setup = true })
