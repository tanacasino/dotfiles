#!/usr/bin/env bash
#############################
# asdf
#############################
if [ -f $(brew --prefix)/opt/asdf/asdf.sh ]; then
    source $(brew --prefix)/opt/asdf/asdf.sh
else
    echo -e "You must install asdf"
    echo -e "$ brew install asdf"
fi
