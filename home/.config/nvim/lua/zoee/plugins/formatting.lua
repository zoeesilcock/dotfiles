return {
  {"sbdchd/neoformat",
    config = function()
      vim.g.neoformat_try_node_exe = 1

      vim.api.nvim_create_autocmd({"BufWritePre"}, {
        pattern = {"*.js"},
        command = "Neoformat",
      })
    end
  },
}
