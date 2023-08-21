require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "cpp",
        "lua",
        "javascript",
        "java",
        "bash",
        "fish",
        "python",
        "sql",
        "go",
        "typescript",
        "html",
        "css",
        "scss",
        "vue",
        "htmldjango",
        "yaml",
    },

    sync_install = false,

    auto_install = false,

    highlight = {
        enable = true,
        disable = { "latex" },
        additional_vim_regex_highlighting = true,
    },

    indent = { enable = true, disable = { "yaml" } },
})
