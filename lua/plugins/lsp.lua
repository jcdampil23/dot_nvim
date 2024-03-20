return {
	"neovim/nvim-lspconfig",
	'hrsh7th/nvim-cmp',      -- Autocompletion plugin,
	'hrsh7th/cmp-nvim-lsp',  -- LSP source for nvim-cmp,
	'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
	'L3MON4D3/LuaSnip',      -- Snippets plugin
	{
		"williamboman/mason.nvim",
		event = "UIEnter",
		config = true,
	},
	"williamboman/mason-lspconfig.nvim"
}
