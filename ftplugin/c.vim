
setlocal cindent

" <localleader>-c comments out code
nnoremap <buffer> <localleader>c I// <esc>

" <localleader>-c in visual mode comments out a block
vnoremap <buffer> <localleader>c A */<esc>'<i/* <esc>

vnoremap <buffer> <localleader>g y:exe "grep /" .. escape(@", '\\/') .. "/ *.c *.h"<CR>

