local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)


-- CTRL Backspace to Delete Word
keymap("i", "<C-H>", "<C-W>", opts) 
keymap("i", "<C-K>", "<C-O>D", opts) 

-- Useful
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")

-- Debugging
keymap("n", "<F1>", ":lua require'dap'.continue()<CR>")
keymap("n", "<F2>", ":lua require'dap'.step_over()<CR>")
keymap("n", "<F3>", ":lua require'dap'.step_into()<CR>")
keymap("n", "<F4>", ":lua require'dap'.step_out()<CR>")

-- Easymotion
keymap("", "\\", "<Plug>(easymotion-sn)", opts)
keymap("", ",", "<Plug>(easymotion-s)", opts)

-- Tabs
keymap("n", "<A-1>", ":BufferGoto 1<CR>", opts)
keymap("n", "<A-2>", ":BufferGoto 2<CR>", opts)
keymap("n", "<A-3>", ":BufferGoto 3<CR>", opts)
keymap("n", "<A-4>", ":BufferGoto 4<CR>", opts)
keymap("n", "<A-5>", ":BufferGoto 5<CR>", opts)
keymap("n", "<A-S-e>", ":BufferMovePrevious<CR>", opts)
keymap("n", "<A-S-n>", " :BufferMoveNext<CR>", opts)
keymap("n", "<A-e>", ":BufferPrevious<CR>", opts)
keymap("n", "<A-n>", " :BufferNext<CR>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
