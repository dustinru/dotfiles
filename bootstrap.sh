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
DOTFILES_ROOT=$(pwd -P)
DOTFILES_BACKUP="$HOME/.dotfiles_backup"

info "Syncing config files with the latest from dustinru/dotfiles repo..."
git pull origin main
success "Files are up to date"

echo ''

info "Determining OS for script running..."
# Check OS (Linux (Ubuntu/WSL), or MacOS)
case "$OSTYPE" in
linux*) success "Detected system: Linux"
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

fail "End of parent script"

echo "Setup completed! Make sure to run :PackerCompile and :PackerInstall within Neovim"