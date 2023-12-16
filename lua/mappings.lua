local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local bufopts = { noremap = true, silent = true, buffer = 0 }

-- resize windows
keymap("n", "+", ":res +5<CR>")
keymap("n", "-", ":res -5<CR>")

-- center
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")

-- ctrl backspace to delete word
keymap("i", "<C-H>", "<C-W>", opts)
keymap("i", "<C-K>", "<C-O>D", opts)

-- useful
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")

-- learn terminal escape: <Esc> <C-\><C-n>
