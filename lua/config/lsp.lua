local lsp = require("lsp-zero")
local cmp = require('cmp')


lsp.preset('recommended')

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
    "gopls",
    "yamlls",
    "docker_compose_language_service",
    "emmet_language_server",
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
