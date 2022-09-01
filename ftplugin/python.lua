-- Magma

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.cmd[[
nnoremap <expr> <Leader>r nvim_exec('MagmaEvaluateOperator', v:true)
let g:magma_automatically_open_output = v:false
let g:magma_output_window_borders = v:false
let g:magma_image_provider = "ueberzug"
let g:magma_save_path = "/home/fabian/notebooks/magma"
]]

keymap("n", "<Leader>R", ":MagmaInit python3<CR>")
keymap("n", "<Leader>rr", ":MagmaEvaluateLine<CR>", opts)
keymap("x", "<Leader>r", ":<C-u>MagmaEvaluateVisual<CR>", opts)
keymap("n", "<Leader>ro", ":MagmaShowOutput<CR>", opts)
-- keymap("n", "<Leader>rd", ":MagmaDelete<CR>", opts)

