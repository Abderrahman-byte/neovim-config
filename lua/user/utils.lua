Path = require("plenary.path")

Utils = {}

local function create(path)
    if not path or path == "" then
        return
    end

    local is_dir = path:sub(-1) == "/"

    if is_dir then
        local dir = Path:new(path)
        dir:mkdir({ parents = true })
    else
        local file = Path:new(path)
        file:touch({ parents = true })
        return file:absolute()
    end
end

function Utils.open_file()
    local buf = vim.fn.expand("%:p")
    local buf_dirname, _ = buf:match('^(.*/)([^/]-)$')

    vim.ui.input({ prompt = "Insert the file name: ", completion = "file", default = buf_dirname }, function(input)
        vim.cmd("redraw")

        local file = create(input)

        if file ~= nil then
            vim.cmd("edit " .. file)
        end
    end)
end

function Utils.delete_current_file()
    local buf = vim.fn.expand("%:p")
    local file = Path:new(buf)

    vim.cmd("bdelete")
    file:rm()
end

function Utils.rename_file()
    local buf = vim.fn.expand("%:p")

    vim.ui.input({ prompt = "Insert the file name: ", completion = "file", default = buf }, function(input)
        vim.cmd("redraw")

        if input == "" or input == buf then
            return
        end

        vim.cmd("silent! !mv " .. buf .. " " .. input)
        vim.cmd("bdelete")
        vim.cmd("edit " .. input)
    end)
end

return Utils
