#!/bin/bash
sudo apt install software-properties-common git wget make python3-pip -y
git clone https://github.com/tizianoGuadagnino/dotfiles.git $HOME/dotfiles
/bin/bash $HOME/dotfiles/install.sh
