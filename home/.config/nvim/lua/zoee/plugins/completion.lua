return {
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local cmp_action = require("lsp-zero").cmp_action()

      cmp.setup({
        preselect = "none",
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({select = true}),
          ["<Tab>"] = cmp_action.luasnip_supertab(),
          ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
        })
      })
    end,
  },
}
