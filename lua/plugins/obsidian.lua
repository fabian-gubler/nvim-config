return {
	"epwalsh/obsidian.nvim",
	lazy = true,
	event = { "BufReadPre /data/nextcloud/obsidian/**.md" },
	keys = {
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
		dir = "/data/nextcloud/obsidian", -- no need to call 'vim.fn.expand' here

		-- Optional, set to true if you don't want obsidian.nvim to manage frontmatter.
		disable_frontmatter = true,

		-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
		completion = {
			-- Set to false to disable completion.
			nvim_cmp = true,

			-- Trigger completion at 2 chars.
			min_chars = 2,

			-- Where to put new notes created from completion. Valid options are
			--  * "current_dir" - put new notes in same directory as the current buffer.
			--  * "notes_subdir" - put new notes in the default notes subdirectory.
			new_notes_location = "current_dir",

			-- Control how wiki links are completed with these (mutually exclusive) options:
			--
			-- 1. Whether to add the note ID during completion.
			-- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
			-- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
			prepend_note_id = true,
			-- 2. Whether to add the note path during completion.
			-- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
			-- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
			prepend_note_path = false,
			-- 3. Whether to only use paths during completion.
			-- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
			-- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
			use_path_only = false,
		},
	},
	config = function(_, opts) require("obsidian").setup(opts) end,
}
