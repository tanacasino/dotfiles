#!/usr/bin/env bash
##############################
# nodenv
##############################
if command -v nodenv &> /dev/null; then
    eval "$(nodenv init -)"
fi

