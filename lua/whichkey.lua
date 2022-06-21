local wk = require("which-key")

-- Leader Keybindings
wk.register({
	-- Buffers
	["<Tab>"] = { ":bd<CR>", "Close buffer" },
	["<S-Tab>"] = { ":bp<CR>", "Cycle through buffers" },

	-- Tabs
	t = {
		name = "+tab",
		s = { ":tab split<CR>", "New Tab With This Buffer" },
		q = { ":tab close<CR>", "Close Tab" },
		c = { ":tab new<CR>", "New Empty Tab" },
		n = { ":tabn<CR>", "Next Tab" },
		p = { ":tabp<CR>", "Previous Tab" },
		b = { ":tabp<CR>", "Previous Tab" },
	},

	-- Windows
	w = {
		name = "+window",
		v = { "<cmd>vs<cr>", "Vertical Split" },
		s = { ":sp<CR>", "Horizontal Split" },
		q = { ":wincmd q<CR>", "Close Window" },
		h = { ":wincmd h<CR>", "Move Left" },
		j = { ":wincmd j<CR>", "Move Down" },
		k = { ":wincmd k<CR>", "Move Up" },
		l = { ":wincmd l<CR>", "Move Right" },
		H = { ":wincmd H<CR>", "Move Window Left" },
		J = { ":wincmd J<CR>", "Move Window Down" },
		K = { ":wincmd K<CR>", "Move Window Up" },
		L = { ":wincmd L<CR>", "Move Window Right" },
		["="] = { " :wincmd =<CR>", "Make All Windows The Same Size" },
		[">"] = { " :wincmd ><CR>", "Increase Window Width" },
		["<"] = { " :wincmd <<CR>", "Decrease Window Width" },
		["+"] = { " :wincmd +<CR>", "Increase Window Height" },
		["-"] = { " :wincmd -<CR>", "Decrease Window Height" },
	},

	-- Package Management And Config Helpers
	up = { ":PackerUpdate<CR>", "Update Packages" },
	pu = { ":PackerUpdate<CR>", "Update Packages" },
	pr = { ":luafile %<CR>:PackerUpdate<CR>", "Source Current File and Update Packages" },
	rf = { ":luafile %<CR>", "Source Current File" },

	-- Telescope
	ef = { "<cmd>Telescope find_files<cr>", "Search by Filename" },
	rg = { "<cmd>Telescope live_grep<cr>", "Ripgrep" },
	fb = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
	fh = { "<cmd>Telescope help_tags<cr>", "Find Help" },
	ch = { "<cmd>Telescope command_history<cr>", "Command History" },
	km = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	sb = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search Buffer" },

	gc = { "<cmd>Telescope git_commits<cr>", "Git Commits" },
	bc = { "<cmd>Telescope git_bcommits<cr>", "Buffer Git Commits" },
	br = { "<cmd>Telescope git_branches<cr>", "Git Branches" },
	gs = { "<cmd>Telescope git_status<cr>", "Git status" },

	gr = { "<cmd>Telescope lsp_references<cr>", "Go to References" },
	ds = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
	dws = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
	trs = { "<cmd>Telescope treesitter<cr>", "Treesitter" },

	gt = {
		name = "+Github",
		i = { "<cmd>Telescope gh issues<cr>", "Issues" },
		p = { "<cmd>Telescope gh pull_request<cr>", "Pull Requests" },
		g = { "<cmd>Telescope gh gist<cr>", "Gists" },
	},

	-- Ranger
	ex = { "<cmd>RnvimrToggle<cr>", "Explore Files" },

	-- Symbols Outline
	so = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Symbols Outline" },

	-- Doc Comments
	doc = { "<cmd>lua require('neogen').generate()<CR>", "Generate Doc Comments" },

	-- Generic
	K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Forcibly Hover" },
	fm = { "<cmd>lua vim.lsp.buf.formatting_sync(nil, 5000)<CR>", "Format Buffer" },
}, { prefix = "<leader>" })

-- No prefix
wk.register({
	["<A-,>"] = { ":bp<CR>", "Buffer previous" },
	["<A-.>"] = { ":bn<CR>", "Buffer next" },

	["<A-1>"] = { ":BufferGoto1<CR>", "Go to buffer 1" },
	["<A-2>"] = { ":BufferGoto2<CR>", "Go to buffer 2" },
	["<A-3>"] = { ":BufferGoto3<CR>", "Go to buffer 3" },
	["<A-4>"] = { ":BufferGoto4<CR>", "Go to buffer 4" },
	["<A-5>"] = { ":BufferGoto5<CR>", "Go to buffer 5" },
	["<A-6>"] = { ":BufferGoto6<CR>", "Go to buffer 6" },
	["<A-7>"] = { ":BufferGoto7<CR>", "Go to buffer 7" },
	["<A-8>"] = { ":BufferGoto8<CR>", "Go to buffer 8" },
	["<A-9>"] = { ":BufferGoto9<CR>", "Go to buffer 9" },
	["<A-0>"] = { ":BufferLast<CR>", "Go to last buffer" },

	["<A-i>"] = { ":BufferPin<CR>", "Pin/unpin buffer" },
	["<A-c>"] = { ":BufferClose<CR>", "Close buffer" },

	["<A-p>"] = { ":BufferPick<CR>", "Magic buffer-picking mode" },

	-- Allow Clicking without effing up scroll position (can still double click/drag etc)
	["<LeftMouse>"] = { "<Nop>", "" },
})
