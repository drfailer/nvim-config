--------------------------------------------------------------------------------
--                                  PLUGINS                                   --
--------------------------------------------------------------------------------

-- Install packer automatically {{{
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
-- }}}

-- Plugins:
return require('packer').startup(function()
  -- Packer:
  use 'wbthomason/packer.nvim'

  -- themes:
  use 'RRethy/base16-nvim'
  use 'savq/melange-nvim'

  -- lualine:
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- utils:
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'

  -- Which key:
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }

  -- zen mode
  use 'folke/zen-mode.nvim'

  -- telescope:
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- oil
  use {
    'stevearc/oil.nvim',
    requires = {
      {
        'echasnovski/mini.icons',
        config = function()
          require("mini.icons").setup()
        end,
      }
    }
  }

  -- plantuml syntax
  use 'aklt/plantuml-syntax'

  -- Treesitter:
  use 'nvim-treesitter/nvim-treesitter'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'saadparwaiz1/cmp_luasnip'

  -- Snippets
  use {'L3MON4D3/LuaSnip', tag = 'v2.*'}
  use 'rafamadriz/friendly-snippets'

  -- refactor:
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  }

  -- vimwiki
  use 'vimwiki/vimwiki'

  -- multicursors
  use {
      'jake-stewart/multicursor.nvim',
      branch = '1.0',
      config = function()
          local mc = require("multicursor-nvim")

          mc.setup()

          -- Add or skip adding a new cursor by matching word/selection
          vim.keymap.set({"n", "v"}, "<C-down>", function() mc.matchAddCursor(1) end)
          vim.keymap.set({"n", "v"}, "<C-up>", function() mc.matchAddCursor(-1) end)
          vim.keymap.set({"n", "v"}, "<C-right>", function() mc.matchSkipCursor(1) end)
          vim.keymap.set({"n", "v"}, "<C-left>", function() mc.matchSkipCursor(-1) end)

          -- Rotate the main cursor.
          vim.keymap.set({"n", "v"}, "<M-left>", mc.nextCursor)
          vim.keymap.set({"n", "v"}, "<M-right>", mc.prevCursor)

          vim.keymap.set("n", "<leader>ca", mc.alignCursors)
          vim.keymap.set("v", "<leader>cs", mc.splitCursors)
          vim.keymap.set("v", "<leader>cm", mc.matchCursors)

          -- Rotate visual selection contents.
          vim.keymap.set("v", "<M-down>", function() mc.transposeCursors(1) end)
          vim.keymap.set("v", "<M-up>", function() mc.transposeCursors(-1) end)

          vim.keymap.set("n", "<esc>", function()
              if not mc.cursorsEnabled() then
                  mc.enableCursors()
              elseif mc.hasCursors() then
                  mc.clearCursors()
              else
                  -- Default <esc> handler.
              end
          end)
      end
          }
      end)
