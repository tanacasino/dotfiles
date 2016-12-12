#
# Custom configuration about fish shell.
# $HOME/.config/fish/config.fish
#

############
# Variable #
############
set -x FZF_DEFAULT_COMMAND 'ag -g ""'
set -x FZF_DEFAULT_OPTS "--reverse --inline-info"



############
# Function #
############
function gcd -d 'Change directory from ghq list'
  ghq list --full-path | __fzfcmd -m | read -la select
  if test ! (count $select) -eq 0
    cd "$select"
  end
  commandline -f repaint
end


function vimf -d 'Open with vim in git files'
  command git ls-files | __fzfcmd -m | __fzfescape | read -la selects
  and vim $selects
end



############
# Alias    #
############
# TODO alias should be replace function (fish rule)
# git
alias g='git'
alias gsb='git status -sb'
alias gst='git status'
alias gd='git diff'
alias gf='git fetch --prune --verbose'
alias gfa='git fetch --all --prune --tags --verbose'
alias ggpush='git push origin (git_branch_name)'
alias gb='git branch'
alias gc='git commit -v'
alias 'gc!'='git commit -v --amend'
alias gco='git checkout'
alias glg='git log --stat --color'
alias glgg='git log --graph --color'

# tmux
function tmux
  env TERM='xterm-256color' tmux $argv
end

function t
    tmux $argv
end


# basic
alias hist=history
alias ls='gls --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias lh='ll -h'
alias ll='ls -lF'
alias lla='ls -AlF'
alias vissh='vim $HOME/.ssh/config'



############
# Bind     #
############
bind \cf forward-char



############
# Local    #
############
if test -f ~/.config/fish/local.fish
    . ~/.config/fish/local.fish
end

