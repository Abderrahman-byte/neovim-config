-- show cursor line only in active window
local cursorGrp = vim.api.nvim_create_augroup("CursorLine", {
    clear = true,
})

vim.api.nvim_create_autocmd(
    { "InsertLeave", "WinEnter" },
    { pattern = "*", command = "set cursorline", group = cursorGrp }
)

vim.api.nvim_create_autocmd(
    { "InsertEnter", "WinLeave" },
    { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- Highlight on yank

local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = yankGrp,
})

--  Auto formatting before save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = ":LspZeroFormat",
})

-- Center cursor on Insert Enter
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    command = ":normal zz",
})
