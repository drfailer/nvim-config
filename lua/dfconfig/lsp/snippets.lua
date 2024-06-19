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

-- -- luasnip mappings
vim.keymap.set({"i"}, "<Tab>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    else
        local tabkey = ""
        for i=1,vim.o.tabstop do
            tabkey = tabkey.." "
        end
        vim.api.nvim_feedkeys(tabkey, "i", true)
    end
end, {silent = true})
vim.keymap.set({"s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
