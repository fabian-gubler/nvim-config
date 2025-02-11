vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)

-- Global files
require("mappings")
require("options")

-- vscode and nvim only settings
if vim.g.vscode then
	require("vscode")
   vim.o.cmdheight = 1
else
	-- plugins
	vim.o.termguicolors = true
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)

	require("lazy").setup({
		spec = {
			{ import = "plugins" },
		},
		change_detection = {
			-- automatically check for config file changes and reload the ui
			enabled = true,
			notify = false, -- get a notification when changes are found
		},
	})

	-- Configuration files
	require("lsp")
	require("autocmd")

	-- set colorsceme
	vim.cmd.colorscheme("nord")
end
