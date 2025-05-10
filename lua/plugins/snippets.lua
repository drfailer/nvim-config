return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  config = function()
    require("luasnip.loaders.from_lua").lazy_load()
    local ls = require("luasnip")

    ls.config.set_config({
      region_check_events = 'InsertEnter',
      delete_check_events = 'InsertLeave',
      enable_autosnippets = true,
    })

    vim.keymap.set({"i"}, "<C-j>", function() ls.expand() end, {silent = true})
    vim.keymap.set({"i", "s"}, "<M-l>", function() ls.jump( 1) end, {silent = true})
    vim.keymap.set({"i", "s"}, "<M-h>", function() ls.jump(-1) end, {silent = true})

    vim.keymap.set({"i", "s"}, "<M-n>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, {silent = true})
  end
}
