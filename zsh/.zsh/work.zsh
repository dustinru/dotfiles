# Work-specific aliases, zsh scripts, etc.

alias addsc='sudo ~/Downloads/addSE/addSecurityExceptions.sh'	# add network security config
alias tools='cd $HOME/Documents/tools' # tools/utilities directory

# Run PHP for TAM Encrypt/Decrypt Tool
tamtool() {
        cd $HOME/Documents/tools/tam-utils/Curtis_Tool;
        open http://localhost:8000;
        php -S localhost:8000
}

# Alias for tamAdvisor
tamadvisor() {
	cd $HOME/Documents/tools/Integration-Scripts/JS/tamAdvisor;
	npm start
}
