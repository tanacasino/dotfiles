# zsh settings

# EDITORがvim設定の場合でもemacsキーバインドを使う(ex. Ctrl + Aで行頭とか)
bindkey -e

# historyの設定
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history


### PATH ###
typeset -U path
path=($HOME/bin(N-/)
      $HOME/local/bin(N-/)
      $path
      )


### Alias ###
alias ls='ls --color=auto'
alias l='ls -CF'
alias ll='ls -lF'
alias la='ls -A'
alias lh='ll -h'
alias lla='ls -AlF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


### Environment Variables ###
export EDITOR=vim


### Other ###
# RVM
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"
