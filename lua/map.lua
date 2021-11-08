local map = vim.api.nvim_set_keymap
local opt = { noremap = true }

-- Custom
map('n', 'q', ':q<cr>', opt)

-- Plugins
map('', ',', '<Plug>(easymotion-s)', {})
map('', '/', '<Plug>(easymotion-sn)', {})
map('', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {})
