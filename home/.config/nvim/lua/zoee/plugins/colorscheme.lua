return {
  {"chriskempson/base16-vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      vim.cmd.colorscheme("base16-tomorrow-night")
    end
  }
}
