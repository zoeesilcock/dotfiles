return {
  {"https://codeberg.org/andyg/leap.nvim",
    keys = {
      { "<leader>j", "<Plug>(leap-forward)", mode = {"n", "x", "o"}, desc = "Leap forward" },
      { "<leader>k", "<Plug>(leap-backward)", mode = {"n", "x", "o"}, desc = "Leap backward" },
      { "<leader>l", "<Plug>(leap-from-window)", mode = {"n", "x", "o"}, desc = "Leap in other window" },
    },
  },
}
