  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  -- cmp.setup.filetype('gitcommit', {
  --   sources = cmp.config.sources({
  --     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  --   }, {
  --     { name = 'buffer' },
  --   })
  -- })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --   capabilities = capabilities
  -- }


-- local cmp_status_ok, cmp = pcall(require, "cmp")
-- if not cmp_status_ok then
-- 	return
-- end
--
-- local check_backspace = function()
-- 	local col = vim.fn.col(".") - 1
-- 	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
-- end
--
-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not snip_status_ok then
-- 	return
-- end
--
-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			require("luasnip").lsp_expand(args.body)
-- 		end,
-- 	},
-- 	mapping = {
-- 		["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 		["<Tab>"] = cmp.mapping(function(fallback)
-- 			if luasnip.expandable() then
-- 				luasnip.expand()
-- 			-- elseif luasnip.expand_or_jumpable() then
-- 			-- 	luasnip.expand_or_jump()
-- 			elseif check_backspace() then
-- 				fallback()
-- 			else
-- 				fallback()
-- 			end
-- 		end, {
-- 			"i",
-- 			"s",
-- 		}),
-- 		["<C-n>"] = cmp.mapping(function(fallback)
-- 			if luasnip.expand_or_jumpable() then
-- 				luasnip.expand_or_jump()
-- 			elseif check_backspace() then
-- 				fallback()
-- 			else
-- 				fallback()
-- 			end
-- 		end, {
-- 			"i",
-- 			"s",
-- 		}),
-- 		["<C-p>"] = cmp.mapping(function(fallback)
-- 			if luasnip.jumpable(-1) then
-- 				luasnip.jump(-1)
-- 			else
-- 				fallback()
-- 			end
-- 		end, {
-- 			"i",
-- 			"s",
-- 		}),
-- 	},
-- 	formatting = {
-- 		fields = { "abbr", "menu" },
-- 		format = function(entry, vim_item)
-- 			vim_item.menu = ({
-- 				nvim_lsp = "[LSP]",
-- 				luasnip = "[Snippet]",
-- 				buffer = "[Buffer]",
-- 				path = "[Path]",
-- 			})[entry.source.name]
-- 			return vim_item
-- 		end,
-- 	},
-- 	sources = {
-- 		{ name = "luasnip", max_item_count = 5 },
-- 		{ name = "nvim_lsp", max_item_count = 5 },
-- 		{ name = "buffer", max_item_count = 5 },
-- 		{ name = "nvim_lua" },
-- 		{ name = "path" },
-- 		{ name = "latex_symbols" },
-- 	},
-- 	documentation = {
-- 		border = "rounded",
-- 		winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
-- 		max_width = 50,
-- 		min_width = 50,
-- 		max_height = math.floor(vim.o.lines * 0.4),
-- 		min_height = 3,
-- 	},
-- 	experimental = {
-- 		native_menu = false,
-- 		ghost_text = false,
-- 	},
-- })
--
