return {
	"akinsho/toggleterm.nvim",

	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-t>]],
			direction = "float",
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			on_open = function(_)
				vim.cmd("startinsert!")
			end,
			on_close = function(_) end,
			count = 99,
		})

		function _lazygit_toggle()
			lazygit:toggle()
		end

		vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
	end,
}
