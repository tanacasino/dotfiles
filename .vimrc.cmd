" vim: ft=vim
" $HOME/.vimrc.cmd

" Toggle View
" puttyやteratermを使っていてvimの画面でcopy/pasteを使う場合に、使いやすいように切り替える
command! -nargs=0 CPView set nolist nonumber
command! -nargs=0 DevView set list number

" CdCurrent (import from kaoriya vim cmdex.vim)
command! -nargs=0 CdCurrent cd %:p:h
