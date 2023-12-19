-- see :help nvim-defaults for list of defaults

local o = vim.opt
local g = vim.g
local indent = 4

-- global
g.auto_save = 1
g.auto_save_silent = 1
g.nord_borders = true
g.markdown_folding = 1
g.vim_markdown_conceal = 2
g.vim_markdown_follow_anchor = 1
g.vim_markdown_conceal_code_blocks = 0

-- options
o.conceallevel = 2
o.cmdheight = 0
o.laststatus = 3
o.cursorline = true
o.colorcolumn = "100"
o.showmode = false
o.autoread = true
o.ignorecase = true
o.smartcase = true
o.relativenumber = true
o.numberwidth = 1
o.swapfile = false
o.splitbelow = true
o.splitright = true
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
o.smartindent = true
o.breakindent = true
o.clipboard = "unnamedplus"
o.signcolumn = "yes:1"
o.shiftwidth = indent
o.tabstop = indent
o.softtabstop = indent
o.expandtab = true
