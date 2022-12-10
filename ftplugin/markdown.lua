local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Markdown
keymap("n", "]#", ":keeppatterns s/^/#/e<cr>", opts)
keymap("n", "[#", ":keeppatterns s/^#//e<cr>", opts)
keymap("n", "]#", ":<c-u>keeppatterns '<,'>g/^#/keeppatterns s/^#//<cr>", opts)
keymap("n", "[#", ":<c-u>keeppatterns '<,'>g/^#/keeppatterns s/^#/##/<cr>", opts)
