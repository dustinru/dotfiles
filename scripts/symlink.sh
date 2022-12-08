#!/usr/bin/env bash

if [ -z $DOTFILES_ROOT ] || [ ! -d $DOTFILES_ROOT ] || [ -z $DOTFILES_BACKUP ] || [ ! -d $DOTFILES_BACKUP ]; then
    echo "You have not run bootstrap.sh at least once"
    exit 1
fi

# Use GNU find for printf option
command -v gfind > /dev/null && alias find="gfind"

echo ''
info "Beginning symlink process..."
echo ''

nvim_config_home="$HOME_DIR/.config/nvim"
kitty_config_home="$HOME_DIR/.config/kitty"
mkdir -p $nvim_config_home
mkdir -p $kitty_config_home

config_folder_list=("tmux" "zsh" "nvim" "kitty")
for folder in ${config_folder_list[@]}; do
    for file in $(find -H "$DOTFILES_ROOT/$folder" -maxdepth 1 -mindepth 1 | sed 's#.*/##'); do
        parent_folder=$HOME_DIR
        if [ $folder = "nvim" ]; then
            parent_folder=$nvim_config_home
        elif [ $folder = "kitty" ]; then
            parent_folder=$kitty_config_home
        fi

        src_path="$DOTFILES_ROOT/$folder/$file"
        sym_path="$parent_folder/$file"
        
        info "Backing up $file to ~/.dotfiles_backup..."
        if [ -f $sym_path ] && [ ! -L $sym_path ]; then
            cp -a $sym_path "$DOTFILES_BACKUP/$file"
            success "Backup completed! Creating symlink for $file..."
        else
            info "$file is either missing or a symbolic link. Skipping backup and creating symlink..."
        fi
        
        if [ ! -L $sym_path ] || [ "$(readlink "$sym_path")" != "$src_path" ]; then
            #rm -rf $sym_path
            ln -sfn $src_path $sym_path
            ls -l $sym_path
            success "Success! Created symlink for $file at $sym_path"
        else
            info "Symlink for $file already exists at $sym_path..."
        fi
        echo ''
    done
done
