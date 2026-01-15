return {
  {"nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim"
    },
    keys = {
      {"<C-p>", "<cmd>Telescope frecency workspace=CWD<CR>"},
      {"<leader>p", "<cmd>Telescope git_files<CR>"},
      {"<leader>ff", "<cmd>Telescope live_grep<CR>"},
      {"<leader>fw", "<cmd>Telescope grep_string<CR>"},
      {"<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<CR>"},
      {"<leader>fh", "<cmd>Telescope help_tags<CR>"},
      {"<leader>fo", "<cmd>Telescope buffers<CR>"},
    },
    config = function()
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")
      local open_with_trouble = require("trouble.sources.telescope").open

      function vim.getVisualSelection()
        vim.cmd("noau normal! \"vy\"")
        local text = vim.fn.getreg("v")
        vim.fn.setreg("v", {})

        text = string.gsub(text, "\n", "")
        if #text > 0 then
          return text
        else
          return ""
        end
      end

      -- Grep for the current selection in all files.
      vim.keymap.set("v", "<leader>fw", function()
        local text = vim.getVisualSelection()
        builtin.grep_string({ default_text = text, use_regex = false })
      end, opts)

      -- Fuzzy find the current selection in the current buffer.
      vim.keymap.set("v", "<leader>fb", function()
        local text = vim.getVisualSelection()
        builtin.current_buffer_fuzzy_find({ default_text = text })
      end, opts)

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-l>"] = open_with_trouble,
            },
            n = {
              ["<C-l>"] = open_with_trouble
            },
          },
          file_ignore_patterns = {
            "node_modules"
          }
        },
        extensions = {
          frecency = {
            matcher = "fuzzy",
          },
        },
      })
    end
  },
  {"nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = {"nvim-telescope/telescope.nvim"},
    config = function()
      require("telescope").load_extension("fzf")
    end
  },
  {"nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")
    end
  },
}
