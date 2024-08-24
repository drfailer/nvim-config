require("oil").setup({
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
})

vim.keymap.set('n', '<leader>e', '<CMD>vert split <BAR> Oil<CR>', { noremap = true })
vim.keymap.set('n', '<leader>x', '<CMD>Oil<CR>', { noremap = true })
