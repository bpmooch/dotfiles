# Fedora 33
resources for Fedora 33

## Installing Volta, a node version manager
Volta's installer doesn't work on fedora. I ended up having to build from source using [this guide](https://docs.volta.sh/contributing/). I also enjoyed reading through [this folder](https://github.com/volta-cli/volta/tree/main/dev/unix)

1. `git clone git@github.com:volta-cli/volta.git`
2. `dnf install openssl`
3. `./volta/dev/unix/volta-install.sh --release`

## [Terminator](https://terminator-gtk3.readthedocs.io/en/latest/) Ctrl+Shift+e isn't splitting vertically
`ibus-emoji` is installed by default. You can edit or disable the `ibus-emoji` shortcut using `ibus-setup`, a gtk3 application for editing IBUS options. More on IBUS [here](https://fedoraproject.org/wiki/I18N/IBus)

## Installing Kustomize
[Docs here](https://kubectl.docs.kubernetes.io/installation/kustomize/source/), install from source. `go` can be easily installed with `sudo dnf install golang`
