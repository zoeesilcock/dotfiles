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
    end,
  },
}
