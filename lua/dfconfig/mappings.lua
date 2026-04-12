--------------------------------------------------------------------------------
--                                  MAPPINGS                                  --
--------------------------------------------------------------------------------

require("dfconfig.functions")

-- leader key
vim.g.mapleader = ' '

-- buffers
key_group("<leader>b", "buffers")
nmap('<leader>bn', '<CMD>bnext<CR>', "buffer next")
nmap('<leader>bp', '<CMD>bprev<CR>', "buffer previous")
nmap('<leader>bk', '<CMD>bdelete<CR>', "buffer kill")

-- resize
nmap("<M-j>", "<CMD>resize -2<CR>")
nmap("<M-k>", "<CMD>resize +2<CR>")
nmap("<M-h>", "<CMD>vertical resize -2<CR>")
nmap("<M-l>", "<CMD>vertical resize +2<CR>")

-- remap the C-^
nmap("<C-p>", "<C-^>")

-- fix J
nmap("J", "mzJ`z")

-- no delete copy
xmap("<leader>p", [["_dP]])

-- easy caps
imap("<c-u>", "<ESC>viwUea")

-- managing tabs
key_group("<leader>t", "tabs")
nmap("<leader>tn", "<CMD>tabnew<CR>")
nmap("<leader>te", "<CMD>tabe %<CR>")
nmap("<M-n>", "<CMD>tabnext<CR>")
nmap("<M-p>", "<CMD>tabprevious<CR>")

-- move threw splits
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- add line bellow
imap("<C-o>", "<Esc>O")

-- move lines
vmap("<M-k>", ":m '<-2<CR>gv=gv")
vmap("<M-j>", ":m '>+1<CR>gv=gv")
vmap("<", "<gv")
vmap(">", ">gv")

-- quick fix list
nmap("<C-q><C-o>", "<CMD>copen<CR>")
nmap("<C-q><C-q>", "<CMD>cclose<CR>")
nmap("<C-q><C-p>", "<CMD>cprev<CR>")
nmap("<C-q><C-n>", "<CMD>cnext<CR>")

-- substitution & search
nmap("<leader>S", ":%s//g<Left><Left>")
vmap("<leader>S", ":s//g<Left><Left>")
nmap("<leader>*", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>")
vmap("<M-r>", '"vyV/\\<\\V<C-r>v\\><CR>')
vmap("<leader>*", ":s/\\<\\V<C-r>v\\>//g<Left><Left>")

-- spell
nmap("<F6>", "<CMD>setlocal spell! spelllang=fr,cjk<cr>")
nmap("<F7>", "<CMD>set spelllang=en,cjk<cr>")
nmap("<leader>s", "<ESC>1z=")

-- toggle virtual edit
key_group("<leader>T", "toggle settings")
nmap("<leader>Tv", function()
  if vim.g.toggleVirtualEdit then
    vim.g.toggleVirtualEdit = false
    vim.cmd("setlocal virtualedit=")
  else
    vim.g.toggleVirtualEdit = true
    vim.cmd("setlocal virtualedit=all")
  end
end)

-- toggle centering
nmap("<leader>Tc", function()
  if vim.g.toggleCentering then
    vim.g.toggleCentering = false
    vim.opt.scrolloff = 0
    vim.opt.sidescrolloff = 0
  else
    vim.g.toggleCentering = true
    vim.opt.scrolloff = 999
    vim.opt.sidescrolloff = 999
  end
end)

-- netrw
-- nmap("<leader>e", "<CMD>vert split <BAR> Ex<CR>")
-- nmap("<leader>x", "<CMD>Ex<CR>")

-- rename file
nmap("<leader>R", function()
    local path = vim.fn.expand('%:h')
    local filename = vim.fn.expand('%:t')
    newname = vim.fn.input('rename file: ', '', 'file')
    os.rename(path .. "/" .. filename, path .. "/" .. newname)
    vim.api.nvim_buf_delete(0, { force = true })
    vim.cmd("e " .. path .. "/" .. newname)
end)

-- fold views
key_group("<leader>v", "views")
nmap("<leader>vm", "<CMD>mkview<CR>")
nmap("<leader>vl", "<CMD>loadview<CR>")
nmap("<leader>vd", function()
    local path = vim.fn.substitute(vim.fn.expand('%'), '/', '=+', 'g')
    local vd = vim.o.viewdir
    local file = vd .. '~=+' .. path .. '='
    print('delete: ' .. file)
    vim.cmd('call delete("' .. file .. '")')
end)
nmap("<leader>vM", "<CMD>set foldmethod=manual<CR>")
nmap("<leader>vK", "<CMD>set foldmethod=marker<CR>")

-- terminal
local term = require("dfmodules.terminal")
tmap("<Esc>", "<C-\\><C-n>")
nmap("<leader>tt", function() term.toggle_float_terminal() end)
nmap("<leader>!", function() term.toggle_bottom_terminal() end)
cmd_add("FTerminal", function(args) term.toggle_float_terminal(args.args) end, { nargs = "*" })
cmd_add("BTerminal", function(args) term.toggle_bottom_terminal(args.args) end, { nargs = "*" })

-- gdb
local gdb = require("dfmodules.gdb")
key_group("<leader>d", "gdb")
nmap('<leader>dd', gdb.reset_build_dir, { noremap = true })
nmap('<leader>db', gdb.add_breakpoint, { noremap = true })
nmap('<leader>dc', gdb.add_conditional_breakpoint, { noremap = true })
nmap('<leader>dp', gdb.print_breakpoints, { noremap = true })
nmap('<leader>dC', gdb.clear_breakpoints, { noremap = true })
