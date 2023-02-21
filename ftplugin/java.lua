-- TODO check if lombok is installed before using it as javaagent

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local jdtls_path = vim.fn.stdpath('data') .. "/mason/packages/jdtls"
local plugins_dir = jdtls_path .. "/plugins/"
local jdtls_jar = plugins_dir .. "org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local config_dir = jdtls_path .. "/config_linux"
local lombok_jar = jdtls_path .. "/lombok.jar"

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }

local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name

os.execute("mkdir -p " .. workspace_dir)

local config = {
    cmd = {
        'java',

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-javaagent:' .. lombok_jar,
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        '-jar', jdtls_jar,

        '-configuration', config_dir,

        '-data', workspace_dir
    },

    root_dir = require("jdtls.setup").find_root(root_markers),

    settings = {
        java = {
        }
    },

    init_options = {
        bundles = {}
    },
}

require('jdtls').start_or_attach(config)
