execute pathogen#interpose('bundle/vimtex')
if has('macunix')
    let g:vimtex_view_method='skim'
elseif has('unix')
    let g:vimtex_view_method='mupdf'
endif

let g:vimtex_quickfix_mode=0
setlocal conceallevel=1
let g:tex_conceal='abdmg'

" Spellcheck
set spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" comments out code
latex nnoremap <buffer> <localleader>c I% <esc>

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal indentexpr=""
