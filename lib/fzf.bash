#############################
# fzf
#############################
command -v fzf &> /dev/null
if [ $? -eq 1 ]; then
    echo -e "You must install fzf"
    echo -e "brew install fzf"
fi

command -v ag &> /dev/null
if [ $? -eq 1 ]; then
    echo -e "You must install ag"
    echo -e "brew install the_silver_searcher"
fi


#############################
# Variables
#############################
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS="--reverse --inline-info"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash


#############################
# Functions
#############################
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

