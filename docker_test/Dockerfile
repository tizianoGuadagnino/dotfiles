FROM ubuntu:jammy

RUN apt update && apt dist-upgrade -y
RUN apt install software-properties-common git curl wget sudo make python3-pip -y
RUN useradd -m -s /bin/bash -N -u 1000 me && \
    echo "me ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers && \
    chmod 0440 /etc/sudoers && \
    chmod g+w /etc/passwd 
USER me
WORKDIR /home/me
RUN git clone https://github.com/tizianoGuadagnino/dotfiles.git /home/me/dotfiles
ENTRYPOINT ["/home/me/dotfiles/setup_dot_files.bash"]
