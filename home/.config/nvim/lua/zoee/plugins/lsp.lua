return {
  {"williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  {"williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "folke/trouble.nvim",
    },
    config = function()
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

      local default_setup = function(server)
        require("lspconfig")[server].setup({
          capabilities = lsp_capabilities,
        })
      end

      local ncat_executable = "nc"

      -- Use ncat on Windows.
      if package.config:sub(1,1) == "\\" then
        ncat_executable = "ncat"
      end

      require("lspconfig").gdscript.setup({
        cmd = { ncat_executable, "localhost", "6005" },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          -- Javascript
          "tsserver",
          "eslint",
          -- LUA
          "lua_ls",
          -- Rust and TOML
          "rust_analyzer",
          "taplo",
        },
        handlers = {
          default_setup,
          lua_ls = function()
            settings = {
              Lua = {
                diagnostics = {
                  globals = {
                    "vim",
                  }
                },
                telemetry = {
                  enabled = false,
                }
              }
            }
          end
        },
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

          vim.keymap.set("n", "gi", "<cmd>TroubleToggle lsp_implementations<cr>", opts)
          vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", opts)
          vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
          vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
          vim.keymap.set("n", "go", "<cmd>TroubleToggle lsp_type_definitions<cr>", opts)

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
