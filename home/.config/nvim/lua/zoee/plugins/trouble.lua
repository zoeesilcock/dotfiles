function getTroubleMode()
  local trouble = require("trouble")
  local mode = "diagnostics"

  if (trouble.is_open("telescope")) then
    mode = "telescope"
  elseif (trouble.is_open("lsp_references")) then
    mode = "lsp_references"
  end

  return mode
end

return {
  {"folke/trouble.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    cmd = "Trouble",
    opts = {
      focus = true,
      auto_refresh = false,
    },
    keys = {
      {"<leader>xx", "<cmd>Trouble diagnostics toggle<CR>"},
      {"<leader>xq", "<cmd>Trouble qflist toggle<CR>"},
      {"<leader>xl", "<cmd>Trouble loclist toggle<CR>"},
      {"<leader>xn", function() require("trouble").next({ mode = getTroubleMode(), skip_groups = true, jump = true }) end, desc = "next trouble"},
      {"<leader>xp", function() require("trouble").prev({ mode = getTroubleMode(), skip_groups = true, jump = true }) end, desc = "previous trouble"},
    }
  },
}
