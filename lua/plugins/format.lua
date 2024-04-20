return {
	"stevearc/conform.nvim",

	keys = {
		{
			"<leader>f",
			function() require("conform").format({ async = true, lsp_fallback = true }) end,
		},
	},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				go = { "goimports", "gofmt" },
			},
		})
	end,
}
