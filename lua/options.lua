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
cmd 'au VimEnter * :set showtabline=0'
cmd 'au VimEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
cmd 'au CmdlineEnter /,? :set hlsearch'
cmd 'au CmdlineLeave /,? :set nohlsearch'

cmd 'autocmd FileType typescript setlocal ts=2 sts=2 sw=2'
cmd 'autocmd FileType html setlocal ts=2 sts=2 sw=2'
cmd 'autocmd FileType javascript setlocal ts=2 sts=2 sw=2'
cmd 'autocmd FileType lua setlocal ts=3 sts=3 sw=3'

-- Set barbar's options
require'core.bar'

