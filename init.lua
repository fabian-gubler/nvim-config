-- Space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set Colorsceme
vim.cmd [[
try
  colorscheme nord
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

-- Configuration files
require('plugins')			-- Plugins
require('options')			-- Options
require('mappings')			-- Mappings
require('colemak')			-- Keyboard Layout
require('lsp')					-- Language Server Protocol

-- Snippets dir
-- vim.o.runtimepath = vim.o.runtimepath .. ',/home/fabian/.config/nvim/lua/snippets,'

-- Luasnip
-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not snip_status_ok then
-- 	return
-- end
--
-- require("luasnip.loaders.from_vscode").load()					-- Load all VSCode snippets

-- Tab Colours
vim.cmd "hi BufferTabpageFill guibg=#2E3440"

vim.cmd "hi BufferCurrent guifg=#ECEFF4 guibg=#3b4252"
vim.cmd "hi BufferCurrentSign guibg=#3b4252"

vim.cmd "hi BufferInactive guifg=#7D869A guibg=#2e3440"
vim.cmd "hi BufferInactiveSign guibg=#2e3440"

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
