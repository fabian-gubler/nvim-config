return {

	"jackMort/ChatGPT.nvim",

	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},

	config = function()
		require("chatgpt").setup({
			-- optional configuration here
		})
		-- plugin-specific keymaps
		vim.keymap.set("n", "<leader>W", ":ChatGPTActAs<cr>")
		vim.keymap.set("n", "<leader>w", ":ChatGPT<cr>")
		vim.keymap.set("v", "<leader>w", function()
			require("chatgpt").edit_with_instructions()
		end)

	end,
}
