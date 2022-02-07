# Aliases
# [CLI Navigation]
alias cd..='cd ..'                              # cd.. command not found
alias ..='cd ..'                                # faster cd ..
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"                                  # `cd` is probably faster to type
alias -- -="cd -"

# [Improved Defaults]
alias ls='ls --color=auto'                      # colorize ls output
alias ll='ls -lahsF'                            # long-listing ls
alias lh='ls -d .*'                             # show hidden files
alias grep='grep --color=auto -i'               # colorize grep output
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vi=vim                                    # set nvim as default vi
alias c='clear'                                 # faster clear
alias y='yarn'
alias ffs='sudo !!'                             # run previous command with sudo

# [Typos]
alias gerp=grep                                 # avoid grep typos
alias ipconfig=ifconfig                         # alias for ifconfig to avoid error
alias help=tldr                                 # easier keyword to remember tldr
command -v bat > /dev/null || alias bat=batcat  # alias for bat on Ubuntu/Debian
command -v fd > /dev/null || alias fd=fdfind    # alias for fd on Ubuntu/Debian

# [Debugging]
alias ports='ss -tulanp'                        # view port status
alias h='history|grep'                          # search cli history
alias jstat='jobs -l'                           # list running jobs
alias path='echo -e ${PATH//:/\\n}'             # print each PATH entry on a separate line
alias duf='du -h --max-depth=1 | sort -rh'      # list out folders by size
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# [Shortcuts]
alias mtr='sudo /usr/local/sbin/mtr'            # mtr shortcut
alias reload='source ~/.zshrc'                  # reload terminal
alias zshconfig='sudo nvim ~/.zshrc'            # edit zsh config file
alias dev='cd ~/dev'                            # shortcut to dev folder
alias zshalias='nvim ~/.zsh/aliases.zsh'        # shortcut to edit aliases
alias dotfiles='cd ~/.dotfiles'                 # shortcut to dotfile directory
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

# [Alternative Commands for MacOS]
# use `md5` as a fallback for macOS
command -v md5sum > /dev/null || alias md5sum="md5"
# use `shasum` as a fallback for macOS
command -v sha1sum > /dev/null || alias sha1sum="shasum"
# use findutils find for macOS
command -v gfind > /dev/null && alias find="gfind"
# use gnu ls for macOS
ls --color=auto &> /dev/null || alias ls="/usr/local/opt/coreutils/libexec/gnubin/ls --color=auto"


# [Functions]
cs() {
    local cheatsheet_home="$HOME/.dotfiles/custom/cheatsheets"
    list_cheatsheets() {
        for file in $(find -H $cheatsheet_home -maxdepth 1 -mindepth 1 | sed 's#.*/##'); do
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
        if [ $# -eq 1 ] && [ -f "$cheatsheet_home/cs-$1.txt" ]; then
            cat "$cheatsheet_home/cs-$1.txt"
        elif [ $# -eq 2 ] && [ -f "$cheatsheet_home/cs-$1.txt" ]; then
            cat "$cheatsheet_home/cs-$1.txt" | grep $2
        else
            echo "Invalid cheatsheet. Please choose from the following:"
            list_cheatsheets
        fi
    fi    
}
