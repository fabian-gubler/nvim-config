local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
	install_info = {
		url = 'https://github.com/milisims/tree-sitter-org',
		revision = 'main',
		files = { 'src/parser.c', 'src/scanner.cc' },
	},
	filetype = 'org',
}

require 'nvim-treesitter.configs'.setup {
	ensure_installed = 'all',

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { 'org' }
	},
}
