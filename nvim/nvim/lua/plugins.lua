-- Autorun ':PackerCompile' whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local execute = vim.api.nvim_command
local fn = vim.fn

local packer_install_dir = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

local plug_url_format = 'https://github.com/%s'
local packer_repo = string.format(plug_url_format, 'wbthomason/packer.nvim')
local install_cmd = string.format('10split |term git clone --depth=1 %s %s', packer_repo, packer_install_dir)

if fn.empty(fn.glob(packer_install_dir)) > 0 then
  vim.api.nvim_echo({{'Installing packer.nvim', 'Type'}}, true, {})
  execute(install_cmd)
  execute 'packadd packer.nvim'
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- the plugin install follows from here
-- ....
return require('packer').startup({
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Performance improvements
    use "nathom/filetype.nvim"
    use 'lewis6991/impatient.nvim'
    use 'dstein64/vim-startuptime'
    -- Syntax highlighting, language servers, and autocompletion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }
    use 'ntpeters/vim-better-whitespace'
    use "lukas-reineke/indent-blankline.nvim"
    use 'ap/vim-css-color'
    -- UI Additions
    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'mhinz/vim-signify'
    --use 'camspiers/snap'
    use { 'ibhagwan/fzf-lua',
      requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use 'ray-x/lsp_signature.nvim'
    -- Popup keybindings
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {
          -- Default Config
        }
      end
    }
    -- Language-specific plugins
    use {
      'iamcco/markdown-preview.nvim',
      run = function() vim.fn['mkdp#util#install']() end,
      ft = {'markdown'}
    }
    -- Formatting
    use 'windwp/nvim-autopairs'
    use {'prettier/vim-prettier', run = 'yarn install' }
    -- QoL fixes/additions
    use 'wellle/targets.vim'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-commentary'
    use 'ggandor/lightspeed.nvim'
    -- Appearance
    use 'sainnhe/gruvbox-material'
    use 'kyazdani42/nvim-web-devicons'
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- Default Config
        }
      end
    }
  end
})