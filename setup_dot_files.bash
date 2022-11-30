#!/bin/bash
ROOT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
# install necessary packages for plugins
sudo apt install -y neovim clang-format clang-tidy clangd flake8 python3-autopep8 tmux silversearcher-ag ripgrep fonts-powerline zathura xclip git build-essential kitty zsh python3-pip
sudo apt remove vim
cd ~/ && wget https://github.com/sharkdp/bat/releases/download/v0.20.0/bat_0.20.0_amd64.deb && sudo dpkg -i bat_0.20.0_amd64.deb
pip install black
curl -sL install-node.vercel.app/lts | sudo bash
# install keyd remapping
mkdir tools && cd tools && git clone https://github.com/rvaiya/keyd
cd keyd && make && sudo make install 
sudo systemctl enable keyd && sudo systemctl start keyd
sudo cp ${ROOT_DIR}/utils/default.conf /etc/keyd/default.conf
sudo keyd reload
# Copy tmux vim and kitti config
cd 
ln -s ${ROOT_DIR}/.vim .
ln -s ${ROOT_DIR}/tmux/.tmux.conf .
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Kitty config
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
# oh my zsh
cd ~/
ln -s ${ROOT_DIR}/utils/.tmuxinator.yml
ln -s ${ROOT_DIR}/.zshrc .
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/plugins/zsh-syntax-highlighting
git clone https://github.com/dracula/zsh.git $ZSH/themes/dracula && cd $ZSH/themes/ && ln -s ./dracula/dracula.zsh-theme . 
cd ${ROOT_DIR}
