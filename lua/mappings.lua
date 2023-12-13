local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local bufopts = { noremap = true, silent = true, buffer = 0 }

-- markdown
keymap("n", "]#", ":keeppatterns s/^/#/e<CR>", bufopts)
keymap("n", "[#", ":keeppatterns s/^#//e<CR>", bufopts)
keymap("x", "]#", ":<c-u>keeppatterns '<,'>g/^#/keeppatterns s/^#//<CR>", bufopts)
keymap("x", "[#", ":<c-u>keeppatterns '<,'>g/^#/keeppatterns s/^#/##/<CR>", bufopts)


-- easy terminal escape
vim.cmd([[
 tnoremap <Esc> <C-\><C-n>
]])

-- general
keymap("n", "<leader>z", ":UndotreeToggle<CR>")

-- lsp
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

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
