local wk = require("which-key")

wk.register({
	["c"] = { ":bd!<CR>", "Close Buffer" },
	["e"] = { ":NvimTreeToggle<CR>", "File Explorer" },
	["a"] = { ":lua require('Comment').toggle()<CR>", "Comment" },
	["r"] = { ':Telescope projects<CR>', 'Projects'},
	["d"] = { ':cd $HOME/.dotfiles | Telescope find_files<CR>', 'Dotfiles'},
	["n"] = { ':cd $HOME/.config/nvim | Telescope find_files<CR>', 'Neovim Config'},
	["l"] = { ':LspInfo<CR>', 'Lsp Info' },
	["<leader>"] = { ":Telescope find_files<CR>", "Find Files" },

-- Packer
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		C = { "<cmd>PackerClean<cr>", "Clean" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

-- Telescope
	t = {
		name = "Telescope",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        g = { "<cmd>Telescope live_grep<cr>", "Grep" },
  },

-- Options
},  {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
})

-- Visual Mode
wk.register({
	["a"] = { "<ESC><CMD>lua ___comment_gc(vim.fn.visualmode())<CR>", "Comment" },
},  { 
    mode = "v", -- NORMAL mode
    prefix = "<leader>",
})

wk.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = false, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
	-- override the label used to display some keys. It doesn't effect WK in any other way.
	-- For example:
	-- ["<space>"] = "SPC",
	-- ["<cr>"] = "RET",
	-- ["<tab>"] = "TAB",
	},
	icons = {
	breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
	separator = "➜", -- symbol used between a key and it's label
	group = "+", -- symbol prepended to a group
	},
	window = {
	border = "single", -- none, single, double, shadow
	position = "bottom", -- bottom, top
	margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
	padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
	winblend = 0
	},
	layout = {
	height = { min = 4, max = 25 }, -- min and max height of the columns
	width = { min = 20, max = 50 }, -- min and max width of the columns
	spacing = 3, -- spacing between columns
	align = "left", -- align columns left, center or right
	},
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
	show_help = false, -- show help message on the command line when the popup is visible
}
