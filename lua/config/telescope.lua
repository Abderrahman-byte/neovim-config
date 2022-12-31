local builtin = require('telescope.builtin')

local telescope = require("telescope")

telescope.load_extension "file_browser"

vim.keymap.set('n', '<Space>ff', builtin.find_files, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
-- vim.keymap.set('n', '<Space>fb', builtin.buffers, {})

vim.keymap.set('n', '<Space>fb', ':Telescope file_browser<CR>', {})
