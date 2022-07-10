local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Bootstrap Lsp Servers
local lsp = { 
	-- programming
	'pyright', 'jdtls', 'clangd',
	-- web
	'tsserver', 'html', 'cssls', 
	-- system
	'bashls', 'sumneko_lua', 'ltex'}

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}

	 if server.name == "jsonls" then
	 	local jsonls_opts = require("lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

-- Install Servers
local lsp_installer_servers = require'nvim-lsp-installer.servers'
for _, value in ipairs(lsp) do
	local ok, lsp_install = lsp_installer_servers.get_server(value)
	if ok then
		if not lsp_install:is_installed() then
			lsp_install:install()
		end
	end
end
