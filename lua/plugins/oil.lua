return {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
        columns = { "icon" },
        skip_confirm_for_simple_edits = false,
        keymaps = {
            ["<C-h>"] = false,
            ["<C-c>"] = "actions.close",
            ["<C-l>"] = false,
            ["L"] = "actions.select",
            ["H"] = "actions.parent",
        },
        view_options = {
            show_hidden = true,
        }
    },
    keys = {
        { "<leader>e", "<CMD>vert split <BAR> Oil<CR>" },
        { "<leader>x", "<CMD>Oil<CR>" },
    },
}
