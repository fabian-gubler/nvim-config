return {
	"hkupty/iron.nvim",

	dependencies = {
		"kana/vim-textobj-user",
		"kana/vim-textobj-line",
		-- introduces "ah" and "ih", move with "[h" or "]h"
		"GCBallesteros/vim-textobj-hydrogen",
	},

	-- event = "BufEnter *.py",
	config = function()
		local iron = require("iron.core")
		local view = require("iron.view")

		iron.setup({
			config = {
				-- Whether a repl should be discarded or not
				scratch_repl = true,
				-- Your repl definitions come here
				repl_definition = {
					sh = {
						-- Can be a table or a function that
						-- returns a table (see below)
						command = { "zsh" },
					},
				},
				-- How the repl window will be displayed
				-- See below for more information
				-- repl_open_cmd = require('iron.view').bottom(40),
				repl_open_cmd = view.split("40%"),
			},
			-- Iron doesn't set keymaps by default anymore.
			-- You can set them here or manually add keymaps to the functions in iron.core
			keymaps = {
				-- Send Cmds
				send_motion = "<leader>c",
				visual_send = "<leader>c",
				send_file = "<leader>sf",
				send_line = "<leader>ss",
				-- Marks
				send_mark = "<leader>sm",
				mark_motion = "<leader>mc",
				mark_visual = "<leader>mc",
				remove_mark = "<leader>md",
				-- Iron UI
				cr = "<leader>r<cr>",
				interrupt = "<leader>r<leader>",
				exit = "<leader>rq",
				clear = "<leader>rl",
			},
			-- If the highlight is on, you can change how it looks
			-- For the available options, check nvim_set_hl
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
		})

		-- iron also has a list of commands, see :h iron-commands for all available commands
		vim.keymap.set("n", "<leader>rs", "<cmd>IronRepl<cr>")
		vim.keymap.set("n", "<leader>rr", "<cmd>IronRestart<cr>")
		vim.keymap.set("n", "<leader>rf", "<cmd>IronFocus<cr>")
		vim.keymap.set("n", "<leader>rh", "<cmd>IronHide<cr>")

		vim.cmd([[
			nmap <leader>cn csih:call search("# %%")<cr><cr>
			nmap <leader>cr csih
			nmap ,n ]h
			nmap ,p [h
			]])
	end,
}
