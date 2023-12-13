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


-- return {
-- 	"ThePrimeagen/harpoon",
-- 	branch = "harpoon2",
-- 	config = function()
-- 		local harpoon = require("harpoon")
--
-- 		harpoon:setup()
--
-- 		vim.keymap.set("n", "<A-m>", function()
-- 			harpoon:list():append()
-- 		end)
--
-- 		vim.keymap.set("n", "<C-h>", function()
-- 			harpoon.ui:toggle_quick_menu(harpoon:list())
-- 		end)
--
-- 		vim.keymap.set("n", "<A-n>", function()
-- 			harpoon:list():select(1)
-- 		end)
--
-- 		vim.keymap.set("n", "<A-e>", function()
-- 			harpoon:list():select(2)
-- 		end)
--
-- 		vim.keymap.set("n", "<A-i>", function()
-- 			harpoon:list():select(3)
-- 		end)
--
-- 		vim.keymap.set("n", "<A-o>", function()
-- 			harpoon:list():select(4)
-- 		end)
--
-- 		vim.keymap.set("n", "<A-h>", function()
-- 			harpoon:list():select(5)
-- 		end)
-- 	end,
-- }
