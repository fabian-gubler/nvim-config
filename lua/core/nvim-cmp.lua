local vim = vim
local cmp = require'cmp'

vim.o.completeopt = "menu,menuone,noselect"
vim.opt.shortmess:append "c"

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp', max_item_count = 4 },
      { name = 'nvim_lua' },
      { name = 'vsnip', max_item_count = 4 },
	  { name = 'path'},
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
