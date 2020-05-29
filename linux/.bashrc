
### Included from https://github.com/rkm/dotfiles/blob/master/linux/.bashrc ###

# NOTE: If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

LS_COLORS=$LS_COLORS:'di=4;37:'
export LS_COLORS

shopt -s checkwinsize
shopt -s globstar

export EDITOR=vim
export VISUAL=vim

# Simplified settings for teaching
if [ "$TEACH" != "" ]; then
    unset PROMPT_COMMAND
    export PS1='\n$(pwd)\n$ '
    alias python=python3
    return 0
fi

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}

trap 'timer_start' DEBUG
PROMPT_COMMAND=timer_stop

export PS1='\n\[$(printf "\\u2500%.0s" $(seq $(tput cols)))\]\n\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] [$STY] ${timer_show}s ${RC}\n> '

PROMPT_COMMAND='RC=$?; if [ -d .git -a ! -x .git/hooks/pre-commit -a -e .pre-commit-config.yaml ] && which pre-commit >& /dev/null; then pre-commit install; fi; '"$PROMPT_COMMAND"
