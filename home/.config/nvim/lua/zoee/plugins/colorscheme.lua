return {
  -- {"chriskempson/base16-vim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.opt.background = "dark"
  --     vim.cmd.colorscheme("base16-tomorrow-night")
  --   end
  -- }
  {"catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        no_italic = true,
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  }
}
