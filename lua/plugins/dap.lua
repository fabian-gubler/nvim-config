return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = function()
				local icons = require("icons")

				vim.fn.sign_define("DapBreakpoint", {
					text = icons.debugging.Breakpoint,
					texthl = "DiagnosticSignError",
				})
				vim.fn.sign_define(
					"DapBreakpointCondition",
					{ text = icons.debugging.Breakpoint, texthl = "DiagnosticHint" }
				)
				-- Configure dapui layout
				require("dapui").setup({
					icons = {
						expanded = icons.debugging.Expanded,
						collapsed = icons.debugging.Collapsed,
						circular = icons.debugging.Circular,
					},
				})

				-- Automatically load / close dapui
				require("dap").listeners.after.event_initialized["dapui_config"] = function()
					require("dapui").open()
				end

				require("dap").listeners.before.event_exited["dapui_config"] = function()
					require("dapui").close()
				end
			end,
		},
		{
			"nvim-neotest/nvim-nio",
		},
		{
			"leoluz/nvim-dap-go",
			config = function() require("dap-go").setup() end,
		},
		{
			"mfussenegger/nvim-dap-python",
			config = function() require("dap-python").setup(".venv/bin/python") end,
		},
	},
	keys = {
		{ "<F1>", function() require("dap").step_into() end },
		{ "<F2>", function() require("dap").step_over() end },
		{ "<F3>", function() require("dap").step_out() end },
		{ "<F4>", function() require("dap").step_back() end },
		{ "<F5>", function() require("dap").continue() end },
		{ "<leader>b", function() require("dap").toggle_breakpoint() end },
		{ "<leader>dc", function() require("dap").run_to_cursor() end },
		{ "<leader>dd", function() require("dap").disconnect() end },
		{ "<leader>dq", function() require("dap").close() end },
		{ "<leader>dp", function() require("dap").pause() end },
		{ "<leader>dr", function() require("dap").repl_open() end },
		{ "<leader>du", function() require("dapui").toggle({ reset = true }) end },
		{ "<leader>dl", function() require("dap").clear_breakpoints() end },
		{
			"<leader>B",
			function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
		},
	},
}
