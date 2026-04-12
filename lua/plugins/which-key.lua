vim.pack.add({"https://github.com/folke/which-key.nvim.git"})
local wk = require("which-key")
wk.setup({ preset = "classic" })

for _, v in ipairs(vim.g.keymaps_list) do
    if v.group then
        wk.add({ v.key, group = v.group, icon = "" })
    else
        wk.add({ v.key, desc = v.desc, mode = v.mode, icon = "" })
    end
end
