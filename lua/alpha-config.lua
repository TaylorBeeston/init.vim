local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = require("helpers/headers").random()

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("d", "  > Close Drop", ":lua require('drop').hide()<CR>"),
    dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("x", "  > Open Explorer", ":lua require('drop').hide(); vim.cmd('RnvimrToggle')<CR>"),
    dashboard.button("f", "  > Find file", ":lua require('drop').hide(); vim.cmd('Telescope find_files')<CR>"),
    dashboard.button("r", "  > Recent", ":lua require('drop').hide(); vim.cmd('Telescope oldfiles')<CR>"),
    dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | :e lua<CR>"),
    dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

-- Set footer
local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

--[[ dashboard.config.opts.setup = function()
    require("duck").hatch()
end ]]

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
