#!/usr/bin/env bash
#############################
# General Aliases
#############################
if command -v gls &> /dev/null; then
    alias ls='gls --color=auto'
elif ls --color -d . &> /dev/null; then
    alias ls="ls --color=auto"
elif ls -G -d . &> /dev/null; then
    alias ls='ls -G'
fi
alias l='ls'
alias ll='ls -l'
alias lh='ll -h'
alias la='ls -a'
alias lla='ls -AlF'


# ssh config
alias vissh='vim $HOME/.ssh/config'


# colored grep
if echo "bab" | grep --color=auto "a" &> /dev/null; then
    alias grep='grep --color=auto'
fi


# tree
if [ ! -x "$(which tree 2>/dev/null)" ]; then
    alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi


