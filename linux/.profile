
### Included from https://github.com/rkm/dotfiles/blob/master/linux/.profile ###

# TODO: PATH
# TODO: export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
# TODO: export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"

# Default programs
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export INPUTRC="$XDG_CONFIG_HOME"/inputrc
export VIMINIT=":source $XDG_CONFIG_HOME/vim/vimrc"
export LESSHISTFILE="-"