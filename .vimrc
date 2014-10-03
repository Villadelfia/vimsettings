" pathogen package manager.
call pathogen#infect()

" Set correct behavior
set nocompatible

" Windows only stuff
if has("win32") || has("win32unix")
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

" Allow usage of C-c, C-x, C-v etc...
set selectmode=key

" Turn syntax highlighting on
syntax on

" Pretty coloring
highlight LineNr ctermfg=grey
highlight SpecialKey ctermfg=5

" Always show status line
set laststatus=2

" Text encoding
set encoding=utf-8

" Color status line based on mode
au InsertEnter * hi StatusLine ctermbg=5
au InsertLeave * hi StatusLine ctermbg=0

" Automatically load skeleton files
au BufNewFile CMakeLists.txt silent! 0r ~/.vim/skel/CMakeLists.txt
au BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e
au BufNewFile * exe "silent! %s/<+NAME+>/" . expand('%:t:r') . "/g"
au BufNewFile * exe 'silent! %s/<+GUARD+>/' . substitute(expand("%:p:h:t") . "_" . expand("%:t:r") . "_H_", ".*", "\\U&", "") . '/g'

" Automatically set filetypes
" au FileType java set foldmethod=syntax
au BufNewFile,BufRead *.s set syntax=mips
au BufNewFile,BufRead *.prolog set syntax=prolog

" Indentation
set cc=81
set expandtab
set shiftwidth=4
set softtabstop=4
set ts=4
set cino=:0g0
filetype indent plugin on

" Flash screen on fail
set visualbell

" Bracket matching
set showmatch 

" Show row and column
set ruler

" Stop folding at the function level
set foldnestmax=2

" Fix for comments
set formatoptions+=r

" Incremental highlighting search
set incsearch hlsearch

" Line numbering
set number
set numberwidth=4

" Allows free movement with arrow keys
set backspace=indent,eol,start whichwrap+=<,>,[,] 
set shellslash 

" Set <D-i> to autoindent (c-like)
nnoremap <D-i> gg=G
inoremap <D-i> <Esc>gg=Gi
vnoremap <D-i> =

" Clear search highlighting when you press space
nnoremap <silent> <C-l> :nohl<Bar>:echo<CR>

" Toggle folding with space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Lisp settings
let g:paredit_matchlines = 1000
let g:lisp_rainbow = 1

" Make settings
" au FileType java set makeprg=javac\ %
au FileType tex set makeprg=latex\ -interaction=nonstopmode\ -silent\ %

" Mouse mode.
set mouse=a

" Windows only stuff
if has("win32") || has("win32unix")
    set runtimepath=~/.vim/,$VIMRUNTIME
endif

" Mac only stuff
if has("macunix")
    nnoremap <leader>m :silent !open -a Marked '%:p'<cr>
    if has("gui_macvim")
        "set transparency=10
    endif
endif

" Disable autoclose in Lisp
au FileType lisp,scheme AutoCloseOff
au BufNewFile,BufRead REPL AutoCloseOff

" Disable autoclose in XML and html
au FileType xml,html AutoCloseOff
au FileType xml,html let b:AutoCloseNoCrRemap = 1

" powerline options.
let g:Powerline_symbols = 'fancy'

" set leader
let mapleader="\\"

" delimitMate options.
let g:delimitMate_expand_cr=1
au FileType vim let b:delimitMate_quotes="'"

" Updatetime
set ut=1000

" More completion options
set completeopt-=preview

" <C-space> for autocomplete
inoremap <C-space> <C-x><C-u>

" hardcore clipboard-on-clipboard action
set clipboard=unnamed

" ruby on rails
let g:rubycomplete_rails = 1

if has("gui_running")
    " NERDTree
    autocmd vimenter * NERDTree 
    autocmd vimenter * if (bufnr("$") == 2 && bufname(1) != "") | winc l | endif 
    set bg=light
    colo force
else
    " Set dark background for in terminal.
    set bg=dark
    colo force
endif

" split navigation
nmap <silent> <PageUp> :wincmd k<CR>
nmap <silent> <PageDown> :wincmd j<CR>
nmap <silent> <Home> :wincmd h<CR>
nmap <silent> <End> :wincmd l<CR>
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" More NERDTree options
let NERDTreeShowBookmarks=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeChDirMode=2
let NERDTreeMapHelp='h'

" Open bufexplorer
nmap <silent> <D-e> :BufExplorer<CR>
imap <silent> <D-e> <esc>:BufExplorer<CR>

" Autoupdate
set autoread

" ,a for alt file.
nmap <silent> <leader>a :A<CR>

" ,g for go to file.
nmap <silent> <leader>g :IH<CR>

" ,n for go to next file matched by ,g.
nmap <silent> <leader>n :IHN<CR>

" Perldoc cache.
let g:Perldoc_path = "/tmp/"

" Snippet author. For license.
let g:snips_author = "Randy Thiemann"

" Latex stuff
let g:tex_flavor = "latex"
let g:LatexBox_viewer = "open"
let g:LatexBox_show_warnings = 1
let g:LatexBox_ignore_warnings = ['Underfull']

" Programmeerwedstrijd commands
" Perl
command Testpl execute "!perl % < %:r.input"
au FileType perl map <D-/> :Testpl<CR>

" Python
command Testpy execute "!python % < %:r.input"
command Testpy3 execute "!python3 % < %:r.input"
au FileType python map <D-/> :Testpy<CR>

" Scheme
command Testscm execute "!racket % < %:r.input"
au FileType scheme map <D-/> :Testscm<CR>

" Php
command Testphp execute "!php % < %:r.input"
au FileType php map <D-/> :Testphp<CR>

" Ruby
command Testrb execute "!ruby % < %:r.input"
au FileType ruby map <D-/> :Testrb<CR>

" C
command Testc execute "!clang -Wall -O2 % -lm && ./a.out < %:r.input && rm a.out"
au FileType c map <D-/> :Testc<CR>

" C++
command Testcpp execute "!clang++ -Wall -O2 % -lm -std=c++11 --stdlib=libc++ && ./a.out < %:r.input && rm a.out"
au FileType cpp map <D-/> :Testcpp<CR>

" C#
command Testcs execute "!mcs % && mono %:r.exe < %:r.input && rm %:r.exe"
au FileType cs map <D-/> :Testcs<CR>

" Prolog
command Testpro execute "!swipl -q -O -t \"['%'],main.\" < %:r.input"
au FileType prolog map <D-/> :Testpro<CR>

" Java
command Testjava execute "!javac % && java %:r < %:r.input && rm %:r.class"
au FileType java map <D-/> :Testjava<CR>

" Haskell
command Tesths execute "!ghc --make -Wall -O2 % && ./%:r < %:r.input && rm %:r %:r.hi %:r.o"
au FileType haskell map <D-/> :Tesths<CR>

" Scala
command Testscala execute "!scalac % && scala %:r < %:r.input && rm *.class"
au FileType scala map <D-/> :Testscala<CR>

" Pascal
command Testpas execute "!fpc -O2 -Sg % && ./%:r < %:r.input && rm %:r %:r.o"
au FileType pascal map <D-/> :Testpas<CR>

autocmd FileType c,cpp,java,php,ruby,python,glsl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" R stuff
let vimrplugin_routnotab = 1
let vimrplugin_rconsole_height = 15
let vimrplugin_ca_ck = 1
let vimrplugin_openpdf = 1
let vimrplugin_routmorecolors = 1
let vimrplugin_restart = 1
au FileType r call StartR('R')
au VimLeave * call system("tmux kill-pane -a")

" YouCompleteMe stuff
let g:ycm_global_ycm_extra_conf = $HOME . '/.vim/bundle/_mine/ycm_global.py'
let g:ycm_extra_conf_vim_data = ['g:ycm_global_ycm_extra_conf']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf = 0
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_always_populate_location_list = 1

let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
