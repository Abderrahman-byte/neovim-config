local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "lua_ls",
    -- "pyright",
    "jedi_language_server",
    "marksman",
    "html",
    "cssls",
    "clangd",
    "bashls",
    "cmake",
    "eslint",
    "jsonls",
    "jdtls",
    "angularls",
    "ansiblels",
    "tsserver",
    "sqlls",
    "texlab",
    "dockerls",
    "lemminx",
    "volar",
})

lsp.nvim_workspace()

lsp.setup()
