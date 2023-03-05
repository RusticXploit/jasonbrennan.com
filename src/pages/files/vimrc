set expandtab
set tabstop=2
set shiftwidth=2

au BufReadPost *.vue set syntax=html
au BufReadPost *.astro set syntax=html

set undofile
set undolevels=1000
set undoreload=10000

set backup
set swapfile
set undodir=$HOME/.vim/tmp/undo//
set backupdir=$HOME/.vim/tmp/backup//
set directory=$HOME/.vim/tmp/swap//

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

