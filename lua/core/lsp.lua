local vim = vim
local lsp = { 'tsserver', 'html', 'cssls', 'clangd', 'bashls', 'pyright', 'sumneko_lua', 'ltex', 'jdtls'}

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

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim', 'hs'},
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

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    -- on_attach = on_attach,
  }
end

-- lsp-install
local function setup_servers()
	local lsp_installer = require("nvim-lsp-installer")

	-- get all installed servers
	local servers = lsp_installer_servers.get_installed_servers()
	-- ... and add manually installed servers
	-- table.insert(servers, "sourcekit")

	for _, server in pairs(servers) do
	lsp_installer.on_server_ready(function(server)
	local config = make_config()
	if server == "lua" then
	  config.settings = lua_settings
	end

	-- (optional) Customize the options passed to the server
	-- if server.name == "tsserver" then
	--     opts.root_dir = function() ... end
	-- end

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
