--------------------------------------------------------------------------------
--                               AUTO COMMANDS                                --
--------------------------------------------------------------------------------

local autocmd_add = vim.api.nvim_create_autocmd

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

-- detect filetypes
autocmd_add({ "BufRead", "BufNewFile" }, { pattern = { "*.tex" }, command = [[set ft=tex]], })
autocmd_add({ "BufRead", "BufNewFile" }, { pattern = { "*.pde" }, command = [[set ft=java]], })

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

