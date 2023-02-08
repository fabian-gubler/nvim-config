return {

  "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        -- optional configuration
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
	 keys = {
		 {"<leader>W", ":ChatGPTActAs<CR>", mode = "n"},
		{"<leader>w", ":ChatGPT<CR>", mode = "n"},
		{"<leader>w", function() require("chatgpt").edit_with_instructions() end, mode = "v"},
	 }

}
