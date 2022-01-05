# dotfiles

## Terminal Theme(s): One Dark (Atom), Gruvbox Material
**One Dark**
```
[Colors]
DefaultColorScheme=0
Black=33,37,43
BoldBlack=33,37,43
Red=224,108,117
BoldRed=224,108,117
Green=152,195,121
BoldGreen=152,195,121
Yellow=229,192,123
BoldYellow=229,192,123
Blue=97,175,239
BoldBlue=97,175,239
Magenta=198,120,221
BoldMagenta=198,120,221
Cyan=86,182,194
BoldCyan=86,182,194
White=171,178,191
BoldWhite=171,178,191
ForegroundColour=171,178,191
BackgroundColour=33,37,43
CursorColour=171,178,191
SyntaxType=2
```
**Gruvbox Material**
```
[Colors]
DefaultColorScheme=0
Black=60,56,54
BoldBlack=90,82,76
Red=184,86,81
BoldRed=184,86,81
Green=143,154,82
BoldGreen=169,182,101
Yellow=193,143,65
BoldYellow=216,166,87
Blue=104,148,138
BoldBlue=125,174,163
Magenta=171,108,125
BoldMagenta=211,134,155
Cyan=114,150,108
BoldCyan=137,180,130
White=168,153,131
BoldWhite=221,199,161
ForegroundColour=212,190,152
BackgroundColour=50,48,47
CursorColour=221,199,161
SyntaxType=2
```
Configure your terminal to this font:
- **iTerm2**: Type `p10k configure` and answer `Yes` when asked whether to install
     *Meslo Nerd Font*. Alternatively, open *iTerm2 → Preferences → Profiles → Text* and set *Font* to
     `MesloLGS NF`.
- **Visual Studio Code**: Open *File → Preferences → Settings* (PC) or
     *Code → Preferences → Settings* (Mac), enter `terminal.integrated.fontFamily` in the search box at
     the top of *Settings* tab and set the value below to `MesloLGS NF`.
     Consult [this screenshot](
       https://raw.githubcontent.com/romkatv/powerlevel10k-media/389133fb8c9a2347929a23702ce3039aacc46c3d/visual-studio-code-font-settings.jpg)
     to see how it should look like or see [this issue](
       https://github.com/romkatv/powerlevel10k/issues/671) for extra information.
- **MobaXterm**: Open *Settings* → *Configuration* → *Terminal* → (under *Terminal look and feel*)
     and change *Font* to `MesloLGS NF`.
- **Windows Terminal** by Microsoft (the new thing): Open `settings.json` (<kbd>Ctrl+Shift+,</kbd>),
     search for `fontFace` and set the value to `MesloLGS NF` for every profile. If you don't find
     `fontFace`, add it under *profiles → defaults*. See [this settings file](
       https://raw.githubcontent.com/romkatv/dotfiles-public/aba0e6c4657d705ed6c344d700d659977385f25c/dotfiles/microsoft-terminal-settings.json)
     for example.

## CLI Tools
```
ag
autojump
bat
delta
docker
fd
fzf
git
jq
markserv
neofetch
neovim
net-tools
nodejs
oh-my-zsh
python3
ripgrep
sudo
tldr
tmux
zsh
```
## Neovim Plugins
```
'wbthomason/packer.nvim'
'nathom/filetype.nvim'
'lewis6991/impatient.nvim'
'dstein64/vim-startuptime'
'neovim/nvim-lspconfig'
'hrsh7th/cmp-nvim-lsp'
'hrsh7th/cmp-buffer'
'hrsh7th/cmp-path'
'hrsh7th/cmp-cmdline'
'hrsh7th/nvim-cmp'
'hrsh7th/cmp-vsnip'
'hrsh7th/vim-vsnip'
'nvim-treesitter/nvim-treesitter'
'ntpeters/vim-better-whitespace'
'ap/vim-css-color'
'nvim-lualine/lualine.nvim'
'mhinz/vim-signify'
'camspiers/snap'
'ray-x/lsp_signature.nvim'
'folke/which-key.nvim'
'iamcco/markdown-preview.nvim'
'windwp/nvim-autopairs'
'prettier/vim-prettier'
'wellle/targets.vim'
'tpope/vim-surround'
'tpope/vim-repeat'
'tpope/vim-commentary'
'ggandor/lightspeed.nvim'
'sainnhe/gruvbox-material'
'kyazdani42/nvim-web-devicons'
'folke/trouble.nvim'
```