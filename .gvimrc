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

au VimEnter * :set co=126
set fillchars=vert:\│
