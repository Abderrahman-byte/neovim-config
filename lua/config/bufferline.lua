require("bufferline").setup({
	options = {
		numbers = "buffer id",
		buffer_close_icon = "",
		show_buffer_close_icons = false,
		show_close_icon = false,
		close_icon = "",
		separator_style = "slant",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true, -- use a "true" to enable the default, or set your own character
			},
		},
	},
})
