#If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='vim'
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"
export PATH="$HOME/.local/bin:$PATH"
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(colored-man-pages git zsh-autosuggestions zsh-syntax-highlighting z tmux sudo history copybuffer copypath)
zstyle ':completion:*' menu select
source $ZSH/oh-my-zsh.sh
source $HOME/.utils.zsh
source $HOME/.aliases.zsh

export BAT_THEME="Dracula"
autoload -Uz compinit
fpath+=~/.zfunc
