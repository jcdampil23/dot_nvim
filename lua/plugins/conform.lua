return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters = {
				biome = {
					condition = function(self, ctx)
						return vim.fs.find("biome.json", { upward = true, path = ctx.filename })[1]
					end,
				},
				prettier = {
					condition = function(self, ctx)
						return vim.fs.find(".prettierrc", { upward = true, path = ctx.filename })[1]
					end,
				},
				gofmt = {},
				goimports = {},
				golines = {},
				formatters = {
					csharpier = {
						args = { "--write-stdout", "--no-cache", "$FILENAME" },
					},
				},
			},
			formatters_by_ft = {
				javascript = { { "prettier", "biome" } },
				javascriptreact = { { "prettier", "biome" } },
				typescript = { { "prettier", "biome" } },
				typescriptreact = { { "prettier", "biome" } },
				svelte = { { "prettier", "biome" } },
				css = { { "prettier", "biome" } },
				html = { { "prettier", "biome" } },
				json = { { "prettier", "biome" } },
				yaml = { { "prettier", "biome" } },
				markdown = { { "prettier", "biome" } },
				graphql = { { "prettier", "biome" } },
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "gofmt", "goimports", "golines" },
				cs = { "csharpier" }

			},
			format_on_save = {
				lsp_fallback = true,
				async = true,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 2000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
