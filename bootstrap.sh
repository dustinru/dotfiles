#!/usr/bin/env bash

# Helper Functions
usage()
{
    echo ""
    echo "Usage: $0 [OPTION]..."
    echo -e "\t-i    only run package installation, optional"
    echo -e "\t-b    run both dotfile symlink creation and package installation, optional"
    exit 1 # Exit script after printing help
}
# Logging Functions
info () {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}
user () {
    printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}
success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}
fail () {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit 1
}


# Main Script
if [[ $# -ge 2 ]] ; then
    usage
fi

script_opt=""
while getopts ":is" opt; do
    case "$opt" in
        i) script_opt="installonly";;
        b) script_opt="both";;          # will never be passed. just to allow script to proceed
        :) script_opt="symlinkonly";;   # symlinkonly if no argument passed
        ?) usage ;; # Print helpFunction in case parameter is non-existent
    esac
done

# Run as sudo due to installs/upgrades
[ "$OSTYPE" == "darwin"* ] || [ "$EUID" -eq 0 ] || fail "Please run with root privileges. Exiting script..."

cd "$(dirname "$0")/."
HOME_DIR=$(dirname "$PWD")
DOTFILES_ROOT=$(pwd -P)
DOTFILES_BACKUP="$HOME_DIR/.dotfiles_backup"
mkdir -p $DOTFILES_BACKUP

info "Syncing config files with the latest from dustinru/dotfiles repo..."
if [ ! -z $(git fetch --dry-run) ]; then
    git pull origin main
fi
success "Files are up to date"

echo ''

info "Determining OS for script running..."
# Check OS (Linux (Ubuntu/WSL/Arch), or MacOS)
if [[ $OSTYPE == "linux"* ]]; then
    success "Detected system: Linux"
    unameR="$(uname -r)"
    case "$unameR" in
    *arch*)                 manager="pacman";;
    *ubuntu*|*microsoft*)   manager="apt-get"
        lin_arch=$(dpkg --print-architecture)
        info "Linux is using the following architecture: $lin_arch"
        ;;
    *)  fail "Unsupported Linux distro. Exiting script...";;
    esac
elif [[ $OSTYPE == "darwin"* ]]; then
    success "Detected system: OS X"
    manager="brew"
elif [[ $OSTYPE == "msys"* ]]; then
    fail "Unsupported system: Windows(DOS). Exiting script..."
else
    fail "Unsupported system. Exiting script..."
fi
info "Using the $manager package manager..."

# Sourcing files to maintain chmod -x permissions and variables

case "$script_opt" in
    installonly)    . "$DOTFILES_ROOT/scripts/install.sh" $manager;;
    symlinkonly)    . "$DOTFILES_ROOT/scripts/symlink.sh";;   # symlinkonly if no argument passed
    both)   . "$DOTFILES_ROOT/scripts/install.sh" $manager;
            . "$DOTFILES_ROOT/scripts/symlink.sh";;          # will never be passed. just to allow script to proceed
    ?) exit 1;;
esac

echo "Setup completed! Make sure to switch the shell to zsh, reopen the terminal, and run :PackerCompile/:PackerInstall within Neovim"