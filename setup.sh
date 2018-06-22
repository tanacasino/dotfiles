#!/bin/bash
# -*- coding: utf-8 -*-
#
# Setup Environment
#
set -e

# THIS DIRECTORY
CONF_HOME=$(cd $(dirname "$0") && pwd)

function usage {
    echo "Usage: $0 [OPTION]..."
    echo "Setup Environment"
    echo ""
    echo "  -V, --no-vim       No install vim settings"
    echo "  -G, --no-git       No install git settings"
    echo "  -h, --help         Print this usage message"
    echo ""
}

#########################
# args
#########################
function process_args {
    case "$1" in
        -V|--no-vim)       vim=0;;
        -G|--no-git)       git=0;;
        -h|--help)         usage; exit 0;;
        *)                 usage; exit 1;;
    esac
}

vim=1
git=1

for arg in "$@"; do
    process_args $arg
done


#########################
# funtions
#########################
function linkit() {
    if [ $(uname) = 'Darwin' ]; then
        gln -is "$CONF_HOME/$1" $2 || return 1
    else
        ln -is "$CONF_HOME/$1" $2 || return 1
    fi
    return 0
}


#########################
# Conf files
#########################
### vim ###
VIMFILES=".vim .vimrc* .gvimrc"
for dotfile in $VIMFILES; do
    linkit $dotfile $HOME/
done
#
# for deoplete
# $ brew install python3
# $ pip3 install neovim
#


### tmux ###
linkit .tmux.conf $HOME/
TMUX_PLUGINS_DIR="$HOME/.tmux/plugins"
mkdir -p "$TMUX_PLUGINS_DIR"
if [ ! -d "$TMUX_PLUGINS_DIR/tpm" ]; then
    $(cd "$TMUX_PLUGINS_DIR" && git clone https://github.com/tmux-plugins/tpm)
fi


### Others(bash, git, hg, screen) ###
DOTFILES=".bashrc .bash_profile .inputrc .gitconfig .dir_colors .screenrc .sbtrc .ideavimrc"
for dotfile in $DOTFILES; do
    linkit $dotfile $HOME/
done

# global gitignore
linkit gitignore $HOME/.gitignore

