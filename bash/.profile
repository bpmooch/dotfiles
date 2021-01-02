# prettify git log
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

EDITOR="gvim -v"
export PATH="${PATH}:${HOME}/.krew/bin"
