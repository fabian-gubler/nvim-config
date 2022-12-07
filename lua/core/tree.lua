require("nvim-tree").setup({
	view = {
		adaptive_size = true,
		side = "left",
		width = 60,
		relativenumber = true,
	},
	diagnostics = {
		enable = false,
		show_on_dirs = true,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
})
