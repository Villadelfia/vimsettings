" VimProjects

fun! FindProject()
    let l:dir = expand("%:p:h")

    if !isdirectory(l:dir)
        return ""
    endif

    while l:dir != "/"
        if isdirectory(l:dir."/.vimproject")
            return l:dir
        endif

        let l:dir = fnamemodify(l:dir, ":h")
    endwhile

    return ""
endfun

fun! LoadProject(path)
    if a:path == ""
        return
    endif

    let g:ProjectRoot = a:path

    execute "source ".g:ProjectRoot."/.vimproject/vimrc"

    execute "set rtp=".&rtp.",".a:path."/.vimproject"     
    echo "Project ".g:ProjectRoot." loaded!"

endfun

fun! FindAndLoadProject() 
    call LoadProject(FindProject())
endfun

au! BufNewFile,BufRead * silent! call FindAndLoadProject()
