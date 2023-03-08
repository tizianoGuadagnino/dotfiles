FROM ubuntu:jammy

RUN apt update && apt dist-upgrade -y
RUN apt update --fix-missing
RUN apt install curl sudo -y
RUN useradd -m -s /bin/bash -N -u 1000 me && \
    echo "me ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers && \
    chmod 0440 /etc/sudoers && \
    chmod g+w /etc/passwd 
USER me
WORKDIR /home/me
# ENTRYPOINT ["sh", "-c", "$(curl -fsSL https://github.com/tizianoGuadagnino/dotfiles/blob/master/install.sh)"]
# RUN git clone https://github.com/tizianoGuadagnino/dotfiles.git /home/me/dotfiles
# ENTRYPOINT ["/home/me/dotfiles/setup_dot_files.bash"]
