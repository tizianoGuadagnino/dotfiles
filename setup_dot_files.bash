#!/bin/bash
ROOT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
# install necessary packages for plugins
sudo apt install -y neovim clang-format-12 flake8 python3-autopep8 tmux silversearcher-ag ripgrep fonts-powerline zathura
cd ~/ && wget https://github.com/sharkdp/bat/releases/download/v0.20.0/bat_0.20.0_amd64.deb && sudo dpkg -i bat_0.20.0_amd64.deb
pip install black
curl -sL install-node.vercel.app/lts | sudo bash
# Copy tmux vim and kitti config
cd ~/
ln -s ${ROOT_DIR}/.vim .
ln -s ${ROOT_DIR}/.bash_aliases .
ln -s ${ROOT_DIR}/tmux/.tmux.conf .
ln -s ${ROOT_DIR}/tmux/.tmux/ .
cd ~/.config && ln -s ${ROOT_DIR}/kitty .
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50
sudo update-alternatives --config x-terminal-emulator
gsettings set org.gnome.desktop.default-applications.terminal exec 'kitty'
# neovim and plugins
mkdir -p ~/.config/nvim
cd ~/.config/nvim
ln -s ~/.vim/init.vim .
ln -s ~/.vim/coc-settings.json .
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
# ipython utils
cd ~/.ipython/profile_default/startup && ln -s ${ROOT_DIR}/utils/python_utils/start.py .
cd ${ROOT_DIR}
