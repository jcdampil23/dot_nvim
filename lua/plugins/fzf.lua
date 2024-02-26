return {
	"ibhagwan/fzf-lua",
	event = "UIEnter",
	-- optional for icon support
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({
			fzf_opts = {
				["--layout"] = "reverse-list",
				["--preview"] = { default = "bat" },
			},
		})
	end,
}
