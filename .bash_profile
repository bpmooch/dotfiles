export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

alias vm="vim +NERDTreeToggle"
alias gl="git lg"
alias gs="git status"
alias cr="cargo run"
alias cb="cargo build"
alias kx="kubectx"
alias kc="kubectl"
alias vlt="VAULT_ADDR=https://vault.ua.dev vault"

export PATH="$HOME/.cargo/bin:$HOME/go/bin:$PATH"

export JIRA_API_TOKEN=7OwX47FW4WqT0oDxcqsTF6C9
