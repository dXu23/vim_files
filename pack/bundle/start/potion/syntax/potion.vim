if exists("b:current_syntax")
    finish
endif

syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return
highlight link potionKeyword Keyword

syntax match potionComment "\v#.*$"
highlight link potionComment Comment

" Operators
let potionOperators = ['"\v\*"', '"\v/"', '"\v\+"', '"\v\-"', '"\v\?"', '"\v\*\="', '"\v/\="', '"\v\+\="', '"\v-\="', '"\v\="', '"\v:"', '"\v\."']

for op in potionOperators
    execute "syntax match potionOperator" op
endfor
highlight link potionOperator Operator

" Numbers
syntax match potionNumber "\v0x\x\+"
syntax match potionNumber "\v[0-9]+(.[0-9]*)?(e[+-][0-9]+)?"
highlight link potionNumber Number

" Strings
syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region potionString start=/\v'/ skip=/\v\\./ end=/\v'/
highlight link potionString String

let b:current_syntax = "potion"

