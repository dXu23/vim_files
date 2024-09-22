if &compatible
    set nocompatible
endif

packadd minpac

command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

if !exists('*minpac#init')
    finish
endif

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})

call minpac#add('pangloss/vim-javascript', {'type': 'opt'})
call minpac#add('dense-analysis/ale', { 'type': 'opt' })

call minpac#add('turbio/bracey.vim')
