vim.opt_local.suffixesadd:prepend('.lua')
vim.opt_local.suffixesadd:prepend('init.lua')
vim.opt_local.path:prepend(vim.fn.stdpath('config')..'/lua')

-- lua sytlegide recommends 3 spaces for indentation
vim.opt_local.tabstop = 3
vim.opt_local.softtabstop = 3
vim.opt_local.shiftwidth = 3
