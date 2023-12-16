--------------------------------------------------------------------------------
--                                 termdebug                                  --
--------------------------------------------------------------------------------

-- enable termdebug
vim.cmd("packadd termdebug")

vim.g.termdebug_wide = 1

vim.api.nvim_create_autocmd('User', {
    pattern = 'TermdebugStartPost',
    callback = function()
        vim.keymap.set('n', 'n', ':Over<CR>',     { noremap = true })
        vim.keymap.set('n', 's', ':Step<CR>',     { noremap = true })
        vim.keymap.set('n', 'c', ':Continue<CR>', { noremap = true })
        vim.keymap.set('n', 'r', ':Run<CR>',      { noremap = true })
        vim.keymap.set('n', 'S', ':Stop<CR>',     { noremap = true })
        vim.keymap.set('n', 'u', ':Until<CR>',    { noremap = true })
        vim.keymap.set('n', 'b', ':Break<CR>',    { noremap = true })
        vim.keymap.set('n', 'C', ':Clear<CR>',    { noremap = true })
        vim.keymap.set('n', 'x', ':Evaluate<CR>', { noremap = true })
        vim.keymap.set('v', 'x', ':Evaluate<CR>', { noremap = true })
    end
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'TermdebugStopPost',
    callback = function()
        vim.keymap.set('n', 'n', 'n', { noremap = true })
        vim.keymap.set('n', 's', 's', { noremap = true })
        vim.keymap.set('n', 'c', 'c', { noremap = true })
        vim.keymap.set('n', 'r', 'r', { noremap = true })
        vim.keymap.set('n', 'S', 'S', { noremap = true })
        vim.keymap.set('n', 'u', 'u', { noremap = true })
        vim.keymap.set('n', 'b', 'b', { noremap = true })
        vim.keymap.set('n', 'C', 'C', { noremap = true })
        vim.keymap.set('n', 'x', 'x', { noremap = true })
        vim.keymap.set('v', 'x', 'x', { noremap = true })
    end
})

local exec_name = ""
local debugger_started = false
function toggle_debugger(reload)
    if debugger_started == false then
        -- get exec name
        if exec_name == "" or reload then
            exec_name = vim.fn.input('Executable: ', '', 'file')
        end
        debugger_started = true
        vim.cmd("Termdebug " .. exec_name)
        vim.cmd("Source")
    else
        debugger_started = false
        vim.cmd("Gdb")
        local keys = vim.api.nvim_replace_termcodes("iquit<CR>", true, false, true)
        vim.api.nvim_feedkeys(keys, "n", false)
    end
end

vim.keymap.set('n', '<leader>dd', function() toggle_debugger(false) end, { noremap = true })
vim.keymap.set('n', '<leader>dD', function() toggle_debugger(true) end, { noremap = true })
