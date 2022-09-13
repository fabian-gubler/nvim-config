local ls = require("luasnip")

-- Load all VSCode snippets
require("luasnip.loaders.from_vscode").load()

-- Custom Snippets
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.add_snippets("markdown", {
	snip({
		trig = "figure",
	}, {
		text({ "<figure markdown>", "  ![Image](" }),
		insert(1, "/path/to/file"),
		text({ "){width='300'}", "  <figcaption>" }),
		insert(2, "caption"),
		text({ "</figcaption>", "</figure>" }),
	}),
	snip({
		trig = "anki",
	}, {
		text({ "## " }),
		insert(1, "Title"),
		text({ "", "%", "" }),
		insert(2, "Description"),
	}),
})
