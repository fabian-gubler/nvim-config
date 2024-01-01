return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{ "<leader>g", function() require("telescope.builtin").live_grep() end },
		{ "<leader><leader>", function() require("telescope.builtin").find_files() end },
		{ "<leader>th", function() require("telescope.builtin").help_tags() end },
		{ "<leader>tk", function() require("telescope.builtin").keymaps() end },

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
