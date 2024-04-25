local wk = require("which-key")
local fmtCmd = vim.lsp.buf.format == nil and "<cmd>lua vim.lsp.buf.formatting_sync(nil, 5000)<CR>"
    or "<cmd>lua vim.lsp.buf.format({ timeout_ms = 5000 })<CR>"

local get_input = require("helpers/input")
local cycle_diagnostics = require("helpers/diagnostics")

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
        ["="] = { ":FocusToggle<CR>", "Make All Windows The Same Size" },
        [">"] = { ":wincmd ><CR>", "Increase Window Width" },
        ["<"] = { ":wincmd <<CR>", "Decrease Window Width" },
        ["+"] = { ":wincmd +<CR>", "Increase Window Height" },
        ["-"] = { ":wincmd -<CR>", "Decrease Window Height" },
    },
    -- Jest
    j = {
        name = "+jest",
        n = { ":lua require('jester').run()<CR>", "Run nearest test(s)" },
        f = { ":lua require('jester').run_file()<CR>", "Run current file" },
        l = { ":lua require('jester').run_last()<CR>", "Run last test(s)" },
        q = {
            name = "+quick",
            n = {
                ":lua require('jester').run({ terminal_cmd = \"lua require('FTerm').open()\"})<CR>",
                "Run nearest test(s) in floating terminal",
            },
            f = {
                ":lua require('jester').run_file({ terminal_cmd = \"lua require('FTerm').open()\"})<CR>",
                "Run current file in floating terminal",
            },
            l = {
                ":lua require('jester').run_last({ terminal_cmd = \"lua require('FTerm').open()\"})<CR>",
                "Run last test(s) in floating terminal",
            },
        },
        d = {
            name = "+debug",
            n = { ":lua require('jester').debug()<CR>", "Debug nearest test(s)" },
            f = { ":lua require('jester').debug_file()<CR>", "Debug current file" },
            l = { ":lua require('jester').debug_last()<CR>", "Debug last test(s)" },
        },
    },
    -- Package Management And Config Helpers
    ll = { ":Lazy<CR>", "Lazy" },
    rf = { ":luafile %<CR>", "Source Current File" },
    -- Telescope
    ef = { "<cmd>Telescope find_files<cr>", "Search by Filename" },
    er = { "<cmd>Telescope oldfiles<cr>", "Search by Recent Files" },
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
    gD = { "<cmd>TSToolsGoToSourceDefinition<cr>", "Go to source definition (TS-Only)" },
    gt = {
        name = "+Github",
        i = { "<cmd>Telescope gh issues<cr>", "Issues" },
        p = { "<cmd>Telescope gh pull_request<cr>", "Pull Requests" },
        g = { "<cmd>Telescope gh gist<cr>", "Gists" },
    },
    n = {
        name = "+Notify",
        d = { require("notify").dismiss, "Dismiss Notification" },
    },
    o = {
        name = "+Octo",
        i = {
            name = "+Issue",
            x = { "<cmd>Octo issue close<CR>", "Close" },
            o = { "<cmd>Octo issue reopen<CR>", "ReOpen" },
            n = { "<cmd>Octo issue create<CR>", "New (Create)" },
            e = { "<cmd>Octo issue edit<CR>", "Edit" },
            l = { "<cmd>Octo issue list<CR>", "List" },
            s = { "<cmd>Octo issue search<CR>", "Search" },
            r = { "<cmd>Octo issue reload<CR>", "Reload" },
            b = { "<cmd>Octo issue browser<CR>", "Browser (opens issue on Github)" },
            u = { "<cmd>Octo issue url<CR>", "URL (Copies URL to clipboard)" },
        },
        p = {
            name = "+PR",
            l = { "<cmd>Octo pr list<CR>", "List" },
            s = { "<cmd>Octo pr search<CR>", "Search" },
            e = { "<cmd>Octo pr edit<CR>", "Edit" },
            o = { "<cmd>Octo pr reopen<CR>", "ReOpen" },
            n = { "<cmd>Octo pr create<CR>", "New (Create)" },
            x = { "<cmd>Octo pr close<CR>", "Close" },
            h = { "<cmd>Octo pr checkout<CR>", "C[h]eckout" },
            c = { "<cmd>Octo pr commits<CR>", "Commits" },
            a = { "<cmd>Octo pr changes<CR>", "Ch[a]nges" },
            d = { "<cmd>Octo pr diff<CR>", "Diff" },
            m = { "<cmd>Octo pr merge<CR>", "Merge" },
            k = { "<cmd>Octo pr ready<CR>", "Ready" },
            i = { "<cmd>Octo pr checks<CR>", "Checks (C[I])" },
            r = { "<cmd>Octo pr reload<CR>", "Reload" },
            b = { "<cmd>Octo pr browser<CR>", "Browser (opens PR on Github)" },
            u = { "<cmd>Octo pr url<CR>", "URL (Copies URL to clipboard)" },
        },
        e = {
            name = "+R[e]po",
            l = { "<cmd>Octo repo list<CR>", "List" },
            f = { "<cmd>Octo repo fork<CR>", "Fork" },
            b = { "<cmd>Octo repo browser<CR>", "Browser (opens repo on Github)" },
            u = { "<cmd>Octo repo url<CR>", "URL (Copies URL to clipboard)" },
            v = { "<cmd>Octo repo view<CR>", "View" },
        },
        g = { "<cmd>Octo gist list<CR>", "List gists" },
        c = {
            name = "+Comment",
            a = { "<cmd>Octo comment add<CR>", "Add" },
            d = { "<cmd>Octo comment delete<CR>", "Delete" },
        },
        t = {
            name = "+Thread",
            r = { "<cmd>Octo thread resolve<CR>", "Resolve" },
            u = { "<cmd>Octo thread unresolve<CR>", "Unresolve" },
        },
        l = {
            name = "+Label",
            a = { "<cmd>Octo label add<CR>", "Add" },
            r = { "<cmd>Octo label remove<CR>", "Remove" },
            c = { "<cmd>Octo label create<CR>", "Create" },
        },
        a = {
            name = "+Assignee",
            a = { "<cmd>Octo assignee add<CR>", "Add" },
            r = { "<cmd>Octo assignee remove<CR>", "Remove" },
        },
        r = {
            name = "+[R]eview/[Re]act",
            s = { "<cmd>Octo review start<CR>", "Start" },
            u = { "<cmd>Octo review submit<CR>", "S[u]bmit" },
            r = { "<cmd>Octo review resume<CR>", "Resume" },
            d = { "<cmd>Octo review discard<CR>", "Discard" },
            m = { "<cmd>Octo review comments<CR>", "Co[m]ments" },
            c = { "<cmd>Octo review commit<CR>", "Commit" },
            x = { "<cmd>Octo review close<CR>", "Close" },
            e = {
                name = "+R[e]act",
                u = { "<cmd>Octo react thumbs_up<CR>", "Thumbs Up" },
                d = { "<cmd>Octo react thumbs_down<CR>", "Thumbs Down" },
                e = { "<cmd>Octo react eyes<CR>", "Eyes" },
                l = { "<cmd>Octo react laugh<CR>", "Laugh" },
                c = { "<cmd>Octo react confused<CR>", "Confused" },
                r = { "<cmd>Octo react rocket<CR>", "Rocket" },
                h = { "<cmd>Octo react heart<CR>", "Heart" },
                p = { "<cmd>Octo react party<CR>", "Party" },
            },
        },
        ["?"] = { "<cmd>Octo actions<CR>", "Show Available Actions" },
    },
    d = {
        name = "Duck",
        d = { require("duck").hatch, "Hatch Duck" },
        k = { require("duck").cook, "Cook Duck" },
    },
    c = {
        name = "Cellular Automaton",
        m = { "<cmd>CellularAutomaton make_it_rain<CR>", "Make it Rain" },
        g = { "<cmd>CellularAutomaton game_of_life<CR>", "Game of Life" },
    },
    gfr = {
        function()
            get_input({
                title = "Rename File",
                default_value = vim.fn.expand("%:t"),
                on_submit = function(value)
                    vim.cmd(":GRename " .. value)
                end,
            })
        end,
        "Git File Rename",
    },
    -- Ranger
    ex = { "<cmd>RnvimrToggle<cr>", "Explore Files" },
    -- Symbols Outline
    so = { "<cmd>SymbolsOutline<CR>", "Symbols Outline" },
    -- Doc Comments
    doc = { "<cmd>lua require('neogen').generate()<CR>", "Generate Doc Comments" },
    -- Generic
    K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Forcibly Hover" },
    fm = { fmtCmd, "Format Buffer" },
    l = { "<cmd>lua require('lsp_lines').toggle()<CR>", "Toggle LSP Lines" },
    td = { cycle_diagnostics, "Cycle Diagnostics" },
    tih = {
        function()
            vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled(0))
        end,
        "Toggle inlay hints",
    },
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
    zz = { "za", "Toggle fold" },
})
