" Vim filetype plugin
" Language:		Markdown

if exists("b:did_ftplugin")
  finish
endif

runtime! ftplugin/html.vim ftplugin/html_*.vim ftplugin/html/*.vim

setlocal comments=fb:*,fb:-,fb:+,n:> commentstring=>\ %s
setlocal formatoptions+=tcqln formatoptions-=r formatoptions-=o
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^[-*+]\\s\\+

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= "|setl cms< com< fo< flp<"
else
  let b:undo_ftplugin = "setl cms< com< fo< flp<"
endif

function! s:OpenMarked()
  execute "w"
  execute ":silent !open -a Marked '%:p'"
  set ut=250
  set sts=4
  au CursorHold,CursorHoldI *.md update
  au BufDelete,VimLeave *.md :call s:CloseMarked() 
endfunction

function! s:CloseMarked()
  execute "silent !osascript -e 'tell application \"Marked\"' -e 'if (count of windows) / 2 <= 1 then' -e 'quit application' -e 'else' -e 'close window \"" . expand("%:p:t") . "\"' -e 'end if' -e 'end tell'"
endfunction 

if has("macunix")
  if expand("%") == ""
    au BufWrite * call s:OpenMarked()
  else
    call s:OpenMarked()
  endif
endif

" vim:set sw=2:
