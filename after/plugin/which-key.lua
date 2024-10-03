--------------------------------------------------------------------------------
--                                 WHICH-KEY                                  --
--------------------------------------------------------------------------------

local wk = require("which-key")

wk.setup({
  preset = "modern"
})

wk.add({
  -- lsp
  { "<leader>l", group = "lsp" },
  { "<leader>l", desc = "lsp" },
  { "<leader>la", desc = "code action" },
  { "<leader>lr", desc = "rename" },
  { "<leader>ld", desc = "diagnostic" },
  { "<leader>ln", desc = "next error" },
  { "<leader>lp", desc = "previous error" },
  { "<leader>lh", desc = "signature help" },
  { "<leader>ls", desc = "workspace symbol" },
  { "<leader>lvr", desc = "view references" },
  { "<leader>lF", desc = "buff format" },
  { "<leader>lf", group = "lsp telescope" },
  { "<leader>lfr", desc = "telescope lsp references" },
  { "<leader>lfs", desc = "telescope doc symbol" },
  { "<leader>lfd", desc = "telescope errors" },

  -- telescope
  { "<leader>f", group = "telescope" },
  { "<leader>ff", desc = "find files" },
  { "<leader>fg", desc = "live grep" },
  { "<leader>fb", desc = "buffers" },
  { "<leader>fh", desc = "help tags" },
  { "<leader>fk", desc = "keymaps" },
  { "<leader>fs", desc = "spell" },
  { "<leader>fG", desc = "git branches" },

  -- refactor
  { "<leader>r", group = "refactor" },
  { "<leader>rr", desc = "telescope refactor" },
  { "<leader>rp", desc = "refactor debug printf" },
  { "<leader>rdv", desc = "refactor debug print var" },
  { "<leader>rdc", desc = "refactor debug cleanup" },

  -- fugitive
  { "<leader>g", group = "fugitive" },
  { "<leader>gg", desc = "status" },
  { "<leader>gc", desc = "commit" },
  { "<leader>gL", desc = "log" },
  { "<leader>gm", desc = "merge" },
  { "<leader>gd", desc = "resolve conflict" },
  { "<leader>gh", desc = "get diff left" },
  { "<leader>gl", desc = "get diff right" },
  { "<leader>gj", desc = "next diff" },
  { "<leader>gk", desc = "previous diff" },

  -- gdb
  { "<leader>d", group = "gdb" },
  { "<leader>dd", desc = "reset build directory" },
  { "<leader>db", desc = "set breakpoint" },
  { "<leader>dc", desc = "set conditional breakpoint" },
  { "<leader>dp", desc = "set print breakpoint (visual mode)" },
  { "<leader>dC", desc = "clear" },

  -- quickfix list
  { "<leader>q", group = "quickfix list" },
  { "<leader>qo", desc = "open" },
  { "<leader>qc", desc = "close" },

  -- toggle
  { "<leader>t", group = "toggle options" },
  { "<leader>tv", desc = "virtual edit" },
  { "<leader>tc", desc = "centering" },
  { "<leader>tl", desc = "light / dark background" },
})
