local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
  {"stevearc/conform.nvim",
    dependencies = {
      "zapling/mason-conform.nvim",
    },
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        zig = { "zigfmt" },
        html = { "superhtml" },
        css = prettier,
        json = prettier,
        javascript = prettier,
        javascriptreact = prettier,
        typescript = prettier,
        typescriptreact = prettier,
        yaml = { "yamlfmt" }
      },
      format_on_save = {
        timeout_ms = 500,
      },
    },
  },
}
