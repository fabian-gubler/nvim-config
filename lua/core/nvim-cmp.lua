local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

luasnip.filetype_extend("typescriptreact", { "javascript" })
luasnip.filetype_extend("typescriptreact", { "html" })

require("luasnip.loaders.from_vscode").load({ include = { "lua", "javascript", "html", "css", "python" } })

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	formatting = {
		fields = { "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "luasnip", max_item_count = 5 },
		{ name = "nvim_lsp", max_item_count = 5 },
		{ name = "buffer", max_item_count = 5 },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
	documentation = {
		border = "rounded",
		winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
		max_width = 50,
		min_width = 50,
		max_height = math.floor(vim.o.lines * 0.4),
		min_height = 3,
	},
	experimental = {
		native_menu = false,
		ghost_text = false,
	},
})

