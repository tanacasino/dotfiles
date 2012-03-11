#!/bin/bash
# -*- coding: utf-8 -*-

DOTFILES=".vim .vimrc* .gvimrc"
DOTFILES+=" .zshrc .hgrc .gitconfig"
#DOTFILES+=" .screenrc"

set -e

CONF_HOME=$(cd $(dirname $0) && pwd)
cd $CONF_HOME

for dotfile in $DOTFILES
do
    ln -is "${CONF_HOME}/${dotfile}" ${HOME}/
done

# For Vim
#git clone https://github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim

