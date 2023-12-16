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

				-- Configure dapui layout
				require("dapui").setup({
					icons = { expanded = "", collapsed = "", circular = "" },
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
			"mfussenegger/nvim-dap-python",
			config = function() require("dap-python").setup(".venv/bin/python") end,
		},
	},
	keys = {
		{ "<leader>dt", function() require("dap").toggle_breakpoint() end },
		{ "<leader>db", function() require("dap").step_back() end },
		{ "<leader>dc", function() require("dap").continue() end },
		{ "<leader>dC", function() require("dap").run_to_cursor() end },
		{ "<leader>dd", function() require("dap").disconnect() end },
		{ "<leader>dq", function() require("dap").close() end },
		{ "<leader>di", function() require("dap").step_into() end },
		{ "<leader>do", function() require("dap").step_over() end },
		{ "<leader>du", function() require("dap").step_out() end },
		{ "<leader>dp", function() require("dap").pause() end },
		{ "<leader>dp", function() require("dap").pause() end },
		{ "<leader>dr", function() require("dap").repl_open() end },
		{ "<leader>dU", function() require("dapui").toggle({ reset = true }) end },
		{ "<leader>dl", function() require("dap").clear_breakpoints() end },
	},
}
