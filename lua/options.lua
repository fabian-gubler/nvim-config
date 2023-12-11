local o = vim.opt
local g = vim.g
local b = vim.b
local indent = 4
local cmd = vim.cmd

-- global
g.auto_save = 1
g.auto_save_silent = 1
g.nord_borders = true
g.markdown_folding = 1
g.markdown_enable_folding = 1
g.vim_markdown_conceal = 2
g.vim_markdown_follow_anchor = 1

-- options
o.background = "dark"
o.conceallevel = 2
o.foldenable = false
o.cmdheight = 0
o.autoread = false -- handled by vim-autoread
o.ignorecase = true
o.relativenumber = true
o.numberwidth = 1
o.showmode = false
o.laststatus = 3
o.cursorline = true
o.swapfile = false
o.splitbelow = true
o.splitright = true
o.smartcase = true
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
o.smartindent = true
o.breakindent = true
o.clipboard = "unnamedplus"
o.signcolumn = "yes:1"
o.colorcolumn = "100"
o.shiftwidth = indent
o.tabstop = indent
o.softtabstop = indent
o.expandtab = false
