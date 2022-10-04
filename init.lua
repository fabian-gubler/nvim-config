-- Space as leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Configuration files
require('plugins')
require('options')
require('mappings')
require('autocmd')
require('lsp')

-- Set Colorsceme
vim.cmd "colorscheme nord"

-- Tab Colours
vim.cmd "hi BufferTabpageFill guibg=#2E3440"

vim.cmd "hi BufferCurrent guifg=#ECEFF4 guibg=#3b4252"
vim.cmd "hi BufferCurrentSign guibg=#3b4252"

vim.cmd "hi BufferInactive guifg=#7D869A guibg=#2e3440"
vim.cmd "hi BufferInactiveSign guibg=#2e3440"

vim.cmd "hi BufferVisible guibg=#2E3440 guifg=#7D869A"
vim.cmd "hi BufferVisibleSign guibg=#2E3440"

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
