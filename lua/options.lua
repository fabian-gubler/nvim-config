local vim = vim
local o = vim.opt
local g = vim.g
local home = os.getenv( "HOME" )
local cmd = vim.cmd
local indent = 4

-- Global
g.nvim_tree_quit_on_open = 1
g.auto_save = 1
g.auto_save_silent = 1
g.EasyMotion_keys='arstdhneioqwfpluygmbjzxcvk1234567890,'
g.nord_borders = 'true'

-- Options
o.relativenumber = true
o.showmode = false
o.cursorline = false
o.swapfile = false
o.splitbelow = true
o.splitright = true
o.ignorecase = true
o.smartcase = true
o.undofile = true
o.undodir = home .. '/.local/share/nvim/undodir'
o.clipboard = "unnamedplus"
o.smartindent = true
o.wrap = false
o.timeoutlen = 100
o.shiftwidth = indent
o.tabstop = indent
o.softtabstop = indent
o.expandtab = false

-- Autocommands
cmd 'au VimEnter * :set showtabline=0'
cmd 'au VimEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
cmd 'au CmdlineEnter /,? :set hlsearch'
cmd 'au CmdlineLeave /,? :set nohlsearch'

cmd 'autocmd FileType typescript setlocal ts=2 sts=2 sw=2'
-- Set barbar's options
-- Testing Crontab

vim.g.bufferline = {
  -- Enable/disable animations
  animation = false,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = false,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  exclude_ft = {''},
  exclude_name = {''},

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = true,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '',
  icon_separator_inactive = '',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}
