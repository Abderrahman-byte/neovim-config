local builtin = require("telescope.builtin")

local telescope = require("telescope")

telescope.setup {
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            height = 0.8,
            width = 0.9
        },
        file_ignore_patterns = {
            "node_modules/",
            "target/",
            "build/",
            "*.class",
            "*.jar",
            "*.war",
            "*.nar",
            "*.ear",
            "*.zip",
            "*.tar.gz",
            "*.rar",
        }
    }
}

telescope.load_extension("file_browser")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
-- vim.keymap.set('n', '<Space>fb', builtin.buffers, {})

vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>", {})
