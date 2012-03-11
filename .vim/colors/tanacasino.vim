" Vim Color Tanacasino
" 自分好みのカラースキーマ.
" desertEx + wombat + koehler
" Maintainer:   tanacasino <tanacasino.org AT gmail DOT com>
" Last Change:  2011-03-16 22:05:00

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="tanacasino"

"hi Normal      guifg=#f6f3e8 guibg=#151515 gui=none
"hi Normal      guifg=#f6f3e8 guibg=#202020 gui=none
hi Normal      guifg=#f6f3e8 guibg=#242424 gui=none
"hi Normal      guifg=#f6f3e8 guibg=Black gui=none


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine   guibg=#2d2d2d
  hi CursorColumn guibg=#2d2d2d
  hi MatchParen   guibg=#857b6f guifg=#f6f3e8 gui=bold
  hi Pmenu        guibg=#444444 guifg=#f6f3e8
  hi PmenuSel     guibg=#cae682 guifg=#000000
endif


" highlight groups
hi Cursor       guifg=black          guibg=yellow   gui=none
hi ErrorMsg     guifg=white          guibg=red      gui=none
hi VertSplit    guifg=gray40         guibg=gray40   gui=none
hi Folded       guifg=DarkSlateGray3 guibg=grey30   gui=none
hi FoldColumn   guifg=tan            guibg=grey30   gui=none
hi IncSearch    guifg=#b0ffff        guibg=#2050d0
hi LineNr       guifg=burlywood3     gui=none
hi ModeMsg      guifg=SkyBlue        gui=none
hi MoreMsg      guifg=SeaGreen       gui=none
hi NonText      guifg=cyan           gui=none
hi Question     guifg=springgreen    gui=none
hi Search       guifg=gray80         guibg=#445599  gui=none
hi SpecialKey   guifg=cyan           gui=none
hi StatusLine   guifg=black          guibg=#c2bfa5  gui=bold
hi StatusLineNC guifg=grey           guibg=gray40   gui=none
hi Title        guifg=indianred      gui=none
hi Visual       guifg=gray17         guibg=tan1     gui=none
hi WarningMsg   guifg=salmon         gui=none
hi Pmenu        guifg=white          guibg=#445599  gui=none
hi PmenuSel     guifg=#445599        guibg=gray
hi WildMenu     guifg=gray           guibg=gray17   gui=none
hi MatchParen   guifg=cyan           guibg=NONE     gui=bold
hi DiffAdd      guifg=black          guibg=wheat1
hi DiffChange   guifg=black          guibg=skyblue1
hi DiffText     guifg=black          guibg=hotpink1  gui=none
hi DiffDelete   guifg=black          guibg=gray45    gui=none


" syntax highlighting groups
hi Comment      guifg=PaleGreen3           gui=none
hi Constant     guifg=salmon               gui=none
hi Identifier   guifg=Skyblue              gui=none
hi Function     guifg=Skyblue              gui=none
hi Statement    guifg=lightgoldenrod2      gui=none
hi PreProc      guifg=PaleVioletRed2       gui=none
hi Type         guifg=lightgreen           gui=none
hi Special      guifg=aquamarine2          gui=none
hi Ignore       guifg=grey40               gui=none
hi Todo         guifg=red guibg=lightblue  gui=none

hi link IncSearch       Visual
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Function        Identifier
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Operator        Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special


" color terminal definitions
hi SpecialKey   ctermfg=darkgreen
hi NonText      ctermfg=darkred      cterm=bold  cterm=bold  gui=bold      guifg=#cc0000
hi Directory    ctermfg=darkcyan
hi ErrorMsg     cterm=bold           ctermfg=7        ctermbg=1
hi IncSearch    cterm=NONE           ctermfg=yellow   ctermbg=green
hi Search       cterm=NONE           ctermfg=grey     ctermbg=blue
hi MoreMsg      ctermfg=darkgreen
hi ModeMsg      cterm=NONE           ctermfg=brown
hi LineNr       ctermfg=3
hi Question     ctermfg=green
hi StatusLine   cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit    cterm=reverse
hi Title        ctermfg=5
hi Visual       cterm=reverse
hi VisualNOS    cterm=bold,underline
hi WarningMsg   ctermfg=1
hi WildMenu     ctermfg=0            ctermbg=3
hi Folded       ctermfg=darkgrey     ctermbg=NONE
hi FoldColumn   ctermfg=darkgrey     ctermbg=NONE
hi DiffAdd      ctermbg=4
hi DiffChange   ctermbg=5
hi DiffDelete   cterm=bold           ctermfg=4        ctermbg=6
hi DiffText     cterm=bold           ctermbg=1

