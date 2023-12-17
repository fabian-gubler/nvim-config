local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- remember folds
augroup("remember_folds", { clear = true })

autocmd("BufWinLeave", {
	pattern = { "*.md" },
	command = "mkview",
	group = "remember_folds",
})

-- auto reload files
autocmd("FocusGained", { pattern = ( "*" ), command = "checktime", })

autocmd("BufWinEnter", {
	pattern = { "*.md" },
	command = "silent! loadview",
	group = "remember_folds",
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

-- no highlight
autocmd("InsertLeave", { command = "setlocal nohlsearch" })
