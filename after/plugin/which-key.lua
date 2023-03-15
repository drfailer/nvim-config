--------------------------------------------------------------------------------
--                                 WHICH-KEY                                  --
--------------------------------------------------------------------------------

local wk = require("which-key")
local mappings = {
  -- lsp
  l = {
    name = "lsp",
    a = "code action",
    r = "rename",
    d = "diagnostic",
    n = "next error",
    p = "previous error",
    h = "signature help",
    s = "workspace symbol",
    vr = "view references",
    f = {
      name = "telescope actions",
      r = "telescope lsp references",
      s = "telescope doc symbol",
      d = "telescope errors",
    },
  },

  d = {
    name = "dap",
    c = "continue",
    s = "stop",
    r = "open repl",
    l = "run last",
    i = "hover inspect",
    k = "up callstack",
    j = "down callstack",
    u = {
      name = "ui",
      t = "toggle ui",
      o = "open ui",
      c = "close ui"
    },
    e = "eval",
    b = "toggle breakpoint",
    B = {
      name = "beakpoint opts",
      c = "breakpoint condition",
      m = "breakpoint msg"
    }
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
  },

  -- toggle
  t = {
    name = "toggle",
    v = "virtual edit",
    c = "centering",
    l = "change bg"
  }
}

local opt = { prefix = '<leader>' }
wk.register(mappings, opt)
