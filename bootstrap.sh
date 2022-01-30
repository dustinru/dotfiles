#!/usr/bin/env bash

# Logging functions
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

# Run as sudo due to installs/upgrades
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

cd "$(dirname "$0")/."
HOME_DIR=$(dirname "$PWD")
DOTFILES_ROOT=$(pwd -P)
DOTFILES_BACKUP="$HOME_DIR/.dotfiles_backup"
mkdir -p $DOTFILES_BACKUP

info "Syncing config files with the latest from dustinru/dotfiles repo..."
if [ $(git fetch --dry-run) -ne 0 ]; then
    git pull origin main
fi
success "Files are up to date"

echo ''

info "Determining OS for script running..."
# Check OS (Linux (Ubuntu/WSL), or MacOS)
case "$OSTYPE" in
linux*) success "Detected system: Linux"
    lin_arch=$(dpkg --print-architecture)
    info "Linux is using the following architecture: $lin_arch"
    manager="apt-get"
    ;;
darwin*) success "Detected system: OS X"
    manager="brew"
    ;;
msys*) fail "Unsupported system: Windows(DOS). Exiting script..."
    ;;
*) fail "Unsupported system. Exiting script..."
    ;;
esac
info "Using $manager as the package manager..."

# Sourcing files to maintain chmod -x permissions and variables
. "$DOTFILES_ROOT/scripts/install.sh" $manager || exit 1

. "$DOTFILES_ROOT/scripts/symlink.sh" || exit 1

echo "Setup completed! Make sure to switch the shell to zsh [chsh -s \$(which zsh)] run :PackerCompile and :PackerInstall within Neovim"