# If you come from bash you might have to change your $PATH.
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
plugins=(colored-man-pages git zsh-autosuggestions zsh-syntax-highlighting z tmux sudo history)
zstyle ':completion:*' menu select
source $ZSH/oh-my-zsh.sh
# User configuration
alias rosws='source devel/setup.bash'
alias dataserver='ssh -t tiziano@dataserver "cd /export/datasets; exec bash"'
alias ckb='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -Bbuild && make -C build -j$(nproc)'
alias update='sudo apt update && sudo apt dist-upgrade -y'
alias spegni='sudo shutdown now'
alias ts='tmux new -s'
alias ta='tmux attach -t'
alias gs='git status'
alias ga='git add --all'
alias gc='git commit'
alias gco='git checkout'
alias gp='git push'
alias gpp='git pull'
alias gppb='gpp --rebase'
alias gca='git commit -am "small thing" && gp'
alias ccopy='xclip -sel c'
alias cat='bat'
alias ssh="kitty +kitten ssh"
alias visualize='python ~/dotfiles/utils/python_utils/visualize.py'
alias spr='tmuxinator start -p $HOME/.tmuxinator.yml'
alias open='xdg-open'
alias install='sudo apt install'
export BAT_THEME="Dracula"
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

autoload -Uz compinit
fpath+=~/.zfunc
_gitlab-ci-local_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" /usr/local/bin/gitlab-ci-local --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gitlab-ci-local_yargs_completions gitlab-ci-local
###-end-gitlab-ci-local-completions-###

