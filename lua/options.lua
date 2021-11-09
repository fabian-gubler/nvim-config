local vim = vim
local o = vim.opt
local g = vim.g
local home = os.getenv( "HOME" )
local cmd = vim.cmd
local indent = 4

-- Global
g.nvim_tree_quit_on_open = 1
g.auto_save = 1
g.auto_save_silent = 1
g.EasyMotion_keys='arstdhneioqwfpluygmbjzxcvk1234567890,'
g.nord_borders = 'true'
-- g.user_emmet_leader_key = ";"

-- Options
o.relativenumber = true
o.showmode = false
o.cursorline = false
o.swapfile = false
o.splitbelow = true
o.splitright = true
o.ignorecase = true
o.smartcase = true
o.undofile = true
o.undodir = home .. '/.local/share/nvim/undodir'
o.clipboard = "unnamedplus"
o.smartindent = true
o.wrap = false
o.timeoutlen = 100
o.shiftwidth = indent
o.tabstop = indent
o.softtabstop = indent
o.expandtab = false

-- Autocommands
cmd 'autocmd VimEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
cmd 'autocmd CmdlineEnter /,? :set hlsearch'
cmd 'autocmd CmdlineLeave /,? :set nohlsearch'

-- cmd "let fc['.*'] = { 'takeover': 'never' }"
