vim.pack.add({"https://github.com/L3MON4D3/LuaSnip.git"})

require("dfconfig.functions")
require("luasnip.loaders.from_lua").lazy_load()
local ls = require("luasnip")

ls.config.set_config({
  region_check_events = 'InsertEnter',
  delete_check_events = 'InsertLeave',
  enable_autosnippets = true,
})

key_add({"i"}, "<C-k>", function() ls.expand() end, {silent = true})
key_add({"i", "s"}, "<C-l>", function() ls.jump( 1) end, {silent = true})
key_add({"i", "s"}, "<C-,>", function() ls.jump(-1) end, {silent = true})
key_add({"i", "s"}, "<C-.>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, {silent = true})
