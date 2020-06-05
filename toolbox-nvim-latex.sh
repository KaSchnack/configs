#!/usr/bin/bash

echo "## Changing gnome settings..."
# Swaps Esc button with CapsLock
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

# Enables touchpad while writting
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing "false"

echo "## Downloading Cryptopass browser addon.."
git clone https://github.com/dchest/cryptopass

echo "## Installing vim-plug..."
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "## Installing personal neovim init.vim..."
curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/init.vim --create-dirs https://raw.githubusercontent.com/KaSchnack/configs/master/init.vim

echo "## Creating work container..."
toolbox create -c work 

run="toolbox run -c work"

echo "## Installing RPM dependencies inside container..."
$run sudo dnf install -y nodejs neovim ctags python3-neovim zathura zathura-plugins-all texlive-scheme-full rubber  

echo "## Done!"
