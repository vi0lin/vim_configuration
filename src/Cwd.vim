function! Folder_Up(count, nr)
  let path=CWD()
  let i = 0
  " echo path a:nr i
  while i < a:nr+a:count
    let path=GetParentDir(path)
    let i += 1
  endwhile
  return path
endfunction

function! Folder_Project()
  return CWD()
endfunction

function! GETCWD()
  if exists("w:cwd")
    return w:cwd
  endif
  return ''
endfunction

" function! CD(path)
"   if isdirectory(a:path)
"     call execute("cd ".a:path)
"     " execute "cd ".a:path
"   else
"     call execute("cd ".GetParentDir(a:path))
"     " execute "cd ".GetParentDir(a:path)
"   endif
"   let w:cwd=getcwd()
"   " Optimize (One Thread, gather All Information In Vim)
"   call UpdateGit()
"   if exists('w:git')
"     if w:git!=-1
"     endif
"   endif
"   " echo "Not A Directory"
"   let $folderrepo=Folder_Repo(0, 0)
" endfunction

function! GetParentDir(path)
    let l:parent = fnamemodify(a:path, ':h')
    return l:parent
endfunction

function! MakeDirCurrent(path)
  let [n, y, x, n, n]=getcurpos()
  call CD(a:path)
  call SetPointer(a:path)
  call cursor(y, x)
endfunction

" function MakeDirCurrentProject()
"   let [n, y, x, n, n]=getcurpos()
"   " let CWD()=expand("%:p:h")
"   " call SetProject(expand("%:p:h"))
"   call cursor(y, x)
" endfunction
"
"
function! FindGit(path)
  let b=split(a:path, "/")
  for i in range(1,len(b))
    let dir='/'..join(b[:len(b)-i], '/')
    let git=dir..'/.git'
    if isdirectory(git)
      " call SetProject(dir)
      return dir
    elseif filereadable(git)
      " bring back in
      call SetProject(dir)
      return dir
    endif
  endfor
  let dir = '/'
  if isdirectory(dir..'/.git')
    " call SetProject(dir)
    return dir
  endif
  return -1
  " let parent=GetParentDir(a:path)
endfunction

" function! AllBranches(path)
"   " let x = systemlist('cd '..a:path..'; git branch')
"   let x=systemlist("cd "..a:path.."; git branch --list | awk {'print $2? $2 : $1'}")
"   let w:gitBranchList = x
"   return w:gitBranchList
" endfunction

" function! FindDiff(path)
"   let x = systemlist('cd '..a:path..'; git diff --stat 2>&1')
"   if len(x)>1
"     return ' '..substitute(substitute(substitute(substitute(substitute(substitute(substitute(x[-1], '[^0-9+-]', ' ', 'g'), '-\{2,\}', '', 'g'), '+\{2,\}', '', 'g'), '\s\{2,\}', ' ', 'g'), '\s+', '+', ''), '\s-', '-', 'g'), '\s$', '', 'g')
"   else
"     return ''
"   endif
" endfunction

" function! FindBranch(path)
"   let x = systemlist('cd '..a:path..'; git branch --show-current')
"   if len(x)>0 && exists('w:git') && w:git!=-1
"     let w:gitBranch = x[0]
"   else
"     let w:gitBranch = -1
"   endif
"   " echo w:gitBranch
"   return w:gitBranch
" endfunction

" function! FindRemote(path)
"   if !exists("w:gitRemote_index")
"     let w:gitRemote_index=0
"   endif
"   let x=GitGetAllRemote()
"   if len(x)>0 && exists('w:git') && w:git!=-1
"     let w:gitRemote = x[w:gitRemote_index]
"   else
"     let w:gitRemote = -1
"   endif
"     " echo w:gitRemote
"   return w:gitRemote
" endfunction

" function! FindRemoteUrl(path)
"   " if !exists('w:gitRemoteUrl')
"   "   let w:gitRemoteUrl=""
"   " endif
"   " let list=systemlist("cd "..a:path.."; git remote -v")
"   " let list=filter(list, 'v:val=~"^'..w:gitRemote..'.*(push)"')
"   let list=systemlist("cd "..a:path.."; git remote -v | grep \"^"..w:gitRemote.."\" | awk '{print $2}'" )
"   " let list=filter(list, 'v:val=~"^'..w:gitRemote..'.(fetch)"')
"   if len(list)>0
"     let w:gitRemoteUrl = list[0]
"     return w:gitRemoteUrl
"   else
"     return ''
"   endif
"   " echo w:gitRemote
" endfunction

" Git Integration

function! GetBranch()
  if exists("w:gitBranch")
    return w:gitBranch
  endif
  return -1
endfunction

" function! GitGetAllRemote()
"   " let x = systemlist('git remote -v')
"   let x=systemlist("git remote -v|awk '{print $1}'")
"   let z=[]
"   for y in x
"     if index(z,y)==-1
"       call add(z,y)
"     endif
"   endfor
"   " for y in z
"   "   echo y
"   " endfor
"   return z
" endfunction

function! GitInfo(...)
  " [Was a series of :echo lines -- more than a screen of them, so Vim
  "  asked to press Enter and then had to repaint. Now the git popup.]
  let stash = len(a:000) > 0 && a:000[0] ==# '--stash'
  let git = 'git --no-pager '
  let lines = [get(w:, 'git', ''), '']
  let lines += ['Remotes:'] + systemlist(git . 'remote -v') + ['']
  let lines += ['Local Branches:'] + systemlist(git . 'branch --list') + ['']
  let lines += ['Remote Branches:'] + systemlist(git . 'branch -r') + ['']
  let lines += ['Modified Files:'] + systemlist(git . 'diff --name-only') + ['']
  let lines += ['Git Log:'] + systemlist(git . 'log --oneline -n 4') + ['']
  let stashes = systemlist(git . 'stash list')
  let lines += ['Stashes:'] + stashes
  if stash
    for x in stashes
      let lines += ['', '--- ' . x] + systemlist(git . 'stash show -p ' . shellescape(substitute(x, ':.*$', '', '')))
    endfor
  endif
  if exists('*GitPopup')
    call GitPopup('git info', lines, 0, stash ? 'diff' : 'git')
  else
    echo join(lines, "\n")
  endif
endfunction

function! SelectBranch(int)
  " echo w:gitBranch_index
  " var 1
  " let w:gitBranch=w:gitBranchList[w:gitBranch_index]
  " var 2
  let cwd=CWD()
  call UpdateGit()
  let target=w:gitBranchList[Mod(w:gitBranch_index+a:int, len(w:gitBranchList))]
  call GitSwitch(target)
  call UpdateGit()
  let w:gitBranch=FindBranch(cwd)
  "endvar
  call Statusline()
  " call DebugCommand(w:gitBranchList)
endfunction

function! SelectRemote(int)
  let w:gitRemote_index=Mod(w:gitRemote_index+a:int, len(w:gitRemoteList))
  if len(w:gitRemoteList)>0
    let w:gitRemote=w:gitRemoteList[w:gitRemote_index]
  endif
  " windo "call Statusline()"
  call Statusline()
  call DebugCommand(w:gitRemoteList)
endfunction

function! IsGithubPush()
  let list=systemlist('git remote -v')
  let list=filter(list, 'v:val=~"^'..w:gitRemote..'.*github.com.*(push)"')
  return len(list)>0
endfunction

function! GetRemote()
  if exists("w:gitRemote")
    return w:gitRemote
  endif
  return -1
endfunction

function! GitToggleBranch()
  let x=systemlist("git branch --list | awk {'print $2? $2 : $1'}")
  return x
endfunction

function! GitToggleRemote()
  " let x=systemlist("git branch --list | awk {'print $2? $2 : $1'}")
  " return x
  return []
endfunction

" function! UpdateGit_OnSave()
"   if exists("w:cwd")
"     let w:gitDiff=FindDiff(w:cwd)
"   endif
"   call Statusline()
" endfunction

function! GitName()
  let b=split(w:git, "/")
  return b[-1]
endfunction

function! GitDiff_Text()
  let b=w:gitDiff
  return b
endfunction

function! GitBranch()
  let b=split(w:gitBranch, "/")
  return b[-1]
endfunction

function! GitRemote()
  let b=split(w:gitRemote, "/")
  return b[-1]
endfunction

function! GitName_Statusline()
  if exists('w:git')
    if w:git==-1
      return ''
    endif
    return ' '..GitName()
  else
    return ''
  endif
endfunction

function! GitName_Statusline_short()
  if exists('w:git')
    if w:git==-1
      return ''
    endif
    return ' '..GitName()[0:5]..'…'
  else
    return ''
  endif
endfunction

function! GitDiff_Statusline()
  if exists('w:gitDiff')
    return GitDiff_Text()
  else
    return ''
  endif
endfunction

function! GitBranch_Statusline()
  if exists('w:gitBranch')
    if w:gitBranch==-1
      return ''
    endif
    " ▶
    " ⇒
    " →
    " ♣
    " №
    return ""..GitBranch()..'♣'
  else
    return ''
  endif
endfunction

function! GitBranch_Statusline_short()
  if exists('w:gitBranch')
    if w:gitBranch==-1
      return ''
    endif
    return ('  '..GitBranch()[0:2]..'…')
  else
    return ''
  endif
endfunction

function! GitRemote_Statusline(num=-1)
  let num=a:num
  let post=""
  if num>-1
  let post="…"
  endif
  if exists('w:gitRemote')
    if w:gitRemote==-1
      return ''
    endif
    " r-->remote
    " return ('  {r:'..GitRemote()..'}')[:num]..post..' '
    return ('  '..GitRemote())[:num]..post..' '
  else
    return ''
  endif
endfunction

function! GitPushTo_Statusline(num=-1)
  " p-->push_to
  return (' ▲'.."{p:remote_branches}"..' ')
endfunction

function! GitRemote_Statusline_short()
  if exists('w:gitRemote')
    if w:gitRemote==-1
      return ''
    endif
    return '  '..GitRemote()[0:2]..'…'
  else
    return ''
  endif
endfunction

" function! UpdateGit()
"   " signature todo
"   let cwd=CWD()
"   let w:git=FindGit(cwd)
"   let w:gitBranch=FindBranch(cwd)
"   let w:gitBranchList=AllBranches(cwd)
"   let w:gitBranch_index=index(w:gitBranchList,w:gitBranch)
"   let w:gitRemote=FindRemote(cwd)
"   let w:gitRemoteUrl=FindRemoteUrl(cwd)
"   let w:gitRemoteList=GitGetAllRemote()
"   call UpdateGit_OnSave()
" endfunction

" function! MakeDirCurrentCWD(bufnr)
"   " signature todo
"   if !exists('g:temporaryfix')
"   " echo expand("%:p:h")
"   " if win_gettype() != 'popup'
"   " echo a:bufnr
"   " echo ThisIsFZF(a:bufnr)
"   " if getbufvar(a:bufnr, '&filetype')!=#'fzf'
"     " echo a:bufnr
"   " && !IsPopup(win_getid())
"     let [n, y, x, n, n]=getcurpos()
"     " let w:cwd=expand("%:p:h")
"     " let w:pointer=expand('%')
"     let p1=expand("%:p:h")
"     let p2=expand('%:p')
"     if isdirectory(p1)
"       call CD(p1)
"     else
"       echo "Dir does not exist" p1
"     endif
"     if filereadable(p2)
"       call SetPointer(p2)
"     endif
"     " call SetProject(expand("%:p:h"))
"     call cursor(y, x)
"   endif
" endfunction

" function! CWD()
"   " if !IsPopup(win_getid())
"   " if !ThisIsFZF(bufnr())
"   if !exists("w:cwd")
"     " let w:cwd=expand('%:p:h')
"     " call SetPointer('%:p')
"     call MakeDirCurrentCWD(bufnr())
"     " redir=>w:cwd | pwd | redir END
"     " let w:cwd=substitute(w:cwd, '\n', "", 'g')
"   endif
"   " endif
"   if exists('w:cwd')
"     return w:cwd
"   else
"     return ''
"   endif
" endfunction

" function! ProjectPath(bufnr=-1)
"   " let cwd=expand("%:p:h")
"   if a:bufnr==-1
"     " let cwd=CWD()
"     let nr=bufnr('%')
"   else
"     let nr=a:bufnr
"     " let cwd=getwinvar(bufwinnr(a:bufnr), "cwd")
"   endif
"   let wincwd=fnamemodify(expand(bufname(nr)), "%:p:h")
"   if empty(wincwd)
"     return "/"
"   endif
"   let finish=0
"   let paths=[]
"   while 1
"     let isgit=globpath(wincwd, '.git')
"     let isproject=index(g:projects, wincwd)
"     if !empty(isgit) || isproject>-1
"       return wincwd
"     endif
"     if wincwd=='/'
"       break
"     endif
"     let wincwd=GetParentDir(wincwd)
"   endwhile
"   return -1
"   " let file = -1
"   " let c=a:count+a:nr
"   " let i = 0
"   " let file = w:git
"   " while i < c
"   "   if i==0
"   "     let x = FindGit(file)
"   "   else
"   "     let x = FindGit(GetParentDir(file))
"   "   endif
"   "   if x=='0' || x==-1 || x==0
"   "     let file=GetParentDir(file)
"   "   else
"   "     let file=x
"   "   endif
"   "   let i += 1
"   " endwhile
"   " " if c==0
"   " "   let file=w:git
"   " " elseif c==1
"   " "   let file=FindGit(GetParentDir(w:git))
"   " " elseif c==2
"   " "   let file=FindGit(GetParentDir(FindGit(GetParentDir(w:git))))
"   " " endif
"   " if file == -1
"   "   " getcwd is not userfriendly
"   "   " consider throwing a message
"   "   " let file=getcwd()
"   "   " echo "No higher Repo"
"   "   return
"   " endif
"   " return file
" endfunction

" function! ProjectOrGitPath()
"   let cwd=CWD()
"   let finish=0
"   let paths=[]
"   while 1
"     let isgit=globpath(cwd, '.git')
"     let isproject=index(g:projects, cwd)
"     if !empty(isgit) || isproject>-1
"       return cwd
"     endif
"     if cwd=='/'
"       break
"     endif
"     let cwd=GetParentDir(cwd)
"   endwhile
"   return -1
"   " let file = -1
"   " let c=a:count+a:nr
"   " let i = 0
"   " let file = w:git
"   " while i < c
"   "   if i==0
"   "     let x = FindGit(file)
"   "   else
"   "     let x = FindGit(GetParentDir(file))
"   "   endif
"   "   if x=='0' || x==-1 || x==0
"   "     let file=GetParentDir(file)
"   "   else
"   "     let file=x
"   "   endif
"   "   let i += 1
"   " endwhile
"   " " if c==0
"   " "   let file=w:git
"   " " elseif c==1
"   " "   let file=FindGit(GetParentDir(w:git))
"   " " elseif c==2
"   " "   let file=FindGit(GetParentDir(FindGit(GetParentDir(w:git))))
"   " " endif
"   " if file == -1
"   "   " getcwd is not userfriendly
"   "   " consider throwing a message
"   "   " let file=getcwd()
"   "   " echo "No higher Repo"
"   "   return
"   " endif
"   " return file
" endfunction

function! Folder(cwd, count)
  let cwd=a:cwd
  let finish=0
  let paths=[]
  let x=0
  while x<a:count
    if cwd=='/'
      break
    endif
    let x+=1
    let cwd=GetParentDir(cwd)
  endwhile
  return cwd
endfunction

" function! Folder_Repo_Or_Project(count, nr)
"   call Refresh('projects', 'GetProjects()')
"   let cwd=CWD()
"   let finish=0
"   let paths=[]
"   let x=a:count+a:nr
"   " echo x
"   let y=0
"   let scwd=cwd
"   let z=0
"   while 1
"     let isgit=globpath(cwd, '.git')
"     let isproject=index(g:projects, cwd)
"     if !empty(isgit) || isproject>-1
"       " this is a project or repo
"       echo "Is Git Project " .. x .. " " .. y
"       let scwd=cwd
"       if x==y
"         return cwd
"       endif
"       let y+=1
"     endif
"     if cwd=='/'
"       break
"     endif
"     let cwd=GetParentDir(cwd)
"     let z+=1
"   endwhile
"   " Folder_Up(cwd)
"   " return '/'
"   " return -1
"   " todo return Folder
"   " call input(Folder(scwd, x-y+1).." "..string(x-y+1))
"   " echo Folder(scwd, x-y+1)
"   return Folder(scwd, x-y+1)
" endfunction

" function! Folder_Repo_Or_Project_notright(count, nr)
"   let cwd=CWD()
"   let finish=0
"   let paths=[]
"   while 1
"     let isgit=globpath(cwd, '.git')
"     let isproject=index(g:projects, cwd)
"     if !empty(isgit) || isproject>-1
"       return cwd
"     endif
"     if cwd=='/'
"       break
"     endif
"     let cwd=GetParentDir(cwd)
"   endwhile
"   return -1
"   " Folder_Up(cwd)
"   " return '/'
"   return Folder(cwd, a:nr)
" endfunction

function! PathShortForm_when_small(path, num, sign="…")
    let buf_height = winheight(winnr())
    let buf_width = winwidth(winnr())
    if buf_width<=136
      return PathShortForm(a:path, a:num, a:sign)
    else
      return a:path
    endif
endfunction

function! PathShortForm(path, num, sign="…")
  let folders=split(a:path, '/')
  let out=""
  let num=a:num
  for f in folders
    let out.="/"..f[ 0 : num]..a:sign
  endfor
  return out
endfunction

" TODO Also Consider g:projects to check agains if its a "repo" not only .git
" containing folders
function! Folder_Repo(count, nr)
  let file = -1
  let c=a:count+a:nr
  let i = 0
  if exists('w:git')
    let file = w:git
  else
    " echo "fix CD"
  endif
  while i < c
    if i==0
      let x = FindGit(file)
    else
      let x = FindGit(GetParentDir(file))
    endif
    if x=='0' || x==-1 || x==0
      let file=GetParentDir(file)
    else
      let file=x
    endif
    let i += 1
  endwhile
  " if c==0
  "   let file=w:git
  " elseif c==1
  "   let file=FindGit(GetParentDir(w:git))
  " elseif c==2
  "   let file=FindGit(GetParentDir(FindGit(GetParentDir(w:git))))
  " endif
  if file == -1
    " getcwd is not userfriendly
    " consider throwing a message
    " let file=getcwd()
    " echo "No higher Repo"
    return
  endif
  return file
endfunction

function! Folder_System()
  return g:system_folders
endfunction

" function! s:disable_statusline(bn)
"   if a:bn == bufname('%')
"     set laststatus=1
"   else
"     set laststatus=2
"   endif
"   set laststatus=0
" endfunction
" au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * call s:disable_statusline('Information')
"
"
"

"FIX!!!
function! CD(path)
  let dir = isdirectory(a:path) ? a:path : GetParentDir(a:path)
  if !isdirectory(dir)
    return
  endif
  let dir = substitute(fnamemodify(dir, ':p'), '.\zs/\+$', '', '')
  if getcwd() !=# dir
    " fnameescape: paths with spaces work now
    call execute(get(g:, 'cd_command', 'cd')..' '..fnameescape(dir))
  endif
  let w:cwd=getcwd()
  " cheap, cached variant - CD() runs on every buffer/window switch.
  " Explicit git commands (branch/remote switching) still call the full
  " UpdateGit() themselves.
  call UpdateGitFast()
  let $folderrepo=Folder_Repo(0, 0)
endfunction

function! CWD()
  " NO side effects: called by the statusline and WinLeave
  if exists('w:cwd')
    return w:cwd
  endif
  return getcwd()
endfunction

function! MakeDirCurrentCWD(bufnr)
  if !exists('g:temporaryfix')
    let p1=expand("%:p:h")
    let p2=expand('%:p')
    " Runs for BufNew, BufAdd, BufReadPost, BufFilePost AND via the BufEnter
    " timer - several times for a single file. Nothing to do when the window
    " is already in this directory on this file.
    if get(w:, 'cwd', '') ==# p1 && getcwd() ==# p1 && get(w:, 'pointer', '') ==# p2
      return
    endif
    let [n, y, x, n, n]=getcurpos()
    if isdirectory(p1)
      call CD(p1)
    endif
    if filereadable(p2)
      call SetPointer(p2)
    endif
    call cursor(y, x)
  endif
endfunction

" Deferred from BufEnter via timer, so FZF's sink and its own cd/restore finish first
function! SyncCwdToBuffer(winid, bufnr, ...)
  if win_getid() != a:winid || bufnr('%') != a:bufnr
    return
  endif
  if &buftype !=# '' || win_gettype() !=# ''
    return
  endif
  let file = expand('%:p')
  if file ==# ''
    return
  endif
  let dir = fnamemodify(file, ':h')
  if !isdirectory(dir)
    return
  endif
  " nothing changed -> no :cd, no git work
  if get(w:, 'cwd', '') ==# dir && getcwd() ==# dir && get(w:, 'pointer', '') ==# file
    return
  endif
  call MakeDirCurrentCWD(a:bufnr)
endfunction

function! ProjectPath(bufnr=-1)
  let nr = a:bufnr == -1 ? bufnr('%') : a:bufnr
  let name = bufname(nr)
  if getbufvar(nr, '&buftype') ==# ''
    if name ==# ''
      return "/"
    endif
    let start = fnamemodify(name, ':p:h')   " was "%:p:h" + expand()
  else
    let start = getcwd(bufwinnr(nr))        " terminal / fzf buffers
  endif
  let cache = getbufvar(nr, 'project_path_cache', {})
  let gen = s:project_gen..'.'..s:SyncProjectsSet()
  if get(cache, 'start', '') ==# start && get(cache, 'gen', '') ==# gen
    return cache.root
  endif
  let root = FindProjectRoot(start)
  call setbufvar(nr, 'project_path_cache', {'start': start, 'root': root, 'gen': gen})
  return root
endfunction

let s:project_gen = get(s:, 'project_gen', 0)
function! ProjectPathCacheClear()
  let s:project_gen += 1
endfunction

function! ProjectOrGitPath()
  return FindProjectRoot(CWD())
endfunction

function! Folder_Repo_Or_Project_notright(count, nr)
  return FindProjectRoot(CWD())
endfunction

function! Folder_Repo_Or_Project(count, nr)
  " no more recursive refresh on every <C-p>; use :UpdateProjects
  if !exists('g:projects')
    call Refresh('projects', 'GetProjects()')
  endif
  let cwd=CWD()
  let x=a:count+a:nr
  let y=0
  let scwd=cwd
  while 1
    if IsGitDir(cwd) || IsProjectDir(cwd)
      let scwd=cwd
      if x==y
        return cwd
      endif
      let y+=1
    endif
    let parent=GetParentDir(cwd)
    if parent ==# cwd
      break
    endif
    let cwd=parent
  endwhile
  return Folder(scwd, x-y+1)
endfunction

" ---------------- git without spawning processes ----------------
function! UpdateGit()
  call ProjectPathCacheClear()
  let cwd=CWD()
  let w:git=FindGit(cwd)
  let s:git_root_cache[cwd] = w:git
  let info=GitRepoInfo(w:git)
  if type(w:git) == v:t_string
    let s:git_info_cache[w:git] = {'key': s:GitInfoKey(w:git), 'info': info}
  endif
  let w:gitBranch=info.branch
  let w:gitBranchList=info.branches
  let w:gitBranch_index=index(w:gitBranchList, w:gitBranch)
  if !exists("w:gitRemote_index")
    let w:gitRemote_index=0
  endif
  let w:gitRemoteList=info.remotes
  if len(info.remotes)>0
    let w:gitRemote=info.remotes[w:gitRemote_index < len(info.remotes) ? w:gitRemote_index : 0]
  else
    let w:gitRemote=-1
  endif
  let w:gitRemoteUrl=get(info.urls, w:gitRemote, '')
  call UpdateGit_OnSave()
endfunction

let s:git_root_cache = get(s:, 'git_root_cache', {})
let s:git_info_cache = get(s:, 'git_info_cache', {})
let s:git_diff_time = get(s:, 'git_diff_time', {})

" Minimum seconds between two background 'git diff --stat' runs for the same
" repository when just switching buffers/windows (saving always refreshes).
if !exists('g:git_diff_min_interval')
  let g:git_diff_min_interval = 5
endif
" Skip submodules in 'git diff --stat': with large submodules that command
" is by far the most expensive part of keeping the statusline up to date.
if !exists('g:git_diff_ignore_submodules')
  let g:git_diff_ignore_submodules = 1
endif

" Cheap fingerprint of everything GitRepoInfo() reads: file times only.
function! s:GitInfoKey(root)
  let [gitdir, common] = GitDirs(a:root)
  if gitdir ==# ''
    return ''
  endif
  return join([getftime(gitdir..'/HEAD'), getftime(common..'/packed-refs'),
        \ getftime(common..'/refs/heads'), getftime(common..'/config')], ',')
endfunction

" Same result as UpdateGit(), for the hot path (every buffer/window switch):
" the repository root is cached per directory, the branch/remote info is
" only re-read when .git/HEAD, refs or config changed, 'git diff --stat' is
" throttled, and only this window's statusline is redrawn - and only when
" something it shows actually changed.
function! UpdateGitFast()
  let cwd = CWD()
  if has_key(s:git_root_cache, cwd)
    let root = s:git_root_cache[cwd]
    if type(root) == v:t_string && !IsGitDir(root)
      let root = FindGit(cwd)
      let s:git_root_cache[cwd] = root
    endif
  else
    let root = FindGit(cwd)
    let s:git_root_cache[cwd] = root
  endif
  let before = [get(w:, 'git', ''), get(w:, 'gitBranch', ''), get(w:, 'gitDiff', '')]
  let w:git = root
  if type(root) == v:t_string
    let key = s:GitInfoKey(root)
    let cached = get(s:git_info_cache, root, {})
    if get(cached, 'key', '') !=# key
      let cached = {'key': key, 'info': GitRepoInfo(root)}
      let s:git_info_cache[root] = cached
    endif
    let info = cached.info
  else
    let info = GitRepoInfo(root)
  endif
  let w:gitBranch=info.branch
  let w:gitBranchList=info.branches
  let w:gitBranch_index=index(w:gitBranchList, w:gitBranch)
  if !exists("w:gitRemote_index")
    let w:gitRemote_index=0
  endif
  let w:gitRemoteList=info.remotes
  if len(info.remotes)>0
    let w:gitRemote=info.remotes[w:gitRemote_index < len(info.remotes) ? w:gitRemote_index : 0]
  else
    let w:gitRemote=-1
  endif
  let w:gitRemoteUrl=get(info.urls, w:gitRemote, '')
  if type(root) == v:t_string
    let w:gitDiff = get(s:git_diff_cache, root, get(w:, 'gitDiff', ''))
    if localtime() - get(s:git_diff_time, root, 0) >= g:git_diff_min_interval
      call GitDiffAsync(root)
    endif
  else
    let w:gitDiff = ''
  endif
  if [get(w:, 'git', ''), get(w:, 'gitBranch', ''), get(w:, 'gitDiff', '')] !=# before
    redrawstatus
  endif
endfunction

function! UpdateGit_OnSave()
  if exists('w:git') && type(w:git) == v:t_string
    let w:gitDiff = get(s:git_diff_cache, w:git, get(w:, 'gitDiff', ''))
    call GitDiffAsync(w:git)
  else
    let w:gitDiff = ''
  endif
  redrawstatus!   " instead of Statusline() (which re-ran :hi)
endfunction

function! FindBranch(path)
  let w:gitBranch = GitRepoInfo(FindGit(a:path)).branch
  return w:gitBranch
endfunction

function! AllBranches(path)
  let w:gitBranchList = GitRepoInfo(FindGit(a:path)).branches
  return w:gitBranchList
endfunction

function! GitGetAllRemote()
  return GitRepoInfo(FindGit(CWD())).remotes
endfunction

function! FindRemote(path)
  if !exists("w:gitRemote_index")
    let w:gitRemote_index=0
  endif
  let x=GitRepoInfo(FindGit(a:path)).remotes
  let w:gitRemote = len(x)>0 ? x[w:gitRemote_index < len(x) ? w:gitRemote_index : 0] : -1
  return w:gitRemote
endfunction

function! FindRemoteUrl(path)
  let urls=GitRepoInfo(FindGit(a:path)).urls
  if exists('w:gitRemote') && has_key(urls, w:gitRemote)
    let w:gitRemoteUrl = urls[w:gitRemote]
    return w:gitRemoteUrl
  endif
  return ''
endfunction

function! FindDiff(path)
  let s:git_diff_time[a:path] = localtime()
  return GitDiffSummary(systemlist('git -C '..shellescape(a:path)..' diff --stat'
        \ ..(g:git_diff_ignore_submodules ? ' --ignore-submodules' : '')..' 2>&1'))
endfunction

function! GitDiffSummary(lines)
  if len(a:lines)>1
    return ' '..substitute(substitute(substitute(substitute(substitute(substitute(substitute(a:lines[-1], '[^0-9+-]', ' ', 'g'), '-\{2,\}', '', 'g'), '+\{2,\}', '', 'g'), '\s\{2,\}', ' ', 'g'), '\s+', '+', ''), '\s-', '-', 'g'), '\s$', '', 'g')
  endif
  return ''
endfunction

let s:git_diff_cache = get(s:, 'git_diff_cache', {})
let s:git_diff_jobs = get(s:, 'git_diff_jobs', {})

" [gitdir, commondir]; handles worktrees/submodules (.git is a file)
function! GitDirs(root)
  let dotgit = (a:root ==# '/' ? '' : a:root)..'/.git'
  let gitdir = ''
  if isdirectory(dotgit)
    let gitdir = dotgit
  elseif filereadable(dotgit)
    let gitdir = matchstr(get(readfile(dotgit, '', 1), 0, ''), '^gitdir:\s*\zs.*')
    if gitdir !=# '' && gitdir !~# '^/'
      let gitdir = a:root..'/'..gitdir
    endif
  endif
  if gitdir ==# '' || !isdirectory(gitdir)
    return ['', '']
  endif
  let common = gitdir
  if filereadable(gitdir..'/commondir')
    let common = get(readfile(gitdir..'/commondir', '', 1), 0, '')
    if common !~# '^/'
      let common = gitdir..'/'..common
    endif
  endif
  return [gitdir, common]
endfunction

function! GitRepoInfo(root)
  let info = {'branch': -1, 'branches': [], 'remotes': [], 'urls': {}}
  if type(a:root) != v:t_string || a:root ==# ''
    return info
  endif
  let [gitdir, common] = GitDirs(a:root)
  if gitdir ==# ''
    return info
  endif
  if filereadable(gitdir..'/HEAD')
    let head = get(readfile(gitdir..'/HEAD', '', 1), 0, '')
    let branch = matchstr(head, '^ref:\s*refs/heads/\zs.*')
    let info.branch = branch ==# '' ? -1 : branch
  endif
  let branches = {}
  let heads = common..'/refs/heads'
  for f in globpath(heads, '**', 1, 1)
    if filereadable(f)
      let branches[strpart(f, len(heads) + 1)] = 1
    endif
  endfor
  if filereadable(common..'/packed-refs')
    for line in readfile(common..'/packed-refs')
      let b = matchstr(line, '^\x\+ refs/heads/\zs.*')
      if b !=# ''
        let branches[b] = 1
      endif
    endfor
  endif
  let info.branches = sort(keys(branches))
  if filereadable(common..'/config')
    let remote = ''
    for line in readfile(common..'/config')
      if line =~# '^\s*\['
        let remote = matchstr(line, '^\s*\[remote\s\+"\zs[^"]\+\ze"\]')
        if remote !=# '' && index(info.remotes, remote) == -1
          call add(info.remotes, remote)
        endif
      elseif remote !=# '' && !has_key(info.urls, remote)
        let url = matchstr(line, '^\s*url\s*=\s*\zs.\{-}\ze\s*$')
        if url !=# ''
          let info.urls[remote] = url
        endif
      endif
    endfor
  endif
  call sort(info.remotes)   " git remote sorts by name
  return info
endfunction

function! GitDiffAsync(root)
  if type(a:root) != v:t_string || a:root ==# ''
    return
  endif
  if !exists('*job_start')
    let s:git_diff_cache[a:root] = FindDiff(a:root)
    return s:GitDiffApply(a:root)
  endif
  let running = get(s:git_diff_jobs, a:root, {})
  if !empty(running) && job_status(running.job) ==# 'run'
    let running.again = 1
    return
  endif
  let s:git_diff_time[a:root] = localtime()
  let ctx = {'root': a:root, 'lines': [], 'again': 0}
  let args = ['git', '-C', a:root, 'diff', '--stat']
  if g:git_diff_ignore_submodules
    call add(args, '--ignore-submodules')
  endif
  let ctx.job = job_start(args, {
        \ 'in_io': 'null', 'err_io': 'null',
        \ 'out_cb': function('s:GitDiffOut', [ctx]),
        \ 'close_cb': function('s:GitDiffDone', [ctx])})
  let s:git_diff_jobs[a:root] = ctx
endfunction

function! s:GitDiffOut(ctx, channel, msg)
  call add(a:ctx.lines, a:msg)
endfunction

function! s:GitDiffDone(ctx, channel)
  let s:git_diff_cache[a:ctx.root] = GitDiffSummary(a:ctx.lines)
  call s:GitDiffApply(a:ctx.root)
  if a:ctx.again
    call remove(s:git_diff_jobs, a:ctx.root)
    call GitDiffAsync(a:ctx.root)
  endif
endfunction

function! s:GitDiffApply(root)
  let changed = 0
  for win in getwininfo()
    let wgit = get(win.variables, 'git', -1)
    if type(wgit) == v:t_string && wgit ==# a:root
          \ && get(win.variables, 'gitDiff', '') !=# s:git_diff_cache[a:root]
      " settabwinvar: getwininfo() also lists windows of other tab pages
      call settabwinvar(win.tabnr, win.winnr, 'gitDiff', s:git_diff_cache[a:root])
      let changed = 1
    endif
  endfor
  if changed
    redrawstatus!
  endif
endfunction

" ---------------- project helpers (always terminate) ----------------
function! IsGitDir(dir)
  let dotgit = (a:dir ==# '/' ? '' : a:dir)..'/.git'
  return isdirectory(dotgit) || filereadable(dotgit)
endfunction

function! IsProjectDir(dir)
  call s:SyncProjectsSet()
  return has_key(s:projects_set, a:dir)
endfunction

let s:projects_gen = get(s:, 'projects_gen', 0)
let s:projects_set = get(s:, 'projects_set', {})
function! s:SyncProjectsSet()
  let projects = exists('g:projects') && type(g:projects) == v:t_list ? g:projects : []
  if !exists('s:projects_ref') || s:projects_ref isnot projects || s:projects_len != len(projects)
    let s:projects_ref = projects
    let s:projects_len = len(projects)
    let s:projects_gen += 1
    let s:projects_set = {}
    for p in projects
      if type(p) == v:t_string && p !=# ''
        let s:projects_set[p] = 1
      endif
    endfor
  endif
  return s:projects_gen
endfunction

function! FindProjectRoot(dir)
  let dir = a:dir
  while 1
    if IsGitDir(dir) || IsProjectDir(dir)
      return dir
    endif
    let parent = fnamemodify(dir, ':h')
    if parent ==# dir
      return -1
    endif
    let dir = parent
  endwhile
endfunction
