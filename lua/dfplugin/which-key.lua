local wk = require("which-key")
local mappings = {
  -- lsp
  l = {
    name = "lsp",
    a = "code action",
    D = "typde definition",
    r = "rename",
    vr = "view references",
    f = "format",
    fr = "telescope lsp references",
    fD = "telescope doc symbol",
    fe = "telescope errors"
  },

  -- telescope
  f = {
    name = "telescope",
    f = "find files",
    g = "live grep",
    b = "buffers",
    h = "help tags",
    k = "keymaps",
    s = "spell",
    G = "git branches",
  },

  -- refactor
  r = {
    name = "refactor",
    r = "telescope refactor",
    p = "refactor debug printf",
    dv = "refactor debug print var",
    dc = "refactor debug cleanup"
  },

  -- fugitive
  g = {
    name = "fugitive",
    j = "",
    f = "",
    g = "status",
    c = "commit",
    p = "push"
  }
}

local opt = { prefix = '<leader>' }
wk.register(mappings, opt)
