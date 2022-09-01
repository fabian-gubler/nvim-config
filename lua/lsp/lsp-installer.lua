require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "pyright", "jdtls" }
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>y', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

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
	"sumneko_lua",
	"pyright",
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

	-- if server == "pyright" then
	-- 	cmd = { 
	-- 	"pyright-langserver", 
	-- 	"--stdio", 
	-- 	"-p",
	-- 	home .. "/.pyrightconfig.json",
	-- }
	-- end

	lspconfig[server].setup(opts)
	::continue::

end
