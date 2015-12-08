" vimrc
" Tomofumi Tanaka <tanacasino@gmail.com>
" $HOME/.vimrc

" vi互換off
set nocompatible
filetype off
filetype plugin indent off

" Configure Bundle
" Use NeoBundle (https://github.com/Shougo/neobundle.vim)
"source ~/.vimrc.bundle

" Install Plugins
" Use vim-plug ()
source ~/.vimrc.plug

" Configure General
source ~/.vimrc.general

" Configure Keymap
source ~/.vimrc.keymap

" Configure Completion
source ~/.vimrc.completion

" Configure Indent
source ~/.vimrc.indent

" Configure Plugin
source ~/.vimrc.plugin

" Configure Extra Command
source ~/.vimrc.cmd

" Configure Programming Language Specific
source ~/.vimrc.lang

" Configure environment-specific
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
