#############################
# fzf
#############################
if ! command -v fzf &> /dev/null; then
    echo -e "You must install fzf"
    echo -e "$ brew install fzf"
fi

if ! command -v ag &> /dev/null; then
    echo -e "You must install ag"
    echo -e "$ brew install the_silver_searcher"
fi


#############################
# Variables
#############################
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS="--reverse --inline-info"


if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
else
    if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
      export PATH="$PATH:/usr/local/opt/fzf/bin"
    fi

    # Auto-completion
    # ---------------
    [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null

    # Key bindings
    # ------------
    source "/usr/local/opt/fzf/shell/key-bindings.bash"
fi


#############################
# Functions
#############################
function git_checkout_fzf() {
    local selected="$(git branch | grep -v '^*' | sed 's/^[ \t]*//' | $(__fzfcmd) --query="$READLINE_LINE")"
    if [ -n "$selected" ]; then
        echo git checkout "$selected"
    fi
}

if command -v ghq &> /dev/null; then
    function ghq_cd_repository() {
        local selected="$(ghq list --full-path | $(__fzfcmd) --query="$READLINE_LINE")"
        if [ -n "$selected" ]; then
            echo cd "$selected"
        fi
    }
    # key binding
    bind '"\C-]": " \C-e\C-u`ghq_cd_repository`\e\C-e\e^\er"'
fi


#############################
# Key binding
#############################
bind '"\C-x\C-g": " \C-e\C-u`git_checkout_fzf`\e\C-e\e^\er"'

