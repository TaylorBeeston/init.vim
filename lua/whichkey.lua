local wk = require("which-key")

wk.register(
    {
        t = {
            name = "+tab",
            s = {":tab split<CR>", "New Tab With This Buffer"},
            q = {":tab close<CR>", "Close Tab"},
            c = {":tab new<CR>", "New Empty Tab"},
            n = {":tabn<CR>", "Next Tab"},
            p = {":tabp<CR>", "Previous Tab"},
            b = {":tabp<CR>", "Previous Tab"}
        },
        w = {
            name = "+window",
            v = {"<cmd>vs<cr>", "Vertical Split"},
            s = {":sp<CR>", "Horizontal Split"},
            q = {":wincmd q<CR>", "Close Window"},
            h = {":wincmd h<CR>", "Move Left"},
            j = {":wincmd j<CR>", "Move Down"},
            k = {":wincmd k<CR>", "Move Up"},
            l = {":wincmd l<CR>", "Move Right"},
            H = {":wincmd H<CR>", "Move Window Left"},
            J = {":wincmd J<CR>", "Move Window Down"},
            K = {":wincmd K<CR>", "Move Window Up"},
            L = {":wincmd L<CR>", "Move Window Right"},
            ["="] = {" :wincmd =<CR>", "Make All Windows The Same Size"},
            [">"] = {" :wincmd ><CR>", "Increase Window Width"},
            ["<"] = {" :wincmd <<CR>", "Decrease Window Width"},
            ["+"] = {" :wincmd +<CR>", "Increase Window Height"},
            ["-"] = {" :wincmd -<CR>", "Decrease Window Height"}
        }
    },
    {prefix = "<leader>"}
)

-- TODOs
wk.register(
    {
        d = {
            name = "+TODO",
            q = {":TodoQuickFix<CR>", "TODOS in Quick Fix List"},
            s = {":TodoTelescope<CR>", "TODOS in Telescope"},
            t = {":TodoTrouble<CR>", "TODOS in Trouble"}
        }
    },
    {prefix = "<leader>t"}
)
