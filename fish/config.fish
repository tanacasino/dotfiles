#
# Custom configuration about fish shell.
# $HOME/.config/fish/config.fish
#

############
# Variable #
############
set -x FZF_DEFAULT_OPTS "--reverse --inline-info"



############
# Bind     #
############
bind \cf forward-char



############
# Function #
############
# cd to ghq repository dir with fzf
function __fzf_ghq_cd
  set -q FZF_CD_COMMAND
  or set -l FZF_CD_COMMAND "
  command ghq list --full-path"
  fish -c "$FZF_CD_COMMAND" | __fzfcmd -m $FZF_CD_OPTS | read -la select
  if test ! (count $select) -eq 0
    cd "$select"
  end
  commandline -f repaint
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
alias gcd='__fzf_ghq_cd'

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

