#############################
# powerline-go
#############################

if command -v powerline-go &> /dev/null; then
    function __update_ps1() {
        local powerline_args="-newline -cwd-max-depth 7 -numeric-exit-codes"
        powerline_args="$powerline_args -modules cwd,git,exit,root,exit"
        PS1="$(~/devel/bin/powerline-go $powerline_args -error $?)"
    }

    if [ "$TERM" != "linux" ]; then
        PROMPT_COMMAND="__update_ps1; $PROMPT_COMMAND"
    fi
else
    echo -e "You must install powerline-go"
    echo -e "$ go get -u github.com/justjanne/powerline-go"
fi

