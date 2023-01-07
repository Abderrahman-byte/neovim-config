local builtin = require("telescope.builtin")

local telescope = require("telescope")

telescope.load_extension("file_browser")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
-- vim.keymap.set('n', '<Space>fb', builtin.buffers, {})

vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>", {})
