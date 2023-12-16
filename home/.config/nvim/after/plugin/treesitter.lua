require("nvim-treesitter.configs").setup {
  ensure_installed = { "javascript", "c_sharp", "markdown", "gdscript", "lua" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
