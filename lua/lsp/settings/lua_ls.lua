return {
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if
			not vim.loop.fs_stat(path .. "/.luarc.json")
			and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
		then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
				Lua = {
					diagnostics = { globals = { "vim" } },
					telemetry = { enable = false },
					runtime = {
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = { vim.env.VIMRUNTIME },
					},
				},
			})
		end
		return true
	end,
}
