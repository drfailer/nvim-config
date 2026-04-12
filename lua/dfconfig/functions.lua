--------------------------------------------------------------------------------
--                                 FUNCTIONS                                  --
--------------------------------------------------------------------------------

-- declare keympas and cmds list (for help menus / which key)
vim.g.keymaps_list = {}
vim.g.cmds_list = {}

function key_group(key, group)
    table.insert(vim.g.keymaps_list, { key, group = group })
end

function key_add(mode, key, effect, opts, desc)
    vim.keymap.set(mode, key, effect, opts)
    table.insert(vim.g.keymaps_list, { key, desc = desc, mode = mode })
end

function nmap(key, effect, desc) key_add("n", key, effect, { noremap = true }, desc) end
function imap(key, effect, desc) key_add("i", key, effect, { noremap = true }, desc) end
function vmap(key, effect, desc) key_add("v", key, effect, { noremap = true }, desc) end
function xmap(key, effect, desc) key_add("x", key, effect, { noremap = true }, desc) end
function tmap(key, effect, desc) key_add("t", key, effect, { noremap = true }, desc) end

function cmd_add(cmd, effect, opts, desc)
    vim.api.nvim_create_user_command(cmd, effect, opts)
    table.insert(vim.g.cmds_list, { cmd, desc = desc })
end
