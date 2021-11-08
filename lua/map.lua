local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- Custom
map('n', 'q', ':q<cr>', opt)
map('n', '<M-m>', '<C-w><C-h>', opt)
map('n', '<M-n>', '<C-w><C-j>', opt)
map('n', '<M-e>', '<C-w><C-k>', opt)
map('n', '<M-i>', '<C-w><C-l>', opt)

-- Plugins
map('', ',', '<Plug>(easymotion-s)', {})
map('', '/', '<Plug>(easymotion-sn)', {})
map('', '<C-m>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {})
