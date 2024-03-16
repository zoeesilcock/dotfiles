return {
  {"MattesGroeger/vim-bookmarks",
    lazy = false,
    keys = {
      {"<C-e>", "<cmd>:BookmarkShowAll<CR>"},
    },
    config = function()
      vim.g.bookmark_auto_close = 1
      vim.g.bookmark_highlight_lines = 1
    end,
  },
}
