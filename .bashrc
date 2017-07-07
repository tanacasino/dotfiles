#!/usr/bin/env bash

#############################
# Bash-it
#############################
# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

export BASH_IT_THEME='tanacasino'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Unomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
export SHORT_HOSTNAME=$(hostname -s)

export BASH_IT_CUSTOM="$HOME/devel/src/github.com/tanacasino/dotfiles/bash_it_custom"

export PATH_BACKUP="$PATH"

# TODO(tanacasino): 適当すぎるやつ。PATHの順序と重複の取り除きをやりたいだけなので、それができるようにするべき。
export PATH="/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Load Bash It
source $BASH_IT/bash_it.sh

# Load local config
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi

