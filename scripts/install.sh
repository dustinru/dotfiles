#!/usr/bin/env bash

packageExists() {
    # $1 is manager, $2 is package
    # return 0 (true) if exists
    case "$1" in
    pacman)
        if [ $($1 -Qi $2) ]; then
            return 0
        fi;;
    apt-get)
        if [ $(dpkg -l | awk "/$2/ {print }"|wc -l) -ge 1 ]; then
            return 0
        fi;;
    brew)
        if [ $($1 ls --versions $2 > /dev/null) ]; then
            return 0
        fi;;
    esac
    return 1
}

extractPackageList() {
    local packageList=$( jq -r '.'\"$1\"' | @sh' "$DOTFILES_ROOT/scripts/packages.json" | tr -d \'\" )
    echo $packageList
}


if [[ $# -eq 0 ]] ; then
    fail 'Error: package manager not provided. Exiting script...'
fi

if [ -z $DOTFILES_ROOT ] || [ ! -d $DOTFILES_ROOT ]; then
    fail "You have not run bootstrap.sh at least once. Exiting script..."
fi

# Adding manager arguments and running update/upgrade
info "Running equivalent update and upgrade commands with $1..."
case "$1" in
pacman)     man_key="$1 -S --needed --noconfirm"
    pacman -Syu
    ;;
apt-get)    man_key="$1 -qq -y"
    $man_key update && $man_key upgrade
    ;;
*)          man_key=$1
    $man_key update && $man_key upgrade
    ;;
esac

success "Currently installed packages are up to date"

echo ''
info "Installing core packages..."
core_list=("git" "curl" "jq" "wget" "zsh")
for val in ${core_list[@]}; do
    if ! $(packageExists $1 $val); then
        $man_key install $val
        success "$val has been installed"
    else
        info "$val is already installed"
    fi
done

# oh-my-zsh and themes/plugins
echo ''
ZSH="$HOME_DIR/.oh-my-zsh"
info "Installing oh-my-zsh and oh-my-zsh themes/plugins..."
if [ ! -f "$HOME_DIR/.oh-my-zsh/oh-my-zsh.sh" ]; then
    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O /tmp/install.sh 
    . /tmp/install.sh --unattended
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
            if [ $entry = "zsh-autosuggestions" ]; then
                sudo git clone --depth=1 https://github.com/romkatv/$entry ${ZSH_CUSTOM:-$HOME_DIR/.oh-my-zsh/custom}/$custom_subdir/$entry
            else
                git clone --depth=1 https://github.com/romkatv/$entry.git ${ZSH_CUSTOM:-$HOME_DIR/.oh-my-zsh/custom}/$custom_subdir/$entry
            fi
            success "$custom_subdir/$entry has been installed"
        else
            info "$custom_subdir/$entry is already installed"
        fi
    done
done

# general package installations
echo ''
info "Installing remaining packages with $1..."
package_list=$(extractPackageList $1)
for package in ${package_list[@]}; do
    if ! $(packageExists $1 $package); then
        $man_key install $package
        success "$package has been installed"
    else
        info "$package is already installed"
    fi
done

# distro-specific installations
echo ''
case "$1" in
pacman)     info "Beginning Arch-specific installations..."
    . "$DOTFILES_ROOT/scripts/distro-specific/arch_install.sh"
    ;;
apt-get)    info "Beginning Ubuntu-specific installations..."
    . "$DOTFILES_ROOT/scripts/distro-specific/ubuntu_install.sh"
    ;;
esac

# Node.js package installation
echo ''
info "Installing node.js packages with npm..."
package_list=$(extractPackageList "npm")
npm list -g --depth=0 >/tmp/tmp_npm_list.txt
for package in ${package_list[@]}; do
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

echo ''
success "Success! Essential packages have been installed..."