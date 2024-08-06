return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local colors = {
			nord = "#434C5E",
			black = "#2E3440",
			white = "#c6c6c6",
			grey = "#2e3440",
		}

		local icons = require("icons")

		local bubbles_theme = {
			normal = {
				a = { fg = colors.white, bg = colors.nord },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white, bg = colors.black },
			},

			insert = { a = { fg = colors.white, bg = colors.nord } },
			visual = { a = { fg = colors.white, bg = colors.nord } },
			replace = { a = { fg = colors.white, bg = colors.nord } },

			inactive = {
				a = { fg = colors.white, bg = colors.black },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.black, bg = colors.black },
			},
		}

		require("lualine").setup({
			options = {
				theme = bubbles_theme,
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "filename" } },
				lualine_b = {
					"branch",
					{
						"diagnostics",
						symbols = {
							error = icons.diagnostics.Error .. " ",
							warn = icons.diagnostics.Warning .. " ",
							info = icons.diagnostics.Information .. " ",
							hint = icons.diagnostics.Hint .. " ",
						},
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "copilot", "filetype", "progress", "location" },
				lualine_z = {
					{},
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
}
