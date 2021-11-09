local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- General
map('n', 'q', ':q<cr>', opt)

-- Windows
map('n', '<M-m>', '<C-w><C-h>', opt)
map('n', '<M-n>', '<C-w><C-j>', opt)
map('n', '<M-e>', '<C-w><C-k>', opt)
map('n', '<M-i>', '<C-w><C-l>', opt)

-- Emacs
map('i', '<C-a>', '<Home>', opt)
map('i', '<C-e>', '<End>', opt)
map('i', '<C-k>', '<Esc>lDa', opt)

-- Plugins
map('', ',', '<Plug>(easymotion-s)', {})
map('', '/', '<Plug>(easymotion-sn)', {})
map('', '<C-m>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {})
