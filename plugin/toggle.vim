nnoremap <leader>f :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
    echom &foldcolumn
endfunction

nnoremap <leader>q :call QuickfixToggle()<cr>

function! QuickfixToggle()
    copen
endfunction
