#!/bin/bash

set -x
set -e

# install some useful packages
sudo apt install -y git vim openssh-client stow tmux dconf-cli uuid-runtime neofetch

# pretty git log
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# install gnome terminal themes
bash -c "$(wget -qO- https://git.io/vQgMr)"

# install vundle plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install discord
sudo snap install discord
