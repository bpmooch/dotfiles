# prettify git log
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

EDITOR="gvim -v"
export PATH="${PATH}:${HOME}/.krew/bin"
. "$HOME/.cargo/env"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export DENO_INSTALL="/home/mooch/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
