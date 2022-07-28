#!/bin/bash

set -x
set -e

# install gnome 41
sudo add-apt-repository ppa:devacom/x11
sudo add-apt-repository ppa:devacom/gnome-40
sudo add-apt-repository ppa:devacom/gnome-41
sudo apt update
sudo apt install ubuntu-desktop gnome-shell gnome-control-center gnome-tweaks gnome-shell-extensions
sudo apt upgrade
