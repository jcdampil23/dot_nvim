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
        blade = { "blade-formatter" },
        javascript = { "prettierd", "prettier", "biome", stop_after_first = true },
        php = { "blade-formatter" },
        javascriptreact = { "prettierd", "prettier", "biome", stop_after_first = true },
        typescript = { "prettierd", "prettier", "biome", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", "biome", stop_after_first = true },
        svelte = { "prettierd", "prettier", "biome", stop_after_first = true },
        css = { "prettierd", "prettier", "biome", stop_after_first = true },
        html = { "prettierd", "prettier", "biome", stop_after_first = true },
        json = { "prettierd", "prettier", "biome", stop_after_first = true },
        markdown = { "prettierd", "prettier", "biome", stop_after_first = true },
        graphql = { "prettierd", "prettier", "biome", stop_after_first = true },
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "gofmt", "goimports", "golines" },
        cs = { "csharpier" },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      conform.format({
        lsp_fallback = true,
        async = true,
        timeout_ms = 3000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
