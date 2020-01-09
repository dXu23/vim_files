if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
    silent !clear
    write
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! PotionShowBytecode()
    write
    " Get the bytecode.
    let bytecode = system(g:potion_command . " -c -V " . bufname("%") . " 2>&1")
    " Open a new split and set it up.
    let BytecodeWinNum = bufwinnr("__Potion_Bytecode__")
    if BytecodeWinNum < 0
        vsplit __Potion_Bytecode__
    else
        execute BytecodeWinNum . "wincmd w"
    endif
    normal! ggdG
    setlocal filetype=potionbytecode
    setlocal buftype=nofile

    " Insert the bytecode.
    call append(0, split(bytecode, '\v\n'))
endfunction

nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b :call PotionShowBytecode()<cr>
