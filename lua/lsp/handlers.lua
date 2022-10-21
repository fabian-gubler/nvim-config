local M = {}

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

--- New
local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
-- M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)
--- New

M.on_attach = function(client, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local keymap = vim.keymap.set
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
	keymap("n", "gd", vim.lsp.buf.definition, bufopts)
	keymap("n", "K", vim.lsp.buf.hover, bufopts)
	keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
	keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	keymap("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
	end, bufopts)
	keymap("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	-- keymap("n", "<leader>rn", vim.lsp.buf.rbname, bufopts)
	keymap("n", "<leader>a", vim.lsp.buf.code_action, bufopts)
	keymap("n", "gr", vim.lsp.buf.references, bufopts)
	keymap("n", "<leader>f", vim.lsp.buf.format, bufopts)
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	keymap("n", "<leader>o", vim.diagnostic.open_float, bufopts)
	keymap("n", "[d", vim.diagnostic.goto_prev, bufopts)
	keymap("n", "]d", vim.diagnostic.goto_next, bufopts)
	keymap("n", "<leader>q", vim.diagnostic.setloclist, bufopts)

	-- Nvim 0.8 Change: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts

	local util = require("vim.lsp.util")

	local formatting_callback = function(client, bufnr)
		vim.keymap.set("n", "<leader>f", function()
			local params = util.make_formatting_params({})
			client.request("textDocument/formatting", params, nil, bufnr)
		end, { buffer = bufnr })
	end

	if client.name == "jdtls" then
		require("jdtls").setup_dap({ hotcodereplace = "auto" })
		require("jdtls.dap").setup_dap_main_class_configs()
		formatting_callback(client, bufnr)
	end

	if client.name == "sumneko_lua" then
		-- formatting_callback(client, bufnr)
	end
end

return M
