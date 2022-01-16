#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
    echo 'Error: package manager not provided. Exiting script...'
    exit 1
fi

if [ $1 = "apt-get" ]; then
    LIN_ARCH=$(dpkg --print-architecture)
fi

MANAGER=$1
"$MANAGER" update && "$MANAGER" upgrade

# [ZSH]
# Install zsh if missing with oh-my-zsh
if [ ! command -v zsh &> /dev/null ]; then
    $1 install zsh
    chsh -s $(which zsh)
else
    echo "zsh is already installed"
fi
# Install oh-my-zsh and powerlevel10k
if [ ! -d "~/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

if [ ! -d "~/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

if [ ! -d "~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [ ! -d "~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi


# Ubuntu-specific installation, if missing
if [ $MANAGER = "apt-get" ]; then
    # install neovim
    if [ ! command -v nvim &> /dev/null ]; then
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
        chmod u+x nvim.appimage
        ./nvim.appimage --appimage-extract
        ./squashfs-root/AppRun --version
        mv squashfs-root /
        ln -s /squashfs-root/AppRun /usr/bin/nvim
    else
        echo "nvim is already installed"
    fi
    
    # install bat + ripgrep (avoid package error) if either missing
    if [[ ! command -v bat &> /dev/null ] || [ ! command -v rg &> /dev/null ]]; then
        apt install -o Dpkg::Options::="--force-overwrite" bat ripgrep
    else
        echo "bat is already installed"
        echo "ripgrep is already installed"
    fi

    # install delta
    if [ ! command -v delta &> /dev/null ]; then
        wget -r -l1 --no-parent -P /tmp -A{$LIN_ARCH}.deb https://github.com/dandavison/delta/releases/latest/download/
        dpkg -i /tmp/git-delta*.deb
    else
        echo "delta is already installed"
    fi

    # install fzf
    if [ ! command -v fzf &> /dev/null ]; then
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
    else
        echo "fzf is already installed"
    fi
fi


# package manager installations
for package in ./packages.json
do
    "$MANAGER" install package
done


# install packer.nvim
if [ ! -d "~/.local/share/nvim/site/pack/packer/start/packer.nvim" ] 
then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    echo "Packer.nvim has been installed"
else
    echo "Packer.nvim is already installed"
fi 

echo "Success! Essential packages have been installed..."