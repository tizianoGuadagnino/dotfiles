#!/bin/bash
docker build -f Dockerfile -t dotfiles .
docker run --rm -it dotfiles:latest sh -c "$(curl -fsSL https://raw.githubusercontent.com/tizianoGuadagnino/dotfiles/master/install.sh)"
