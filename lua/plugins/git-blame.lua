return {
	"f-person/git-blame.nvim",
	cond = not vim.g.vscode,
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
}
