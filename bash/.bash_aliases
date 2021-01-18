# General
alias vi="gvim -v"
alias vim="gvim -v"
alias vm="gvim -v +NERDTreeToggle"
alias gits="git status"
alias gitb="git branch"
alias gitr="git rebase"

# below relies on git global alias
# https://coderwall.com/p/euwpig/a-better-git-log
alias gl="git lg"

# Cloud Stuff
function scoped_flux_sync {
    fluxctl sync --k8s-fwd-ns $1
}

alias kc='kubectl'
alias kx='kubectl ctx'
alias kn='kubectl ns'
alias fluxsync=scoped_flux_sync
