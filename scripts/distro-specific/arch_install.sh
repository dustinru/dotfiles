# prompt for yay before installing AUR packages
if [ ! -x "$(command -v yay)" ]; then
    echo ''
    info "Yay is not installed. Follow the steps listed on the dotfiles repo."
    fail "Please ensure yay is installed before proceeding further..."
fi

echo ''
info "Installing AUR packages with yay..."
package_list=$(extractPackageList "yay")
for package in ${package_list[@]}; do
    if [ ! $(pacman -Qi $package) ]; then
        yay -S $package
        success "$package has been installed"
    else
        info "$package is already installed"
    fi
done