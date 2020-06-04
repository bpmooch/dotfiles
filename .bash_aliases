function scoped_kubectl {
    kubectl --context=dev --namespace=$* 
}

function scoped_flux_sync {
    fluxctl sync --k8s-fwd-ns $1
}

# General
alias vm="vim +NERDTreeToggle"
alias gits="git status"

# below relies on git global alias
# https://coderwall.com/p/euwpig/a-better-git-log
alias gl="git lg"

# Cloud Stuff
alias kx='kubectx'
alias kc='kubectl'
alias kcdev='kubectl --context=dev --namespace=cmucciolo'
alias kd=scoped_kubectl
alias fluxsync=scoped_flux_sync
alias vlt='VAULT_ADDR=https://vault.uacf.io vault'
