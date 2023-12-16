return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{ "<leader>g", ":Telescope live_grep<CR>" },
		{ "<leader><leader>", ":Telescope find_files hidden=true no_ignore=true<CR>" },
		{ "<leader>th", ":Telescope help_tags<cr>" },
		{ "<leader>tk", ":Telescope keymaps<cr>" },

		-- dap extension
		{ "<leader>dl", function() require("telescope").extensions.dap.list_breakpoints() end },
		{ "<leader>dd", function() require("telescope").extensions.dap.commands() end },
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
