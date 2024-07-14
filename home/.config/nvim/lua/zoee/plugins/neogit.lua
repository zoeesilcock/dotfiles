return {
  {"NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    keys = {
      { "<leader>gs", "<cmd>Neogit<CR>", desc = "Launch neogit" },
      { "<leader>gd", "<cmd>DiffviewFileHistory %<CR>", mode = "n", desc = "Launch diffview for current file" },
      { "<leader>gd", "<cmd>'<,'>DiffviewFileHistory<CR>", mode = "v", desc = "Launch diffview for current line" },
    },
    config = function()
      require("neogit").setup()
      require("diffview").setup()
    end,
  },
  {"lewis6991/gitsigns.nvim",
    lazy = false,
    keys = {
      {
        "<leader>gb",
        function()
          require("gitsigns").blame_line{full=true}
        end,
        desc = "Show blame for current line",
      },
      {
        "<leader>gn",
        function()
          if not vim.wo.diff then
            require("gitsigns").nav_hunk("next")
          end
        end,
        desc = "Go to next hunk",
      },
      {
        "<leader>gp",
        function()
          if not vim.wo.diff then
            require("gitsigns").nav_hunk("prev")
          end
        end,
        desc = "Go to previous hunk",
      },
    },
    config = function()
      require("gitsigns").setup()
    end
  }
}
