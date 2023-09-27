local keymap = vim.keymap.set
local bufopts = { noremap = true, silent = true, buffer = bufnr }

keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
keymap("n", "gd", vim.lsp.buf.definition, bufopts)
keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
keymap("n", "gr", vim.lsp.buf.references, bufopts)
keymap("n", "K", vim.lsp.buf.hover, bufopts)
keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
keymap("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
keymap("n", "<leader>r", vim.lsp.buf.rename, bufopts)
keymap("n", "<leader>a", vim.lsp.buf.code_action, bufopts)
keymap("n", "<leader>f", vim.lsp.buf.format, bufopts)
keymap("n", "<leader>u", vim.diagnostic.open_float, bufopts)
keymap("n", "[d", vim.diagnostic.goto_prev, bufopts)
keymap("n", "]d", vim.diagnostic.goto_next, bufopts)
keymap("n", "<leader>q", vim.diagnostic.setloclist, bufopts)
