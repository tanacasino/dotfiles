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
    echo "  -a, --apt        Install apt-packages"
    echo "  -X, --xapt       Install apt-gui-packages"
    echo "  -V, --no-vim     No install vim settings"
    echo "  -G, --no-git     No install git settings"
    echo "  -h, --help       Print this usage message"
    echo ""
}

#########################
# args
#########################
function process_args {
    case "$1" in
        -a|--apt)    apt=1;;
        -x|--xapt)   xapt=1;;
        -V|--no-vim) vim=0;;
        -G|--no-git) git=0;;
        -h|--help)   usage; exit 0;;
        *)           usage; exit 1;;
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
        if [ "Ubuntu" == $(lsb_release -i -s) ]; then
            return 0
        fi
    fi
    return 1
}

function linkit() {
    ln -is "$CONF_HOME/$1" $2 || return 1
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
    [[ $apt  == 1 ]] && apt_install apt-packages
    [[ $xapt == 1 ]] && apt_install apt-gui-packages
fi


#########################
# Conf files
#########################
### zsh ###
OH_MY_ZSH=$HOME/.oh-my-zsh
if [ ! -d $OH_MY_ZSH ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git "$OH_MY_ZSH"
    linkit tanacasino.zsh       "$OH_MY_ZSH/custom/"
    linkit tanacasino.zsh-theme "$OH_MY_ZSH/themes/"
    linkit .zshrc               "$HOME/"
fi

### vim ###
VIMFILES=".vim .vimrc* .gvimrc"
for dotfile in $VIMFILES; do
    linkit $dotfile $HOME/
done
NEO_BUNDLE=$HOME/.vim/bundle/neobundle.vim
if [ ! -d $NEO_BUNDLE ]; then
    git clone https://github.com/Shougo/neobundle.vim $NEO_BUNDLE
fi

### Others(git, hg, GNU screen) ###
DOTFILES=".hgrc .gitconfig"
# when use byobu, no need screenrc
#DOTFILES+=" .screenrc"
for dotfile in $DOTFILES; do
    linkit $dotfile $HOME/
done

# global gitignore
linkit gitignore $HOME/.gitignore
