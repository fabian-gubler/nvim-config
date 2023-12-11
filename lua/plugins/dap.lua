return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = function()
				vim.fn.sign_define(
					"DapBreakpoint",
					{ text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
				)
				require("dapui").setup({
					expand_lines = true,
					icons = { expanded = "", collapsed = "", circular = "" },
					mappings = {
						-- Use a table to apply multiple mappings
						expand = { "<CR>", "<2-LeftMouse>" },
						open = "o",
						remove = "d",
						edit = "e",
						repl = "r",
						toggle = "t",
					},
					layouts = {
						{
							elements = {
								{ id = "scopes", size = 0.33 },
								{ id = "breakpoints", size = 0.17 },
								{ id = "stacks", size = 0.25 },
								{ id = "watches", size = 0.25 },
							},
							size = 0.33,
							position = "right",
						},
						{
							elements = {
								{ id = "repl", size = 0.45 },
								{ id = "console", size = 0.55 },
							},
							size = 0.27,
							position = "bottom",
						},
					},
					floating = {
						max_height = 0.9,
						max_width = 0.5, -- Floats will be treated as percentage of your screen.
						border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
						mappings = {
							close = { "q", "<Esc>" },
						},
					},
				})

				require("dap").listeners.after.event_initialized["dapui_config"] = function()
					require("dapui").open()
				end
			end,
		},
		{
			"mfussenegger/nvim-dap-python",
			config = function()
				require("dap-python").setup(".venv/bin/python")
			end,
		},
	},
	keys = {
		{ "<leader>db", function() require'dap'.toggle_breakpoint() end, desc = "debug breakpoint" },
		{ "<leader>dc", function() require'dap'.continue() end, desc = "debug continue" },
		{ "<leader>do", function() require'dap'.step_over() end, desc = "debug over" },
		{ "<leader>dO", function() require'dap'.step_out() end, desc = "debug out" },
		{ "<leader>di", function() require'dap'.step_into() end, desc = "debug into" },
		{ "<leader>dr", function() require'dap'.repl_open() end, desc = "debug repl" },
		{ "<leader>du", function() require'dapui'.toggle() end, desc = "debug toggle" },
		{ "<leader>dl", function() require("telescope").extensions.dap.list_breakpoints() end, desc = "list breakpoints"},
		{ "<leader>dL", function() require'dap'.clear_breakpoints() end, desc = "debug toggle" },
		{ "<leader>dd", function() require("telescope").extensions.dap.commands() end, desc = "list commands"},
		-- { "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", descr = "debug last" },
	},
}
