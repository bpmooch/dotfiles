#!/bin/bash

# only run as root
if [ "$EUID" -ne 0 ] ; then
	echo "Please run as root"
	exit
fi
HOME="/home/$SUDO_USER"

### install useful tools ###
apt-get update

# git
if ! [ -f git ] ; then
	apt-get install git -yq
	echo 'git installed'
fi

# vim-gtk3
if ! [ -f vim ] ; then
	apt-get install vim-gtk3 -yq
	echo 'vim-gtk3 installed'
fi

# terminator
if ! [ -f terminator ] ; then
	apt-get install terminator -yq
	echo 'terminator installed'
fi

# kubectl
if ! [ -f kubectl ] ; then
	curl -LOs https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
	chmod +x "$PWD/kubectl"
	mv "$PWD/kubectl" /usr/local/bin/kubectl
	echo 'kubectl installed'
fi

# kubectx 0.9
if ! [ -f kubectx ] ; then
	curl -LOs https://github.com/ahmetb/kubectx/releases/download/v0.9.0/kubectx_v0.9.0_linux_x86_64.tar.gz
	tar -xvf "$PWD/kubectx_v0.9.0_linux_x86_64.tar.gz"
	rm "$PWD/kubectx_v0.9.0_linux_x86_64.tar.gz"
	rm "$PWD/LICENSE"
	chmod +x "$PWD/kubectx"
	mv "$PWD/kubectx" /usr/local/bin/kubectx
	echo 'kubectx installed'
fi

# jq
if ! [ -f jq ] ; then
	apt-get install jq -yq
	echo 'jq installed'
fi

# zettlr & deps
if ! [ -f zettlr ] ; then
	apt-get install pandoc pandoc-citeproc texlive-base texlive-xetex -yq
	echo 'zettlr & its dependencies installed'
fi
