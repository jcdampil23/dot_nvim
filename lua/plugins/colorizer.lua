return {
	"norcalli/nvim-colorizer.lua",
	cond = not vim.g.vscode,
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("colorizer").setup()
	end,
}
