local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_autogroup

-- Need to Convert

-- Appearance
autocmd("BufEnter", { command = "set laststatus=3" })

-- Tab Size
autocmd("FileType", {
	pattern = { "typescript", "typescriptreact", "html", "javascript", "javascriptreact" },
	command = "setlocal ts=2 sts=2 sw=2",
})

autocmd("FileType", {
	pattern = { "lua", "r" },
	command = "setlocal ts=3 sts=3 sw=3",   
})

-- Writing Text
-- autocmd("FileType", { pattern = {"markdown", "tex"}, command = "lua require('cmp').setup.buffer { enabled = false }" })
autocmd("FileType", { pattern = { "markdown"}, command = "set cc=" })
autocmd("FileType", { pattern = { "tex" }, command = "set cc=79" })
autocmd("FileType", { pattern = { "markdown", "tex" }, command = "setlocal wrap" })
autocmd("FileType", { pattern = { "markdown", "tex" }, command = "setlocal linebreak" })

-- No highlight
autocmd("InsertLeave", { command = "setlocal nohlsearch"})

-- Run current file
vim.cmd [[
	augroup run_file
		autocmd BufEnter *.java let @g=":w\<CR>:terminal java %\<CR>"
		autocmd BufEnter *.py let @g=":w\<CR>:10 sp |terminal python3 %\<CR>i" 
		autocmd BufEnter *.cpp let @g=":w\<CR> :!g++ %\<CR> | :10 sp |terminal ./a.out\<CR>i" 
		autocmd BufEnter *.c let @g=":w\<CR> :!gcc %\<CR> | :10 sp |terminal ./a.out\<CR>i" 
		autocmd BufEnter *.go let @g=":w\<CR> :10 sp | terminal go run % \<CR>i" 
		autocmd BufEnter *.js let @g=":w\<CR> :10 sp | terminal node % \<CR>i" 
		autocmd BufEnter *.html let @g=":w\<CR> :silent !firefox % \<CR>"
	augroup end
]]

vim.cmd [[
		autocmd BufEnter *.py let @a=":MagmaReevaluateCell\<CR> |:normal })\<CR>"
		autocmd BufEnter *.py let @o="<expr> <Leader>r nvim_exec('MagmaEvaluateOperator', v:true)"
]]
