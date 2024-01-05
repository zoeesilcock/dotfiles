return {
  {"williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  {"VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {"L3MON4D3/LuaSnip"},
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.preset("recommended")

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
      end)
      lsp_zero.setup()
    end,
  },
  {"williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "VonHeikemen/lsp-zero.nvim",
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig();

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
          lsp_zero.default_setup,
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
