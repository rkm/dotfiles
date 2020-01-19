
### Included from https://github.com/rkm/dotfiles/blob/master/linux/.bash_aliases ###

alias grep='grep --color=auto --line-buffered'
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -l'

alias gdc='git diff --cached'

alias au='ansible-pull -U https://github.com/rkm/personal-centos7-ansible'

alias ss='sudo systemctl'

[ -f ~/.bash_aliases_azure ] && . ~/.bash_aliases_azure

function pyinit {
    virtualenv -ppython3.7 venv && \
    echo -e '"""\n\n"""\n\n\nimport sys\n\n\ndef main() -> int:\n    return 0\n\n\nif __name__ == "__main__":\n    sys.exit(main())' > main.py
}
