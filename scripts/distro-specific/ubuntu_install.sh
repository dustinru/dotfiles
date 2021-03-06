# neovim, bat, ripgrep, delta, fzf
if [ ! -x "$(command -v nvim)" ]; then
    fail "Please install neovim before continuing further. Exiting script..."
fi

if [ ! -x "$(command -v batcat)" ] || [ ! -x "$(command -v rg)" ]; then
    apt -y install -o Dpkg::Options::="--force-overwrite" bat ripgrep
    success "bat has been installed"
    success "ripgrep has been installed"
else
    info "bat is already installed"
    info "ripgrep is already installed"
fi

if [ ! -x "$(command -v delta)" ]; then
    delta_url=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep -i "$lin_arch.deb" | grep -v musl)
    wget -P /tmp $delta_url
    dpkg -i /tmp/git-delta*.deb
    success "delta has been installed"
else
    info "delta is already installed"
fi

if [ ! -d "$HOME_DIR/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME_DIR/.fzf
    $HOME_DIR/.fzf/install
    success "fzf has been installed"
else
    info "fzf is already installed"
fi