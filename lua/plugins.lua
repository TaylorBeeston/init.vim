-- Treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persit_queries = false
  }
}

-- Vim-Compe (Autocompletion)
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
    nvim_lua = true;
    ultisnips = true;
    treesitter = true;
  };
}

-- Formattter (Run Prettier on save)
require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
    },
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
augroup END
]], true)

-- Neat Icons in Autocompletion
require('lspkind').init()

-- Telescope
require('telescope').load_extension('gh')

-- Colored Icons
require'nvim-web-devicons'.setup {
    default = true;
}

-- CSS Colors
require 'colorizer'.setup(nil, { css = true; })
