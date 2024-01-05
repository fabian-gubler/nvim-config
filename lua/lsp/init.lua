-- Load external modules
require("lsp.diagnostics")

-- Setup language servers.
-- See `:help lspconfig-setup`
local lspconfig = require("lspconfig")

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
	"pyright",
	"lua_ls",
	"nil_ls",
	"texlab",
	"bashls",
	"ccls",
   "tsserver"
}

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

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }

		vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, opts)
		vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
	end,
})
