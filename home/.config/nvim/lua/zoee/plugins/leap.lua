return {
  {"ggandor/leap.nvim",
    lazy = false,
    config = function()
      vim.keymap.set({'n', 'x', 'o'}, 'ö',  '<Plug>(leap-forward)')
      vim.keymap.set({'n', 'x', 'o'}, 'Ö',  '<Plug>(leap-backward)')
      vim.keymap.set({'n', 'x', 'o'}, 'öö', '<Plug>(leap-from-window)')
    end,
  },
}