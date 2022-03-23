local map = vim.keymap.set
local opt = { noremap = true, silent = true }

-- CTRL Backspace to Delete Word
map("i", "<C-H>", "<C-W>", opt) 

-- Windows
map("n", "<S-m>", "<C-w><C-h>", opt)
map("n", "<S-n>", "<C-w><C-j>", opt)
map("n", "<S-e>", "<C-w><C-k>", opt)
map("n", "<S-i>", "<C-w><C-l>", opt)
map("n", "_", "<C-w>_", opt)
map("n", "=", "<C-w>=", opt)

-- Shifting
map("v", "<S-e>", ":m '<-2<CR>gv=gv")
map("v", "<S-n>", ":m '>+1<CR>gv=gv")
map("v", ">", ">gv")
map("v", "<", "<gv")

-- Easymotion
map("", "/", "<Plug>(easymotion-sn)", {})
map("", ",", "<Plug>(easymotion-s)", {})

-- Tabs
map("n", "<A-1>", ":BufferGoto 1<CR>", opt)
map("n", "<A-2>", ":BufferGoto 2<CR>", opt)
map("n", "<A-3>", ":BufferGoto 3<CR>", opt)
map("n", "<A-4>", ":BufferGoto 4<CR>", opt)
map("n", "<A-5>", ":BufferGoto 5<CR>", opt)

map("n", "<A-e>", ":bp<CR>", opt)
map("n", "<A-C-e>", ":tabprevious<CR>", opt)
map("n", "<A-n>", ":bn<CR>", opt)
map("n", "<A-C-n>", ":tabnext<CR>", opt)

map("n", "<A-S-e>", ":BufferMovePrevious<CR>", opt)
map("n", "<A-S-n>", " :BufferMoveNext<CR>", opt)
