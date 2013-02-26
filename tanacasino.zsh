# my zsh settings
### keybind ###
# EDITORがvim設定の場合でもemacsキーバインドを使う(ex. Ctrl + Aで行頭とか)
bindkey -e

# 日本語
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

### history ###
# 複数シェル間でヒストリーを共有しない
setopt append_history no_inc_append_history no_share_history

# 右プロンプトの表示が常に1つになるように
setopt transient_rprompt

### nocorrect ###

if [ -f ~/.zsh_nocorrect ]; then
    while read -r COMMAND; do
        alias $COMMAND="nocorrect $COMMAND"
    done < ~/.zsh_nocorrect
fi


### PATH ###
typeset -U path
path=(
      $HOME/bin(N-/)
      $HOME/local/bin(N-/)
      $HOME/homebrew/bin(N-/)
      $path
     )


### Alias ###
if [ `uname` = "Darwin" ]; then
    # GNU (prereq: brew install coreutils)
    alias ls='gls --color=auto'
    if [ -f $HOME/.dir_colors ]; then
        eval $(gdircolors -b $HOME/.dir_colors)
    fi
    # Byobu(brew install byobu)
    export BYOBU_PREFIX=$(brew --prefix)
    # MacVim(kaoriya)
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
else
    alias ls='ls --color=auto'
    if [ -f $HOME/.dir_colors ]; then
        eval $(dircolors -b $HOME/.dir_colors)
    fi
fi
alias l='ls -CF'
alias ll='ls -lF'
alias la='ls -A'
alias lh='ll -h'
alias lla='ls -AlF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias hist='history'

# python
alias ipython='PAGER="less -r" ipython'

# git
alias g='git'
compdef g=git

alias vissh='vim $HOME/.ssh/config'

### Environment Variables ###
export EDITOR=vim


### Other ###
# python-pip cache
export PIP_DOWNLOAD_CACHE="$HOME/.pip-cache"
