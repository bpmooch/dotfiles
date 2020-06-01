# move .bash_aliases, .profile, .vimrc
cp ./.bash_aliases $HOME/.bash_aliases
cp ./.profile $HOME/.profile
cp ./.vimrc $HOME/.vimrc

# source bash_aliases, .profile in bashrc
if [ -f "$HOME/.bashrc"]; then
    echo 'source ~/.bash_aliases' >> "$HOME/.bashrc"
    echo 'source ~/.profile' >> "$HOME/.bashrc"
fi

# check for certain tools, install them if missing
# jq, kubectl, kubectx

### Maybes
# build .profile, move to ~/.profile, source in bashrc