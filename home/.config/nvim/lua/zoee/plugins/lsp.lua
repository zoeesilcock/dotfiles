return {
  {"mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "folke/trouble.nvim",
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup()

      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("*", {
        capabilities = lsp_capabilities,
      })

      -- Use ncat on Windows.
      local ncat_executable = "nc"
      if package.config:sub(1,1) == "\\" then
        ncat_executable = "ncat"
      end

      require("lspconfig").gdscript.setup({
        cmd = { ncat_executable, "localhost", "6005" },
      })

      require("lspconfig").zls.setup({
        cmd = { "zls", "--config-path", "zls.json" },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local opts = {buffer = event.buf}

          -- these will be buffer-local keybindings
          -- because they only work if you have an active language server
          vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
          vim.keymap.set("n", "<leader>S", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

          vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
          vim.keymap.set({"n", "x"}, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
          vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

          vim.keymap.set("n", "gi", "<cmd>Trouble lsp_implementations toggle<cr>", opts)
          vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references toggle<cr>", opts)
          vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
          vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
          vim.keymap.set("n", "go", "<cmd>Trouble lsp_type_definitions toggle<cr>", opts)

          -- Diagnostics
          vim.diagnostic.config({ virtual_text = false })
          vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)

          -- Inlay hints
          vim.keymap.set("n", "<leader>h", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", opts)
        end
      })
    end,
  },
}
