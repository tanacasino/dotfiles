#
# Custom configuration about fish shell.
# $HOME/.config/fish/config.fish
#

###########
# Alias   #
###########
# git
alias g='git'
alias gsb='git status -sb'
alias gst='git status'
alias gd='git diff'
alias gf='git fetch --prune --tags --verbose'
alias gfa='git fetch --prune --tags --verbose --all'
alias ggpush='git push origin (git_branch_name)'
alias gb='git branch'
alias gc='git commit -v'
alias 'gc!'='git commit -v --amend'
alias gco='git checkout'
alias glg='git log --stat --color'
alias glgg='git log --graph --color'

# tmux
alias tmux='env TERM=xterm-256color tmux'
alias t=tmux

# basic
alias hist=history
alias ls='gls --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias lh='ll -h'
alias ll='ls -lF'
alias lla='ls -AlF'
alias vissh='vim $HOME/.ssh/config'


###########
# Bind    #
###########
bind \cf forward-char

