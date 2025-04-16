local state = {
  floating = {
    buf = -1,
    win = -1,
  },
  job_id = -1,
}

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  -- Calculate the position to center the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Create a buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
  end

  -- Define window configuration
  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal", -- No borders or extra UI elements
    border = "rounded",
  }

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

-- toggle a terminal in a floating window and execute the given command if any
local toggle_terminal = function(cmd)
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
      state.job_id = vim.bo.channel
    end
  elseif cmd == "" then
    vim.api.nvim_win_hide(state.floating.win)
  end
  if cmd ~= "" then
    vim.fn.chansend(state.job_id, { cmd .. "\r" })
  end
end

-- open a terminal in the bottom
local job_id = 0
local open_bottom_terminal = function()
  vim.cmd.new()
  vim.cmd.term()
  vim.api.nvim_win_set_height(0, 15);
  job_id = vim.bo.channel
end

return {
    toggle_terminal = toggle_terminal,
    open_bottom_terminal = open_bottom_terminal,
}
