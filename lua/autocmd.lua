local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup("remember_folds", { clear = true })

autocmd("BufWinLeave", {
	pattern = { "*.md" },
	command = "mkview",
	group = "remember_folds",
})

-- vim.cmd 'autocmd FileChangedShell * let v:fcs_choice = "reload"'
-- vim.cmd 'autocmd FileChangedShell * echo "File changed on disk. Buffer reloaded."'

vim.cmd ' autocmd FocusGained * checktime'

-- vim.cmd [[
--  " trigger `autoread` when files changes on disk
--       set autoread
--       autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
--     " notification after file change
--       autocmd FileChangedShellPost *
--         \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
-- ]]

autocmd("BufWinEnter", {
	pattern = { "*.md" },
	command = "silent! loadview",
	group = "remember_folds",
})

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt" },
	callback = function()
		require("metals").initialize_or_attach({})
	end,
	group = nvim_metals_group,
})

-- vs code
vim.cmd([[
	autocmd BufEnter *.ipynb#* if mode() == 'n' | call feedkeys("a\<C-c>")
]])

-- introduce cmdheight when necessary
autocmd("RecordingEnter", {
	pattern = "*",
	command = "set cmdheight=1",
})

autocmd("RecordingLeave", {
	pattern = "*",
	command = "set cmdheight=0",
})

-- writing text
autocmd("FileType", { pattern = { "tex" }, command = "set cc=79" })
autocmd("FileType", { pattern = { "markdown", "tex" }, command = "setlocal wrap | setlocal linebreak" })

-- no highlight
autocmd("InsertLeave", { command = "setlocal nohlsearch" })

-- Run current file
augroup("run_file", { clear = true })

autocmd("BufEnter", {
	pattern = { "*.py" },
	command = "let @g=':20 sp | terminal python3 %'",
	group = "run_file",
})

autocmd("BufEnter", {
	pattern = { "*.java" },
	command = "let @g=':terminal java %'",
	group = "run_file",
})

autocmd("BufEnter", {
	pattern = { "*.cpp" },
	-- command = "let @g=':20 sp | terminal g++ % | :10 sp | terminal ./a.out'",
	command = "let @g=':20 sp | terminal g++ % && ./a.out'",
	group = "run_file",
})

autocmd("BufEnter", {
	pattern = { "*.c" },
	command = "let @g=':!gcc % | :10 sp |terminal ./a.out'",
	group = "run_file",
})

autocmd("BufEnter", {
	pattern = { "*.js" },
	command = "let @g=':10 sp | terminal node %'",
	group = "run_file",
})

-- Open current file
augroup("open_file", { clear = true })

autocmd("BufEnter", {
	pattern = { "*.md", "*.html" },
	command = "let @o=':silent !xdg-open %&'",
	group = "open_file",
})

-- Set text wrapping limit
augroup("myformatting", { clear = true })

autocmd("BufEnter", {
	pattern = { "*.md" },
	command = "set textwidth=90",
	group = "myformatting",
})

autocmd("Filetype", {
	pattern = { "mail" },
	command = "set textwidth=100",
	group = "myformatting",
})
