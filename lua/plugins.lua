local vim = vim

return require('packer').startup(function(use)
-- Packer can manage itself
	use 'wbthomason/packer.nvim'

-- Simple Setup
	use 'shaunsingh/nord.nvim'
	use '907th/vim-auto-save'
	use 'easymotion/vim-easymotion'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'mattn/emmet-vim'

	use 'fhill2/telescope-ultisnips.nvim'
	use 'SirVer/ultisnips'


-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require'core.treesitter' end,
	}

-- LSP
	use {
		'neovim/nvim-lspconfig',
		config = function() require('core.lsp') end,
		requires = {'williamboman/nvim-lsp-installer'}
	}

-- Completion
	use {
		'hrsh7th/nvim-cmp',
		config = function ()
			require('core.nvim-cmp')
		end,
		requires = {{'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'}, {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-nvim-lua'}, {'hrsh7th/cmp-vsnip'}, {'kdheepak/cmp-latex-symbols'}}
	}

-- Snippets
	use {
		'hrsh7th/vim-vsnip',
		requires = {{'rafamadriz/friendly-snippets'}}
	}

-- Bar
	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

-- Whichkey
	use {
	 	'folke/which-key.nvim',
	 	event = 'BufWinEnter',
		config = function() require('core.which-key')
	end
	}

-- Firenvim
	use {
		 'glacambre/firenvim',
		 run = function() vim.fn['firenvim#install'](0) end
}

-- File Navigation
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require'nvim-tree'.setup {}
	end
	}

-- Project
use {
	"ahmedkhalf/project.nvim",
	config = function()
	require("project_nvim").setup {}
	require('telescope').load_extension('projects')
  end
}

-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} },
		require('telescope').setup{
			defaults = { file_ignore_patterns = {"node_modules"} }
	  },
	}

-- Colorizer
	use {
		'norcalli/nvim-colorizer.lua',
		config = function() require('colorizer').setup()
	end
}

-- Statusline
	use {
		'nvim-lualine/lualine.nvim',
		config = function() require('core.lualine') end,
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
}

-- Scrolling
	use {
		'karb94/neoscroll.nvim',
		config = function()
		require('neoscroll').setup({
			mappings = {'<C-u>', '<C-d>'},
		})
    end
}

-- Commenting
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
	end
}

	use {
		'terrortylor/nvim-comment',
		config = function()
			require('nvim_comment').setup()
	end
}

-- Autopairs
	use {
	'windwp/nvim-autopairs',
	config = function()
	require('nvim-autopairs').setup()
	end
}

-- Terminal
	use {
		'akinsho/toggleterm.nvim',
		event = "BufWinEnter",
		config = function()
        require('toggleterm').setup{
            open_mapping = [[<c-t>]],
			direction = 'float',
			close_on_exit = false,
			float_opts = {
			  border = "curved",
			  winblend = 0,
			  highlights = {
				border = "Normal",
				background = "Normal",
			  },
			}
		}
    end
	}

end)
