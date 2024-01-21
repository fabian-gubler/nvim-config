-- Function for simple plugin setup
local function setup(plugin_name)
	return function() require(plugin_name).setup() end
end

return {
	-- one liners
	"shaunsingh/nord.nvim",
	"907th/vim-auto-save",
	"stevearc/dressing.nvim",
	"neovim/nvim-lspconfig",
	"preservim/vim-markdown",
	"dhruvasagar/vim-table-mode",
   "godlygeek/tabular",

	-- simple setup
	{ "numToStr/Comment.nvim", config = setup("Comment") },
	{ "lewis6991/gitsigns.nvim", config = setup("gitsigns") },
	{ "windwp/nvim-autopairs", config = setup("nvim-autopairs") },
}
