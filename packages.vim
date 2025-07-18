vim9script

if &compatible
    set nocompatible
endif

packadd minpac

command! PackUpdate packadd minpac | source $MYVIMRC | redraw | minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | minpac#clean()

if !exists('*minpac#init')
    finish
endif

minpac#init()

minpac#add('k-takata/minpac', {'type': 'opt'})

minpac#add('tpope/vim-unimpaired')
minpac#add('tpope/vim-scriptease', {'type': 'opt'})

minpac#add('pangloss/vim-javascript', {'type': 'opt'})
minpac#add('dense-analysis/ale', { 'type': 'opt' })

minpac#add('turbio/bracey.vim')
minpac#add('bundle/vimtex')
