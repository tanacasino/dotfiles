##############################
## fasd
##############################

command -v fasd &> /dev/null
if [ $? -eq 1 ]; then
    echo -e "You must install fasd"
    echo -e "brew install fasd"
else
    eval "$(fasd --init auto)"
fi
