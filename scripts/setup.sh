#!/bin/bash

# only run as root
if [ "$EUID" -ne 0 ] ; then
	echo "Please run as root"
	exit
fi

# username needs to be passed in 
if [ $# -eq 0 ] ; then
	echo 'username argument required. Please do something like ./setup.sh $USER'
	exit
fi
HOME="/home/$1/"

# only run if .bashrc exists
if [ -f "$HOME/.bashrc" ] ; then
	echo "$HOME/.bashrc is missing. Fix that then re-run"
	exit
fi

### install useful tools ###
apt-get update

# git
if ! [ -f git ] ; then
	apt-get install git -yq
fi

# vim-gtk3
if ! [ -f vim ] ; then
	apt-get install vim-gtk3 -yq

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
git clone $DOTFILES_GIT $DOTFILES_DIR

for dotfile in "$DOTFILES_DIR/.*" do
	echo "source $DOTFILES_DIR/$dotfile" >> "$HOME/.bashrc"
done

# move settings.json to its place
mkdir -p "$HOME/.config/Code/User/"
cp "$DOTFILES_DIR/settings.json" "$HOME/.config/Code/User/settings.json"
