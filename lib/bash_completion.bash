#!/usr/bin/env bash
#############################
# Bash Completion
#############################
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
else
    echo -e "You must install bash-completion"
    echo -e "$ brew install bash-completion"
fi
