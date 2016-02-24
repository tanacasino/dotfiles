#
# this file is https://github.com/tanacasino/.zshrc
# - Use zplug: git clone https://github.com/b4b4r07/zplug ~/.zplug
#


########################
# environment variables
########################
# Japanese related
export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LESSCHARSET=utf-8

# vim vim vim
export EDITOR=vim


########################
# zsh options
########################
# keybind
bindkey -e

# no share history
setopt append_history no_inc_append_history no_share_history

# right prompt auto hidden
setopt transient_rprompt

# no spell check
unsetopt correct
unsetopt correct_all

# completion settings
autoload -U compinit
compinit

# completion
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

WORDCHARS=''

zmodload -i zsh/complist

## case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  if [ "x$HYPHEN_INSENSITIVE" = "xtrue" ]; then
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    unset HYPHEN_INSENSITIVE
  else
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  fi
fi

zstyle ':completion:*' list-colors ''

# should this be in keybindings?
bindkey -M menuselect '^o' accept-and-infer-next-history

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
if [ "$OSTYPE[0,7]" = "solaris" ]
then
  zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm"
else
  zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
fi

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

if [ "x$COMPLETION_WAITING_DOTS" = "xtrue" ]; then
  expand-or-complete-with-dots() {
    echo -n "\e[31m......\e[0m"
    zle expand-or-complete
    zle redisplay
  }
  zle -N expand-or-complete-with-dots
  bindkey "^I" expand-or-complete-with-dots
fi


autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

setopt auto_cd
setopt auto_pushd

autoload -U promptinit && promptinit

# history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY


########################
# path
########################
typeset -U path
path=(
    $HOME/bin(N-/)
    $HOME/local/bin(N-/)
    $HOME/homebrew/bin(N-/)
    $path
)


########################
# alias
########################
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

alias gb='git branch'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias ggpush='git push origin $(git_current_branch)'
alias glg='git log --stat --color'
alias glgp='git log --stat --color -p'
alias glgg='git log --graph --color'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias gsb='git status -sb'
alias gst='git status'

# open ssh config with vim
alias vissh='vim $HOME/.ssh/config'

# tmux
alias t='tmux'


########################
# functions
# TODO(tanacasino): Rewrite this using zplug local
########################

function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

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

function agvim () {
    vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

function tmuxps() {
    tmuxp load $(ls ~/.tmuxp | peco --query "$LBUFFER")
}


########################
# zplug configuration
########################
source ~/.zplug/zplug

# completions for general commands
zplug "zsh-users/zsh-completions"

# syntax highlight for command line
zplug "zsh-users/zsh-syntax-highlighting", nice:10

# z/autojump like cd
zplug "b4b4r07/enhancd", of:enhancd.sh
export ENHANCD_FILTER=peco:fzf
export ENHANCD_COMMAND='z'

# utility functions using peco/percol/fzf
zplug "mollifier/anyframe"

bindkey '^r' anyframe-widget-execute-history

bindkey '^gh' anyframe-widget-cd-ghq-repository
bindkey '^g^h' anyframe-widget-cd-ghq-repository

bindkey '^gb' anyframe-widget-insert-git-branch
bindkey '^g^b' anyframe-widget-insert-git-branch

# cd git root directory
zplug "mollifier/cd-gitroot"

# async plugin
zplug "mafredri/zsh-async"

# fast/clean prompt theme
zplug "sindresorhus/pure"

# emoji-cli
zplug "stedolan/jq", \
    as:command, \
    file:jq, \
    from:gh-r \
    | zplug "b4b4r07/emoji-cli", if:"which jq"


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load > /dev/null


########################
# localrc
########################
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

