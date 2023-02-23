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
keymap("n", "<leader>o", ":b#<CR>")
keymap("n", "<leader>o", ":b#<CR>")
keymap("n", "<leader>u", ":UndotreeToggle<CR>")
keymap("n", "<leader>l", ":Lazy<CR>")

-- lsp
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- disable
-- keymap("i", "<C-p>", "\"+p")
-- vim.keymap.set("i", "<C-p>", "\"+p")

keymap("n", "-", "<Nop>", opts)

-- resize windows
keymap("n", "+", ":res +5<CR>")
keymap("n", "-", ":res -5<CR>")

-- center
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")

-- lsp
keymap("n", "<leader>m", "<cmd>LspInfo<CR>", opts)

-- ctrl backspace to delete word
keymap("i", "<C-H>", "<C-W>", opts)
keymap("i", "<C-K>", "<C-O>D", opts)

-- useful
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")

-- dap
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<CR>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<CR>", opts)
