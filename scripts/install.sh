#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
    fail 'Error: package manager not provided. Exiting script...'
fi

if [ -z $DOTFILES_ROOT ] || [ ! -d $DOTFILES_ROOT ]; then
    fail "You have not run bootstrap.sh at least once. Exiting script..."
fi

if [ $1 = "apt-get" ]; then
    man_key="$1 -qq -y"
else
    man_key=$1
fi

info "Running $1 update and $1 upgrade..."
$man_key update && $man_key upgrade
success "Currently installed packages are up to date"

echo ''
info "Installing core packages..."
core_list=("git" "curl" "jq" "wget" "zsh")
for val in ${core_list[@]}; do
    if [ $val = "zsh" ] && [ ! -x $(command -v $val) ]; then
        $man_key install $val
        chsh -s $(which zsh)
        success "$val has been installed"
    elif [ ! -x $(command -v $val) ]; then
        $man_key install $val
        success "$val has been installed"
    else
        info "$val is already installed"
    fi
done

echo ''
info "Installing oh-my-zsh and oh-my-zsh themes/plugins..."
if [ ! -d "$HOME_DIR/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    success "oh-my-zsh has been installed"
else
    info "oh-my-zsh is already installed"
fi

declare -A zsh_list
themes_list=("powerlevel10k")
plugins_list=("zsh-syntax-highlighting" "zsh-autosuggestions")
zsh_list[themes]=themes_list[@]
zsh_list[plugins]=plugins_list[@]
for custom_subdir in ${!zsh_list[@]}; do
    for entry in ${!zsh_list[$custom_subdir]}; do
        if [ ! -d "$HOME_DIR/.oh-my-zsh/custom/$custom_subdir/$entry" ]; then
            git clone --depth=1 https://github.com/romkatv/$entry.git ${ZSH_CUSTOM:-$HOME_DIR/.oh-my-zsh/custom}/$custom_subdir/$entry
            success "$custom_subdir/$entry has been installed"
        else
            info "$custom_subdir/$entry is already installed"
        fi
    done
done

# Ubuntu-specific installation, if missing
if [ $1 = "apt-get" ]; then
    echo ''
    info "Beginning Ubuntu-specific installations..."
    if [ ! -x $(command -v nvim) ]; then
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
        chmod u+x nvim.appimage
        ./nvim.appimage --appimage-extract
        ./squashfs-root/AppRun --version
        mv squashfs-root /
        ln -s /squashfs-root/AppRun /usr/bin/nvim
        success "nvim has been installed"
    else
        info "nvim is already installed"
    fi
    
    if [ ! -x $(command -v batcat) ] || [ ! -x $(command -v rg) ]; then
        apt -y install -o Dpkg::Options::="--force-overwrite" bat ripgrep
        success "bat has been installed"
        success "ripgrep has been installed"
    else
        info "bat is already installed"
        info "ripgrep is already installed"
    fi

    if [ ! -x $(command -v delta) ]; then
        delta_url=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep -i "$lin_arch.deb" | grep -v musl)
        wget -P /tmp $delta_url
        dpkg -i /tmp/git-delta*.deb
        success "delta has been installed"
    else
        info "delta is already installed"
    fi

    if [ ! -x $(command -v fzf) ]; then
        git clone --depth 1 https://github.com/junegunn/fzf.git $HOME_DIR/.fzf
        $HOME_DIR/.fzf/install
        success "fzf has been installed"
    else
        info "fzf is already installed"
    fi
fi

echo ''
info "Installing remaining packages with $1..."
package_list=($( jq -r '.'\"$1\"' | @sh' "$DOTFILES_ROOT/scripts/packages.json" | tr -d \'\" ))
for package in ${package_list[@]}; do
    if [[( $1 = "apt-get" && ! $(dpkg -l | awk "/$package/ {print }"|wc -l) -ge 1 ) || ( $1 = "brew" && ! $($1 ls --versions $package) )]]; then
        $man_key install $package
        success "$package has been installed"
    else
        info "$package is already installed"
    fi
done


echo ''
info "Installing node.js packages with npm..."
npm_list=($( jq -r '.'\"npm\"' | @sh' "$DOTFILES_ROOT/scripts/packages.json" | tr -d \'\" ))
npm list -g --depth=0 >/tmp/tmp_npm_list.txt
for package in ${npm_list[@]}; do
    if [[ ! $(cat /tmp/tmp_npm_list.txt | grep $package) ]]; then
        npm install -g --quiet $package
        success "$package has been installed"
    else
        info "$package is already installed"
    fi
done

echo ''
info "Installing the nvim plugin manager..."
if [ ! -d "$HOME_DIR/.local/share/nvim/site/pack/packer/start/packer.nvim" ] 
then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$HOME_DIR/.local/share/nvim/site/pack/packer/start/packer.nvim"
    success "Packer.nvim has been installed"
else
    info "Packer.nvim is already installed"
fi

success "Success! Essential packages have been installed..."