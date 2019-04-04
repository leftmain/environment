set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "mine"

" Colors for syntax highlighting
hi Comment  ctermfg=22
hi Constant ctermfg=52
hi String ctermfg=88
hi Character ctermfg=88
hi Boolean ctermfg=23

" if
hi Statement ctermfg=89

hi PreProc ctermfg=89
hi Special ctermfg=90

hi Type ctermfg=24

hi Number ctermfg=65

hi LineNr ctermbg=234 ctermfg=59

hi CursorLine term=NONE cterm=NONE ctermbg=233

