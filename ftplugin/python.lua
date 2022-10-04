local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.cmd[[
nnoremap <expr> <Leader>r nvim_exec('MagmaEvaluateOperator', v:true)
let g:magma_automatically_open_output = v:false
let g:magma_output_window_borders = v:false
let g:magma_image_provider = "none"
]]

keymap("n", "<Leader>R", ":MagmaLoad<CR>")
keymap("n", "<Leader>rr", ":MagmaInit<CR>", opts)
keymap("x", "<Leader>r", ":<C-u>MagmaEvaluateVisual<CR>", opts)
keymap("n", "<Leader>ro", ":MagmaShowOutput<CR>", opts)
keymap("n", "<Leader>rc", ":noautocmd MagmaEnterOutput<CR>", opts)
keymap("n", "<Leader>rs", ":MagmaSave<CR> <bar> :echo 'saved successfully'<CR> ", opts)

-- keymap("n", "<C-Enter>", ":MagmaReevaluateCell<CR>", opts)				-- Evaluate Cell
keymap("n", "<C-Enter>", ":MagmaReevaluateCell<CR> |:normal })<CR>")		-- Evaluate Cell & Jump to Next
