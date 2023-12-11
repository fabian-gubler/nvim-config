return {
	"nvim-neotest/neotest",
	dependencies = { "nvim-neotest/neotest-python" },
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
		{
			"<leader>dm",
			"<cmd>lua require('neotest').run.run()<cr>",
			desc = "test method",
		},

		{
			"<leader>dM",
			":lua require'neotest'.run.run({strategy = 'dap'})<cr>",
			desc = "test method dap",
		},

		{
			"<leader>ds",
			":lua require'neotest'.summary.toggle()<cr>",
			desc = "test summary",
		},

		{
			"<leader>df",
			":lua require'neotest'.run.run(vim.fn.expand('%'))<cr>",
			desc = "test file",
		},

		{
			"<leader>dF",
			"<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
			desc = "test class dap",
		},

		-- don't know if needed
		{ "<leader>dt", ":lua require'neotest'.run.stop()<cr>", desc = "stop test" },
		-- { "<leader>dta", ":lua require'neotest'.run.attach()<cr>", desc = "attach test" },
	},
}
