return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")
        wk.setup({ preset = "classic" })
        wk.add(vim.g.keymaps_list)
    end
}
