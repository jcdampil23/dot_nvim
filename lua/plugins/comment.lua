return {
	"numToStr/Comment.nvim",
	cond = not vim.g.vscode,
	opts = {
		-- add any options here
	},
	lazy = true,
	event = { "InsertEnter" },
}
