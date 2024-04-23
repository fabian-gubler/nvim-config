return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/neotest-python",
		"nvim-neotest/neotest-go",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					runner = "pytest",
				}),
			},
		})
	end,
	keys = {
		{ "<F6>", function() require("neotest").run.run() end },
		{ "<F7>", function() require("neotest").run.run({ strategy = "dap" }) end },
		{ "<F8>", function() require("neotest").summary.toggle() end },
		{ "<F9>", function() require("neotest").run.run(vim.fn.expand("%")) end },
		{
			"<F10>",
			function() require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" }) end,
		},
	},
}
