return {
  {"NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    keys = {
      { "<leader>gs", "<cmd>Neogit kind=split_above<CR>", desc = "Launch neogit" },
    },
    config = true
  },
  {"lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  }
}
