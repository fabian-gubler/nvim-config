-- Mappings originate from:
-- https://github.com/jooize/vim-colemak

local map = vim.api.nvim_set_keymap
local opt = { noremap = true }
local cmd = vim.cmd

-- Navigation                 [Key]   [Action]     [Mode]
map('n', 'm', 'h', opt)    --    m       left         any
map('n', 'i', 'l', opt)    --    i       right        any
map('n', 'n', 'j', opt)    --    j       down         any
map('n', 'e', 'k', opt)    --    k       up           any

map('x', 'm', 'h', opt)    --    m       left         any
map('x', 'i', 'l', opt)    --    i       right        any
map('x', 'n', 'j', opt)    --    j       down         any
map('x', 'e', 'k', opt)    --    k       up           any

map('o', 'm', 'h', opt)    --    m       left         any
map('o', 'i', 'l', opt)    --    i       right        any
map('o', 'n', 'j', opt)    --    j       down         any
map('o', 'e', 'k', opt)    --    k       up           any

map('n', 'a', 'v', opt)    --    a       visual       any
map('n', 'A', 'V', opt)    --    A       visual       any

map('x', 'a', 'v', opt)    --    a       visual       any
map('x', 'A', 'V', opt)    --    A       visual       any

map('n', 'l', 'b', opt)    --    l       back         any
map('o', 'l', 'b', opt)    --    l       back         any
map('x', 'l', 'b', opt)    --    l       back         any

map('n', 'L', 'B', opt)    --    L       back         any
map('o', 'L', 'B', opt)    --    L       back         any
map('x', 'L', 'B', opt)    --    L       back         any

map('n', 'y', 'w', opt)    --    y       forward      any
map('o', 'y', 'w', opt)    --    y       forward      any
map('x', 'y', 'w', opt)    --    y       forward      any

map('n', 'Y', 'W', opt)    --    L       back         any
map('o', 'Y', 'W', opt)    --    L       back         any
map('x', 'Y', 'W', opt)    --    L       back         any

map('', 'y', 'w', opt)    --    y       forward      any
map('', 'Y', 'W', opt)    --    Y       forward      any
map('', 'u', 'e', opt)    --    u       end          any
map('', 'U', 'E', opt)    --    U       end          any

map('n', 'p', 't', opt)
map('o', 'p', 't', opt)
map('x', 'p', 't', opt)

map('n', 'P', 'T', opt)
map('o', 'P', 'T', opt)
map('x', 'P', 'T', opt)

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

map('n', 'v', 'p', opt)
map('o', 'v', 'p', opt)
map('x', 'v', 'p', opt)

map('n', 'V', 'P', opt)
map('x', 'V', 'P', opt)
map('o', 'V', 'P', opt)

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
