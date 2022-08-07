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

	-- Commenting
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Simple Setup
	use("shaunsingh/nord.nvim")
	use("907th/vim-auto-save")
	use("easymotion/vim-easymotion")
	use("lukas-reineke/indent-blankline.nvim")
	use("nvim-lua/plenary.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Java
	use 'mfussenegger/nvim-jdtls'

	-- Debugging
	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("core.dap")
		end,

	})

	use({
		"rcarriga/nvim-dap-ui",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("core.treesitter")
		end,
	})

	-- Zen Mode
	use {
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup {
				window = {
					backdrop = 1,
					width = 80,
					height = 1,
					options = {
						number = false,
						relativenumber = true,
						cursorcolumn = false,
					},
				},
				plugins = {
					options = {
						enabled = true,
						ruler = false, -- disables the ruler text in the cmd line area
						showcmd = true, -- disables the command in the last line of the screen
					},
					twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
					gitsigns = { enabled = true }, -- disables git signs
					tmux = { enabled = false }, -- disables the tmux statusline
					-- this will change the font size on kitty when in zen mode
					-- to make this work, you need to set the following kitty options:
					-- - allow_remote_control socket-only
					-- - listen_on unix:/tmp/kitty
					kitty = {
						enabled = false,
						font = "+5", -- font size increment
					},
				},
			}
		end
	}
	-- LSP
	use({
		"neovim/nvim-lspconfig",
		requires = { "williamboman/nvim-lsp-installer" },
	})

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("core.nvim-cmp")
		end,
		requires = {
			{ "kdheepak/cmp-latex-symbols" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
	})

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		requires = { "rafamadriz/friendly-snippets" },
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
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("core.bar")
		end,
	})

	-- Whichkey
	use({
		"folke/which-key.nvim",
		event = "BufWinEnter",
		config = function()
			require("core.which-key")
		end,
	})

	-- File Navigation
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup({
				view = {
					relativenumber = true,
					width = 50,
					mappings = {
						list = {
							{ key = "o", action = "open" },
						},
					},
				},
			})
		end,
	})

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

	-- Scrolling
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				mappings = { "<C-u>", "<C-d>" },
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
