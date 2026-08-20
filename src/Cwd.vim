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

function! CD(path)
  if isdirectory(a:path)
    call execute("cd ".a:path)
    " execute "cd ".a:path
  else
    call execute("cd ".GetParentDir(a:path))
    " execute "cd ".GetParentDir(a:path)
  endif
  let w:cwd=getcwd()
  " Optimize (One Thread, gather All Information In Vim)
  call UpdateGit()
  if exists('w:git')
    if w:git!=-1
    endif
  endif
  " echo "Not A Directory"
  let $folderrepo=Folder_Repo(0, 0)
endfunction

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

function! AllBranches(path)
  " let x = systemlist('cd '..a:path..'; git branch')
  let x=systemlist("cd "..a:path.."; git branch --list | awk {'print $2? $2 : $1'}")
  let w:gitBranchList = x
  return w:gitBranchList
endfunction

function! FindDiff(path)
  let x = systemlist('cd '..a:path..'; git diff --stat 2>&1')
  if len(x)>1
    return ' '..substitute(substitute(substitute(substitute(substitute(substitute(substitute(x[-1], '[^0-9+-]', ' ', 'g'), '-\{2,\}', '', 'g'), '+\{2,\}', '', 'g'), '\s\{2,\}', ' ', 'g'), '\s+', '+', ''), '\s-', '-', 'g'), '\s$', '', 'g')
  else
    return ''
  endif
endfunction

function! FindBranch(path)
  let x = systemlist('cd '..a:path..'; git branch --show-current')
  if len(x)>0 && exists('w:git') && w:git!=-1
    let w:gitBranch = x[0]
  else
    let w:gitBranch = -1
  endif
  " echo w:gitBranch
  return w:gitBranch
endfunction

function! FindRemote(path)
  if !exists("w:gitRemote_index")
    let w:gitRemote_index=0
  endif
  let x=GitGetAllRemote()
  if len(x)>0 && exists('w:git') && w:git!=-1
    let w:gitRemote = x[w:gitRemote_index]
  else
    let w:gitRemote = -1
  endif
    " echo w:gitRemote
  return w:gitRemote
endfunction

function! FindRemoteUrl(path)
  " if !exists('w:gitRemoteUrl')
  "   let w:gitRemoteUrl=""
  " endif
  " let list=systemlist("cd "..a:path.."; git remote -v")
  " let list=filter(list, 'v:val=~"^'..w:gitRemote..'.*(push)"')
  let list=systemlist("cd "..a:path.."; git remote -v | grep \"^"..w:gitRemote.."\" | awk '{print $2}'" )
  " let list=filter(list, 'v:val=~"^'..w:gitRemote..'.(fetch)"')
  if len(list)>0
    let w:gitRemoteUrl = list[0]
    return w:gitRemoteUrl
  else
    return ''
  endif
  " echo w:gitRemote
endfunction

" Git Integration

function! GetBranch()
  if exists("w:gitBranch")
    return w:gitBranch
  endif
  return -1
endfunction

function! GitGetAllRemote()
  " let x = systemlist('git remote -v')
  let x=systemlist("git remote -v|awk '{print $1}'")
  let z=[]
  for y in x
    if index(z,y)==-1
      call add(z,y)
    endif
  endfor
  " for y in z
  "   echo y
  " endfor
  return z
endfunction

function! GitInfo(...)
  " Use GetOpts
  let stash=0
  if len(a:000) > 0 && a:000[0]=="--stash"
    let stash=1
  endif
  echo w:git
  echo "\n"
  " echo w:gitRemoteList
  echo "Remotes:"
  for x in systemlist('git remote -v')
    echo x
  endfor
  " echo w:gitBranchList
  echo "\n"
  echo "Local Branches:"
  for x in systemlist('git branch --list')
    echo x
  endfor
  echo "\n"
  echo "Remote Branches:"
  for x in systemlist('git branch -r')
    echo x
  endfor
  echo "\n"
  echo "Modified Files:"
  call DebugCommand(systemlist('git diff --name-only'))
  echo "\n"
  echo "Git Log:"
  call DebugCommand(systemlist("git log --oneline | head -n 4"), "\n")
  echo "\n"
  echo "Stashes:"
  let stashes=systemlist("git stash list")
  call DebugCommand(stashes, "\n")
  if stash
    for x in stashes
      let s=substitute(x, ":.*$", "", "")
      let diff=systemlist("git stash show -p "..s)
      for x in diff
        echo x
      endfor
    endfor
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

function! UpdateGit_OnSave()
  if exists("w:cwd")
    let w:gitDiff=FindDiff(w:cwd)
  endif
  call Statusline()
endfunction

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
    return ""..GitBranch()..'▶'
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
    return ('  {remote:'..GitRemote()..'}')[:num]..post..' '
  else
    return ''
  endif
endfunction

function! GitPushTo_Statusline(num=-1)
  return (' ▲'.."{push_to:remote_branches}"..' ')
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

function! UpdateGit()
  " signature todo
  let cwd=CWD()
  let w:git=FindGit(cwd)
  let w:gitBranch=FindBranch(cwd)
  let w:gitBranchList=AllBranches(cwd)
  let w:gitBranch_index=index(w:gitBranchList,w:gitBranch)
  let w:gitRemote=FindRemote(cwd)
  let w:gitRemoteUrl=FindRemoteUrl(cwd)
  let w:gitRemoteList=GitGetAllRemote()
  call UpdateGit_OnSave()
endfunction

function! MakeDirCurrentCWD(bufnr)
  " signature todo
  if !exists('g:temporaryfix')
  " echo expand("%:p:h")
  " if win_gettype() != 'popup'
  " echo a:bufnr
  " echo ThisIsFZF(a:bufnr)
  " if getbufvar(a:bufnr, '&filetype')!=#'fzf'
    " echo a:bufnr
  " && !IsPopup(win_getid())
    let [n, y, x, n, n]=getcurpos()
    " let w:cwd=expand("%:p:h")
    " let w:pointer=expand('%')
    let p1=expand("%:p:h")
    let p2=expand('%:p')
    if isdirectory(p1)
      call CD(p1)
    else
      echo "Dir does not exist" p1
    endif
    if filereadable(p2)
      call SetPointer(p2)
    endif
    " call SetProject(expand("%:p:h"))
    call cursor(y, x)
  endif
endfunction

function! CWD()
  " if !IsPopup(win_getid())
  " if !ThisIsFZF(bufnr())
  if !exists("w:cwd")
    " let w:cwd=expand('%:p:h')
    " call SetPointer('%:p')
    call MakeDirCurrentCWD(bufnr())
    " redir=>w:cwd | pwd | redir END
    " let w:cwd=substitute(w:cwd, '\n', "", 'g')
  endif
  " endif
  if exists('w:cwd')
    return w:cwd
  else
    return ''
  endif
endfunction

function! ProjectPath()
  let cwd=CWD()
  " let cwd=expand("%:p:h")
  let finish=0
  let paths=[]
  while 1
    let isgit=globpath(cwd, '.git')
    let isproject=index(g:projects, cwd)
    if !empty(isgit) || isproject>-1
      return cwd
    endif
    if cwd=='/'
      break
    endif
    let cwd=GetParentDir(cwd)
  endwhile
  return -1
  " let file = -1
  " let c=a:count+a:nr
  " let i = 0
  " let file = w:git
  " while i < c
  "   if i==0
  "     let x = FindGit(file)
  "   else
  "     let x = FindGit(GetParentDir(file))
  "   endif
  "   if x=='0' || x==-1 || x==0
  "     let file=GetParentDir(file)
  "   else
  "     let file=x
  "   endif
  "   let i += 1
  " endwhile
  " " if c==0
  " "   let file=w:git
  " " elseif c==1
  " "   let file=FindGit(GetParentDir(w:git))
  " " elseif c==2
  " "   let file=FindGit(GetParentDir(FindGit(GetParentDir(w:git))))
  " " endif
  " if file == -1
  "   " getcwd is not userfriendly
  "   " consider throwing a message
  "   " let file=getcwd()
  "   " echo "No higher Repo"
  "   return
  " endif
  " return file
endfunction

function! ProjectOrGitPath()
  let cwd=CWD()
  let finish=0
  let paths=[]
  while 1
    let isgit=globpath(cwd, '.git')
    let isproject=index(g:projects, cwd)
    if !empty(isgit) || isproject>-1
      return cwd
    endif
    if cwd=='/'
      break
    endif
    let cwd=GetParentDir(cwd)
  endwhile
  return -1
  " let file = -1
  " let c=a:count+a:nr
  " let i = 0
  " let file = w:git
  " while i < c
  "   if i==0
  "     let x = FindGit(file)
  "   else
  "     let x = FindGit(GetParentDir(file))
  "   endif
  "   if x=='0' || x==-1 || x==0
  "     let file=GetParentDir(file)
  "   else
  "     let file=x
  "   endif
  "   let i += 1
  " endwhile
  " " if c==0
  " "   let file=w:git
  " " elseif c==1
  " "   let file=FindGit(GetParentDir(w:git))
  " " elseif c==2
  " "   let file=FindGit(GetParentDir(FindGit(GetParentDir(w:git))))
  " " endif
  " if file == -1
  "   " getcwd is not userfriendly
  "   " consider throwing a message
  "   " let file=getcwd()
  "   " echo "No higher Repo"
  "   return
  " endif
  " return file
endfunction

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

function! Folder_Repo_Or_Project(count, nr)
  call Refresh('projects', 'GetProjects()')
  let cwd=CWD()
  let finish=0
  let paths=[]
  let x=a:count+a:nr
  " echo x
  let y=0
  let scwd=cwd
  let z=0
  while 1
    let isgit=globpath(cwd, '.git')
    let isproject=index(g:projects, cwd)
    if !empty(isgit) || isproject>-1
      " this is a project or repo
      echo "Is Git Project " .. x .. " " .. y
      let scwd=cwd
      if x==y
        return cwd
      endif
      let y+=1
    endif
    if cwd=='/'
      break
    endif
    let cwd=GetParentDir(cwd)
    let z+=1
  endwhile
  " Folder_Up(cwd)
  " return '/'
  " return -1
  " todo return Folder
  " call input(Folder(scwd, x-y+1).." "..string(x-y+1))
  " echo Folder(scwd, x-y+1)
  return Folder(scwd, x-y+1)
endfunction

function! Folder_Repo_Or_Project_notright(count, nr)
  let cwd=CWD()
  let finish=0
  let paths=[]
  while 1
    let isgit=globpath(cwd, '.git')
    let isproject=index(g:projects, cwd)
    if !empty(isgit) || isproject>-1
      return cwd
    endif
    if cwd=='/'
      break
    endif
    let cwd=GetParentDir(cwd)
  endwhile
  return -1
  " Folder_Up(cwd)
  " return '/'
  return Folder(cwd, a:nr)
endfunction

function! PathShortForm(path, num)
  let folders=split(a:path, '/')
  let out=""
  let num=a:num
  for f in folders
    let out.="/"..f[ 0 : num].."…"
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
