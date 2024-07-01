return {
  {"folke/trouble.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    cmd = "Trouble",
    opts = {
      focus = true,
      auto_refresh = false,
    },
    keys = {
      {"<leader>xx", "<cmd>Trouble diagnostics toggle<CR>"},
      {"<leader>xq", "<cmd>Trouble qflist toggle<CR>"},
      {"<leader>xl", "<cmd>Trouble loclist toggle<CR>"},
      {"<leader>xn", function() require("trouble").next({ mode = "diagnostics", skip_groups = true, jump = true }) end, desc = "next trouble"},
      {"<leader>xp", function() require("trouble").previous({ mode = "diagnostics", skip_groups = true, jump = true }) end, desc = "previous trouble"},
    }
  },
}
