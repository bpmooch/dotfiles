#!/bin/bash

# only run as root
if [ "$EUID" -ne 0 ] ; then
	echo "Please run as root"
	exit
fi
HOME="/home/$SUDO_USER"

# only run if .bashrc exists
BASHRC_PATH="$HOME/.bashrc"
if ! [ -f $BASHRC_PATH ] ; then
	echo "$BASHRC_PATH is missing. Fix that then re-run"
	exit
fi

### install useful tools ###
apt-get update

# git
if ! [ -f git ] ; then
	apt-get install git -yq
fi

# curl
if ! [ -f curl ] ; then
	apt-get install curl -yq
fi

# vim-gtk3
if ! [ -f vim ] ; then
	apt-get install vim-gtk3 -yq
fi

# terminator
if ! [ -f terminator ] ; then
	apt-get install terminator -yq
fi

# kubectl
if ! [ -f kubectl ] ; then
	curl -LOs https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
	chmod +x "$PWD/kubectl"
	mv "$PWD/kubectl" /usr/local/bin/kubectl
fi

# kubectx 0.9
if ! [ -f kubectx ] ; then
	curl -LOs https://github.com/ahmetb/kubectx/releases/download/v0.9.0/kubectx_v0.9.0_linux_x86_64.tar.gz
	tar -xvf "$PWD/kubectx_v0.9.0_linux_x86_64.tar.gz"
	rm "$PWD/kubectx_v0.9.0_linux_x86_64.tar.gz"
	rm "$PWD/LICENSE"
	chmod +x "$PWD/kubectx"
	mv "$PWD/kubectx" /usr/local/bin/kubectx
fi

# jq
if ! [ -f jq ] ; then
	apt-get install jq -yq
fi

# setup bash environment
DOTFILES_GIT='git@github.com:chrism00ch/dotfiles.git'
DOTFILES_DIR="$HOME/dotfiles"
sudo -u $SUDO_USER git clone $DOTFILES_GIT $DOTFILES_DIR

for dotfile in "$DOTFILES_DIR/.bash_aliases" "$DOTFILES_DIR/.profile"
do
	echo "source $dotfile" >> "$HOME/.bashrc"
done

# merge .config directory into $HOME
rsync "$DOTFILES_DIR/.config/" "$HOME/.config/"

# move settings.json to its place
mkdir -p "$HOME/.config/Code/User/"
cp "$DOTFILES_DIR/settings.json" "$HOME/.config/Code/User/settings.json"

# setup vim
ln -s "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
sudo -u $SUDO_USER git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
