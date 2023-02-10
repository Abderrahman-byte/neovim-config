local utils = require("user.utils")

vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("x", "<leader>d", '"_d')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("n", "<leader>ll", ":VimtexCompile<Cr>", {})
vim.keymap.set("n", "<leader>le", ":VimtexErrors<Cr>", {})
vim.keymap.set("n", "<leader>j", ":bprevious<CR>")
vim.keymap.set("n", "<leader>k", ":bnext<CR>")
vim.keymap.set("n", "<leader>bc", ":bdelete<CR>")

vim.keymap.set("n", "<C-i>", ":LspZeroFormat<CR>", {})

-- Remove newbie crutches in Normal Mode
vim.keymap.set("n", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Right>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Up>", "<Nop>", { noremap = true, silent = true })

-- Remove newbie crutches in Visual Mode
vim.keymap.set("v", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "<Right>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "<Up>", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>fa", function()
    utils.open_file()
end, { noremap = true })

vim.keymap.set("n", "<leader>fd", function()
    utils.delete_current_file()
end, { noremap = true })

vim.keymap.set("n", "<leader>fm", function()
    utils.rename_file()
end, { noremap = true })
