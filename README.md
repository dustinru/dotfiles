<div align="center">

# Dustin's dotfiles

[Installation](#installation) • [Usage](#usage) • [Features](#features) • [Wiki](https://github.com/dustinru/dotfiles/wiki)

</div>

A repository and programmatic setup of my dot files for MacOS, Windows (WSL), and other Linux distros with a focus on zsh, neovim, and tmux.

## Installation

### Prerequisites

Supported OS: MacOS, Ubuntu, Arch Linux

#### Windows

1. Make sure to enable Virtualization

    * In Bios

        > In the BIOS settings, find the configuration items related to the CPU and enable virtualization; the setting may be called VT-x, AMD-V, SVM, or Vanderpool. Enable Intel VT-d or AMD IOMMU if the options are available.  
        > Save your changes and reboot.

    * In Powershell

        ```shell
        dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
        ```

2. Install Windows Terminal from the [Microsoft Store](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701)

3. Install WSL

    ```bash
    wsl --install
    ```

4. Install Ubuntu 20.04 or your preferred OS from the [Microsoft Store](https://www.microsoft.com/en-us/p/ubuntu-2004-lts/9n6svws3rx71)

#### MacOS

1. Install a terminal emulator (e.g. iterm2, kitty, etc.)

#### Arch Linux

1. Install yay

    ```bash
    pacman -S --needed git base-devel
    cd /tmp/ && git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    ```

---

### Quickstart

```bash
git clone https://github.com/dustinru/dotfiles.git "$HOME/.dotfiles" && cd "$HOME/.dotfiles"
chmod +x bootstrap.sh
./bootstrap.sh
```

## Usage

This script has 2 major components: package installation and dotfiles symlink creation.

## Features

### zsh

* Fish-like syntax highlighting
* Fish-like autosuggestions
* Oh-My-Zsh + Powerlevel10k
* Improved defaults and sensible aliases

### neovim

Version: 0.6+  
Plugin Manager: packer.nvim

### tmux

* Prefixless keybindings
* Autostart tmux in new terminal
