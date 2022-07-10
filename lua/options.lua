local o = vim.opt
local g = vim.g
local indent = 4
local cmd = vim.cmd

-- Global
g.auto_save = 1
g.auto_save_silent = 1
g.EasyMotion_verbose = 0
g.EasyMotion_keys = "arstdhneioqwfpluygmbjzxcvk1234567890,"
g.nord_borders = "true"

-- Options
o.termguicolors = true
o.relativenumber = true
o.numberwidth = 1
o.showmode = false
o.laststatus = 3
-- o.cursorline = true
-- o.cursorlineopt = "number"
o.swapfile = false
o.splitbelow = true
o.splitright = true
o.ignorecase = true
o.smartcase = true
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
o.clipboard = "unnamedplus"
o.smartindent = true
o.breakindent = true
o.signcolumn = "yes:1"
o.colorcolumn = "100"
o.wrap = false
o.timeoutlen = 100
o.shiftwidth = indent
o.tabstop = indent
o.softtabstop = indent
o.expandtab = false
