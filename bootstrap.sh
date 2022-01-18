#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)
DOTFILES_BACKUP="$HOME/.dotfiles_backup"

#DEBUGGING
echo $DOTFILES_ROOT
exit 1

git pull origin main

echo ''

# Check OS (Linux (Ubuntu/WSL), or MacOS)
case "$OSTYPE" in
linux*) echo "Detected system: Linux"
    manager="apt-get"
    ;;
darwin*) echo "Detected system: OS X"
    manager="brew"
    ;;
msys*) echo "Unsupported system: Windows(DOS). Exiting script..."
    exit 1
    ;;
*) echo "Unsupported system. Exiting script..."
    exit 1
    ;;
esac

# Run through installation script for missing packages
"$DOTFILES_ROOT/scripts/install.sh" $manager

# Symlink ~/.dotfiles folder w/ config dot files
"$DOTFILES_ROOT/scripts/symlink.sh"

echo "Setup completed! Make sure to run :PackerCompile and :PackerInstall within Neovim"