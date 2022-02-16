# Work-specific aliases, zsh scripts, etc.

alias addsc='sudo ~/Downloads/addSE/addSecurityExceptions.sh'	# add network security config

# Run PHP for TAM Encrypt/Decrypt Tool
tamtool() {
        cd $HOME/Documents/tam-utils/Curtis_Tool;
        open http://localhost:8000;
        php -S localhost:8000
}
