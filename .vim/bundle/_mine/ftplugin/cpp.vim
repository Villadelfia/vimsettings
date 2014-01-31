if executable("astyle")
    set equalprg=astyle\ --options=$HOME/.vim/astyle
endif
runtime! syntax/cpp11.vim
