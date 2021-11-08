local vim = vim

local lsp = { 'tsserver', 'html', 'cssls', 'sumneko_lua', 'bashls', 'pyright', 'jdtls', 'clangd'}
local lsp_installer_servers = require'nvim-lsp-installer.servers'

-- Install Servers
for _, value in ipairs(lsp) do
	local ok, lsp_install = lsp_installer_servers.get_server(value)
	if ok then
		if not lsp_install:is_installed() then
			lsp_install:install()
		end
	end
end

-- Mappings
local on_attach = function(_, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Bindings
	local opts = { noremap = true, silent = true }
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

end

-- Make Configuration
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

-- Configure lua for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { 'vim' },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  }
}

-- Setup Servers
local function setup_servers()
	local lsp_installer = require("nvim-lsp-installer")

	-- get all installed servers
	local servers = lsp_installer_servers.get_installed_servers()
	-- ... and add manually installed servers
	table.insert(servers, "ls_emmet")

	for _, server in pairs(servers) do
		lsp_installer.on_server_ready(function(server)
		local config = make_config()
		if server == "lua" then
			-- print(config)
			config.settings = lua_settings
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md
	server:setup(config)
	end)
	end
end

setup_servers()



-- Disable signs
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
	  signs = false,
	}
)

-- Emmet
local configs = require'lspconfig/configs'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

configs.ls_emmet = {
  default_config = {
    cmd = { 'ls_emmet', '--stdio' };
    filetypes = { 'html', 'css'};
    root_dir = function(fname)
      return vim.loop.cwd()
    end;
    settings = {};
  };
}

require'lspconfig'.ls_emmet.setup{
	capabilities = capabilities
}

