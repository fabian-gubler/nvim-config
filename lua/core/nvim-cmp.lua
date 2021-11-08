local cmp = require'cmp'

vim.o.completeopt = "menu,menuone,noselect"
vim.opt.shortmess:append "c"

  cmp.setup({
    -- snippet = {
    --   expand = function(args)
    --     vim.fn["vsnip#anonymous"](args.body)
    --   end,
    -- },
    mapping = {
	  -- ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	  -- ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      -- ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      -- { name = 'vsnip' },
	  { name = 'path'},
	  -- { name = "latex_symbols" },
	  -- { name = 'orgmode' },
      { name = 'buffer' },
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
		native_menu=false;
		ghost_text=false;
	}
  })
