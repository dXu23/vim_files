
setlocal cindent

" <localleader>-c comments out code
nnoremap <buffer> <localleader>c I// <esc>

" <localleader>-c in visual mode comments out a block
vnoremap <buffer> <localleader>c A */<esc>'<i/* <esc>

" Typing iff becomes if()
iabbrev <buffer> iff if ()<left>

