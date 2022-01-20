#!/usr/bin/env bash

if [ -z $DOTFILES_ROOT ] || [ ! -d $DOTFILES_ROOT ] || [ -z $DOTFILES_BACKUP ] || [ ! -d $DOTFILES_BACKUP ]; then
    echo "You have not run bootstrap.sh at least once"
    exit 1
fi

echo ''
info "Beginning symlink process..."

# nvim config directory
nvim_config_home="$HOME_DIR/.config/nvim"
mkdir -p $nvim_config_home

config_folder_list=("tmux" "zsh" "nvim")
for folder in ${config_folder_list[@]}; do
    for file in $(find -H "$DOTFILES_ROOT/$folder" -maxdepth 1 -mindepth 1 -printf "%P\n"); do
        parent_folder=$HOME_DIR
        if [ $folder = "nvim" ]; then
            parent_folder=$nvim_config_home
        fi
        info "Backing up $file to ~/.dotfiles_backup..."
        cp -a "$parent_folder/$file" "$DOTFILES_BACKUP/$file"
        success "Backup completed for $file! Creating symlink for $file..."
        if [ ! -L $parent_folder/$file ] || [ ! "$(readlink -- "$parent_folder/$file")" = "$DOTFILES_ROOT/$folder/$file" ]; then
            ln -sfn "$DOTFILES_ROOT/$folder/$file" "$parent_folder/$file"
            ls -l "$parent_folder/$file"
            success "Success! Created symlink for $file at $parent_folder/$file"
        else
            info "Symlink for $file already exists at $parent_folder/$file..."
        fi
        echo ''
    done
done