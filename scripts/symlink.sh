#!/usr/bin/env bash

if [ -z $DOTFILES_ROOT ] || [ ! -d $DOTFILES_ROOT ] || [ -z $DOTFILES_BACKUP ] || [ ! -d $DOTFILES_BACKUP ]; then
    echo "You have not run bootstrap.sh at least once"
    exit 1
fi

mkdir -p $DOTFILES_BACKUP
# nvim config directory
local nvim_config_home=""~/.config/nvim""
mkdir -p $nvim_config_home

local folder_list=("tmux" "zsh" "nvim")
for folder in ${folder_list[@]}; do
    for file in $(find -H "$DOTFILES_ROOT/$folder" -maxdepth 1 -mindepth 1 -printf "%P\n"); do
        
        # ln -s my_file.txt my_link.txt
        # ls -l my_link.txt to list link 
        local parent_folder=$HOME
        if [ $folder = "nvim" ]; then
            parent_folder=$nvim_config_home
        fi
        echo "Backing up $file to ~/.dotfiles_backup..."
        cp -a "$parent_folder/$file" "$DOTFILES_BACKUP/$file"
        
        echo "Backup completed for $file! Creating symlink for $file..."
        ln -s "$DOTFILES_ROOT/$folder/$file" "$parent_folder/$file"
        ls -l "$parent_folder/$file"
        echo "Success! Created symlink for $file"
    done
done

# Manual symlink creation for now
#ln -s "$DOTFILES_ROOT/tmux/.tmux.conf"
#ln -s "$DOTFILES_ROOT/zsh/.zsh"
#ln -s "$DOTFILES_ROOT/zsh/.p10k.zsh"
#ln -s "$DOTFILES_ROOT/zsh/.zshrc"
#ln -s "$DOTFILES_ROOT/nvim/lua"
#ln -s "$DOTFILES_ROOT/nvim/init.lua"