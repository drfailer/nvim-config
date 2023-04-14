--------------------------------------------------------------------------------
--                                  ZEN MODE                                  --
--------------------------------------------------------------------------------

require("zen-mode").setup {
  window = {
    backdrop = 0.95,
    width = 100,
    height = 1,
    options = {
      signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      relativenumber = false, -- disable relative numbers
      cursorline = false, -- disable cursorline
    },
  },
  on_open = function(win)
    vim.o.colorcolumn = "0"
  end,
  on_close = function()
    vim.o.colorcolumn = "80"
  end,
}

vim.keymap.set('n', '<leader>tz', "<Cmd>ZenMode<CR>", { noremap = true })
