return {
  {"folke/trouble.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    keys = {
      {"<leader>xx", "<cmd>TroubleToggle<CR>"},
      {"<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>"},
      {"<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>"},
      {"<leader>xq", "<cmd>TroubleToggle quickfix<CR>"},
      {"<leader>xl", "<cmd>TroubleToggle loclist<CR>"},
      {"<leader>xn", function() require("trouble").next({ skip_groups = true, jump = true }) end, desc = "next trouble"},
      {"<leader>xp", function() require("trouble").previous({ skip_groups = true, jump = true }) end, desc = "previous trouble"},
    }
  },
}
