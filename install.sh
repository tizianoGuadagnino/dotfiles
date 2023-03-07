#!/bin/sh
sudo apt install software-properties-common git wget sudo make python3-pip -y
git clone https://github.com/tizianoGuadagnino/dotfiles.git $HOME/dotfiles
/bin/bash $HOME/dotfiles/setup_dot_files.bash
