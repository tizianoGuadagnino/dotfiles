alias dataserver='ssh -t tiziano@dataserver "cd /export/datasets; exec zsh"'
alias ckb='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -Bbuild && cmake --build build -j$(nproc)'
alias update='sudo apt update && sudo apt dist-upgrade -y'
alias spegni='sudo shutdown now'
alias ts='tmux new -s'
alias ta='tmux attach -t'
alias gs='git status'
alias ga='git add --all'
alias gc='git commit'
alias gco='git checkout'
alias gp='git push'
alias gpp='git pull --recurse-submodules'
alias gppb='git pull --rebase'
alias gca='git commit -am "small thing" && gp'
alias ccopy='xclip -sel c'
alias cat='batcat'
alias ssh="kitty +kitten ssh"
alias visualize='python ~/dotfiles/utils/python_utils/visualize.py'
alias spr=' tmuxinator start -p $HOME/.tmuxinator.yml $(basename $(pwd))'
alias open='xdg-open'
alias install='sudo apt install'
alias gitsm='submodule_for_each'