local vim = vim

-- Bootstrap packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

return require('packer').startup(function(use)
-- Packer can manage itself
	use 'wbthomason/packer.nvim'

-- Simple Setup
	use 'shaunsingh/nord.nvim'
	use '907th/vim-auto-save'
	use 'easymotion/vim-easymotion'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'mattn/emmet-vim'
	use 'rafamadriz/friendly-snippets'
	use 'saadparwaiz1/cmp_luasnip'

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

	use {
		'hrsh7th/nvim-cmp',
		config = function ()
			require('core.nvim-cmp')
		end,
		requires = {{'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'}, {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-nvim-lua'}, {'hrsh7th/cmp-vsnip'}, {'kdheepak/cmp-latex-symbols'}}
	}

	use {
		'hrsh7th/vim-vsnip',
		requires = {{'rafamadriz/friendly-snippets'}}
	}

-- Neuron
	use {
		'oberblastmeister/neuron.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
		config = function()
		require("neuron").setup {
			virtual_titles = true,
			mappings = true,
			run = nil, -- function to run when in neuron dir
			neuron_dir = "~/notes", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
			leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
		}
	end,
	}

-- Firenvim
	use {
		'glacambre/firenvim',
		run = function() vim.fn['firenvim#install'](0) end
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
	require("project_nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
	require('telescope').load_extension('projects')
  end
}

-- Telescope
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
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
		event = "BufRead",
		config = function() require('Comment').setup()
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
			  -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
			  border = "curved",
			  -- width = <value>,
			  -- height = <value>,
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
