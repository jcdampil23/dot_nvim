return {
	"mbbill/undotree",
	cond = not vim.g.vscode,
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
	},
	init = function()
		vim.cmd("let g:undotree_SetFocusWhenToggle = 1")
	end,
}
