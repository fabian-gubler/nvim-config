return {
	"zbirenbaum/copilot.lua",
	dependencies = {
		"AndreM222/copilot-lualine",
	},
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
			},
			filetypes = {
				mail = false,
            yaml = true,
			},
		})

		-- copilot
		vim.keymap.set("n", "<leader>h", function()
			require("copilot.suggestion").toggle_auto_trigger()
			print("Copilot auto trigger: " .. tostring(require("copilot.suggestion").auto_trigger))
		end)
	end,
}
