#!/bin/bash
# -*- coding: utf-8 -*-

# エラーが出たら即中止
set -e

# THIS DIRECTORY
CONF_HOME=$(cd $(dirname $0) && pwd)
cd $CONF_HOME


### zsh ###
OH_MY_ZSH=${HOME}/.oh-my-zsh
if [ ! -d ${OH_MY_ZSH} ]
then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ${OH_MY_ZSH}
    ln -is "${CONF_HOME}/tanacasino.zsh" ${OH_MY_ZSH}/custom/
    ln -is "${CONF_HOME}/tanacasino.zsh-theme" ${OH_MY_ZSH}/themes/
    ln -is "${CONF_HOME}/.zshrc" ${HOME}/
fi


### vim ###
VIMFILES=".vim .vimrc* .gvimrc"
for dotfile in $VIMFILES
do
    ln -is "${CONF_HOME}/${dotfile}" ${HOME}/
done
NEO_BUNDLE=${HOME}/.vim/bundle/neobundle.vim
if [ ! -d ${NEO_BUNDLE} ]
then
    git clone https://github.com/Shougo/neobundle.vim ${NEO_BUNDLE}
fi


### Others(git, hg, GNU screen) ###
DOTFILES=".hgrc .gitconfig"
# byobuを使う場合は.screenrcはいらない
#DOTFILES+=" .screenrc"
for dotfile in $DOTFILES
do
    ln -is "${CONF_HOME}/${dotfile}" ${HOME}/
done

# gitignore
ln -is "${CONF_HOME}/gitignore" ${HOME}/.gitignore
