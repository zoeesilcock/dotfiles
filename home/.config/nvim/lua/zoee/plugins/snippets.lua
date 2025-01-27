local function custom_snippets()
  local ls = require("luasnip")
  -- some shorthands...
  local s = ls.snippet
  local sn = ls.snippet_node

  local t = ls.text_node
  local i = ls.insert_node

  local f = ls.function_node
  local c = ls.choice_node
  local d = ls.dynamic_node
  local r = ls.restore_node

  local l = require("luasnip.extras").lambda
  local rep = require("luasnip.extras").rep
  local p = require("luasnip.extras").partial
  local m = require("luasnip.extras").match
  local n = require("luasnip.extras").nonempty
  local dl = require("luasnip.extras").dynamic_lambda
  local fmt = require("luasnip.extras.fmt").fmt
  local fmta = require("luasnip.extras.fmt").fmta
  local types = require("luasnip.util.types")
  local conds = require("luasnip.extras.conditions")
  local conds_expand = require("luasnip.extras.conditions.expand")

  ls.add_snippets("zig", {
    -- Boomer loop
    s("loop", {
      -- Variable
      t("var "),
      i(1, "index"),
      t(": u32 = 0;"),
      t({ "", "" }),
      -- While
      t("while ("),
      rep(1),
      t(" <= "),
      i(2, "count"),
      t(") : ("),
      rep(1),
      t({ " += 1) {", "\t" }),
      -- Body
      i(0),
      t({ "", "}" }),
    }),
  });

  ls.add_snippets("cs", {
    -- Unity Debug.Log
    s("log", {
      t('Debug.Log("'),
      i(0),
      t('", this);'),
    }),
  });
end

return {
  {"L3MON4D3/LuaSnip",
    dependencies = {"rafamadriz/friendly-snippets"},
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      custom_snippets()
    end
  }
}
