return	{
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			-- disable_netrw = true,
			-- hijack_netrw = false,
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
	end,
}
