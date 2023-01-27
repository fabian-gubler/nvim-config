return {

	-- simple setup
	"shaunsingh/nord.nvim",
	"907th/vim-auto-save",
	"lukas-reineke/indent-blankline.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"stevearc/dressing.nvim",
	"ThePrimeagen/harpoon",
	"mbbill/undotree",
	"godlygeek/tabular",

	-- programming language extensions
	"mfussenegger/nvim-jdtls",
	"simrat39/rust-tools.nvim",

-- install without yarn or npm
{
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
},

	
  {
    "kiyoon/jupynium.nvim",
    -- build = "~/miniconda3/envs/jupynium/bin/pip install .",
    -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
  },

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
			"neovim/nvim-lspconfig",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()
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
