
### Included from https://github.com/rkm/dotfiles/blob/master/linux/.profile ###

# TODO: export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"

# Default programs
export EDITOR="vim"
export TERMINAL="bash"
export BROWSER="brave"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export LESSHISTFILE="-"
export VIMINIT=":source $XDG_CONFIG_HOME/vim/vimrc"

export PATH="$PATH:/opt/bin"
export PATH="$PATH:~/.local/bin"

export DOTNET_CLI_TELEMETRY_OPTOUT=1
export GOPATH="$HOME/dev/go"
export PATH="$PATH:$GOPATH/bin"

[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
