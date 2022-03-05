local o = vim.opt
local g = vim.g
local home = os.getenv("HOME")
local cmd = vim.cmd
local indent = 4

-- Global
-- g.nvim_tree_quit_on_open = 1
g.auto_save = 1
g.auto_save_silent = 1
g.EasyMotion_keys = "arstdhneioqwfpluygmbjzxcvk1234567890,"
g.nord_borders = "true"
g.vimtex_view_method = "zathura"
g.vimtex_mappings_enabled = "false"

-- Options
o.termguicolors = true
o.relativenumber = true
o.numberwidth = 1
o.showmode = false
o.cursorline = false
o.swapfile = false
o.splitbelow = true
o.splitright = true
o.ignorecase = true
o.smartcase = true
o.undofile = true
o.undodir = home .. "/.local/share/nvim/undodir"
o.clipboard = "unnamedplus"
o.smartindent = true
o.signcolumn = "yes:1"
o.wrap = false
o.timeoutlen = 100
o.shiftwidth = indent
o.tabstop = indent
o.softtabstop = indent
o.expandtab = false

-- Autocommands
cmd("au BufNew,BufRead * setl fo-=orc")
cmd("au CmdlineEnter /,? :set hlsearch")
cmd("au CmdlineLeave /,? :set nohlsearch")

cmd("au FileType typescript setlocal ts=2 sts=2 sw=2")
cmd("au FileType typescriptreact setlocal ts=2 sts=2 sw=2")
cmd("au FileType html setlocal ts=2 sts=2 sw=2")
cmd("au FileType javascript setlocal ts=2 sts=2 sw=2")
cmd("au FileType javascriptreact setlocal ts=2 sts=2 sw=2")
cmd("au FileType lua setlocal ts=3 sts=3 sw=3")
cmd("au FileType r setlocal ts=3 sts=3 sw=3")

cmd("au FileType tex setlocal wrap")
cmd("au FileType tex let b:auto_save=0")
cmd("au FileType markdown setlocal wrap")
cmd("au FileType markdown lua require('cmp').setup.buffer { enabled = false }")
