" Vim color file
" Maintainer:  Randy Thiemann

set background=dark  
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="midnight"

hi Normal guifg=#FFFFFF guibg=#000000 ctermfg=14

hi CursorLine guibg=#343126 
hi LineNr guifg=#FFFFFF
hi Pmenu guibg=#444444

" syntax highlighting groups
hi Comment guifg=#41CC45 
hi Constant guifg=#00A0FF
hi String guifg=#FE2B38
hi Character guifg=#786DFF
hi Number guifg=#786DFF
hi Identifier guifg=#23FF83 
hi Statement guifg=#D31881
hi PreProc guifg=#E47C48
hi Type  guifg=#00A0FF
hi Special guifg=#FE2B38
hi Todo guifg=#000000 guibg=#FFFFFF 
hi NonText guifg=#BCBCBC

