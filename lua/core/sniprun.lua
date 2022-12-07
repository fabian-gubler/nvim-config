require'sniprun'.setup({
  selected_interpreters = {},     --# use those instead of the default for the current filetype
  repl_enable = {"Python3_original","python"},               --# enable REPL-like behavior for the given interpreters
  repl_disable = {},              --# disable REPL-like behavior for the given interpreters
  display = {"Classic"},

  interpreter_options = {         --# interpreter-specific options, see docs / :SnipInfo <name>

    --# use the interpreter name as key
    GFM_original = {
      use_on_filetypes = {"markdown.pandoc"}    --# the 'use_on_filetypes' configuration key is
                                                --# available for every interpreter
    },
    Python3_original = {
        error_truncate = "auto"         --# Truncate runtime errors 'long', 'short' or 'auto'
                                        --# the hint is available for every interpreter
                                        --# but may not be always respected
    }
  },      

})
