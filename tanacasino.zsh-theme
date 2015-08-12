# プロンプトの設定
PROMPT='%{${fg_bold[white]}%}%n%{$reset_color%}%{${fg[white]}%}@%m%{$reset_color%} [%{$fg[cyan]%}%~%{$reset_color%}] $(git_prompt_info)%(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )
%{$fg[yellow]%}$%{$reset_color%} '

# gitレポジトリがカレントの場合の表示
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%})%{$fg[red]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%})"
