return {
  {"dmtrKovalenko/fff.nvim",
    build = function()
      -- downloads a prebuilt binary or falls back to cargo build
      require("fff.download").download_or_build_binary()
    end,
    opts = {
      layout = {
        preview_position = "left",
      },
      git = {
        status_text_color = true,
      },
      -- debug = {
      --   enabled = true,
      --   show_scores = true,
      -- },
    },
    lazy = false,
    keys = {
      { "<C-p>", function() require("fff").find_files() end, desc = "FFFind files" },
      { "<leader>ff", function() require("fff").live_grep() end, desc = "LiFFFe grep" },
      { "<leader>fz",
        function() require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } }) end,
        desc = "Live fffuzy grep",
      },
      { "<leader>fw",
        function() require("fff").live_grep({ query = vim.fn.expand("<cword>") }) end,
        desc = "Search current word",
      },
    },
  },
}
