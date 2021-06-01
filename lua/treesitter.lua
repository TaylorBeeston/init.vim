require "nvim-treesitter.configs".setup {
    highlight = {enable = true},
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persit_queries = false
    },
    indent = {enable = true},
    rainbow = {enable = true},
    context_commentstring = {enable = true},
    autotag = {enable = true}
}
