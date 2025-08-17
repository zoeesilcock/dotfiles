local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
  {"stevearc/conform.nvim",
    dependencies = {
      "zapling/mason-conform.nvim",
    },
    opts = {
      formatters_by_ft = {
        zig = { "zigfmt" },
        html = { "superhtml" },
        css = prettier,
        json = prettier,
        javascript = prettier,
        typescript = prettier,
        yaml = { "yamlfmt" }
      },
      format_on_save = {
        timeout_ms = 500,
      },
    },
  },
}
