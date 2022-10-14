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

-- install packer with git: {{{
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim
-- ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--}}}

-- Plugins: {{{1
return require('packer').startup(function()
  -- Packer: {{{2
  use 'wbthomason/packer.nvim'
  -- 2}}}

  -- themes: {{{2
  use 'Mofiqul/vscode.nvim'
  use 'gruvbox-community/gruvbox'
  use 'navarasu/onedark.nvim'
  -- 2}}}

  -- lualine: {{{2
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- 2}}}

  -- utils: {{{2
  use 'windwp/nvim-autopairs'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  -- 2}}}

  -- Which key: {{{2
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }
  -- 2}}}

  -- telescope: {{{2
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- 2}}}

  -- Treesitter: {{{2
  use 'nvim-treesitter/nvim-treesitter'
  -- 2}}}

  -- LSP: {{{2
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  -- 2}}}

  -- completion: {{{2
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'onsails/lspkind.nvim'
  -- 2}}}

  -- snippets: {{{2
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  use 'saadparwaiz1/cmp_luasnip'
  -- 2}}}

  -- refactor: {{{2
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  }
  -- 2}}}

  -- lsp installer: {{{2
  use { "williamboman/mason.nvim" }
  require("mason").setup()
  -- 2}}}
end)
-- 1}}}
