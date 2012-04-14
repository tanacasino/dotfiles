# プロンプトの設定
PROMPT='%{${fg_bold[white]}%}%n%{$reset_color%}%{${fg[white]}%}@%m%{$reset_color%} $(git_prompt_info)%(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )%{$fg[yellow]%}$%{$reset_color%} '

# 右側に表示するプロンプトの設定
RPROMPT='%{$fg[green]%}%~%{$reset_color%}'


# gitレポジトリがカレントの場合の表示
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
