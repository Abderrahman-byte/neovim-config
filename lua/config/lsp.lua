local lsp = require("lsp-zero")
local cmp = require('cmp')


lsp.preset('recommended')

lsp.ensure_installed({
    "angularls",
    "ansiblels",
    "bashls",
    "clangd",
    "cmake",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "emmet_language_server",
    "eslint",
    "gopls",
    "html",
    "jdtls",
    "jedi_language_server",
    "jsonls",
    "lemminx",
    "lua_ls",
    "marksman",
    "sqlls",
    "texlab",
    "tsserver",
    "volar",
    -- "yamlls",
    -- "pyright",
})

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.nvim_workspace()

lsp.setup()

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    sources = {
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "vim-dadbod-completion" },
        { name = "path" },
        { name = "buffer",               keyword_length = 5 },
    },
})
