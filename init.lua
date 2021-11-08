-- Space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme nord]]

-- Configuration files
require('opt')			-- Options
require('map')			-- Keymappings
require('plug')			-- Plugins
require('colemak')		-- Keyboard Layout

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
