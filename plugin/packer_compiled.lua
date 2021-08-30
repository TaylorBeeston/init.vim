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
  local success, result = pcall(loadstring(s))
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
  ["HighStr.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/HighStr.nvim"
  },
  ScrollColors = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/ScrollColors"
  },
  ["base16-vim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/base16-vim"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/compe-tabnine"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2’\2\0\2\n\0\14\0!7\2\0\1\5\2\0\0T\2\2€%\2\1\0:\2\0\1)\2\0\0007\3\0\1\a\3\2\0T\3\2€7\2\0\1T\3\14€4\3\3\0007\3\4\3%\4\5\0007\5\0\0014\6\6\0007\6\a\6%\a\b\0004\b\t\0007\t\n\1>\b\2\0=\6\1\0027\a\v\1>\3\5\2\16\2\3\0002\3\3\0003\4\r\0%\5\f\0\16\6\2\0$\5\6\5;\5\1\4;\4\1\3H\3\2\0\1\3\0\0\0\29GitSignsCurrentLineBlame\6 \fsummary\16author_time\rtonumber\r%m-%d-%Y\tdate\aos\18%s, %s â€¢ %s\vformat\vstring\22Not Committed Yet\bYou\vauthorw\1\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0001\2\4\0:\2\5\1>\0\2\1G\0\1\0!current_line_blame_formatter\0\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["goto-preview"] = {
    config = { "\27LJ\1\2S\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\21default_mappings\2\nsetup\17goto-preview\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/goto-preview"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  ["i3config.vim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/i3config.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lightspeed.nvim"] = {
    config = { "\27LJ\1\2\1\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\3\24cycle_group_bwd_key\n<tab>\24cycle_group_fwd_key\f<space>\27highlight_unique_chars\2\nsetup\15lightspeed\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/limelight.vim"
  },
  ["lsp-trouble.nvim"] = {
    config = { "\27LJ\1\0029\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\1\0024\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  mkdx = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/mkdx"
  },
  neorg = {
    config = { "\27LJ\1\2š\2\0\0\6\0\17\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\15\0003\2\3\0002\3\0\0:\3\4\0023\3\6\0003\4\5\0:\4\a\3:\3\b\0022\3\0\0:\3\t\0023\3\r\0003\4\v\0003\5\n\0:\5\f\4:\4\a\3:\3\14\2:\2\16\1>\0\2\1G\0\1\0\tload\1\0\0\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\tmain\f~/neorg\24core.norg.concealer\18core.keybinds\vconfig\1\0\0\1\0\2\17neorg_leader\14<Leader>o\21default_keybinds\2\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/neorg"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\1\2§\1\0\0\5\0\n\0\0204\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\6\0002\3\3\0007\4\3\0007\4\4\0047\4\5\4;\4\1\3:\3\a\2>\1\2\0014\1\0\0%\2\b\0>\1\2\0027\1\1\0017\1\t\0012\2\0\0>\1\2\1G\0\1\0\nsetup\14lspconfig\fsources\1\0\0\reslint_d\16diagnostics\rbuiltins\vconfig\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-base16.lua"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-cursorline"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-cursorline"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-luapad"
  },
  ["nvim-nonicons"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-nonicons"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\1\2Ý\2\0\0\5\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\6\0003\3\3\0003\4\4\0:\4\5\3:\3\a\0023\3\b\0003\4\t\0:\4\n\0033\4\v\0:\4\f\3:\3\r\2:\2\15\1>\0\2\1G\0\1\0\16textobjects\1\0\0\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\fkeymaps\1\0\4\aif\20@function.inner\aaf\20@function.outer\aac\17@class.outer\aic\17@class.inner\1\0\2\14lookahead\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  nvim_context_vt = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim_context_vt"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\1\0022\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/octo.nvim"
  },
  ["package-info.nvim"] = {
    config = { "\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17package-info\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/package-info.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["python-syntax"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/python-syntax"
  },
  rnvimr = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/rnvimr"
  },
  ["specs.nvim"] = {
    config = { "\27LJ\1\2¢\2\0\0\5\0\r\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0004\3\0\0%\4\1\0>\3\2\0027\3\5\3:\3\6\0024\3\0\0%\4\1\0>\3\2\0027\3\a\3:\3\b\2:\2\t\0012\2\0\0:\2\n\0013\2\v\0:\2\f\1>\0\2\1G\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\18slide_resizer\nfader\16pulse_fader\1\0\5\vinc_ms\3\2\nwinhl\14IncSearch\nblend\3P\rdelay_ms\3\0\nwidth\3A\1\0\2\rmin_jump\3\30\15show_jumps\2\nsetup\nspecs\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/specs.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20symbols-outline\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-doge"
  },
  ["vim-es2015-snippets"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-es2015-snippets"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-exchange"
  },
  ["vim-fold-cycle"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-fold-cycle"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gh-line"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-gh-line"
  },
  ["vim-graphql"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-graphql"
  },
  ["vim-instant-markdown"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/opt/vim-instant-markdown"
  },
  ["vim-kitty"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-kitty"
  },
  ["vim-react-snippets"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-react-snippets"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-styled-components"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-styled-components"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-syntax-extra"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-syntax-extra"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-wordmotion"
  },
  vimwiki = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["virtual-types.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/virtual-types.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: specs.nvim
time([[Config for specs.nvim]], true)
try_loadstring("\27LJ\1\2¢\2\0\0\5\0\r\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0004\3\0\0%\4\1\0>\3\2\0027\3\5\3:\3\6\0024\3\0\0%\4\1\0>\3\2\0027\3\a\3:\3\b\2:\2\t\0012\2\0\0:\2\n\0013\2\v\0:\2\f\1>\0\2\1G\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\18slide_resizer\nfader\16pulse_fader\1\0\5\vinc_ms\3\2\nwinhl\14IncSearch\nblend\3P\rdelay_ms\3\0\nwidth\3A\1\0\2\rmin_jump\3\30\15show_jumps\2\nsetup\nspecs\frequire\0", "config", "specs.nvim")
time([[Config for specs.nvim]], false)
-- Config for: package-info.nvim
time([[Config for package-info.nvim]], true)
try_loadstring("\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17package-info\frequire\0", "config", "package-info.nvim")
time([[Config for package-info.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\1\2š\2\0\0\6\0\17\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\15\0003\2\3\0002\3\0\0:\3\4\0023\3\6\0003\4\5\0:\4\a\3:\3\b\0022\3\0\0:\3\t\0023\3\r\0003\4\v\0003\5\n\0:\5\f\4:\4\a\3:\3\14\2:\2\16\1>\0\2\1G\0\1\0\tload\1\0\0\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\tmain\f~/neorg\24core.norg.concealer\18core.keybinds\vconfig\1\0\0\1\0\2\17neorg_leader\14<Leader>o\21default_keybinds\2\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: goto-preview
time([[Config for goto-preview]], true)
try_loadstring("\27LJ\1\2S\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\21default_mappings\2\nsetup\17goto-preview\frequire\0", "config", "goto-preview")
time([[Config for goto-preview]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\1\0024\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2’\2\0\2\n\0\14\0!7\2\0\1\5\2\0\0T\2\2€%\2\1\0:\2\0\1)\2\0\0007\3\0\1\a\3\2\0T\3\2€7\2\0\1T\3\14€4\3\3\0007\3\4\3%\4\5\0007\5\0\0014\6\6\0007\6\a\6%\a\b\0004\b\t\0007\t\n\1>\b\2\0=\6\1\0027\a\v\1>\3\5\2\16\2\3\0002\3\3\0003\4\r\0%\5\f\0\16\6\2\0$\5\6\5;\5\1\4;\4\1\3H\3\2\0\1\3\0\0\0\29GitSignsCurrentLineBlame\6 \fsummary\16author_time\rtonumber\r%m-%d-%Y\tdate\aos\18%s, %s â€¢ %s\vformat\vstring\22Not Committed Yet\bYou\vauthorw\1\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0001\2\4\0:\2\5\1>\0\2\1G\0\1\0!current_line_blame_formatter\0\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lsp-trouble.nvim
time([[Config for lsp-trouble.nvim]], true)
try_loadstring("\27LJ\1\0029\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\ftrouble\frequire\0", "config", "lsp-trouble.nvim")
time([[Config for lsp-trouble.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\1\2§\1\0\0\5\0\n\0\0204\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\6\0002\3\3\0007\4\3\0007\4\4\0047\4\5\4;\4\1\3:\3\a\2>\1\2\0014\1\0\0%\2\b\0>\1\2\0027\1\1\0017\1\t\0012\2\0\0>\1\2\1G\0\1\0\nsetup\14lspconfig\fsources\1\0\0\reslint_d\16diagnostics\rbuiltins\vconfig\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
try_loadstring("\27LJ\1\2Ý\2\0\0\5\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\6\0003\3\3\0003\4\4\0:\4\5\3:\3\a\0023\3\b\0003\4\t\0:\4\n\0033\4\v\0:\4\f\3:\3\r\2:\2\15\1>\0\2\1G\0\1\0\16textobjects\1\0\0\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\fkeymaps\1\0\4\aif\20@function.inner\aaf\20@function.outer\aac\17@class.outer\aic\17@class.inner\1\0\2\14lookahead\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
try_loadstring("\27LJ\1\2\1\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\3\24cycle_group_bwd_key\n<tab>\24cycle_group_fwd_key\f<space>\27highlight_unique_chars\2\nsetup\15lightspeed\frequire\0", "config", "lightspeed.nvim")
time([[Config for lightspeed.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
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
