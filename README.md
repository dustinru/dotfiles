# Dustin's dotfiles
A repository and programmatic setup of my dot files for Windows (WSL), MacOS, and Linux distros with a focus on zsh, neovim, and tmux.
## Table of Contents
- [dotfiles](#dotfiles)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
      - [Windows](#windows)
      - [MacOS](#macos)
      - [Linux (Ubuntu/Debian)](#linux-ubuntudebian)
  - [How to Use](#how-to-use)
  - [References](#references)
## Prerequisites
Supported OS: Ubuntu, MacOS
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
## How to Use
```
git clone https://github.com/dustinru/dotfiles.git "$HOME/.dotfiles" && cd "$HOME/.dotfiles"
chmod +x bootstrap.sh
./bootstrap.sh
```
## References
* [Adding an SSH Key to Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent)
* [How to setup WSL](https://docs.microsoft.com/en-us/windows/wsl/install)
* [Prefixless tmux keymappings](https://zserge.com/posts/tmux/)