return {
	{
		"VonHeikemen/lsp-zero.nvim",
		cond = not vim.g.vscode,
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"williamboman/mason.nvim",
		event = "UIEnter",
		config = true,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		cond = not vim.g.vscode,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
			{ "hrsh7th/cmp-path" },
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			-- And you can configure cmp even more, if you want to.
			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()

			cmp.setup({
				window = {
					completion = cmp.config.window.bordered({}),
					documentation = cmp.config.window.bordered({}),
				},
				formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }, { "i", "n", "s" }),
					["<S-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "n", "s" }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
						if cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						else
							fallback()
						end
					end, { "i", "s", "c" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
						else
							fallback()
						end
					end, { "i", "s", "c" }),
				}),
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cond = not vim.g.vscode,
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, { buffer = bufnr, remap = false, desc = "Go to definition" })

				vim.keymap.set("n", "<leader>i", function()
					vim.lsp.buf.hover()
				end, { buffer = bufnr, remap = false, desc = "Hover Type" })

				vim.keymap.set("n", "<leader>o", function()
					vim.diagnostic.open_float()
				end, { buffer = bufnr, remap = false, desc = "Open diagnostic" })

				vim.keymap.set("n", "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, { buffer = bufnr, remap = false, desc = "Code action" })
			end)

			require("mason-lspconfig").setup({
				ensure_installed = { "html", "cssls", "vtsls", "clangd", "biome", "eslint", "lua_ls", "gopls" },
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						-- (Optional) Configure lua language server for neovim
						local lua_opts = lsp_zero.nvim_lua_ls()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup(lua_opts)
					end,
				},
			})
		end,
	},
}
