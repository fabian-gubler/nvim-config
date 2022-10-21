require("mason-lspconfig").setup({
	-- ensure_installed = { 
	-- 	-- LSP
	-- 	"sumneko_lua", "pyright", "jdtls", "bash", "rust-analyzer",
	-- 	-- Formatters
	-- 	"stylua", "black", "prettier"
	-- }
})

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

local servers = {
	"clangd",
	"sumneko_lua",
	"pyright",
	"rust_analyzer",
	-- "json",
}

local home = os.getenv "HOME"


local capabilities = vim.lsp.protocol.make_client_capabilities()

for _, server in pairs(servers) do
	opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = capabilities,
	}

	if server == "sumneko_lua" then
		local sumneko_opts = require "lsp.settings.sumneko_lua"
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	-- end

	lspconfig[server].setup(opts)
	::continue::

end
