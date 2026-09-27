--------------------------------------------------------------------------------
--                               AUTO COMMANDS                                --
--------------------------------------------------------------------------------

require("dfconfig.functions")

-- Highlight the region on yank
autocmd_add('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})

-- trim whitespaces
autocmd_add({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})


-- disable line numbers in terminal
autocmd_add("TermOpen", {
    group = vim.api.nvim_create_augroup("term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})

-- netrw mapping (https://www.reddit.com/r/neovim/comments/ud2w4k/how_to_remap_netrw_to_n_in_keybindingsinitlua/)
autocmd_add('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      key_add('n', lhs, rhs, {remap = true, buffer = true})
    end
    -- mappings
    bind('l', '<CR>')
    bind('h', '-')
  end
})

-- for some stupide reason, it is super hard to prevent nvim from loading the
-- ada default configuration. Using a scheduled function is the only way I
-- found out to override the default mappings and makeprog.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'ada',
  callback = function(args)
    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(args.buf) then
        pcall(vim.keymap.del, 'i', '<leader>aj', { buffer = args.buf })
        pcall(vim.keymap.del, 'i', '<leader>al', { buffer = args.buf })
        vim.opt_local.makeprg = "make"
      end
    end)
  end,
})
