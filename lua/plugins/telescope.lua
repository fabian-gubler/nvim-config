return {
	"nvim-telescope/telescope.nvim",
	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical",
				file_ignore_patterns = { "node_modules", "venv" },
			},
		})

		vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>", opts)
		vim.keymap.set("n", "<leader><leader>", ":Telescope find_files<CR>", opts)
	end,
	dependencies = { { "nvim-lua/plenary.nvim" } },
}
