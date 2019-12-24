
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

export EDITOR=vim
export VISUAL=vim

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

PROMPT_COMMAND='if [ -d .git -a ! -x .git/hooks/pre-commit -a -e .pre-commit-config.yaml ] && which pre-commit >& /dev/null; then pre-commit install; fi; '"$PROMPT_COMMAND"

function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}

trap 'timer_start' DEBUG
PROMPT_COMMAND=timer_stop

export PS1='\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] [$? ${timer_show}s]\n> '

[ -d /usr/local/go ] && export PATH=$PATH:/usr/local/go/bin
export GOPATH=~/dev/go
