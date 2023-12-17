-- require "lsp.lsp-installer"
-- require("lsp.handlers").setup()

-- Setup language servers.
-- See `:help lspconfig-setup`
local lspconfig = require("lspconfig")

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = { "pyright", "lua_ls", "rnix", "texlab", "bashls", "ccls" }
for _, lsp in ipairs(servers) do
	local opts = {
		-- on_attach = require("lsp.handlers").on_attach,
		capabilities = capabilities,
	}

	-- Load additional settings if they exist
	local require_ok, settings = pcall(require, "lsp.settings." .. lsp)
	if require_ok then opts = vim.tbl_deep_extend("force", settings, opts) end

	-- Setup language server
	lspconfig[lsp].setup(opts)
end

-- Diagnostics configuration
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local icons = require("icons")
local signs = {
	{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
	{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
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

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>u", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }

		vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts) -- vim.lsp.buf.definition
		vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, opts) -- vim.lsp.buf.implementation
		vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts) -- vim.lsp.buf.references
		vim.keymap.set("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, opts) -- vim.lsp.buf.type_definition

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
	end,
})
