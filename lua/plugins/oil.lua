vim.pack.add({"https://github.com/stevearc/oil.nvim.git"})

require("dfconfig.functions")

require("oil").setup({
    columns = {},
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
})

nmap("<leader>e", "<CMD>vert split <BAR> Oil<CR>")
nmap("<leader>x", "<CMD>Oil<CR>")
