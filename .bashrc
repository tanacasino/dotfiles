#!/usr/bin/env bash
#
# bash configuration
#

if ((BASH_VERSINFO[0] < 4)); then
    echo -e "Older version of Bash. At least bash-4.0."
    echo -e "BASH_VERSION: $BASH_VERSION"
    echo -e "$ brew install bash"
fi

DOTFILES_HOME=$(cd $(dirname $(readlink "${BASH_SOURCE:-$0}")) && pwd)


##############################
## install thirdparty libs
##############################
mkdir -p "$DOTFILES_HOME/vendor"
function __load_vendor() {
    local git_dir="$1"
    local script_file="$2"
    local git_remote="$3"
    if [ -f "${git_dir}/$script_file" ]; then
        source "${git_dir}/$script_file"
    else
        git clone "$git_remote" "$git_dir"
        source "${git_dir}/$script_file"
    fi
}
__load_vendor "$DOTFILES_HOME/vendor/composure" "composure.sh" "https://github.com/erichs/composure.git"
__load_vendor "$DOTFILES_HOME/vendor/bash-sensible" "sensible.bash" "https://github.com/mrzool/bash-sensible.git"
unset __load_vendor


##############################
## PATH
##############################
export PATH_OLD="$PATH"
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"


#############################
# Key binding
#############################
stty werase undef
bind '"\C-w": backward-kill-word'


#############################
# Aliases
#############################
function __load_alias() {
    local alias_script
    for alias_script in "${DOTFILES_HOME}/alias/"*.bash; do
        source "$alias_script"
    done
}
__load_alias
unset __load_alias


##############################
## Load lib
##############################
for lib_script in "${DOTFILES_HOME}/lib/"*.bash; do
    source "$lib_script"
done
unset lib_script


##############################
## Prompt
##############################
source "${DOTFILES_HOME}/prompt/powerline-go.bash"


##############################
## Load local configuration
##############################
if [ -f "$HOME/.bashrc.local" ]; then
    source "$HOME/.bashrc.local"
fi
