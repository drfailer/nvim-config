--------------------------------------------------------------------------------
--                                 WHICH-KEY                                  --
--------------------------------------------------------------------------------

local wk = require("which-key")
local mappings = {
  -- lsp
  l = {
    name = "lsp",
    a = "code action (lspsaga)",
    D = "typde definition",
    r = "rename (lspsaga)",
    vr = "view references",
    sh = "signature help",
    F = "format",
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
    G = "git branches"
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
    g = "status",
    c = "commit",
    L = "log",
    m = "merge",
    d = "resolve conflict",
    h = "get diff left",
    l = "get diff right",
    j = "next diff",
    k = "previous diff"
  }
}

local opt = { prefix = '<leader>' }
wk.register(mappings, opt)
