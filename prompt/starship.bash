#############################
# starship
#############################

if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
else
    echo -e "You must install starship"
    echo -e "$ brew install starship"
fi

