#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

git pull origin main

echo ''

# Check OS (Linux (Ubuntu/WSL), or MacOS)
case "$OSTYPE" in
linux*) echo "Detected system: Linux"
    MANAGER="apt-get"
    ;;
darwin*) echo "Detected system: OS X"
    MANAGER="brew"
    ;;
msys*) echo "Unsupported system: Windows(DOS). Exiting script..."
    exit 1
    ;;
*) echo "Unsupported system. Exiting script..."
    exit 1
    ;;
esac

# Run through installation script for missing packages
.scripts/install.sh "$MANAGER"

# Symlink ~/.dotfiles folder w/ config dot files
.scripts/symlink.sh