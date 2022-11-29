require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp", "lua", "javascript", "java", "bash", "fish", "python"},

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },

  indent = { enable = true, disable = { "yaml" } },
}
