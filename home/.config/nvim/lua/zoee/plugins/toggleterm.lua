return {
  {"akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-j>", "<cmd>lua _lazygit_toggle()<CR>", desc = "Toggle terminal" },
    },
    opts = {
      open_mapping = [[<C-j>]],
      start_in_insert = true,
      insert_mappings = false,
      direction = "float",
    }
  },
}
