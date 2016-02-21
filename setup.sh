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
    echo "  -a, --apt          Install apt-packages"
    echo "  -X, --xapt         Install apt-desktop-packages"
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
        -a|--apt)          apt=1;;
        -x|--xapt)         xapt=1;;
        -V|--no-vim)       vim=0;;
        -G|--no-git)       git=0;;
        -h|--help)         usage; exit 0;;
        *)                 usage; exit 1;;
    esac
}

apt=0
xapt=0
vim=1
git=1

for arg in "$@"; do
    process_args $arg
done


#########################
# funtions
#########################
function is_ubuntu() {
    if [ -x $(which lsb_release 2>/dev/null) ]; then
        if [ "Ubuntu" = $(lsb_release -i -s) ]; then
            return 0
        fi
    fi
    return 1
}

function linkit() {
    if [ $(uname) = 'Darwin' ]; then
        gln -is "$CONF_HOME/$1" $2 || return 1
    else
        ln -is "$CONF_HOME/$1" $2 || return 1
    fi
    return 0
}

function apt_install() {
    grep -v ^# $1 | grep -v ^$ | xargs sudo apt-get install -y || return 1
    return 0
}


#########################
# Install packages
#########################
if [ is_ubuntu ]; then
    [[ $apt  -eq 1 ]] && apt_install apt-packages
    [[ $xapt -eq 1 ]] && apt_install apt-desktop-packages
fi


#########################
# Conf files
#########################
### zsh ###
linkit .zshrc $HOME/

ZPLUG_DIR="$HOME/.zplug"
if [ ! -d "$ZPLUG_DIR" ]; then
    git clone https://github.com/b4b4r07/zplug "$ZPLUG_DIR"
fi


### vim ###
VIMFILES=".vim .vimrc* .gvimrc"
for dotfile in $VIMFILES; do
    linkit $dotfile $HOME/
done


### tmux plugin manager ###
TMUX_PLUGINS_DIR="$HOME/.tmux/plugins"
mkdir -p "$TMUX_PLUGINS_DIR"
if [ ! -d "$TMUX_PLUGINS_DIR/tpm" ]; then
    $(cd "$TMUX_PLUGINS_DIR" && git clone https://github.com/tmux-plugins/tpm)
fi


### Others(git, hg, GNU screen) ###
DOTFILES=".hgrc .gitconfig .dir_colors"
# NOTE when use byobu, no need screenrc and .tmux.conf
#DOTFILES+=" .screenrc"
DOTFILES+=" .tmux.conf"
for dotfile in $DOTFILES; do
    linkit $dotfile $HOME/
done

# global gitignore
linkit gitignore $HOME/.gitignore

