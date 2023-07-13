#!/bin/bash
if [ $(git diff | wc -l) -gt 0 ]; then
    echo "You forgot to push...test it is useless... bye bye"
    exit 666
fi
FOLDER=$(dirname $0)
docker build -f ${FOLDER}/Dockerfile -t dotfiles ${FOLDER}
docker run --rm -it dotfiles:latest sh -c "$(curl -fsSL https://raw.githubusercontent.com/tizianoGuadagnino/dotfiles/master/remote_install.sh)" && zsh
