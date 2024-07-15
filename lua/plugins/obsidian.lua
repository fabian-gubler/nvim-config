return {
	"epwalsh/obsidian.nvim",
	lazy = true,
	event = { "BufReadPre /home/fabian/nextcloud/obsidian/**.md" },
	keys = {
      -- FIX: Opening does not work
		{ "<leader>co", function() return "<cmd>ObsidianOpen<CR>" end },
		-- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
		-- see also: 'follow_url_func' config option below.
		{
			"gf",
			function()
				if require("obsidian").util.cursor_on_markdown_link() then
					return "<cmd>ObsidianFollowLink<CR>"
				else
					return "gf"
				end
			end,
		},
	},
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		dir = "/home/fabian/nextcloud/obsidian", -- no need to call 'vim.fn.expand' here

		-- Optional, set to true if you don't want obsidian.nvim to manage frontmatter.
		disable_frontmatter = true,

      follow_url_func = function(url)
         -- Open the URL in the browser.
         vim.fn.jobstart({ "xdg-open", url })
      end,

		-- Where to put new notes created from completion. Valid options are
		--  * "current_dir" - put new notes in same directory as the current buffer.
		--  * "notes_subdir" - put new notes in the default notes subdirectory.
		new_notes_location = "current_dir",
		-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
		--

	},
	config = function(_, opts) require("obsidian").setup(opts) end,
}
