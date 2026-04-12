--------------------------------------------------------------------------------
--                                 FUNCTIONS                                  --
--------------------------------------------------------------------------------

function key_group(key, group)
    local list = vim.g.keymaps_list or {}
    table.insert(list, { key = key, group = group })
    vim.g.keymaps_list = list
end

function key_add(mode, key, effect, opts, desc)
    vim.keymap.set(mode, key, effect, opts)
    local list = vim.g.keymaps_list or {}
    table.insert(list, { key = key, desc = desc, mode = mode })
    vim.g.keymaps_list = list
end

function nmap(key, effect, desc) key_add("n", key, effect, { noremap = true }, desc) end
function imap(key, effect, desc) key_add("i", key, effect, { noremap = true }, desc) end
function vmap(key, effect, desc) key_add("v", key, effect, { noremap = true }, desc) end
function xmap(key, effect, desc) key_add("x", key, effect, { noremap = true }, desc) end
function tmap(key, effect, desc) key_add("t", key, effect, { noremap = true }, desc) end

cmd_add = vim.api.nvim_create_user_command
autocmd_add = vim.api.nvim_create_autocmd

function ab_add(from, to)
    vim.cmd("ab " .. from .. " " .. to)
end
