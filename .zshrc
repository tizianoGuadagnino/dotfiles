# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting z tmux sudo history)

source $ZSH/oh-my-zsh.sh
# User configuration
alias ws='cd ~/source/bonn/adaptive_lidar_odometry/'
alias rosws='source devel/setup.bash'
alias dataserver_mount='sshfs tguadagnino@131.220.233.14:/export/datasets ~/dataserver'
alias cmake_build='mkdir -p build && cd build && cmake .. && make -j4'
alias update='sudo apt update && sudo apt dist-upgrade -y'
alias spegni='sudo shutdown now'
alias activate='source ~/source/bonn/adaptive_lidar_odometry/python/venv/bin/activate'
alias ts='tmux new -s'
alias ta='tmux attach -t'
alias gs='git status'
alias ga='git add --all'
alias gc='git commit'
alias cat='bat'
alias ssh="kitty +kitten ssh"
export BAT_THEME="Dracula"
