local  null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- Java
		formatting.google_java_format,

		-- Javascript
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote", "--trailingComma none" } }),

		-- Lua
		formatting.stylua,

		-- Python
		formatting.black.with({ extra_args = { "--fast" } }),
		-- diagnostics.flake8,
	},
})
