local fn = vim.fn

-- Auto-install packer in case it hasn't been installed.
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_echo({{'Installing packer.nvim', 'Type'}}, true, {})
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Autorun ':PackerCompile' whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- the plugin install follows from here
require('packer').startup({
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Performance improvements
    use "nathom/filetype.nvim"
    use 'lewis6991/impatient.nvim'
    use 'dstein64/vim-startuptime'

    -- QoL fixes/additions
    use 'wellle/targets.vim'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    --use 'tpope/vim-commentary' -- use comment.nvim
    use 'ggandor/lightspeed.nvim'

    -- Syntax highlighting, language servers, and autocompletion
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
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
    use 'norcalli/nvim-colorizer.lua'
    use 'numToStr/Comment.nvim'
    use "rafamadriz/friendly-snippets"

    -- UI Additions
    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'mhinz/vim-signify'
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'} -- optional, for file icons
    }
    use { 'ibhagwan/fzf-lua',
      requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use 'ray-x/lsp_signature.nvim'
    --use {'kevinhwang91/nvim-bqf'}
    --use 'folke/which-key.nvim'

    -- Language-specific 
    use 'godlygeek/tabular'
    use 'preservim/vim-markdown'
    -- install without yarn or npm
    use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Formatting
    use { "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }
    use { 'prettier/vim-prettier',
      run = 'yarn install --frozen-lockfile --production'
    }
    -- Appearance
    use 'sainnhe/gruvbox-material'
    use 'kyazdani42/nvim-web-devicons'
    -- use 'folke/twilight.nvim'
    --[[
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- Default Config
        }
      end
    }
    ]]--

    if packer_bootstrap then
      require('packer').sync()
    end
  end
})