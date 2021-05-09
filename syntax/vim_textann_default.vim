if exists("b:current_syntax")

finish

endif

syn region r_region2  matchgroup=Redundant start="\<\<\<" end="\>\>\>"  fold contains=Flow, NoFlow
syn region r_region  matchgroup=NoFlow start=">>" end="<<"    fold contains=Flow, NoFlow, Redundant
syn region f_region  matchgroup=Flow start="\[\[" end="\]\]"  fold contains=sender, attribute, recipient, subject, TP

syn match sender "<S>.\{-}<\/S>" contains=ALL contained
syn match attribute "<A>.\{-}<\/A>"  contains=ALL contained
syn match subject "<U>.\{-}<\/U>"  contains=ALL contained
syn match recipient "<R>.\{-}<\/R>"  contains=ALL contained
syn match TP  "<T>\_.\{-}<\/T>"   contains=ALL contained





"syn region inBold concealends matchgroup=bTag start="<S>" end="</S>"

let b:current_syntax="vim_textann_default"

hi f_region  ctermfg=green
hi r_region  ctermfg=red
hi r_region2  ctermfg=Gray

hi def link sender Todo
hi def link attribute Comment
hi def link subject Statement
hi def link recipient Type
hi def link TP Constant
hi textpattern cterm=bold,underline

" we need the conceal feature (vim ≥ 7.3)
if !has('conceal')
    finish
endif

set conceallevel=2
call matchadd('Conceal', '<S>', 0, -1, {'conceal': ''})
call matchadd('Conceal', '</S>', 0, -1, {'conceal': ''})

call matchadd('Conceal', '<A>', 0, -1, {'conceal': ''})
call matchadd('Conceal', '</A>', 0, -1, {'conceal': ''})

call matchadd('Conceal', '<R>', 0, -1, {'conceal': ''})
call matchadd('Conceal', '</R>', 0, -1, {'conceal': ''})

call matchadd('Conceal', '<U>', 0, -1, {'conceal': ''})
call matchadd('Conceal', '</U>', 0, -1, {'conceal': ''})

call matchadd('Conceal', '<T>', 0, -1, {'conceal': ''})
call matchadd('Conceal', '</T>', 0, -1, {'conceal': ''})
