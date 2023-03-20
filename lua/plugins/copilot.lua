return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = false,
				auto_refresh = true,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>",
				},
				layout = {
					position = "bottom", -- | top | left | right
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = false,
				debounce = 75,
				keymap = {
					accept = "<M-l>",
					accept_word = false,
					accept_line = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
			},
			copilot_node_command = "node", -- Node.js version must be > 16.x
			server_opts_overrides = {},
		})

		-- copilot
		vim.keymap.set("n", "<leader>h", function()
			require("copilot.suggestion").toggle_auto_trigger()
			print("Copilot auto trigger: " .. tostring(require("copilot.suggestion").auto_trigger))
		end)

		vim.keymap.set("i", "<A-.>", function()
			require("copilot.suggestion").next()
		end)

		vim.keymap.set("i", "<A-,>", function()
			require("copilot.suggestion").prev()
		end)

		vim.keymap.set("i", "<A-CR>", function()
			require("copilot.suggestion").accept()
		end)

	end,
}
