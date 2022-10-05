require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "astro",
        "bash",
        "css",
        "dockerfile",
        "fish",
        "graphql",
        "help",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "lua",
        "norg",
        "prisma",
        "regex",
        "rust",
        "scss",
        "solidity",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
    },
    highlight = { enable = true },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
    },
    indent = { enable = true },
    rainbow = { enable = true },
    context_commentstring = { enable = true },
    autotag = { enable = true },
})
