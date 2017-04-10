#############################
# Variables
#############################
# TODO(tanacasino): 優先順位を変えたいだけなので、重複を取り除いてソートするようにしたい

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS="--reverse --inline-info"
export GOPATH="$HOME/devel"

pathmunge "$HOME/.nodenv/bin"
pathmunge "$GOPATH/bin"
pathmunge "$HOME/.yarn/bin"


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

function git_checkout_fzf() {
    # g br | grep -v '^*' | sed 's/^[ \t]*//''
    local selected="$(git branch | grep -v '^*' | sed 's/^[ \t]*//' | $(__fzfcmd) --query="$READLINE_LINE")"
    if [ -n "$selected" ]; then
        echo git checkout "$selected"
    fi
}



#############################
# Key binding
#############################
bind '"\C-]": " \C-e\C-u`ghq_cd_repository`\e\C-e\e^\er"'
bind '"\C-x\C-g": " \C-e\C-u`git_checkout_fzf`\e\C-e\e^\er"'



#############################
# Aliases
#############################
# basic
alias vissh='vim $HOME/.ssh/config'
alias lh='ll -h'
alias lla='ls -AlF'

# git
alias ggpush='git push origin $(git_branch_name)'
alias ggpushf='git push -f origin $(git_branch_name)'
alias lock='"/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession" -suspend'



#############################
# Completions
#############################
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g



#############################
# Others
#############################
# init nodenv
if which nodenv > /dev/null 2>&1; then
    eval "$(nodenv init -)"
fi
