local servers = {
	"lua_ls",
	"pyright",
	"texlab",
	"rnix",
	"bashls",
	"tsserver",
	"ccls",
}

-- Lsp Completion
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

-- Configuration
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

for _, server in pairs(servers) do
	opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = capabilities,
	}

	if server == "lua_ls" then
		local lua_opts = require("lsp.settings.lua_ls")
		opts = vim.tbl_deep_extend("force", lua_opts, opts)
	end

	if server == "sqls" then
		require("lspconfig").sqls.setup({
			on_attach = function(client, bufnr)
				require("sqls").on_attach(client, bufnr)
			end,
		})
	end

	lspconfig[server].setup(opts)
	::continue::
end
