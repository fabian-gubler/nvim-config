return {
	"hrsh7th/nvim-cmp",
	config = function()
		-- Setup nvim-cmp.
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local icons = require("icons")

		cmp.setup({
         preselect = cmp.PreselectMode.None,
			snippet = {
				expand = function(args) require("luasnip").lsp_expand(args.body) end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<c-y>"] = cmp.mapping(
					cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					{ "i", "c" }
				),

				["<Tab>"] = cmp.mapping(function(fallback)
					if luasnip.expandable() then
						luasnip.expand()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
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
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					vim_item.kind = icons.kind[vim_item.kind]
					vim_item.menu = ({
						nvim_lsp = "",
						nvim_lua = "",
						luasnip = "",
						buffer = "",
						path = "",
						emoji = "",
					})[entry.source.name]
					return vim_item
				end,
			},
			sources = cmp.config.sources({
				-- { name = "copilot", group_index = 2 },
				{ name = "path" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip", max_item_count = 5 },
				{ name = "nvim_lsp", max_item_count = 8 },
				{ name = "nvim_lua", max_item_count = 5 },
				{ name = "buffer", keyword_length = 3 },
			}),
			experimental = {
				ghost_text = false,
			},
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("markdown", {
			sources = cmp.config.sources({
				{ name = "luasnip", keyword_length = 3 },
			}),
		})
	end,
	dependencies = {
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "saadparwaiz1/cmp_luasnip" },
	},
}
