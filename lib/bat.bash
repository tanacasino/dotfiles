#!/usr/bin/env bash
#############################
# A cat(1) clone with wings
#############################
if ! command -v bat &> /dev/null; then
    echo -e "You must install bat"
    echo -e "$ brew install bat"
fi

alias bat='bat --theme GitHub'
