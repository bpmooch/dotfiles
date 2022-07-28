#!/bin/bash

set -e

. ./lib/install.sh
. ./lib/util.sh

# don't put stuff here that doesn't install cleanly
# don't put stuff here that isn't idempotent
info 'Vim' 'Installing vim-X11'
install_vim

info 'Discord' 'Installing Discord'
install_discord

info 'Visual Studio Code' 'Installing vscode + extensions'
install_vscode
