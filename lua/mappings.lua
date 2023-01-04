local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local bufopts = { noremap = true, silent = true, buffer = 0 }

-- markdown
keymap("n", "]#", ":keeppatterns s/^/#/e<CR>", bufopts)
keymap("n", "[#", ":keeppatterns s/^#//e<CR>", bufopts)
keymap("x", "]#", ":<c-u>keeppatterns '<,'>g/^#/keeppatterns s/^#//<CR>", bufopts)
keymap("x", "[#", ":<c-u>keeppatterns '<,'>g/^#/keeppatterns s/^#/##/<CR>", bufopts)

-- sniprun
keymap("v", "s", "<Plug>SnipRun", { silent = true })
keymap("n", "<leader>s", "<Plug>SnipRunOperator", { silent = true })
keymap("n", "<leader>ss", "<Plug>SnipRun", { silent = true })

-- general
keymap("n", "<leader>g", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader><leader>", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap("n", "<leader>E", ":NvimTreeFindFileToggle<CR>")
keymap("n", "<leader>o", ":b#<CR>")
keymap("n", "<leader>u", ":UndotreeToggle<CR>")

-- copilot
keymap("n", "<leader>c", function() require("copilot.suggestion").toggle_auto_trigger() end, opts)
keymap("i", "<A-.>", function() require('copilot.suggestion').next() end, opts)
keymap("i", "<A-,>", function() require('copilot.suggestion').prev() end, opts)
keymap("i", "<C-y>", function() require('copilot.suggestion').accept() end, opts)

-- resize windows
keymap("n", "+", ":res +5<CR>")
keymap("n", "-", ":res -5<CR>")


-- center
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")

-- xdg-open
keymap("n", "gx", ":!xdg-open <C-r><C-a><CR>", opts) -- because i disabled netrw

-- lsp
keymap("n", "<leader>m", "<cmd>LspInfo<CR>", opts)
keymap("n", "<leader>M", "<cmd>Mason<CR>", opts)

-- clipboard
keymap("n", "<leader>y", '"+y')
keymap("v", "<leader>y", '"+y')
keymap("n", "<leader>p", '"+p')
keymap("v", "<leader>p", '"+p')
keymap("n", "<leader>d", '"+d')
keymap("v", "<leader>d", '"+d')

-- ctrl backspace to delete word
keymap("i", "<C-H>", "<C-W>", opts)
keymap("i", "<C-K>", "<C-O>D", opts)

-- useful
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")

-- harpoon
keymap("n", "<A-Enter>", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<A-m>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<A-n>", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<A-e>", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", "<A-i>", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap("n", "<A-o>", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)

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
