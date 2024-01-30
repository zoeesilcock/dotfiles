return {
  {"ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {"<leader>a", function() require("harpoon"):list():append() end, desc = "harpoon file"},
      {"<C-e>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu"},
      {"<A-1>", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1"},
      {"<A-2>", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2"},
      {"<A-3>", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3"},
      {"<A-4>", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4"},
      {"<A-5>", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5"},
      {"<C-S-P>", function() require("harpoon"):list():prev() end, desc = "harpoon to previous file"},
      {"<C-S-N>", function() require("harpoon"):list():next() end, desc = "harpoon to next file"},
    },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({})
      harpoon:extend({
        UI_CREATE = function(cx)
          vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
          end, { buffer = cx.bufnr })
          vim.keymap.set("n", "<C-x>", function()
            harpoon.ui:select_menu_item({ split = true })
          end, { buffer = cx.bufnr })
        end,
      })
    end,
  }
}
