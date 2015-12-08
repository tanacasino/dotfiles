" vimrc
" Tomofumi Tanaka <tanacasino@gmail.com>
" $HOME/.vimrc

" vi互換off
set nocompatible
filetype off
filetype plugin indent off

" Install Plugins
" Use vim-plug ()
source ~/.vimrc.plug
" Use NeoBundle (https://github.com/Shougo/neobundle.vim)
"source ~/.vimrc.bundle

" Configure General
source ~/.vimrc.general

" Configure Plugin
source ~/.vimrc.plugin

" Configure Programming Language Specific
source ~/.vimrc.lang

" Configure environment-specific
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

