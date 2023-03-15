return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local ls = require("luasnip")

		-- Load all VSCode snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Custom Snippets
		local snip = ls.snippet
		local node = ls.snippet_node
		local text = ls.text_node
		local insert = ls.insert_node
		local func = ls.function_node
		local choice = ls.choice_node
		local dynamicn = ls.dynamic_node

		ls.add_snippets("sh", {
			snip({ trig = "#!" }, {
				text({ "#!/usr/bin/env bash" }),
			}),
		})

		ls.add_snippets("markdown", {
			snip({ trig = "figure" }, {
				text({ "<figure markdown>", "  ![Image](" }),
				insert(1, "/path/to/file"),
				text({ ")", "  <figcaption>" }),
				insert(2, ""),
				text({ "</figcaption>", "</figure>" }),
			}),
			snip({ trig = "yaml" }, {
				text({ "---",  "title: " }),
				insert(1, "Title"),
				text({ "", "author: " }),
				insert(2, "Fabian Gubler"),
				text({ "", "fontfamily: " }),
				insert(3, "helvet"),
				text({ "", "geometry: " }),
				insert(4, "margin=2cm" ),
				text({ "", "date: " }),
				insert(5, "today"),
				text({ "", "header-includes: " }),
				text({ "", "  - \\renewcommand{\\familydefault}{\\sfdefault}" }),
				text({ "", "---" }),

		-- 		header-includes:
  -- - 

			}),
		})

		ls.add_snippets("mail", {
			snip({ trig = "sign" }, {
				text({ "Yours sincerly,", "Fabian Gubler" }),
			}),
			snip({ trig = "best" }, {
				text({ "Best Regards,", "Fabian Gubler" }),
			}),
			snip({ trig = "grüsse" }, {
				text({ "Freundliche Grüsse,", "Fabian Gubler" }),
			}),
		})

		ls.add_snippets("markdown", {})
	end,
}

