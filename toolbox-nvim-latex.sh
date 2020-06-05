#!/usr/bin/bash -e

echo "## Setting personal gnome inputs..."
# Swaps Esc button with CapsLock
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

# Enables touchpad while writting
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing "false"

echo "## Creating work container..."
toolbox create -c work 

run="toolbox run -c work"

echo "## Installing RPM dependencies inside container..."
$run sudo dnf install -y nodejs nvim ctags python3-neovim zathura zathura-plugins-all texlive-scheme-full rubber  

echo "## Installing vim-plug..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
