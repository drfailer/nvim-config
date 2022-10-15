--------------------------------------------------------------------------------
--                                  NVIM DAP                                  --
--------------------------------------------------------------------------------

local dap = require('dap')

-- mappings
vim.keymap.set('n', '<F5>', '<Cmd>lua require("dap").continue()<CR>', { noremap = true })
vim.keymap.set('n', '<F10>', '<Cmd>lua require"dap".step_over()<CR>', { noremap = true })
vim.keymap.set('n', '<F11>', '<Cmd>lua require"dap".step_into()<CR>', { noremap = true })
vim.keymap.set('n', '<F12>', '<Cmd>lua require"dap".step_out()<CR>', { noremap = true })
vim.keymap.set('n', '<leader>db', '<Cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true })
vim.keymap.set('n', '<leader>dB', '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { noremap = true })
vim.keymap.set('n', '<leader>dp', '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { noremap = true })
vim.keymap.set('n', '<leader>dr', '<Cmd>lua require"dap".repl.open()<CR>', { noremap = true })
vim.keymap.set('n', '<leader>dl', '<Cmd>lua require"dap".run_last()<CR>', { noremap = true })

-- c/c++/rust
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/home/drfailer/.local/share/nvim/mason/bin/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}
dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp
