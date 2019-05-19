execute pathogen#interpose('bundle/vimtex')
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
setlocal conceallevel=1
let g:tex_conceal='abdmg'

" comments out code
latex nnoremap <buffer> <localleader>c I% <esc>

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal indentexpr=""
