" <localleader>-c comments out code
nnoremap <buffer> <localleader>c I// <esc>

" <localleader>-c in visual mode comments out a block
vnoremap <buffer> <localleader>c A<cr>*/<esc>'<O/*<esc>
" A */<esc>'<i/* <esc>

" Typing iff becomes if()
iabbrev <buffer> iff if ()<left>

" Typing ret becomes return ;
iabbrev <buffer> ret return;<left>

