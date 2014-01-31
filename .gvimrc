" Set colorscheme
set bg=dark
colo force

" Highlight the cursor line
set cursorline

" Hide gui elements
set guioptions-=T
set guioptions-=a
set guioptions-=L

" Windows only stuff
if has("win32") || has("win32unix")
  set guifont=Consolas:h10:cANSI
elseif has("macunix")
  set guifont=Menlo\ for\ Powerline
endif

" Remap tab bindings
map <C-Tab> gt
inoremap <C-Tab> <ESC>lgt
map <F10> :tab sball<CR>
inoremap <F10> <ESC>:tab sball<CR>li
map <C-t> :tabnew<CR>
inoremap <C-t> <ESC>:tabnew<CR>

" autocomplete
function s:TurnOffAutoComplete()
    if &ft != "c" && &ft != "cpp" && &ft != "cpp11" && &buftype != "nofile" && &buftype != "quickfix"
        if expand('%')=='REPL' || expand('%') == 'SLDB'
            execute ":NeoComplCacheDisable"
        else
            execute ":NeoComplCacheEnable"
        endif
    endif
endfunction

au WinEnter * :call s:TurnOffAutoComplete()
au BufNewFile,BufRead * :call s:TurnOffAutoComplete()

let g:neocomplcache_force_overwrite_completefunc=1
let g:clang_complete_auto=1
let g:clang_auto_select=0
let g:clang_use_library=1
let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"
let g:clang_close_preview=1
let g:clang_periodic_quickfix=1
let g:clang_hl_errors=1
let g:clang_complete_copen=1

" Build option section.
" STANDARD FLAGS.
let clangopts =' -std=c++11'
let clangopts.=' -stdlib=libc++'
let clangopts.=' -ferror-limit=0'
let clangopts.=' -pedantic'
" let clangopts.=' -ansi'
let clangopts.=' -Wall'
let clangopts.=' -Wextra'
let clangopts.=' -Werror'
let clangopts.=' -Wno-import-preprocessor-directive-pedantic'

" ALL OF QT5.
let qt5prefix =' -I/Users/villadelfia/Developer/Qt5-nightly/qtgit/clang_64/include/'
let clangopts.=qt5prefix
let clangopts.=qt5prefix . 'QtWidgets/'
let clangopts.=qt5prefix . 'QtGui/'
let clangopts.=qt5prefix . 'QtCore/'
let clangopts.=qt5prefix . 'QtCLucene/'
let clangopts.=qt5prefix . 'QtConcurrent/'
let clangopts.=qt5prefix . 'QtDeclarative/'
let clangopts.=qt5prefix . 'QtDesigner/'
let clangopts.=qt5prefix . 'QtDesignerComponents/'
let clangopts.=qt5prefix . 'QtHelp/'
let clangopts.=qt5prefix . 'QtMultimedia/'
let clangopts.=qt5prefix . 'QtMultimediaQuick_p/'
let clangopts.=qt5prefix . 'QtMultimediaWidgets/'
let clangopts.=qt5prefix . 'QtNetwork/'
let clangopts.=qt5prefix . 'QtOpenGL/'
let clangopts.=qt5prefix . 'QtPlatformSupport/'
let clangopts.=qt5prefix . 'QtPrintSupport/'
let clangopts.=qt5prefix . 'QtQml/'
let clangopts.=qt5prefix . 'QtQmlDevTools/'
let clangopts.=qt5prefix . 'QtQuick/'
let clangopts.=qt5prefix . 'QtQuickParticles/'
let clangopts.=qt5prefix . 'QtQuickTest/'
let clangopts.=qt5prefix . 'QtScript/'
let clangopts.=qt5prefix . 'QtScriptTools/'
let clangopts.=qt5prefix . 'QtSql/'
let clangopts.=qt5prefix . 'QtSvg/'
let clangopts.=qt5prefix . 'QtTest/'
let clangopts.=qt5prefix . 'QtUiTools/'
let clangopts.=qt5prefix . 'QtV8/'
let clangopts.=qt5prefix . 'QtWebKit/'
let clangopts.=qt5prefix . 'QtWebKitWidgets/'
let clangopts.=qt5prefix . 'QtXml/'
let clangopts.=qt5prefix . 'QtXmlPatterns/'

" MODIFY FOR NEW QT VERSION, Never mind, makes vim cry.
" let clangopts.=qt5prefix . 'QtGui/5.0.1/QtGui/'

" Setting it to the proper location.
let g:clang_user_options=clangopts

au VimEnter * :set co=126
set fillchars=vert:\│
