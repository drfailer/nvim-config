local dap = require "dap"
local ui = require "dapui"

require("dapui").setup()

require("nvim-dap-virtual-text").setup()

vim.keymap.set("n", "<space>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<space>dr", dap.run_to_cursor)

-- Eval var under cursor
vim.keymap.set("n", "<space>?", function()
  require("dapui").eval(nil, { enter = true })
end)

vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>dC", dap.terminate)
vim.keymap.set("n", "<left>", dap.step_into)
vim.keymap.set("n", "<down>", dap.step_over)
vim.keymap.set("n", "<right>", dap.step_out)
vim.keymap.set("n", "<up>", dap.step_back)
vim.keymap.set("n", "<C-up>", dap.up)
vim.keymap.set("n", "<C-down>", dap.down)
vim.keymap.set("n", "<leader>dR", dap.restart)

dap.listeners.before.attach.dapui_config = function()
  ui.open()
end
dap.listeners.before.launch.dapui_config = function()
  ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  ui.close()
end
