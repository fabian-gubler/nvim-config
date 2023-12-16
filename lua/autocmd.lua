local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- remember folds
augroup("remember_folds", { clear = true })

autocmd("BufWinLeave", {
	pattern = { "*.md" },
	command = "mkview",
	group = "remember_folds",
})

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

-- writing text
autocmd("FileType", { pattern = { "tex" }, command = "set cc=79" })
autocmd("FileType", { pattern = { "markdown", "tex" }, command = "setlocal wrap | setlocal linebreak" })

-- no highlight
autocmd("InsertLeave", { command = "setlocal nohlsearch" })

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
