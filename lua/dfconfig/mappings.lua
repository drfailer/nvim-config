--------------------------------------------------------------------------------
--                                  MAPPINGS                                  --
--------------------------------------------------------------------------------

-- leader key
vim.g.mapleader = ' '

-- resize
vim.keymap.set('n', '<M-j>', '<CMD>resize -2<CR>', { noremap = true })
vim.keymap.set('n', '<M-k>', '<CMD>resize +2<CR>', { noremap = true })
vim.keymap.set('n', '<M-h>', '<CMD>vertical resize -2<CR>', { noremap = true })
vim.keymap.set('n', '<M-l>', '<CMD>vertical resize +2<CR>', { noremap = true })

-- fix J
vim.keymap.set("n", "J", "mzJ`z")

-- avoid Q to run the last macro
vim.keymap.set("n", "Q", "A")

-- no delete copy
vim.keymap.set("x", "<leader>p", [["_dP]])

-- easy caps
vim.keymap.set('i', '<c-u>', '<ESC>viwUea', { noremap = true })

-- managing tabs
vim.keymap.set('n', '<leader>Tn', '<CMD>tabnew<CR>', { noremap = true })
vim.keymap.set('n', '<leader>Te', '<CMD>tabe %<CR>', { noremap = true })
vim.keymap.set('n', '<M-n>', '<CMD>tabnext<CR>', { noremap = true })
vim.keymap.set('n', '<M-p>', '<CMD>tabprevious<CR>', { noremap = true })

-- move threw splits
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- add line bellow
vim.keymap.set('i', '<C-o>', '<Esc>O', { noremap = true })

-- move lines
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })

-- quick fix list
vim.keymap.set('n', '<C-q><C-o>', '<CMD>copen<CR>', { noremap = true })
vim.keymap.set('n', '<C-q><C-q>', '<CMD>cclose<CR>', { noremap = true })
vim.keymap.set('n', '<C-q><C-p>', '<CMD>cprev<CR>', { noremap = true })
vim.keymap.set('n', '<C-q><C-n>', '<CMD>cnext<CR>', { noremap = true })

-- substitution & search
vim.keymap.set('n', '<leader>S', ':%s//g<Left><Left>', { noremap = true })
vim.keymap.set('v', '<leader>S', ':s//g<Left><Left>', { noremap = true })
vim.keymap.set('n', '<leader>*', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>', { noremap = true })
vim.keymap.set('v', '<C-f>', '"vyV/\\V<C-r>v<CR>', { noremap = true })
vim.keymap.set('v', '<leader>*', ':s/\\V<C-r>v//g<Left><Left>', { noremap = true })

-- spell PROBLEME
vim.keymap.set('n', '<F6>', '<CMD>setlocal spell! spelllang=fr,cjk<cr>', { noremap = true })
vim.keymap.set('n', '<F7>', '<CMD>set spelllang=en,cjk<cr>', { noremap = true })
vim.keymap.set('n', '<leader>s', '<ESC>1z=', { noremap = true })

-- toggle virtual edit
vim.keymap.set('n', '<leader>tv', function()
  if vim.g.toggleVirtualEdit then
    vim.g.toggleVirtualEdit = false
    vim.cmd("setlocal virtualedit=")
  else
    vim.g.toggleVirtualEdit = true
    vim.cmd("setlocal virtualedit=all")
  end
end, { noremap = true })

-- toggle centering
vim.keymap.set('n', '<leader>tc', function()
  if vim.g.toggleCentering then
    vim.g.toggleCentering = false
    vim.opt.scrolloff = 0
    vim.opt.sidescrolloff = 0
  else
    vim.g.toggleCentering = true
    vim.opt.scrolloff = 999
    vim.opt.sidescrolloff = 999
  end
end, { noremap = true })

-- Explorer
-- vim.keymap.set('n', '<leader>e', '<CMD>vert split <BAR> Ex<CR>', { noremap = true })
-- vim.keymap.set('n', '<leader>x', '<CMD>Ex<CR>', { noremap = true })

-- rename file
vim.keymap.set('n', '<leader>R', function()
    local path = vim.fn.expand('%:h')
    local filename = vim.fn.expand('%:t')
    newname = vim.fn.input('rename file: ', '', 'file')
    os.rename(path .. "/" .. filename, path .. "/" .. newname)
    vim.api.nvim_buf_delete(0, { force = true })
    vim.cmd("e " .. path .. "/" .. newname)
end, { noremap = true })

-- remember folds
vim.keymap.set('n', '<leader>vm', '<CMD>mkview<CR>', { noremap = true })
vim.keymap.set('n', '<leader>vl', '<CMD>loadview<CR>', { noremap = true })
vim.keymap.set('n', '<leader>vd', function()
    local path = vim.fn.substitute(vim.fn.expand('%'), '/', '=+', 'g')
    local vd = vim.o.viewdir
    local file = vd .. '~=+' .. path .. '='
    print('delete: ' .. file)
    vim.cmd('call delete("' .. file .. '")')
end, { noremap = true })
vim.keymap.set('n', '<leader>vM', '<CMD>set foldmethod=manual<CR>', { noremap = true })
vim.keymap.set('n', '<leader>vK', '<CMD>set foldmethod=marker<CR>', { noremap = true })

-- terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set("n", "<leader>tt", function()
    require("dfconfig.terminal").toggle_float_terminal()
end, { noremap = true })
vim.keymap.set("n", "<leader>!", function()
    require("dfconfig.terminal").toggle_bottom_terminal()
end, { noremap = true })

vim.api.nvim_create_user_command("FTerminal", function(args)
  require("dfconfig.terminal").toggle_float_terminal(args.args)
end, { nargs = "*" })

vim.api.nvim_create_user_command("BTerminal", function(args)
  require("dfconfig.terminal").toggle_bottom_terminal(args.args)
end, { nargs = "*" })

-- netrw mapping (https://www.reddit.com/r/neovim/comments/ud2w4k/how_to_remap_netrw_to_n_in_keybindingsinitlua/)
vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
    end
    -- mappings
    bind('l', '<CR>')
    bind('h', '-')
  end
})

-- remap the C-^
vim.keymap.set('n', '<C-p>', '<C-^>', { noremap = true })
