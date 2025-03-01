# Work-specific aliases, zsh scripts, etc.

alias addsc='sudo ~/Downloads/addSE/addSecurityExceptions.sh'	# add network security config
alias tools='cd $HOME/Documents/tools' # tools/utilities directory

# Run PHP for mediation rewrite tool
tamtool() {
        cd $HOME/Documents/tools/tam-utils/Curtis_Tool;
        open http://localhost:8000;
        php -S localhost:8000
}

# Run PHP for Curtis' Polling Tool
pollingtool() {
  cd $HOME/Documents/tools/tam-utils/Curtis_Tool;
  open http://localhost:8000/pollingURLgenerator.php;
  php -S localhost:8000
}

# Run PHP for encrypt/decrypt tool
encrypttool() {
  cd $HOME/Documents/tools/tam-utils/Curtis_Tool;
  open http://localhost:8000/encryptTool.php;
  php -S localhost:8000
}

# Alias for tamAdvisor
tamadvisor() {
	cd $HOME/dev/tools/Integration-Scripts/JS/tamAdvisor;
	npm start
}

logcat() {

}

# Path for flutter commands in zsh
export PATH=~/dev/flutter/flutter/bin:$PATH
