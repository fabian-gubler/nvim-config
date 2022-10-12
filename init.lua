-- Space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Configuration files
require("plugins")
require("options")
require("mappings")
require("autocmd")
require("lsp")
require("terminal")

-- Set Colorsceme
vim.cmd.colorscheme('nord')

-- Highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)
