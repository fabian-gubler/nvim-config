local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
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

	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("core.tree")
		end,
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

	-- Surround
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- Debugging
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("core.dap")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("core.treesitter")
		end,
	},

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("core.nvim-cmp")
		end,
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
	},

	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("core.snippets")
		end,
	},

	{
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
		"nvim-lualine/lualine.nvim",
		config = function()
			require("core.lualine")
		end,
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},

	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-t>]],
				direction = "float",
			})
		end,
	},

	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

})
