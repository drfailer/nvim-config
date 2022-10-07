-- load settings
require('dfconfig.settings')
require('dfconfig.mappings')

-- Plugins
-- install packer:
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--
return require('packer').startup(function()
  -- Packer
  use 'wbthomason/packer.nvim'

  -- themes
  use 'Mofiqul/vscode.nvim'
  require('dfplugin.theme')

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  require("dfplugin.statusline")

  -- utils
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'

  -- Which key
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  require("dfplugin.telescope")

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  require("dfplugin.treesitter")

  -- LSP
  use 'neovim/nvim-lspconfig'
  require("dfplugin.lsp")

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'onsails/lspkind.nvim'
  require("dfplugin.comp")

  -- snippets
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- lsp installer
  use { "williamboman/mason.nvim" }
  require("mason").setup()
end)
