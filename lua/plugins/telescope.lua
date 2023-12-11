return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{ "<leader>g", ":Telescope live_grep<CR>", desc = "telescope grep" },
		{
			"<leader><leader>",
			":Telescope find_files hidden=true no_ignore=true<CR>",
			desc = "telescope find files",
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical",
				file_ignore_patterns = {
					"node_modules",
					"venv",
					-- python
					".pytest_cache",
					"__pycache__",
					".git",
					"__init__.py",
				},
			},
		})

		require("telescope").load_extension("dap")
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-dap.nvim",
	},
}
