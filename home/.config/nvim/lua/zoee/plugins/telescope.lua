return {
  {"nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim"
    },
    keys = {
      {"<C-p>", "<cmd>Telescope find_files<CR>"},
      {"<leader>p", "<cmd>Telescope git_files<CR>"},
      {"<leader>ff", "<cmd>Telescope live_grep<CR>"},
      {"<leader>fw", "<cmd>Telescope grep_string<CR>"},
      {"<leader>fh", "<cmd>Telescope help_tags<CR>"},
    },
    config = function()
      local actions = require("telescope.actions")
      local trouble = require("trouble.providers.telescope")

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<c-t>"] = trouble.open_with_trouble,
            },
            n = {
              ["<c-t>"] = trouble.open_with_trouble
            },
          },
          file_ignore_patterns = {
            "node_modules"
          }
        }
      })
    end
  },
  {"nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = {"nvim-telescope/telescope.nvim"},
    config = function()
      require("telescope").load_extension("fzf")
    end
  }
}
