local parsers = {
  "javascript",
  "typescript",
  "c_sharp",
  "markdown",
  "lua",
  "zig",
}

local filetypes_with_highlighting = {
  "javascript",
  "typescript",
  "typescriptreact",
  "cs",
  "csharp",
  "markdown",
  "lua",
  "zig"
}

return {
  {"nvim-treesitter/nvim-treesitter",
    branch = "main",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    },
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes_with_highlighting,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end
  },
  {"nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        max_lines = 5,
      })
    end
  },
}
