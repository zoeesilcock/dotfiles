local lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)
lsp_zero.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver', 'eslint', 'lua_ls'},
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  })
})
