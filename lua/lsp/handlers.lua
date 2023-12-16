local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false,
		signs = true,
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	-- Only Show diagnostics if Warning or Error
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = {
			severity_limit = "Error",
		},
		underline = {
			severity_limit = "Warning",
		},
		update_in_insert = false,
	})
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_keymaps(bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap.set
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
	keymap("n", "gd", vim.lsp.buf.definition, bufopts)
	keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
	keymap("n", "gr", vim.lsp.buf.references, bufopts)
	keymap("n", "K", vim.lsp.buf.hover, bufopts)
	keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	keymap("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	keymap("n", "<leader>r", vim.lsp.buf.rename, bufopts)
	keymap("n", "<leader>a", vim.lsp.buf.code_action, bufopts)
	-- keymap("n", "<leader>f", vim.lsp.buf.format, bufopts)
	keymap("n", "<leader>u", vim.diagnostic.open_float, bufopts)
	keymap("n", "[d", vim.diagnostic.goto_prev, bufopts)
	keymap("n", "]d", vim.diagnostic.goto_next, bufopts)
	keymap("n", "<leader>q", vim.diagnostic.setloclist, bufopts)
end

M.on_attach = function(client, bufnr)
	-- if client.name == "jdtls" then
	-- reccomended according to nvim-jdtls
	-- require("jdtls").setup_dap({ hotcodereplace = "auto" })
	-- require("jdtls.dap").setup_dap_main_class_configs()
	-- end

	if client.name == "lua_ls" then
		-- use stylua instead of builtin
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps(bufnr)
end

return M
