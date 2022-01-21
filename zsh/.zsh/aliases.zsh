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