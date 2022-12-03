--------------------------------------------------------------------------------
--                                 WHICH-KEY                                  --
--------------------------------------------------------------------------------

local wk = require("which-key")
local mappings = {
  -- lsp
  l = {
    name = "lsp",
    a = "code action (lspsaga)",
    o = "outline",
    r = "rename (lspsaga)",
    e = "error",
    d = "diagnostic list",
    n = "next error (saga)",
    p = "previous error (saga)",
    vr = "view references",
    sh = "signature help",
    F = "format",
    f = {
      name = "telescope actions",
      r = "telescope lsp references",
      s = "telescope doc symbol",
      d = "telescope errors",
    },
    w = {
      name = "workspace actions",
      a = "add workspace folder",
      r = "remove workspace folder"
    }
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
  }
}

local opt = { prefix = '<leader>' }
wk.register(mappings, opt)
