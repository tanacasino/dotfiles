#!/usr/bin/env bash
#
# bash configuration
#

if ((BASH_VERSINFO[0] < 4)); then
    echo -e "Older version of Bash. At least bash-4.0."
    echo -e "BASH_VERSION: $BASH_VERSION"
fi

DOTFILES_HOME=$(cd $(dirname $(readlink "${BASH_SOURCE:-$0}")) && pwd)

##############################
## install thirdparty libs
##############################
mkdir -p "$DOTFILES_HOME/vendor"
# composure
if [ -f "$DOTFILES_HOME/vendor/composure/composure.sh" ]; then
    source "$DOTFILES_HOME/vendor/composure/composure.sh"
else
    git clone https://github.com/erichs/composure.git "$DOTFILES_HOME/vendor/composure"
    source "$DOTFILES_HOME/vendor/composure/composure.sh"
fi

# sensible.bash
if [ -f "$DOTFILES_HOME/vendor/bash-sensible/sensible.bash" ]; then
    source "$DOTFILES_HOME/vendor/bash-sensible/sensible.bash"
else
    git clone https://github.com/mrzool/bash-sensible.git "$DOTFILES_HOME/vendor/bash-sensible"
    source "$DOTFILES_HOME/vendor/bash-sensible/sensible.bash"
fi

# bash-powerline
if [ -f "$DOTFILES_HOME/vendor/bash-powerline/bash-powerline.sh" ]; then
    source "$DOTFILES_HOME/vendor/bash-powerline/bash-powerline.sh"
else
    git clone https://github.com/riobard/bash-powerline.git "$DOTFILES_HOME/vendor/bash-powerline"
    source "$DOTFILES_HOME/vendor/bash-powerline/bash-powerline.sh"
fi


##############################
## PATH
##############################
export PATH_OLD="$PATH"
export PATH="/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"


#############################
# Key binding
#############################
stty werase undef
bind '"\C-w": backward-kill-word'


##############################
## Completion
##############################
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
else
    echo -e "You must install bash-completion"
    echo -e "brew install bash-completion"
fi


#############################
# Aliases
#############################
# basic
if ls --color -d . &> /dev/null; then
    alias ls="ls --color=auto"
elif ls -G -d . &> /dev/null; then
    alias ls='ls -G'        # Compact view, show colors
fi
alias l='ls'
alias lh='ll -h'
alias la='ls -a'
alias lla='ls -AlF'

alias vissh='vim $HOME/.ssh/config'


##############################
## Load lib
##############################
for lib in "${DOTFILES_HOME}/lib/"*.bash; do
    source "$lib"
done


##############################
## Load local configuration
##############################
if [ -f "$HOME/.bashrc.local" ]; then
    source "$HOME/.bashrc.local"
fi
