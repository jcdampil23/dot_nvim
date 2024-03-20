return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		local Path = require("plenary.path")
		local function normalize_path(buf_name, root)
			return Path:new(buf_name):make_relative(root)
		end
		harpoon:setup({
			default = {
				create_list_item = function(config, name)
					name = name
						or normalize_path(
							vim.api.nvim_buf_get_name(
								vim.api.nvim_get_current_buf()
							),
							config.get_root_dir()
						)

					local bufnr = vim.fn.bufnr(name, false)
					local pos = { 1, 0 }
					if bufnr ~= -1 then
						pos = vim.api.nvim_win_get_cursor(0)
					end

					return {
						value = vim.fn.expand('%:p'),
						context = {
							row = pos[1],
							col = pos[2],
							name = name
						},
					}
				end,
				display = function(list_item)
					local name = list_item.context.name

					local windowWidth = vim.api.nvim_win_get_width(0)
					local ui_fallback_width = 69;
					local ui_width_ratio = 0.62569;

					local truncateAt = math.floor(windowWidth * ui_width_ratio)

					if truncateAt < ui_fallback_width then
						truncateAt = ui_fallback_width
					end

					if (string.len(name) >= truncateAt) then
						name = Path:new(name):shorten(2)
					end

					return name
				end,

			}
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
