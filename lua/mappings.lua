local map = vim.keymap.set
local cmd = vim.cmd
local opt = { noremap = true, silent = true }

-- Unmapping
-- map("n", "k", "<Nop>")

-- General
map("n", "q", ":q<cr>", opt)

-- Windows
map("n", "<M-m>", "<C-w><C-h>", opt)
map("n", "<M-n>", "<C-w><C-j>", opt)
map("n", "<M-e>", "<C-w><C-k>", opt)
map("n", "<M-i>", "<C-w><C-l>", opt)

-- Shifting
map("n", "<S-n>", ":m+<CR>", opt)
map("n", "<S-e>", ":m-2<CR>", opt)
cmd("vnoremap <S-n> :m '>+1<CR>gv=gv")
cmd("vnoremap <S-e> :m '<-2<CR>gv=gv")
cmd("vnoremap > >gv")
cmd("vnoremap < <gv")

-- Emacs
map("i", "<C-a>", "<Home>", opt)
map("i", "<C-e>", "<End>", opt)
map("i", "<C-k>", "<Esc>lDa", opt)

-- Easymotion
map("", "/", "<Plug>(easymotion-sn)", {})
map("", ",", "<Plug>(easymotion-s)", {})

-- Tabs
map("n", "<A-1>", ":BufferGoto 1<CR>", opt)
map("n", "<A-2>", ":BufferGoto 2<CR>", opt)
map("n", "<A-3>", ":BufferGoto 3<CR>", opt)
map("n", "<A-4>", ":BufferGoto 4<CR>", opt)
map("n", "<A-5>", ":BufferGoto 5<CR>", opt)

map("n", "<A-e>", ":BufferPrevious<CR>", opt)
map("n", "<A-n>", ":BufferNext<CR>", opt)

map("n", "<A-S-e>", ":BufferMovePrevious<CR>", opt)
map("n", "<A-S-n>", " :BufferMoveNext<CR>", opt)
