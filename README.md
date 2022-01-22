# Dustin's dotfiles
A repository and programmatic setup of my dot files for Windows (WSL), MacOS, and Linux distros with a focus on zsh, neovim, and tmux.
## Table of Contents
1. [Prerequisites](#prerequisites)
    - [Windows](#windows)
    - [MacOS](#macos)
    - [Linux (Ubuntu/Debian)](#linux-ubuntudebian)
2. [How to Use](#how-to-use)
3. [Features](#features)
4. [References](#references)
## Prerequisites
Supported OS: Ubuntu, MacOS
#### Windows
1. Make sure to enable Virtualization
   * In Bios
   #
       - In the BIOS settings, find the configuration items related to the CPU.
       - Enable virtualization; the setting may be called VT-x, AMD-V, SVM, or Vanderpool. Enable Intel VT-d or AMD IOMMU if the options are available.
       - Save your changes and reboot.
      See: https://bce.berkeley.edu/enabling-virtualization-in-your-pc-bios.html
   * In Powershell
   #
       dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
2. Install Windows Terminal from the Microsoft Store
3. Install WSL
4. Install Ubuntu 20.04 or your preferred OS.
#### MacOS
1. Install iterm2
## How to Use
```
git clone https://github.com/dustinru/dotfiles.git "$HOME/.dotfiles" && cd "$HOME/.dotfiles"
chmod +x bootstrap.sh
./bootstrap.sh
```
## Features
### zsh
### neovim
### tmux
## References
* [Adding an SSH Key to Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent)
* [Holman's Dotfiles](https://github.com/holman/dotfiles)
* [How to setup WSL](https://docs.microsoft.com/en-us/windows/wsl/install)
* [Prefixless tmux keymappings](https://zserge.com/posts/tmux/)