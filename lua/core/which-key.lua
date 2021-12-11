local wk = require("which-key")

wk.register({
-- General
	["c"] = { ":bd!<CR>", "Close Buffer" },
	["e"] = { ":NvimTreeToggle<CR>", "File Explorer" },
	["r"] = { ':Telescope projects<CR>', 'Projects'},
	["d"] = { ':cd $HOME/.dotfiles | Telescope find_files<CR>', 'Dotfiles'},
	["n"] = { ':cd $HOME/.config/nvim | Telescope find_files<CR>', 'Neovim Config'},
	["l"] = { ':LspInfo<CR>', 'Lsp Info' },
	["<leader>"] = { ":Telescope find_files<CR>", "Find Files" },

-- Comments
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

wk.register({
	["a"] = { "<ESC><CMD>lua require('Comment.api').gc(vim.fn.visualmode())<CR>", "Comment" },
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
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
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
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  triggers = {"<leader>"}, -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}
