return {
	"ThePrimeagen/harpoon",

	keys = {
		{ "<A-m>", function() require'harpoon.mark'.add_file() end },
		{ "<C-h>", function() require'harpoon.ui'.toggle_quick_menu() end },
		{ "<A-n>", function() require'harpoon.ui'.nav_file(1) end },
		{ "<A-e>", function() require'harpoon.ui'.nav_file(2) end },
		{ "<A-i>", function() require'harpoon.ui'.nav_file(3) end },
		{ "<A-o>", function() require'harpoon.ui'.nav_file(4) end },
		{ "<A-h>", function() require'harpoon.ui'.nav_file(5) end },
	},

}
