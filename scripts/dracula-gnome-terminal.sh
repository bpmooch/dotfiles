#!/bin/bash

### installs the  dracula theme for gnome-terminal ###

# dconf is needed for the dracula install script
if ! [ -f dconf-cli ] ; then
	sudo apt-get install dconf-cli -yq
fi

# install dracula theme
# TODO: currently interactive, should fix
cd $HOME
git clone https://github.com/dracula/gnome-terminal dracula-gt/
cd dracula-gt
. install.sh -s Dracula --skip-dircolors
rm -rf "$HOME/dracula-gt
