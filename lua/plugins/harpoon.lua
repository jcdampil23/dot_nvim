return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "UIEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
			},
		})

		local keymap = vim.keymap.set
		keymap("n", "<leader>a", function()
			harpoon:list():append()
		end, { desc = "Add to harpoon list" })

		keymap("n", "<leader>e", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open harpoon list" })

		keymap("n", "<C-j>", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon Item 1" })

		keymap("n", "<C-k>", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon Item 2" })

		keymap("n", "<C-l>", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon Item 3" })

		keymap("n", "<C-;>", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon Item 4" })

		keymap("n", "<C-n>", function()
			harpoon:list():select(5)
		end, { desc = "Harpoon Item 5" })
	end,
}
