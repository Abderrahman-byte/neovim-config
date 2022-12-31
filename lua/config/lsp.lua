local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    'sumneko_lua',
    'pyright',
    'marksman',
    'html',
    'cssls',
    'clangd',
    'bashls',
    'cmake',
    'eslint',
    'jsonls',
    'jdtls',
    'angularls',
    'ansiblels',
    'tsserver'
})

lsp.nvim_workspace()

lsp.setup()
