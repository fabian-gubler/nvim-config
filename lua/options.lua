local o = vim.opt
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_autogroup
local indent = 4
local cmd = vim.cmd

-- Global
g.auto_save = 1
g.auto_save_silent = 1
g.EasyMotion_keys = "arstdhneioqwfpluygmbjzxcvk1234567890,"
g.nord_borders = "true"

-- Options
o.termguicolors = true
o.relativenumber = true
o.numberwidth = 1
o.showmode = false
o.laststatus = 3
o.cursorline = false
o.swapfile = false
o.splitbelow = true
o.splitright = true
o.ignorecase = true
o.smartcase = true
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
o.clipboard = "unnamedplus"
o.smartindent = true
o.signcolumn = "yes:1"
o.colorcolumn = "100"
o.wrap = false
o.timeoutlen = 100
o.shiftwidth = indent
o.tabstop = indent
o.softtabstop = indent
o.expandtab = false

-- Autocmds
autocmd("BufEnter", { command = "set laststatus=3" })

-- Tab Size
autocmd("FileType", {
	pattern = { "typescript", "typescriptreact", "html", "javascript", "javascriptreact" },
	command = "setlocal ts=2 sts=2 sw=2",
})

autocmd("FileType", {
	pattern = { "lua", "r" },
	command = "setlocal ts=3 sts=3 sw=3",
})
