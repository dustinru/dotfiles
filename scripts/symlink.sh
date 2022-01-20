#!/usr/bin/env bash

if [ -z $DOTFILES_ROOT ] || [ ! -d $DOTFILES_ROOT ] || [ -z $DOTFILES_BACKUP ] || [ ! -d $DOTFILES_BACKUP ]; then
    echo "You have not run bootstrap.sh at least once"
    exit 1
fi

# nvim config directory
nvim_config_home="$HOME/.config/nvim"
mkdir -p $nvim_config_home

config_folder_list=("tmux" "zsh" "nvim")
for folder in ${config_folder_list[@]}; do
    for file in $(find -H "$DOTFILES_ROOT/$folder" -maxdepth 1 -mindepth 1 -printf "%P\n"); do
        
        # ln -s my_file.txt my_link.txt
        # ls -l my_link.txt to list link 
        parent_folder=$HOME
        if [ $folder = "nvim" ]; then
            parent_folder=$nvim_config_home
        fi
        #info "Backing up $file to $HOME/.dotfiles_backup..."
        #cp -a "$parent_folder/$file" "$DOTFILES_BACKUP/$file"
        info "backing up $parent_folder/$file to $DOTFILES_BACKUP/$file"
        info "linking src: $DOTFILES_ROOT/$folder/$file to sym: $parent_folder/$file"
        
        #success "Backup completed for $file! Creating symlink for $file..."
        #ln -s "$DOTFILES_ROOT/$folder/$file" "$parent_folder/$file"
        #ls -l "$parent_folder/$file"
        #success "Success! Created symlink for $file"
    done
done

# Debugging Break
fail "End of child script"

# Manual symlink creation for now
#ln -s "$DOTFILES_ROOT/tmux/.tmux.conf"
#ln -s "$DOTFILES_ROOT/zsh/.zsh"
#ln -s "$DOTFILES_ROOT/zsh/.p10k.zsh"
#ln -s "$DOTFILES_ROOT/zsh/.zshrc"
#ln -s "$DOTFILES_ROOT/nvim/lua"
#ln -s "$DOTFILES_ROOT/nvim/init.lua"