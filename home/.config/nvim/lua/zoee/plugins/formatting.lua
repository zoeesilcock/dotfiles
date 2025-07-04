return {
  {"sbdchd/neoformat",
    config = function()
      vim.g.neoformat_try_node_exe = 1

      vim.api.nvim_create_autocmd({"BufWritePre"}, {
        pattern = {"*.ts,*.tsx"},
        command = "Neoformat prettier",
      })
    end
  },
}
