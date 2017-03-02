#############################
# Variables
#############################
# TODO(tanacasino): 優先順位を変えたいだけなので、重複を取り除いてソートするようにしたい
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS="--reverse --inline-info"
export GOPATH="$HOME/devel"
export PATH="$GOPATH/bin:$PATH"


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

alias ggpush='git push origin $(git_branch_name)'
alias ggpushf='git push -f origin $(git_branch_name)'
alias lock='"/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession" -suspend'



#############################
# Completions
#############################
# alias g='git'
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g



#############################
# Others
#############################
# init nodenv
eval "$(nodenv init -)"

