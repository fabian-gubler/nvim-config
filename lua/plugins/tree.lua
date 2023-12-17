return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local icons = require("icons")
		require("nvim-tree").setup({
			-- disable_netrw = true,
			-- hijack_netrw = false,
			view = {
				adaptive_size = true,
				side = "left",
				width = 55,
				relativenumber = true,
			},
			diagnostics = {
				enable = false,
				show_on_dirs = true,
				debounce_delay = 50,
				icons = {
					hint = icons.diagnostics.Hint,
					info = icons.diagnostics.Information,
					warning = icons.diagnostics.Warning,
					error = icons.diagnostics.Error,
				},
			},
		})

		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
		vim.keymap.set("n", "<leader>E", ":NvimTreeFindFileToggle<CR>")
	end,
}
