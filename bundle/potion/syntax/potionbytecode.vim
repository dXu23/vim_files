" if exists("b:current_syntax")
"     finish
" endif

let PotionBytecodeKeywords = ['bind', 'call', 'getlocal', 'getupval', 'loadk', 'loadpn', 'move', 'msg', 'mult', 'proto', 'return', 'self', 'setlocal', 'setupval']

for keyword in PotionBytecodeKeywords
    execute "syntax keyword potionBytecodeKeyword" keyword
endfor
highlight link potionBytecodeKeyword Keyword


