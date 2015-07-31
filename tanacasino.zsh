# $HOME/.oh-my-zsh/custom/tanacasino.zsh

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

# コマンドのスペルチェックをしない
unsetopt correct
unsetopt correct_all


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
#compdef g=git

alias vissh='vim $HOME/.ssh/config'

# tmux
alias t='tmux'
#compdef t=tmux


### Environment Variables ###
export EDITOR=vim

# python-pip cache
export PIP_DOWNLOAD_CACHE="$HOME/.pip-cache"


### Functions ###

function alc() {
    if which w3m > /dev/null 2>&1; then
        if [ -r $HOME/.w3m/config ]; then
            if grep -q ^http_proxy $HOME/.w3m/config; then
                eval `grep ^http_proxy ~/.w3m/config`
            fi
        fi
        if [ -n "$http_proxy" ]; then
            http_proxy=$http_proxy w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa" | sed "1,37d" | less
        else
            w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa" | sed "1,37d" | less
        fi
    else
        echo "w3m not found"
    fi
}

## peco ##
function agvim () {
    vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history


function peco-cd-devel-directory() {
    BUFFER=$(ghq list -p | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-cd-devel-directory
bindkey '^x^r' peco-cd-devel-directory


function peco-git-branch-checkout() {
    BUFFER=$(git branch | peco --query "$LBUFFER" | sed -e "s/\* //g" | awk '{print "git checkout " $1}')
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-git-branch-checkout
bindkey '^g^b' peco-git-branch-checkout


function tmuxps() {
    tmuxp load $(ls ~/.tmuxp | peco --query "$LBUFFER")
}


### localrc ###
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
