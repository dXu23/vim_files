vim9script

nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

def GrepOperator(type: string)
    var saved_unnamed_register = getreg("")

    if type ==# 'v'
        normal! `<v`>y
    elseif type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    silent execute "grep! -R " .. shellescape(getreg("")) .. " ."
    copen

    setreg("", saved_unnamed_register)
enddef
