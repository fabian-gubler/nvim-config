-- Diagnostics configuration
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local icons = require("icons")
local signs = {
	{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
	-- { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
	{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local default_diagnostic_config = {
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(default_diagnostic_config)

-- Disable virtual text for diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
	})

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>u", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
