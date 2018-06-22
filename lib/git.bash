#!/usr/bin/env bash
#############################
# git
#############################

#############################
# Functions
#############################
# Show current git branch name (or tag name)
function git_branch_name {
    local branch_name="$(git symbolic-ref --short HEAD 2>/dev/null)"

    if [ -z "$branch_name" ]; then
        local tag_name="$(git describe --tags --exact-match HEAD 2>/dev/null)"
        if [ -z "$tag_name" ]; then
            git rev-parse --short HEAD 2>/dev/null
        else
            echo "$tag_name"
        fi
    else
        echo "$branch_name"
    fi
}


#############################
# Aliases
#############################
alias g='git'
alias gg='git grep'
alias ggpush='git push origin $(git_branch_name)'
alias ggpushf='git push -f origin $(git_branch_name)'
alias gst='git st'


#############################
# Completions
#############################
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g

