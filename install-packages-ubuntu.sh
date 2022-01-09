#!/bin/bash

set -x
set -e

# install some useful packages
sudo apt install -y git vim openssh-client stow tmux dconf-cli uuid-runtime neofetch

# install gnome terminal themes
bash -c "$(wget -qO- https://git.io/vQgMr)"

# install vundle plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install discord
sudo snap install discord

# install gnome 41
echo 'installing x11 ppa'
sudo add-apt-repository ppa:devacom/x11
echo 'installing gnome 40 ppa'
sudo add-apt-repository ppa:devacom/gnome-40
sudo add-apt-repository ppa:devacom/gnome-41
sudo apt update
sudo apt install ubuntu-desktop gnome-shell gnome-control-center gnome-tweaks gnome-shell-extensions

# after previous commands, instructions told us to install application-menu or arc-menu
