return {
	"nvim-telescope/telescope.nvim",
	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical",
				file_ignore_patterns = { "node_modules", "venv" },
			},
		})
	end,
	dependencies = { { "nvim-lua/plenary.nvim" } },
}
