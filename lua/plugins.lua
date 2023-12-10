return {

	-- need to change
	"jose-elias-alvarez/null-ls.nvim", -- replace with conform.nvim & nvim-lint
	"djoshea/vim-autoread", -- simpler solution with builtins

	-- simple setup
	"shaunsingh/nord.nvim",
	"907th/vim-auto-save",
	"stevearc/dressing.nvim",
	"neovim/nvim-lspconfig",
	"ThePrimeagen/harpoon",
	"preservim/vim-markdown",

	-- programming language extensions
	"mfussenegger/nvim-jdtls",
	"simrat39/rust-tools.nvim",


	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()
			vim.keymap.set("n", "<leader>M", "<cmd>Mason<CR>", opts)
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
