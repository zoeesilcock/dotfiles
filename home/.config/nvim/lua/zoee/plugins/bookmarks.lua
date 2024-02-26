return {
  {"MattesGroeger/vim-bookmarks",
    keys = {
      {"<C-e>", "<cmd>:BookmarkShowAll<CR>"},
    },
    config = function()
      vim.g.bookmark_auto_close = 1
      vim.g.bookmark_highlight_lines = 1
    end,
  },
}
