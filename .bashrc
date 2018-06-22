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
function __load_composure() {
    local composure_dir="$DOTFILES_HOME/vendor/composure"
    local composure_script="${composure_dir}/composure.sh"
    if [ -f "$composure_script" ]; then
        source "$composure_script"
    else
        git clone https://github.com/erichs/composure.git "$composure_dir"
        source "$composure_script"
    fi
}
__load_composure
unset __load_composure


# sensible.bash
function __load_sensible() {
    local sensible_dir="$DOTFILES_HOME/vendor/bash-sensible"
    local sensible_script="$sensible_dir/sensible.bash"
    if [ -f "$sensible_script" ]; then
        source "$sensible_script"
    else
        git clone https://github.com/mrzool/bash-sensible.git "$sensible_dir"
        source "$sensible_script"
    fi
}
__load_sensible
unset __load_sensible


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
if command -v gls &> /dev/null; then
    alias ls='gls --color=auto'
elif ls --color -d . &> /dev/null; then
    alias ls="ls --color=auto"
elif ls -G -d . &> /dev/null; then
    alias ls='ls -G'
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
unset lib


##############################
## Prompt powerline-go
##############################
source "${DOTFILES_HOME}/prompt/powerline-go.bash"


##############################
## Load local configuration
##############################
if [ -f "$HOME/.bashrc.local" ]; then
    source "$HOME/.bashrc.local"
fi
