# dotfiles
A repository and setup for my dot files on Windows (WSL), MacOS, and Linux distros with a focus on zsh, neovim, and tmux.
## Table of Contents
1. [Prerequisites](#prerequisites)
2. [How to use](#how-to-use)
3. [CLI Tools/Plugins List](#cli-toolsplugins-list)
4. [Color Themes](#color-themes)
5. [References](#references)
## Prerequisites
#### Windows
1. Make sure to enable Virtualization
   1. In Bios
   2. In Powershell
2. Install Windows Terminal
3. Install WSL
4. Install Ubuntu 20.04 or your preferred OS.
#### MacOS
1. Install iterm2
#### Linux (Ubuntu/Debian)
##### How to install Neovim
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
```
##### *Optional: Exposing nvim globally.*
```
mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim
```
##### How to install Ripgrep (rg) and Bat (bat)
```
sudo apt install -o Dpkg::Options::="--force-overwrite" bat ripgrep
```
##### Determine architecture for .deb files (Linux)
```
dpkg --print-architecture
```
##### Download diff on Ubuntu
```
cd ~/tmp/
wget -r -l1 --no-parent -Aamd64.deb https://github.com/dandavison/delta/releases/latest/download/
dpkg -i git-delta*amd64.deb
```
#### General
Configure your terminal to use monospace MesloLGS Nerd Font:
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
## How to Use
## CLI Tools/Plugins List
#### UNIX (zsh)
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
#### Neovim v0.6+ (Packer)
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
## Color Themes
Personal Preference: Gruvbox Material
### ANSI Values
| Color | Gruvbox Material | One Dark (Atom) |
| --- | --- | --- |
| Black | 60,56,54 | 33,37,43 |
| BoldBlack | 90,82,76 | 33,37,43 |
| Red | 184,86,81 | 224,108,117 |
| BoldRed | 184,86,81 | 224,108,117|
| Green | 143,154,82 | 152,195,121 |
| BoldGreen | 169,182,101 | 152,195,121 |
| Yellow | 193,143,65 | 229,192,123 |
| BoldYellow| 216,166,87 | 229,192,123 |
| Blue | 104,148,138 | 97,175,239 |
| BoldBlue | 125,174,163 | 97,175,239 |
| Magenta | 171,108,125 | 198,120,221 |
| BoldMagenta | 211,134,155 | 198,120,221 |
| Cyan | 114,150,108 | 86,182,194 |
| BoldCyan | 137,180,130 | 86,182,194 |
| White | 168,153,131 | 171,178,191 |
| BoldWhite | 221,199,161 | 171,178,191 |
| ForegroundColour | 212,190,152 | 171,178,191 |
| BackgroundColour | 50,48,47 | 33,37,43 |
| CursorColour | 221,199,161 | 171,178,191 |

## References
* [Adding an SSH Key to Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent)
* [How to setup WSL](https://docs.microsoft.com/en-us/windows/wsl/install)
* [Prefixless tmux keymappings](https://zserge.com/posts/tmux/)