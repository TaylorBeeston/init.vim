" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
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
local package_path_str = "/home/taylor/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/taylor/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/taylor/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/taylor/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/taylor/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\ní\2\0\2\r\0\14\0!9\2\0\1\5\2\0\0X\2\2Ä'\2\1\0=\2\0\1+\2\0\0009\3\0\1\a\3\2\0X\3\2Ä9\2\0\1X\3\14Ä6\3\3\0009\3\4\3'\5\5\0009\6\0\0016\a\6\0009\a\a\a'\t\b\0006\n\t\0009\f\n\1B\n\2\0A\a\1\0029\b\v\1B\3\5\2\18\2\3\0004\3\3\0005\4\r\0'\5\f\0\18\6\2\0&\5\6\5>\5\1\4>\4\1\3L\3\2\0\1\3\0\0\0\29GitSignsCurrentLineBlame\6 \fsummary\16author_time\rtonumber\r%m-%d-%Y\tdate\aos\18%s, %s ‚Ä¢ %s\vformat\vstring\22Not Committed Yet\bYou\vauthorw\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\2B\0\2\1K\0\1\0!current_line_blame_formatter\0\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["goto-preview"] = {
    config = { "\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21default_mappings\2\nsetup\17goto-preview\frequire\0" },
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
  ["limelight.vim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/limelight.vim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lsp-trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
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
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\nü\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\3\veasing\2\16hide_cursor\2\20easing_function\ncubic\1\b\0\0\n<C-b>\n<C-f>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nlua.nvim"
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
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
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
    config = { "\27LJ\2\n¢\2\0\0\a\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4=\4\6\0036\4\0\0'\6\1\0B\4\2\0029\4\a\4=\4\b\3=\3\t\0024\3\0\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\18slide_resizer\nfader\16pulse_fader\1\0\5\nwidth\3A\nblend\3P\vinc_ms\3\2\rdelay_ms\3\0\nwinhl\14IncSearch\1\0\2\rmin_jump\3\30\15show_jumps\2\nsetup\nspecs\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/specs.nvim"
  },
  ["spellsitter.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/spellsitter.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20symbols-outline\frequire\0" },
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
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/vim-be-good"
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
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/taylor/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\ní\2\0\2\r\0\14\0!9\2\0\1\5\2\0\0X\2\2Ä'\2\1\0=\2\0\1+\2\0\0009\3\0\1\a\3\2\0X\3\2Ä9\2\0\1X\3\14Ä6\3\3\0009\3\4\3'\5\5\0009\6\0\0016\a\6\0009\a\a\a'\t\b\0006\n\t\0009\f\n\1B\n\2\0A\a\1\0029\b\v\1B\3\5\2\18\2\3\0004\3\3\0005\4\r\0'\5\f\0\18\6\2\0&\5\6\5>\5\1\4>\4\1\3L\3\2\0\1\3\0\0\0\29GitSignsCurrentLineBlame\6 \fsummary\16author_time\rtonumber\r%m-%d-%Y\tdate\aos\18%s, %s ‚Ä¢ %s\vformat\vstring\22Not Committed Yet\bYou\vauthorw\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\2B\0\2\1K\0\1\0!current_line_blame_formatter\0\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\nü\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\3\veasing\2\16hide_cursor\2\20easing_function\ncubic\1\b\0\0\n<C-b>\n<C-f>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: goto-preview
time([[Config for goto-preview]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21default_mappings\2\nsetup\17goto-preview\frequire\0", "config", "goto-preview")
time([[Config for goto-preview]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: spellsitter.nvim
time([[Config for spellsitter.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0", "config", "spellsitter.nvim")
time([[Config for spellsitter.nvim]], false)
-- Config for: lsp-trouble.nvim
time([[Config for lsp-trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "lsp-trouble.nvim")
time([[Config for lsp-trouble.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: specs.nvim
time([[Config for specs.nvim]], true)
try_loadstring("\27LJ\2\n¢\2\0\0\a\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4=\4\6\0036\4\0\0'\6\1\0B\4\2\0029\4\a\4=\4\b\3=\3\t\0024\3\0\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\18slide_resizer\nfader\16pulse_fader\1\0\5\nwidth\3A\nblend\3P\vinc_ms\3\2\rdelay_ms\3\0\nwinhl\14IncSearch\1\0\2\rmin_jump\3\30\15show_jumps\2\nsetup\nspecs\frequire\0", "config", "specs.nvim")
time([[Config for specs.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-instant-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
