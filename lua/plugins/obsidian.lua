return {
	"epwalsh/obsidian.nvim",
	lazy = true,
	event = { "BufReadPre /data/nextcloud/obsidian/**.md" },
	-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
	},
	opts = {
		dir = "/data/nextcloud/obsidian", -- no need to call 'vim.fn.expand' here

		-- see below for full list of options 👇
	},
	config = function(_, opts)
		require("obsidian").setup(opts)

		-- Optional, set to true if you don't want obsidian.nvim to manage frontmatter.
		disable_frontmatter = true

		-- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
		-- see also: 'follow_url_func' config option below.
		vim.keymap.set("n", "gf", function()
			if require("obsidian").util.cursor_on_markdown_link() then
				return "<cmd>ObsidianFollowLink<CR>"
			else
				return "gf"
			end
		end, { noremap = false, expr = true })
	end,
}
