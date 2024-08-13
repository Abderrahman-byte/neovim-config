local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local lsp_attach = function(client, bufnr)
    lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
    })
end

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require('mason').setup({})

require('mason-lspconfig').setup({
    ensure_installed = {
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
        "volar@2.0.7",
        "helm_ls",
        "yamlls",
        "pyright",
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        volar = function()
            require('lspconfig').volar.setup({})
        end,

        tsserver = function()
            local vue_typescript_plugin = require('mason-registry')
                .get_package('vue-language-server')
                :get_install_path()
                .. '/node_modules/@vue/language-server'
                .. '/node_modules/@vue/typescript-plugin'

            require('lspconfig').tsserver.setup({
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vue_typescript_plugin,
                            languages = { 'javascript', 'typescript', 'vue' }
                        },
                    }
                },
                filetypes = {
                    'javascript',
                    'javascriptreact',
                    'javascript.jsx',
                    'typescript',
                    'typescriptreact',
                    'typescript.tsx',
                    'vue',
                },
            })
        end,

    }
})

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
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
