local map = vim.keymap.set
local opt = { noremap = true, silent = true }

-- CTRL Backspace to Delete Word
map("i", "<C-H>", "<C-W>", opt) 
map("i", "<C-K>", "<C-O>D", opt) 

-- Useful
map("v", ">", ">gv")
map("v", "<", "<gv")

-- Debugging
map("n", "<F1>", ":lua require'dap'.continue()<CR>")
map("n", "<F2>", ":lua require'dap'.step_over()<CR>")
map("n", "<F3>", ":lua require'dap'.step_into()<CR>")
map("n", "<F4>", ":lua require'dap'.step_out()<CR>")

-- Easymotion
map("", "\\", "<Plug>(easymotion-sn)", opt)
map("", ",", "<Plug>(easymotion-s)", opt)

-- Tabs
map("n", "<A-1>", ":BufferGoto 1<CR>", opt)
map("n", "<A-2>", ":BufferGoto 2<CR>", opt)
map("n", "<A-3>", ":BufferGoto 3<CR>", opt)
map("n", "<A-4>", ":BufferGoto 4<CR>", opt)
map("n", "<A-5>", ":BufferGoto 5<CR>", opt)
map("n", "<A-S-e>", ":BufferMovePrevious<CR>", opt)
map("n", "<A-S-n>", " :BufferMoveNext<CR>", opt)
