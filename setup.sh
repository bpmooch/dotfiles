#!/bin/bash/

# sudo this script

# move .bash_aliases, .profile, .vimrc
cp "$PWD/.bash_aliases" "$HOME/.bash_aliases"
cp "$PWD/.profile" "$HOME/.profile"
cp "$PWD/.vimrc" "$HOME/.vimrc"

# source bash_aliases, .profile in bashrc
if [ -f "$HOME/.bashrc"]; then
    echo 'source ~/.bash_aliases' >> "$HOME/.bashrc"
    echo 'source ~/.profile' >> "$HOME/.bashrc"
fi

# check for certain tools, install them if missing
# jq, kubectl, kubectx
# kubectl
curl -LOs https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x "$PWD/kubectl"
mv "$PWD/kubectl" /usr/local/bin/kubectl

# kubectx 0.9
curl -LOs https://github.com/ahmetb/kubectx/releases/download/v0.9.0/kubectx_v0.9.0_linux_x86_64.tar.gz
tar -xvf "$PWD/kubectx_v0.9.0_linux_x86_64.tar.gz"
rm "$PWD/LICENSE"
chmod +x "$PWD/kubectx"
mv "$PWD/kubectx" /usr/local/bin/kubectx

# jq
apt-get update
apt-get install jq -yq

# vscode
# settings.json linux path - ~/.config/Code/User/settings.json
# install plugins silently?

# dracula theme for bash

### Maybes
# build .profile, move to ~/.profile, source in bashrc
