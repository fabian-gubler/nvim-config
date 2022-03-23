local wk = require("which-key")

wk.register({
	-- General
	["c"] = { ":bd!<CR>", "Close Buffer" },
	["b"] = { ":execute 'set showtabline=' . (&showtabline ==# 0 ? 2 : 0)", "Toggle Bar" },
	-- ["b"] = { ":Telescope buffers<cr>", "Toggle Bar" },
	["e"] = { ":NvimTreeToggle<cr>", "File Explorer" },
	["d"] = { ":cd $HOME/.dotfiles | Telescope find_files<CR>", "Dotfiles" },
	["n"] = { ":cd $HOME/.config/nvim | Telescope find_files<CR>", "Neovim Config" },
	["y"] = { "ggVGY", "Copy All" },
	["r"] = { ':call VimuxRunCommand("clear; python3 " . bufname("%"))<CR>', "Run python" },
	["<leader>"] = { ":Telescope find_files<CR>", "Find Files" },

	-- Comments
	["a"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment Line" },

	-- Packer
	p = {
		name = "Packer",
		r = { "<cmd>so% | PackerSync<cr>", "Refresh" },
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		C = { "<cmd>PackerClean<cr>", "Clean" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	-- Packer
	o = {
		name = "Open",
		t = { ":!typora % &<cr><cr>", "Typora"}
	},
	-- Vimtex
	x = {
		name = "Vimtex",
		c = { "<cmd>VimtexCompile<cr>", "Compile" },
		s = { "<cmd>VimtexStop<cr>", "Stop" },
		S = { "<cmd>VimtexStatus<cr>", "Status" },
		C = { "<cmd>VimtexClean<cr>", "Clean" },
		t = { "<cmd>VimtexTocToggle<cr>", "Table of Contents" },
	},

	-- Telescope
	t = {
		name = "Telescope",
		r = { "<cmd>Telescope lsp_references<cr>", "References" },
		g = { "<cmd>Telescope live_grep<cr>", "Grep" },
		d = { ":Telescope diagnostics<cr>", "Telescope Diagnostics" },
		-- b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		-- c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		-- k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	},

	-- LSP
	l = {
		name = "LSP",
		n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
		e = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		i = { ":LspInfo<CR>", "LSP Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
	},

	-- Options
}, {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
})

-- Visualmode
wk.register({
	["a"] = { "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment" },
}, {
	mode = "v", -- NORMAL mode
	prefix = "<leader>",
})

-- Whichkey Settings
wk.setup({
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
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	-- triggers = "auto", -- automatically setup triggers
	triggers = { "<leader>" }, -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
})
