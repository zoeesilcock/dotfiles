return {
  {"nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {"nvim-lua/plenary.nvim"},
    keys = {
      {"<C-p>", "<cmd>Telescope find_files<CR>"},
      {"<leader>ff", "<cmd>Telescope live_grep<CR>"},
      {"<leader>fw", "<cmd>Telescope grep_string<CR>"},
      {"<leader>h", "<cmd>Telescope help_tags<CR>"},
    },
    config = function()
      require("telescope").setup{
        defaults = {
          file_ignore_patterns = {
            "node_modules"
          }
        }
      }
    end
  }
}
