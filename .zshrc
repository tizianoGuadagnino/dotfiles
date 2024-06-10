#If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='vim'
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dracula"

export BAT_THEME="Dracula"
export PATH="$HOME/.local/bin:$PATH"

plugins=(colored-man-pages git zsh-autosuggestions zsh-syntax-highlighting z tmux sudo history copybuffer copypath cp)
zstyle ':completion:*' menu select
source $ZSH/oh-my-zsh.sh
source $HOME/.utils.zsh
source $HOME/.aliases.zsh
source $HOME/.zshrc_local

autoload -Uz compinit
fpath+=~/.zfunc
