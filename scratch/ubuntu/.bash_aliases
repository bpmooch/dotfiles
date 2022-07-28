scoped_flux_sync() {
    fluxctl --k8s-fwd-ns $1
}

# General
alias gits="git status"
alias gitb="git branch"
alias gitr="git rebase"

# below relies on git global alias
# https://coderwall.com/p/euwpig/a-better-git-log
alias gl="git lg"

# Cloud Stuff
alias kx='kubectx'
alias kc='kubectl'
alias fluxctl=scoped_flux_sync
