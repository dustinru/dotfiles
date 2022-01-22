# Aliases
# [CLI Behavior]
alias ls='ls --color=auto'                      # colorize ls output
alias ll='ls -lahsF'                            # long-listing ls
alias lh='ls -d .*'                             # show hidden files
alias cd..='cd ..'                              # cd.. command not found
alias ..='cd ..'                                # faster cd ..
alias grep='grep --color=auto -i'               # colorize grep output
alias gerp=grep                                 # avoid grep typos
alias vim=nvim                                  # set nvim as default vim
alias vi=vim                                    # set nvim as default vi
alias ipconfig=ifconfig                         # alias for ifconfig to avoid error
alias ports='ss -tulanp'                        # view port status
alias bat=batcat                                # alias for bat on Ubuntu
alias help=tldr                                 # easier keyword to remember tldr
alias c='clear'                                 # faster clear
alias y='yarn'
alias ffs='sudo !!'                             # run previous command with sudo
alias h='history|grep'                          # search cli history
alias jstat='jobs -l'                           # list running jobs
# [Shortcuts]
alias mtr='sudo /usr/local/sbin/mtr'            # mtr shortcut
alias reload='source ~/.zshrc'                  # reload terminal
alias zshconfig='sudo nvim ~/.zshrc'            # edit zsh config file
alias dev='cd ~/dev'                            # shortcut to dev folder
alias zshalias='nvim ~/.zsh/aliases.zsh'        # shortcut to edit aliases
alias dotfiles='cd ~/.dotfiles'                 # shortcut to dotfile directory
# [Functions]
cs() {
    list_cheatsheets() {
        for file in $(find -H "$HOME/.dotfiles/custom" -maxdepth 1 -mindepth 1 -type f -printf "%P\n"); do
            echo "> ${${file%.*}#cs-}"
        done
    }
    if [ $# -eq 0 ]; then
        echo "No arguments supplied. Please choose from the following cheatsheets:"
        list_cheatsheets
    elif [ $# -gt 2 ] || [ $1 = "--help" ] || [ $1 = "-h" ]; then
        echo ''
        echo "Program usage is as follows:"
        echo ''
        echo "> cs \$1 \$2"
        echo "\$1 - cheatsheet name, i.e. tmux"
        echo "\$2 - (optional), grep for specific keymap"
    else
        if [ $# -eq 1 ] && [ -f "$HOME/.dotfiles/custom/cs-$1.txt" ]; then
            cat "$HOME/.dotfiles/custom/cs-$1.txt"
        elif [ $# -eq 2 ] && [ -f "$HOME/.dotfiles/custom/cs-$1.txt" ]; then
            cat $HOME/.dotfiles/custom/cs-$1.txt | grep $2
        else
            echo "Invalid cheatsheet. Please choose from the following:"
            list_cheatsheets
        fi
    fi    
}