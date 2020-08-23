set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "mine"

" Colors for syntax highlighting
hi Comment  ctermfg=28
hi Constant ctermfg=124
hi String ctermfg=124
hi Character ctermfg=124
hi Boolean ctermfg=23
hi TabLineFill ctermfg=234
hi TabLineSel ctermfg=244 ctermbg=232
hi TabLine term=bold cterm=NONE ctermfg=241 ctermbg=234
hi VertSplit ctermfg=233
hi StatusLine ctermfg=233 ctermbg=240
hi StatusLineNC ctermfg=233 ctermbg=240

" if
hi Statement ctermfg=89

hi PreProc ctermfg=89
hi Special ctermfg=90

hi Type ctermfg=31

hi Number ctermfg=65

hi LineNr ctermbg=234 ctermfg=59

hi CursorLine term=NONE cterm=NONE ctermbg=233
hi CursorLineNr    term=bold cterm=bold ctermfg=233 gui=bold

hi Visual term=NONE cterm=NONE ctermbg=232


