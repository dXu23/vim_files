
packadd vim-javascript
packadd ale

nnoremap <buffer> <localleader>c I// <esc>

iabbrev <buffer> iff if ()<left>

vnoremap <buffer> <localleader>c A */<esc>'<i/* <esc>

iabbrev <buffer> ret return;<left>

let b:ale_fixers = {
    'javascirpt': [ 'prettier', 'eslint' ],
    'css': [ 'prettier' ],


let g:ale_linters_explicit = 1

let g:ale_sign_error = '❌'

let g:ale_sign_warning = '⚠️'
