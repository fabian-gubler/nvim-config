return	{
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-t>]],
			direction = "float",
		})
	end,
}
