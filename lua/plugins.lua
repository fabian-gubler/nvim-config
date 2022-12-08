local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- simple setup
	use("shaunsingh/nord.nvim")
	use("907th/vim-auto-save")
	use("lukas-reineke/indent-blankline.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("stevearc/dressing.nvim")
	use("ThePrimeagen/harpoon")
	use("lewis6991/impatient.nvim")
	use({ "michaelb/sniprun", run = "bash ./install.sh" })

	-- Setup
	use({
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("core.tree")
		end,
	})

	-- Commenting
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Mason
	use({
		"williamboman/mason.nvim",
		requires = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()
		end,
	})

	-- Data Science
	use({ "dccsillag/magma-nvim", run = ":UpdateRemotePlugins" })

	-- Programming Language Extensions
	use("mfussenegger/nvim-jdtls")
	use("simrat39/rust-tools.nvim")

	-- Surround
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	-- Debugging
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("core.dap")
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("core.treesitter")
		end,
	})

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("core.nvim-cmp")
		end,
		requires = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
	})

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		requires = { "rafamadriz/friendly-snippets" },
		config = function()
			require("core.snippets")
		end,
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "vertical",
					file_ignore_patterns = { "node_modules", "venv" },
				},
			})
		end,
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- Bar
	-- use({
	-- 	"romgrk/barbar.nvim",
	-- 	requires = { "kyazdani42/nvim-web-devicons" },
	-- 	config = function() require("core.bar") end,
	-- })

	-- Colorizer
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("core.lualine")
		end,
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-t>]],
				direction = "float",
			})
		end,
	})

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
