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

-- TODO: Switch to this when quick menu bug is fixed

-- return {
-- 	"ThePrimeagen/harpoon",
-- 	branch = "harpoon2",
-- 	dependencies = "nvim-lua/plenary.nvim",
-- 	config = function()
-- 		local harpoon = require("harpoon")
--
-- 		harpoon:setup()
--
-- 		vim.keymap.set("n", "<A-m>", function() harpoon:list():append() end)
-- 		vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- 		vim.keymap.set("n", "<A-n>", function() harpoon:list():select(1) end)
-- 		vim.keymap.set("n", "<A-e>", function() harpoon:list():select(2) end)
-- 		vim.keymap.set("n", "<A-i>", function() harpoon:list():select(3) end)
-- 		vim.keymap.set("n", "<A-o>", function() harpoon:list():select(4) end)
-- 		vim.keymap.set("n", "<A-h>", function() harpoon:list():select(5) end)
--       end,
--    }
