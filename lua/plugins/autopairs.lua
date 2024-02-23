return {
	"windwp/nvim-autopairs",
	cond = not vim.g.vscode,
	event = "InsertEnter",
	lazy = true,
	opts = {}, -- this is equalent to setup({}) function
}
