local opts = { noremap = true, silent = true }

-- Markdown
vim.keymap.set("n", "]#", ":keeppatterns s/^/#/e<cr>", opts)
vim.keymap.set("n", "[#", ":keeppatterns s/^#//e<cr>", opts)
vim.keymap.set("n", "]#", ":<c-u>keeppatterns '<,'>g/^#/keeppatterns s/^#//<cr>", opts)
vim.keymap.set("n", "[#", ":<c-u>keeppatterns '<,'>g/^#/keeppatterns s/^#/##/<cr>", opts)
