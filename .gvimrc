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
"colorscheme tanacasino
colorscheme solarized
set background=dark

" フォント
if has('win32')
    set guifont=Migu_1M:h12:cSHIFTJIS
else
    set guifont=Migu\ 1M\ 12
endif

