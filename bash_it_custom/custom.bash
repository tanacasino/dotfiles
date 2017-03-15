#############################
# Variables
#############################
# TODO(tanacasino): 優先順位を変えたいだけなので、重複を取り除いてソートするようにしたい
export PATH="$HOME/devel/bin:/usr/local/bin:$PATH"
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS="--reverse --inline-info"
export GOPATH=$HOME/devel
export PATH="$GOPATH/bin:/usr/local/bin:$PATH"


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


function ghq_cd_repository() {
    local selected="$(ghq list --full-path | $(__fzfcmd) --query="$READLINE_LINE")"
    if [ -n "$selected" ]; then
        echo cd "$selected"
    fi
}

bind '"\C-]": " \C-e\C-u`ghq_cd_repository`\e\C-e\e^\er"'



#############################
# Aliases
#############################
# basic
alias vissh='vim $HOME/.ssh/config'
alias lh='ll -h'
alias lla='ls -AlF'

# git
alias ggpush='git push origin $(git_branch_name)'


