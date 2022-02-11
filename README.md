<div align="center">

# Dustin's dotfiles

[Installation](#installation) • [Usage](#usage) • [Features](#features) • [Wiki](https://github.com/dustinru/dotfiles/wiki)

</div>

A repository and programmatic setup of my dot files for MacOS, Windows (WSL), and other Linux distros with a focus on zsh, neovim, and tmux.

## Installation

### Prerequisites

Supported OS: Ubuntu (Native/WSL), Arch Linux, MacOS

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

#### Ubuntu (Native/WSL)

1. Install neovim

    ```bash
    # Stable
    sudo add-apt-repository ppa:neovim-ppa/stable
    # Nightly
    sudo add-apt-repository ppa:neovim-ppa/unstable

    sudo apt-get update
    sudo apt-get install neovim
    ```

#### Arch Linux

1. Install yay

    ```bash
    pacman -S --needed git base-devel
    cd /tmp/ && git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    ```

#### MacOS

1. Install a terminal emulator (e.g. iterm2, kitty, etc.)

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

## Common Errors/Issues

### Various Permission Denied Errors for Neovim

```log
> nvim .gitconfig
E886: System error while opening ShaDa file /home/dustinr/.local/share/nvim/shada/main.shada for reading: permission denied
E303: Unable to create directory "/home/dustinr/.local/share/nvim/swap" for swap file, recovery impossible: permission denied
E303: Unable to open swap file for "/home/dustinr/.gitconfig", recovery impossible
E886: System error while opening ShaDa file /home/dustinr/.local/share/nvim/shada/main.shada for reading: permission denied
```

To address this, you need to change ownership of the various ~/.local/share/nvim files/directories:

```bash
sudo chown -R "${USER}" ~/.local
```

### Neovim unable to create directory

```log
[ERROR Wed Feb  9 10:33:49 2022 3.72275146663e+14] .../site/pack/packer/start/packer.nvim/lua/packer/async.lua:20: Error in coroutine: Vim:E739: Cannot create directory /home/dustinr/.config/nvim/plugin: permission denied
```

To work around this, you need to manually create the directory:

```bash
sudo mkdir -p ~/.config/nvim/plugin
```

### Neovim errors with indexing local (a nil value)

```log
[ERROR Wed Feb  9 12:21:05 2022 3.787105013973e+14] .../site/pack/packer/start/packer.nvim/lua/packer/async.lua:20: Error in coroutine: ...e/nvim/site/pack/packer/start/packer.nvim/lua/packer.lua:701: attempt to index local 'output_file' (a nil value)
```

To address this, you need to change ownership of the ~/.config/nvim/plugin directory:

```bash
sudo chown $USER ~/.config/nvim/plugin
```
