# scm theming
SCM_THEME_PROMPT_PREFIX="|"
SCM_THEME_PROMPT_SUFFIX=""

SCM_THEME_PROMPT_DIRTY=" ${bold_red}!${normal}"
SCM_THEME_PROMPT_CLEAN=" ${green}-${normal}"
SCM_GIT_CHAR="${green}G${normal}"

SCM_GIT_AHEAD_CHAR=" ↑ "
SCM_GIT_BEHIND_CHAR=" ↓ "

scm_prompt() {
    CHAR=$(scm_char)
    if [ $CHAR = $SCM_NONE_CHAR ]; then
        return
    else
        echo "[$(scm_char)$(scm_prompt_info)]"
    fi
}

tanacasino_prompt() {
    ps_host="${bold_blue}\h${normal}";
    ps_user="${green}\u${normal}";
    ps_user_mark="${red}❯ ${normal}";
    #ps_user_mark="${green}❯ ${normal}";
    ps_root="${red}\u${red}";
    ps_root_mark="${red}# ${normal}"
    ps_path="${yellow}\w${normal}";

    # make it work
    case $(id -u) in
        0) PS1="$ps_root@$(scm_prompt):$ps_path\n$ps_root_mark"
            ;;
        *) PS1="$ps_path $(scm_prompt)\n$ps_user_mark"
            ;;
    esac
}

safe_append_prompt_command tanacasino_prompt

