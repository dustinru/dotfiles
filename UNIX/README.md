## How to install Neovim
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
```
### Optional: exposing nvim globally.
```
mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim
```
## How to install Ripgrep (rg) and Bat (bat)
```
sudo apt install -o Dpkg::Options::="--force-overwrite" bat ripgrep
```
## Determine architecture for .deb files (Linux)
```
dpkg --print-architecture
```
## Download diff on Ubuntu
```
cd ~/tmp/
wget -r -l1 --no-parent -Aamd64.deb https://github.com/dandavison/delta/releases/latest/download/
dpkg -i git-delta*amd64.deb
```