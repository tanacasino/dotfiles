#!/usr/bin/env bash
##############################
# fasd
##############################
if command -v fasd &> /dev/null; then
    eval "$(fasd --init auto)"
else
    echo -e "You must install fasd"
    echo -e "$ brew install fasd"
fi
