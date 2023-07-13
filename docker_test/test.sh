#!/bin/bash
if [ $(git diff | wc -l) -gt 0]; then
    echo "You forgot to push...test it is useless... bye bye"
    exit 666
fi
docker build -f Dockerfile -t dotfiles $(dirname $0)
docker run --rm -it dotfiles:latest sh -c "$(curl -fsSL https://raw.githubusercontent.com/tizianoGuadagnino/dotfiles/master/remote_install.sh)" && zsh
