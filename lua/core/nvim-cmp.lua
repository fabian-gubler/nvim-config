local vim = vim
local cmp = require'cmp'

vim.o.completeopt = "menu,menuone,noselect"
vim.opt.shortmess:append "c"

-- ... needed for jumping within snippets with tab ...
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
-- ... needed for jumping within snippets with tab ...

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
			end,
		},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
			cmp.select_next_item()
		  elseif vim.fn["vsnip#available"](1) == 1 then
			feedkey("<Plug>(vsnip-expand-or-jump)", "")
		  elseif has_words_before() then
			cmp.complete()
		  else
			fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
		  end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
		  if cmp.visible() then
			cmp.select_prev_item()
		  elseif vim.fn["vsnip#jumpable"](-1) == 1 then
			feedkey("<Plug>(vsnip-jump-prev)", "")
		  end
		end, { "i", "s" }),
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
