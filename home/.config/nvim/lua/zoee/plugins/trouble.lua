return {
  {"folke/trouble.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    keys = {
      {"<leader>xx", "<cmd>TroubleToggle<CR>"},
      {"<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>"},
      {"<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>"},
      {"<leader>xq", "<cmd>TroubleToggle quickfix<CR>"},
      {"<leader>xl", "<cmd>TroubleToggle loclist<CR>"},
      {"gr", "<cmd>TroubleToggle lsp_references<CR>"},
    }
  },
}
