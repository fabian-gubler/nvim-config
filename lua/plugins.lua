return {

	-- simple setup
	"shaunsingh/nord.nvim",
	"907th/vim-auto-save",
	"lukas-reineke/indent-blankline.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"stevearc/dressing.nvim",
	"mbbill/undotree",
	"godlygeek/tabular",
	"neovim/nvim-lspconfig",
	"felipec/notmuch-vim",

	-- programming language extensions
	"mfussenegger/nvim-jdtls",
	"simrat39/rust-tools.nvim",
	"iamcco/markdown-preview.nvim",

	-- {
	-- 	"gw31415/deepl-commands.nvim",
	-- 	dependencies = {
	-- 		"gw31415/deepl.vim",
	-- 		"gw31415/fzyselect.vim", -- Optional
	-- 	},
	-- 	config = function()
	-- 		require("deepl-commmands").setup({
	-- 			selector_func = require("fzyselect").start, -- Default value is `vim.ui.select`
	-- 			default_target = "EN", -- Default value is 'EN'
	-- 		})
	-- 	end,
	-- },

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
		config = function()
			require("nvim-surround").setup()
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
}
