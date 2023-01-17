require("mason-tool-installer").setup({
	ensure_installed = {

		-- LSP
		"lua-language-server",
		"clangd",
		"pyright",
		"rust-analyzer",
		"texlab",
		"rnix-lsp",

		-- you can pin a tool to a particular version
		{ "jdtls", version = "v1.18.0" },

		-- you can turn off/on auto_update per tool
		{ "bash-language-server", auto_update = true },

		-- Formatters
		"shellcheck",
		"black",
		"prettier",
		"flake8",
	},

	auto_update = false,
	run_on_start = true,
	start_delay = 3000, -- 3 second delay
})

local servers = {
	"clangd",
	"sumneko_lua",
	"pyright",
	"rust_analyzer",
	"texlab",
	"rnix",
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

	if server == "sumneko_lua" then
		local sumneko_opts = require("lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	-- end

	lspconfig[server].setup(opts)
	::continue::
end
