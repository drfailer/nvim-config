--------------------------------------------------------------------------------
--                                  snippets                                  --
--------------------------------------------------------------------------------

-- snipmate like snippet load
require("luasnip.loaders.from_snipmate").lazy_load()
local ls = require("luasnip")

ls.config.set_config({
  region_check_events = 'InsertEnter',
  delete_check_events = 'InsertLeave'
})

vim.keymap.set({"i"}, "<C-j>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<M-l>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<M-h>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-e>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, {silent = true})
