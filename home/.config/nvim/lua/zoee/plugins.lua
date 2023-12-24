local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "chriskempson/base16-vim",
    config = function()
      vim.opt.background = "dark"
      vim.cmd.colorscheme("base16-tomorrow-night")
    end
  },
  {"mbbill/undotree"},
  {"numToStr/Comment.nvim", opts = {}},
  {"tpope/vim-fugitive"},
  {"vim-syntastic/syntastic"},

  -- LSP and completion
  {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
  {"neovim/nvim-lspconfig"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/nvim-cmp"},
  {"L3MON4D3/LuaSnip"},

  -- LSP installation
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},

  -- Rust
  {"rust-lang/rust.vim"},
})
