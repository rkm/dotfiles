
### Included from https://github.com/rkm/dotfiles/blob/master/linux/.bash_aliases ###

alias grep='grep --color=auto --line-buffered'
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -l'

alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

alias gdc='git diff --cached'

function au {
    if [ $(grep -q 'release 7' /etc/redhat-release) ]; then
        ansible-pull -U https://github.com/rkm/personal-centos7-     ansible "$@" | tee ~/.au.log;
    else
        ansible-pull -U https://github.com/rkm/personal-centos8 "$@" | tee ~/.au.log;
    fi
}

alias ss='sudo systemctl'

alias weechat="weechat -d $XDG_CONFIG_HOME/weechat"
alias mvn="mvn -gs $XDG_CONFIG_HOME/maven/settings.xml"

[ -f ~/.bash_aliases_azure ] && . ~/.bash_aliases_azure
