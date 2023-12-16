return {
	"ThePrimeagen/harpoon",

	keys = {
		{ "<A-m>", "<cmd>lua require'harpoon.mark'.add_file()<CR>" },
		{ "<C-h>", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<CR>" },
		{ "<A-n>", "<cmd>lua require'harpoon.ui'.nav_file(1)<CR>" },
		{ "<A-e>", "<cmd>lua require'harpoon.ui'.nav_file(2)<CR>" },
		{ "<A-i>", "<cmd>lua require'harpoon.ui'.nav_file(3)<CR>" },
		{ "<A-o>", "<cmd>lua require'harpoon.ui'.nav_file(4)<CR>" },
		{ "<A-h>", "<cmd>lua require'harpoon.ui'.nav_file(5)<CR>" },
	},

}
