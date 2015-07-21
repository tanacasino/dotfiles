"===================================
" gvimrc GUI settings.
"===================================

" Windows Gvim メニュー文字化け対策
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

" ツールバーを削除
set guioptions-=T

" カラースキーマ
"set background=light
set background=dark
"colorscheme solarized
"colorscheme desertEx
"colorscheme tanacasino
colorscheme PaperColor

" フォント
if has('win32')
  set guifont=Migu_1M:h12:cSHIFTJIS
elseif has('mac')
  set guifont=Migu\ 1M\ regular:h14
  "set guifont=ゆたぽん（コーディング）:h14
else
  set guifont=Migu\ 1M\ 12
endif
