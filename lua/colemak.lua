-- Mappings originate from:
-- https://github.com/jooize/vim-colemak

local map = vim.api.nvim_set_keymap
local opt = { noremap = true }
local cmd = vim.cmd

-- Navigation                 [Key]   [Action]     [Mode]
map('', 'm', 'h', opt)    --    m       left         any
map('', 'i', 'l', opt)    --    i       right        any
map('', 'n', 'j', opt)    --    j       down         any
map('', 'e', 'k', opt)    --    k       up           any

map('', 'l', 'b', opt)    --    l       back         any
map('', 'L', 'B', opt)    --    L       back         any
map('', 'y', 'w', opt)    --    y       forward      any
map('', 'Y', 'W', opt)    --    Y       forward      any
map('', 'u', 'e', opt)    --    u       end          any
map('', 'U', 'E', opt)    --    U       end          any


map('', 'a', 'v', opt)    --    a       visual       any
map('', 'A', 'V', opt)    --    A       visual       any
map('', 'p', 't', opt)    --    p       find         any
map('', 'P', 'T', opt)    --    P       find         any

-- Operation
map('n', 's', 'i', opt)   --    s       insert       normal
map('n', 'S', 'I', opt)   --    S       insert       normal
map('n', 't', 'a', opt)   --    t       append       normal
map('n', 'T', 'A', opt)   --    T       append       normal
map('n', 'w', 'c', opt)   --    w       change       normal
map('x', 'w', 'c', opt)   --    w       change       visual

map('x', 'x', 'd', opt)   --    x       cut          visual
map('', 'c', 'y', opt)    --    c       copy         any
map('n', 'C', 'yy', opt)  --    C       copy         normal
map('x', 'C', 'y', opt)   --    C       copy         visual
map('', 'v', 'p', opt)    --    v       paste        any
map('', 'V', 'P', opt)    --    v       paste        any


-- MISC
map('v', 'b', 'u', opt)   --    b       case         visual & select
map('v', 'B', 'U', opt)   --    B       case         visual & select
map('n', 'b', 'z', opt)   --    b       fold         normal
map('n', 'z', 'u', opt)   --    z       undo         normal
map('x', 'z', ':<C-U>undo<cr>', opt) -- undo         visual
map('n', 'Z', '<C-R>', opt)          -- redo         normal
map('x', 'Z', ':<C-U>redo<cr>', opt) -- redo         visual
map('o', 'r', 'i', opt)   --    *r*     inner        operator pending


-- no idea how this works
cmd([[
  " Make insert/add work also in visual line mode
  xnoremap <silent> <expr> s (mode() =~# "[V]" ? "\<C-V>0o$I" : "I")
  xnoremap <silent> <expr> S (mode() =~# "[V]" ? "\<C-V>0o$I" : "I")
  xnoremap <silent> <expr> t (mode() =~# "[V]" ? "\<C-V>0o$A" : "A")
  xnoremap <silent> <expr> T (mode() =~# "[V]" ? "\<C-V>0o$A" : "A")
]])
