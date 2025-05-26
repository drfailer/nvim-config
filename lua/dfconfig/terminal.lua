local state = {
  floating = {
    buf = -1,
    win = -1,
    job = -1,
  },
  bottom = {
    buf = -1,
    win = -1,
    job = -1,
  },
}

local function create_buff(buf)
  local result = nil
  if vim.api.nvim_buf_is_valid(buf) then
    result = buf
  else
    result = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
  end
  return result
end

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  -- Calculate the position to center the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = create_buff(opts.buf)

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

local function create_boom_window(opts)
  local buf = create_buff(opts.buf)

  -- If the file is not specified, it creates an empty unamed buffer which is
  -- infinitely added to telescope's buffer list.
  vim.cmd.vnew(vim.fn.expand("%"))
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15);

  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win, buf)

  return { buf = buf, win = win }
end

local toggle_terminal = function(cmd, win_id, create_window)
  if not vim.api.nvim_win_is_valid(state[win_id].win) then
    local result = create_window({ buf = state[win_id].buf })
    state[win_id].buf = result.buf
    state[win_id].win = result.win
    if vim.bo[state[win_id].buf].buftype ~= "terminal" then
      vim.cmd.terminal()
      state[win_id].job = vim.bo.channel
    end
  elseif cmd == nil or cmd == "" then
    vim.api.nvim_win_hide(state[win_id].win)
  end
  if cmd and cmd ~= "" then
    vim.fn.chansend(state[win_id].job, { cmd .. "\r" })
  end
end

local toggle_float_terminal = function(cmd)
  toggle_terminal(cmd, "floating", create_floating_window)
end

local toggle_bottom_terminal = function(cmd)
  toggle_terminal(cmd, "bottom", create_boom_window)
end

return {
    toggle_float_terminal = toggle_float_terminal,
    toggle_bottom_terminal = toggle_bottom_terminal,
}
