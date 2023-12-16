return {

	-- need to change
	"djoshea/vim-autoread", -- simpler solution with builtins

	-- simple setup
	"shaunsingh/nord.nvim",
	"907th/vim-auto-save",
	"stevearc/dressing.nvim",
	"neovim/nvim-lspconfig",
	"preservim/vim-markdown",

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
}
