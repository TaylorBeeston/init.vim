-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/taylor/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/taylor/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/taylor/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/taylor/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/taylor/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FTerm.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numtostr/FTerm.nvim"
  },
  ["HighStr.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/HighStr.nvim",
    url = "https://github.com/pocco81/HighStr.nvim"
  },
  ScrollColors = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/ScrollColors",
    url = "https://github.com/vim-scripts/ScrollColors"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\1\2^\0\0\3\0\5\0\n4\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\1>\0\2\1G\0\1\0\topts\26alpha.themes.startify\nsetup\nalpha\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["base16-vim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/base16-vim",
    url = "https://github.com/chriskempson/base16-vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-fuzzy-buffer"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/cmp-fuzzy-buffer",
    url = "https://github.com/tzachar/cmp-fuzzy-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["focus.nvim"] = {
    config = { "\27LJ\1\2h\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\4\15signcolumn\2\15cursorline\2\17hybridnumber\2\venable\2\nsetup\nfocus\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/focus.nvim",
    url = "https://github.com/beauwilliams/focus.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["fuzzy.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/fuzzy.nvim",
    url = "https://github.com/tzachar/fuzzy.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2�\2\0\2\n\0\14\0!7\2\0\1\5\2\0\0T\2\2�%\2\1\0:\2\0\1)\2\0\0007\3\0\1\a\3\2\0T\3\2�7\2\0\1T\3\14�4\3\3\0007\3\4\3%\4\5\0007\5\0\0014\6\6\0007\6\a\6%\a\b\0004\b\t\0007\t\n\1>\b\2\0=\6\1\0027\a\v\1>\3\5\2\16\2\3\0002\3\3\0003\4\r\0%\5\f\0\16\6\2\0$\5\6\5;\5\1\4;\4\1\3H\3\2\0\1\3\0\0\0\29GitSignsCurrentLineBlame\6 \fsummary\16author_time\rtonumber\r%m-%d-%Y\tdate\aos\18%s, %s • %s\vformat\vstring\22Not Committed Yet\bYou\vauthorw\1\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0001\2\4\0:\2\5\1>\0\2\1G\0\1\0!current_line_blame_formatter\0\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["i3config.vim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/i3config.vim",
    url = "https://github.com/mboughaba/i3config.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/limelight.vim",
    url = "https://github.com/junegunn/limelight.vim"
  },
  ["lsp-trouble.nvim"] = {
    config = { "\27LJ\1\0029\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim",
    url = "https://github.com/folke/lsp-trouble.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\1\2�\2\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\25\tText\b\rFunction\b\rOperator\b\nColor\b\nClass\bﴯ\vModule\b\rConstant\b\rProperty\bﰠ\vMethod\b\15EnumMember\b\tUnit\b塞\14Interface\b\vStruct\bפּ\rVariable\b\fSnippet\b\vFolder\b\nEvent\b\nField\bﰠ\18TypeParameter\5\tFile\b\nValue\b\16Constructor\b\tEnum\b\fKeyword\b\14Reference\b\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  mkdx = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/mkdx",
    url = "https://github.com/SidOfc/mkdx"
  },
  neorg = {
    config = { "\27LJ\1\2�\2\0\0\6\0\17\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\15\0003\2\3\0002\3\0\0:\3\4\0023\3\6\0003\4\5\0:\4\a\3:\3\b\0022\3\0\0:\3\t\0023\3\r\0003\4\v\0003\5\n\0:\5\f\4:\4\a\3:\3\14\2:\2\16\1>\0\2\1G\0\1\0\tload\1\0\0\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\tmain\f~/neorg\24core.norg.concealer\18core.keybinds\vconfig\1\0\0\1\0\2\17neorg_leader\14<Leader>o\21default_keybinds\2\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nlua.nvim",
    url = "https://github.com/tjdevries/nlua.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-base16.lua",
    url = "https://github.com/norcalli/nvim-base16.lua"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-cursorline"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-luapad",
    url = "https://github.com/rafcamlet/nvim-luapad"
  },
  ["nvim-nonicons"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-nonicons",
    url = "https://github.com/yamatsum/nvim-nonicons"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\1\0022\0\0\3\0\3\0\0064\0\0\0004\1\2\0%\2\1\0>\1\2\2:\1\1\0G\0\1\0\frequire\vnotify\bvim\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\1\2�\2\0\0\5\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\6\0003\3\3\0003\4\4\0:\4\5\3:\3\a\0023\3\b\0003\4\t\0:\4\n\0033\4\v\0:\4\f\3:\3\r\2:\2\15\1>\0\2\1G\0\1\0\16textobjects\1\0\0\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\fkeymaps\1\0\4\aif\20@function.inner\aaf\20@function.outer\aac\17@class.outer\aic\17@class.inner\1\0\2\14lookahead\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  nvim_context_vt = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim_context_vt",
    url = "https://github.com/haringsrob/nvim_context_vt"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\1\0022\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["package-info.nvim"] = {
    config = { "\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17package-info\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/package-info.nvim",
    url = "https://github.com/vuki656/package-info.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["python-syntax"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/python-syntax",
    url = "https://github.com/vim-python/python-syntax"
  },
  rnvimr = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/rnvimr",
    url = "https://github.com/kevinhwang91/rnvimr"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["searchbox.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/searchbox.nvim",
    url = "https://github.com/VonHeikemen/searchbox.nvim"
  },
  ["specs.nvim"] = {
    config = { "\27LJ\1\2�\2\0\0\5\0\r\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0004\3\0\0%\4\1\0>\3\2\0027\3\5\3:\3\6\0024\3\0\0%\4\1\0>\3\2\0027\3\a\3:\3\b\2:\2\t\0012\2\0\0:\2\n\0013\2\v\0:\2\f\1>\0\2\1G\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\18slide_resizer\nfader\16pulse_fader\1\0\5\vinc_ms\3\2\nwinhl\14IncSearch\nblend\3P\rdelay_ms\3\0\nwidth\3A\1\0\2\rmin_jump\3\30\15show_jumps\2\nsetup\nspecs\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/specs.nvim",
    url = "https://github.com/edluffy/specs.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20symbols-outline\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\1\2�\2\0\0\4\0\f\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0002\2\a\0003\3\4\0;\3\1\0023\3\5\0;\3\2\0023\3\6\0;\3\3\0023\3\a\0;\3\4\0023\3\b\0;\3\5\0023\3\t\0;\3\6\2:\2\n\0012\2\0\0:\2\v\1>\0\2\1G\0\1\0\fexclude\ftabouts\1\0\2\topen\6{\nclose\6}\1\0\2\topen\6[\nclose\6]\1\0\2\topen\6(\nclose\6)\1\0\2\topen\6`\nclose\6`\1\0\2\topen\6\"\nclose\6\"\1\0\2\topen\6'\nclose\6'\1\0\a\21ignore_beginning\2\15act_as_tab\2\21act_as_shift_tab\1\15completion\2\21enable_backwards\2\21backwards_tabkey\f<S-Tab>\vtabkey\n<Tab>\nsetup\vtabout\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/opt/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-doge",
    url = "https://github.com/kkoomen/vim-doge"
  },
  ["vim-es2015-snippets"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-es2015-snippets",
    url = "https://github.com/epilande/vim-es2015-snippets"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-exchange",
    url = "https://github.com/tommcdo/vim-exchange"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gh-line"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-gh-line",
    url = "https://github.com/ruanyl/vim-gh-line"
  },
  ["vim-graphql"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-graphql",
    url = "https://github.com/jparise/vim-graphql"
  },
  ["vim-instant-markdown"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/opt/vim-instant-markdown",
    url = "https://github.com/suan/vim-instant-markdown"
  },
  ["vim-kitty"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-kitty",
    url = "https://github.com/fladson/vim-kitty"
  },
  ["vim-react-snippets"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-react-snippets",
    url = "https://github.com/epilande/vim-react-snippets"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-smoothie",
    url = "https://github.com/psliwka/vim-smoothie"
  },
  ["vim-styled-components"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-styled-components",
    url = "https://github.com/styled-components/vim-styled-components"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-syntax-extra"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-syntax-extra",
    url = "https://github.com/justinmk/vim-syntax-extra"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-wordmotion",
    url = "https://github.com/chaoren/vim-wordmotion"
  },
  vimwiki = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: specs.nvim
time([[Config for specs.nvim]], true)
try_loadstring("\27LJ\1\2�\2\0\0\5\0\r\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0004\3\0\0%\4\1\0>\3\2\0027\3\5\3:\3\6\0024\3\0\0%\4\1\0>\3\2\0027\3\a\3:\3\b\2:\2\t\0012\2\0\0:\2\n\0013\2\v\0:\2\f\1>\0\2\1G\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\18slide_resizer\nfader\16pulse_fader\1\0\5\vinc_ms\3\2\nwinhl\14IncSearch\nblend\3P\rdelay_ms\3\0\nwidth\3A\1\0\2\rmin_jump\3\30\15show_jumps\2\nsetup\nspecs\frequire\0", "config", "specs.nvim")
time([[Config for specs.nvim]], false)
-- Config for: package-info.nvim
time([[Config for package-info.nvim]], true)
try_loadstring("\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17package-info\frequire\0", "config", "package-info.nvim")
time([[Config for package-info.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\1\2�\2\0\0\6\0\17\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\15\0003\2\3\0002\3\0\0:\3\4\0023\3\6\0003\4\5\0:\4\a\3:\3\b\0022\3\0\0:\3\t\0023\3\r\0003\4\v\0003\5\n\0:\5\f\4:\4\a\3:\3\14\2:\2\16\1>\0\2\1G\0\1\0\tload\1\0\0\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\tmain\f~/neorg\24core.norg.concealer\18core.keybinds\vconfig\1\0\0\1\0\2\17neorg_leader\14<Leader>o\21default_keybinds\2\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\1\2^\0\0\3\0\5\0\n4\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\1>\0\2\1G\0\1\0\topts\26alpha.themes.startify\nsetup\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\1\2�\2\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\25\tText\b\rFunction\b\rOperator\b\nColor\b\nClass\bﴯ\vModule\b\rConstant\b\rProperty\bﰠ\vMethod\b\15EnumMember\b\tUnit\b塞\14Interface\b\vStruct\bפּ\rVariable\b\fSnippet\b\vFolder\b\nEvent\b\nField\bﰠ\18TypeParameter\5\tFile\b\nValue\b\16Constructor\b\tEnum\b\fKeyword\b\14Reference\b\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: lsp-trouble.nvim
time([[Config for lsp-trouble.nvim]], true)
try_loadstring("\27LJ\1\0029\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\ftrouble\frequire\0", "config", "lsp-trouble.nvim")
time([[Config for lsp-trouble.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2�\2\0\2\n\0\14\0!7\2\0\1\5\2\0\0T\2\2�%\2\1\0:\2\0\1)\2\0\0007\3\0\1\a\3\2\0T\3\2�7\2\0\1T\3\14�4\3\3\0007\3\4\3%\4\5\0007\5\0\0014\6\6\0007\6\a\6%\a\b\0004\b\t\0007\t\n\1>\b\2\0=\6\1\0027\a\v\1>\3\5\2\16\2\3\0002\3\3\0003\4\r\0%\5\f\0\16\6\2\0$\5\6\5;\5\1\4;\4\1\3H\3\2\0\1\3\0\0\0\29GitSignsCurrentLineBlame\6 \fsummary\16author_time\rtonumber\r%m-%d-%Y\tdate\aos\18%s, %s • %s\vformat\vstring\22Not Committed Yet\bYou\vauthorw\1\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0001\2\4\0:\2\5\1>\0\2\1G\0\1\0!current_line_blame_formatter\0\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: focus.nvim
time([[Config for focus.nvim]], true)
try_loadstring("\27LJ\1\2h\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\4\15signcolumn\2\15cursorline\2\17hybridnumber\2\venable\2\nsetup\nfocus\frequire\0", "config", "focus.nvim")
time([[Config for focus.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\1\0022\0\0\3\0\3\0\0064\0\0\0004\1\2\0%\2\1\0>\1\2\2:\1\1\0G\0\1\0\frequire\vnotify\bvim\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
try_loadstring("\27LJ\1\2�\2\0\0\5\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\6\0003\3\3\0003\4\4\0:\4\5\3:\3\a\0023\3\b\0003\4\t\0:\4\n\0033\4\v\0:\4\f\3:\3\r\2:\2\15\1>\0\2\1G\0\1\0\16textobjects\1\0\0\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\fkeymaps\1\0\4\aif\20@function.inner\aaf\20@function.outer\aac\17@class.outer\aic\17@class.inner\1\0\2\14lookahead\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd ultisnips ]]
vim.cmd [[ packadd nvim-cmp ]]
vim.cmd [[ packadd tabout.nvim ]]

-- Config for: tabout.nvim
try_loadstring("\27LJ\1\2�\2\0\0\4\0\f\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0002\2\a\0003\3\4\0;\3\1\0023\3\5\0;\3\2\0023\3\6\0;\3\3\0023\3\a\0;\3\4\0023\3\b\0;\3\5\0023\3\t\0;\3\6\2:\2\n\0012\2\0\0:\2\v\1>\0\2\1G\0\1\0\fexclude\ftabouts\1\0\2\topen\6{\nclose\6}\1\0\2\topen\6[\nclose\6]\1\0\2\topen\6(\nclose\6)\1\0\2\topen\6`\nclose\6`\1\0\2\topen\6\"\nclose\6\"\1\0\2\topen\6'\nclose\6'\1\0\a\21ignore_beginning\2\15act_as_tab\2\21act_as_shift_tab\1\15completion\2\21enable_backwards\2\21backwards_tabkey\f<S-Tab>\vtabkey\n<Tab>\nsetup\vtabout\frequire\0", "config", "tabout.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-instant-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
