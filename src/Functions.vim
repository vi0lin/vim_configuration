if !exists("g:vim_advantages_got_sourced")

let g:default_direction='j'

function! OpenedRepos(...)
  let value=a:000[0]
  let out=[]
  for b in getbufinfo({'buflisted': 1})
    call add(out, b)
  endfor
  "echo map(copy(out), '{"bufnr": v:val}')
  " echo out
  echo map(copy(out), 'v:val.bufnr')
endfunction
command! -range -nargs=* OpenedRepos :call OpenedRepos(<f-args>)
command! -range -nargs=* OR :call OpenedRepos(<f-args>)

function! Rec(nr=1)
  let nr=a:nr
  let x=systemlist("source "..g:bashrc.."; r "..nr)
  put=x
  redraw!
endfunction
command! -range -nargs=? Rec :call Rec(<q-args>)

function! Split(args)
  exec "args" a:args
  if len(filter(argv(), 'v:val=~".*.zip"'))>0
    argdelete *.zip
  endif
  if len(argv())>0
    tabnew
    sall
  else
    echo "No files were found."
  endif
endfunction
command! -range -nargs=* Split :call Split(<q-args>)

function! RemoveFile(...)
  let file=expand('%:p')
  let yes=input('remove '..file..'? [yY]')
  if yes==#"y"
    call system('rm '..file)
  endif
endfunction
command! -range -nargs=* RemoveFile :call RemoveFile(<f-args>)
command! -range -nargs=* RF :call RemoveFile(<f-args>)

function! CreateFunction(...)
  set noignorecase
  if len(a:000)==1
    let name=a:000[0]
    let shortname=substitute(name, '[a-z]', '', 'g')
    let key=""
  elseif len(a:000)==2
    let name=a:000[0]
    let key=a:000[1]
    let shortname=substitute(name, '[a-z]', '', 'gi')
  else
    let name="Name"
    let shortname="N"
    let key=""
  endif
  echo name
  let abc =<< eval EOD
function! {name}(...)
  
endfunction
command! -range -nargs=* {name} :call {name}(<f-args>)
command! -range -nargs=* {shortname} :call {name}(<f-args>)
EOD
  if key!=""
    let abc2 =["NewMap -no -v -n "..key.." :"..shortname.."<CR>"]
    call extend(abc, abc2)
  endif
  " put=abc
  call append(line('.'), abc)
  norm jjA
endfunction
  set ignorecase
command! -range -nargs=* CF :call CreateFunction(<f-args>)
" let v ??= 'test'

function! DiffFolders(...)
  let folder1=a:000[0]
  let folder2=a:000[1]
  let files1=map(globpath(folder1, "**", 0, 1), 'substitute(v:val, "^'.folder1.'/", "", "")')
  let files2=map(globpath(folder2, "**", 0, 1), 'substitute(v:val, "^'.folder2.'/", "", "")')
  let files_only_left=[]
  let files_only_right=[]
  let files_diff=[]
  let files_equal=[]
  let intersectioin=filter(copy(files2), {_, v ->index(files1, v)>=0})
  " let seen={}
  " let intersection=filter(copy(files2), {_, v->
  "   \ index(files1, v)>=0 && !has_key(seen,v) ? (seen[v]=1):0})
  " let files_equal=[]
  " if cmp --silent -- "$file1" "$file2";
  let s1={}
  for x in files1 | let s1[x]=x | endfor
  let s2={}
  for x in files2 | let s2[x]=x | endfor
  let files2=[]
  let tmp = filter(copy(files2), {_, v ->
    \ has_key(files1, v)
    \ ? (add(files_equal, v), 0)
    \ : (add(files_only_right, v), 0)
    \ })
  for p in files2
    if has_key(s1, p)
      if s1[p] ==# s2[p]
        if index(files_equal, p) < 0 | call add(files_equal, p) | endif
      else
        call add(files_diff, p)
      endif
    endif
  endfor
  for p in files1
    if !has_key(s2, p)
      call add(files_only_left, p)
    endif
  endfor
  echo files1
  echo files2
  echo files_only_left
  echo files_only_right
  echo files_diff
  echo files_equal
endfunction
command! -range -nargs=* DiffFolders :call DiffFolders(<f-args>)

function! Spare()
  let root=input("for files in folder: ")
  function! DiffFiles_callback(file, root)
    let path=GetTempfileLine(a:file)
    let path=path.''
    if !(path=="0" || path=="-1")
      let files = filter(globpath(a:root, "*", 0, 1), 'v:val!~".*.zip"')
      for x in files
        tabnew
        let filename=split(x, "/")[-1]
        " let path=Folder_Repo_Or_Project_Only()
        " path with smallest depth / or split all matches vertically
        let file=filter(globpath(path, "**", 0, 1), 'filereadable(v:val)&&split(v:val, "/")[-1]=="'..filename..'"')
        enew
        if len(file)>0
          exec "e" file[0]
        endif
        vs
        exec "e" x
        windo diffthis
      endfor
    else
      let g:fzfabort=1
    endif
    call _cleanCallback(a:file)
  endfunction
  let Cb={job, status -> timer_start(0, {_ -> DiffFiles_callback(g:outfile, root)})}
  let comparePath=Popup("Choose Destiny Project", 'window', g:projects, Cb, g:outfile)
endfunction
command! -range -nargs=0 Spare :call Spare()

" unstage a specific file:
" git reset <filename>
" all files:
" git reset --soft
" git reset --soft <filename>

" Avoid cdo prompt for overwiting files
" let &t_TI = "\<Esc>[>4;2m"
" let &t_TE = "\<Esc>[>4;m"
" let &t_TI = [=1;1u
" let &t_TE = [>4;m[=0;1u
" let &t_TI = "\<Esc>[>4;2m"
" let &t_TE = "\<Esc>[>4;0m"
" set <M-q>=\eq

function BufLength()
  return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

function CloseFind()
  bufdo | if bufname()=="Find"| bd! | endif
endfunction
" call CloseFind()

let g:debug=0

if !exists('g:vim_configuration_path')
  let g:vim_configuration_path=resolve(expand('<sfile>:p:h')..'/../')
endif

let g:preservedLists=[ 'favorites', 'multiprojectholder', 'projectholder', 'projectholder_projects', 'multiprojectholder_projects', 'projects', 'favoritefolders', 'favoritefolders_recursively', 'favoritefolders_files', 'favoritefolders_glob', 'favoritefolders_glob_files', 'favoritefolders_files_recursively', 'pathsoffavorites']

function! BuildCommandData(dict_or_array) abort
  let lines = []
  for data in a:dict_or_array
    let line ="call extend(b:favoritefolders_glob, [" . string(data[0]) . ", " . string(data[1]) . "])"
    call add(lines, line)
  endfor
  return lines
endfunction

" let g:temporarily={
"   'favorites': { 'holder': 0, 'multiproject': 0, 'extend': 'favorites' },
"   'ph': { 'holder': 1, 'multiproject': 0, 'extend': 'projects' },
"   'mph': { 'holder': 0, 'multiproject': 1, 'extend': 'projects' },
"   'projectsholder': { 'holder': 1, 'multiproject': 0, 'extend': 'projects' },
"   'projects': { 'holder': 0, 'multiproject': 0, 'extend': 'projects' },
"   \ }
let g:preservedListsFolders=[ 'favorites' ]

function PreservedListsInit()
  for pl in g:preservedLists
    let varname="g:"..pl
    if !exists(varname)
      exec "let "..varname.."=[]"
    endif
  endfor
  for plf in g:preservedListsFolders
    let varname="g:"..pl.."_folders"
    if !exists(varname)
      exec "let "..varname.."=[]"
    endif
  endfor
endfunction
call PreservedListsInit()

if !exists('g:unreleased')
  let g:unreleased=g:vim_configuration_path..'/.unreleased'
endif

if !exists('g:generated_src')
  let g:generated_src=g:vim_configuration_path..'/generated_src'
endif

function! CreateFileAndPathIfNotExists(file)
  let dir = fnamemodify(a:file, ':h')
  if !isdirectory(dir)
    if !filereadable(dir)
      call MkDir(dir)
    endif
  endif
  if !filereadable(a:file)
    " call input(a:file)
    call writefile([], a:file)
  endif
  return filereadable(a:file)
endfunction

function OpenUnreleased(file)
  let file=g:unreleased..'/.'..a:file
  if filereadable(file)
    exec "e "g:unreleased..'/.'..a:file
  endif
endfunction

function! Refresh(name, functionname)
  exec 'let g:'..a:name..'='a:functionname
endfunction

function! UnreleasedVariable(name)
  exec 'let g:'..a:name..'=ReadUnreleased("'..a:name..'")'
endfunction

function! ReadUnreleased(file)
  return Read(g:unreleased..'/.'..a:file)
endfunction

function! GetFavoriteFolders()
  call UnreleasedVariable('favoritefolders')
  return g:favoritefolders
endfunction

function! GetFavoriteFolders_Recursively()
  call UnreleasedVariable('favoritefolders_recursively')
  return g:favoritefolders_recursively
endfunction

function! SaveFavoriteFolders_Glob()
  let test=[
    \ [ '/', '**/*' ],
    \ [ './src', '**' ],
    \ [ './', '*' ]
    \ ]
  let script = BuildCommandData(test)
  call WriteUnreleased(script, "favoritefolders_glob.unreleased")
endfunction

function! GetFavoriteFolders_Glob()
  let g:favoritefolders_glob=ReadUnreleased("favoritefolders_glob.unreleased")
endfunction

function! GetFavoriteFolders_Files()
  let x = []
  for path in g:favoritefolders
    let dirs=filter(globpath(path, "*", 0, 1), 'filereadable(v:val)')
    call extend(x, dirs)
  endfor
  call WriteUnreleased(x, 'favoritefolders_files')
  call UnreleasedVariable('favoritefolders_files')
  return g:favoritefolders_files
endfunction

function! GetPathsOfFavorites()
  let x=[]
  for f in g:favorites
    if isdirectory(f) && indexof(x, f)==-1
      call add(x, f)
    endif
  endfor
  return x
endfunction

function! GetFavoriteFolders_Files_Recursively()
  let x = []
  for path in g:favoritefolders
    let dirs=filter(globpath(path, "**", 0, 1), 'filereadable(v:val)')
    call extend(x, dirs)
  endfor
  call WriteUnreleased(x, 'favoritefolders_files_recursively')
  call UnreleasedVariable('favoritefolders_files_recursively')
  return g:favoritefolders_files_recursively
endfunction

function! GetGitprojects(file=g:unreleased..'/.gitprojects')
  if !filereadable(a:file)
    call SearchGitProjects()
  endif
  " Add Updating Logic When New Projects Were Visited Or Removed
  let g:gitprojects=Read(a:file)
  return g:gitprojects
endfunction

if 0
  function FN
endif

function FN(...)
  echo expand('----')
  echo expand('<sfile>')
  echo expand('----')

  let g:newmap_optschema = [
    \ [ 'a', 'A|a', 0]
    \ ]
  echo substitute(expand('<sfile>'), '.*\.\.|\s', '', '')
  echo substitute(expand('<sfile>'), 'function (.*)\[\d\]\.\..*', '\1',  '')
  let x="function SFN[2]..FunctionName"
  echo substitute(expand('<sfile>'), 'function (.*)\[\d\]\.\..*', '\1' , '')
  echo expand('<file>')
  function! GetCurrentFunctionName()
    let line = getline(search('^[[:alpha:]$_]', 'bcnW'))
    echo matchstr(line, '\w\+')
  endfunction
  echo GetCurrentFunctionName()

  echohl argsMsg
  let m1=search('^[^ \t#/]\\{2}.*[^:]\s*$', 'bWn')
  echo m1
  let firstline=getline(m1)
  echo firstline

  echohl None
  let m2=search('^[[:alpha:]$_]', 'bcnW')
  echo m2
  let lastline=getline(m2)
  echo lastline

  let m3=search('^[[:alpha:]$_]', 'bcnW')
  echo m3
  echo substitute(getline(m3), '', '', '')
  put=expand('<sfile>')
  let x = expand('<sfile>')
  echo substitute(x, '.*\s\(.*\)\[\d\].*', '\1', '')
  " NewMap -n -no <f1> :FunctionName 3<cr>:FunctionName 1<cr>
endfunction
" call FN()

map <F2> :echo FN()<cr>
map <F4> :exec "echo g:"..expand('<cword>')<cr>
map <F3> exec ""

function! GetProjects()
  call Refresh('multiprojectholder', 'GetMultiprojectHolder()')
  call Refresh('projectholder', 'GetProjectHolder()')
  call Refresh('gitprojects', 'GetGitprojects()')
  call Refresh('favoritefolders_files', 'GetFavoriteFolders_Files()')
  call Refresh('favoritefolders_files_recursively', 'GetFavoriteFolders_Files_Recursively()')
  call Refresh('pathsoffavorites', 'GetPathsOfFavorites()')
  return Merge(g:gitprojects, g:favoritefolders_files, g:multiprojectholder_projects, g:projectholder_projects, g:pathsoffavorites)
endfunction

function! GetFoldersFolders(name)
  call UnreleasedVariable(a:name)
  exec 'echo g:'..a:name
  exec 'for folder in g:'..a:name
    echo folder
  endfor
endfunction

function! GetProjectFolders()
  let x=[]
  for p in g:projectfolders
    call add(x, p)
  endfor
  return x
endfunction

function! SearchGitProjects(file=g:unreleased..'/.gitprojects')
  let gitprojects=systemlist("find "..g:SearchGitProjectsPath.." -name .git -type d 2>/dev/null | sed 's|/.git||'")
  " echo gitprojects
  return Write(gitprojects, a:file)
  echo "Done"
endfunction
command! -range -nargs=0 SearchGitProjects :call SearchGitProjects()

function! Read(file)
  if CreateFileAndPathIfNotExists(a:file)
    " put =readfile(a:file)
    return readfile(a:file)
  endif
  return []
endfunction

function! WriteStructure(data, file, append='b')
  if CreateFileAndPathIfNotExists(a:file)
    call writefile([json_encode(a:data)], a:file, a:append)
  endif
endfunction

function! Write(data, file, append='b')
  if CreateFileAndPathIfNotExists(a:file)
    call writefile(a:data, a:file, a:append)
  endif
endfunction

function! ClearUnreachableFavorite()
endfunction

function! WriteUnreleased(list, file)
    call Write(a:list, g:unreleased..'/.'..a:file)
endfunction

let g:sessionfile=g:unreleased..'/.session'

function! WriteSession()
  exec "mksession!" g:sessionfile
endfunction
command! -range -nargs=0 WriteSession :call WriteSession()

function! ReadSession()
  echo g:sessionfile
  " if exists(g:sessionfile)
  exec "source" g:sessionfile
  " endif
endfunction
command! -range -nargs=0 ReadSession :call ReadSession()
command! -range -nargs=0 Projekt :call SetUnset('projekt', expand("%:p"))
command! -range -nargs=0 MultiprojectHolder :call SetUnset('multiprojectholder', expand("%:p"))
command! -range -nargs=0 FavoriteFolder :call SetUnset('favoritefolders', expand("%:p"))
command! -range -nargs=0 FavoriteFolderRecursively :call SetUnset('favoritefolders_recursively', expand("%:p"))
command! -range -nargs=0 ProjectHolder :call SetUnset('projectholder', expand("%:p"))

function! GetProjectHolder()
  call UnreleasedVariable('projectholder')
  call GetProjectHolder_Projects()
  return g:projectholder
endfunction

function! GetProjectHolder_Projects()
  let p=[]
  for path in g:projectholder
    let dirs=filter(globpath(path, "*", 0, 1), 'isdirectory(v:val)')
    call extend(p, dirs)
  endfor
  " call ForceSet('projectholder_projects', p)
  call WriteUnreleased(p, 'projectholder_projects')
  return g:projectholder_projects
endfunction

function! GetMultiprojectHolder()
  call UnreleasedVariable('multiprojectholder')
  call GetMultiprojectHolder_Projects()
  return g:multiprojectholder
endfunction

function! GetMultiprojectHolder_Projects()
  let p=[]
  for path in g:multiprojectholder
    let subpaths=filter(globpath(path, "*", 0, 1), 'isdirectory(v:val)')
    for path2 in subpaths
       let pp=filter(globpath(path2, "*", 0, 1), 'isdirectory(v:val)')
      call extend(p, pp)
    endfor
  endfor
  " call ForceSet('projectholder_projects', p)
  call WriteUnreleased(p, 'multiprojectholder_projects')
  call UnreleasedVariable('multiprojectholder_projects')
  return g:multiprojectholder_projects
endfunction

function EchoP()
  echo "g:projectholder"
  echo g:projectholder
  echo "g:projectholder_projects"
  echo g:projectholder_projects
  echo "g:multiprojectholder"
  echo g:multiprojectholder
  echo "g:multiprojectholder_projects"
  echo g:multiprojectholder_projects
  echo "g:gitprojects"
  echo g:gitprojects
endfunction

function! EnsureArr(value)
  let x=[]
  if type(a:value)==3
    call extend(x, a:value)
  else
    call extend(x, [a:value])
  endif
  return x
endfunction

function! SetUnset(name, value)
  " exec "let g:"..a:name.."=ReadUnreleased('"..a:name.."')"
  exec "call UnreleasedVariable('"..a:name.."')"
  let x = EnsureArr(a:value)
  for y in x
    exec "let index=index(g:"..a:name..", '"..y.."')"
    if index>=0
      exec "call remove(g:"..a:name..", index)"
      exec "call WriteUnreleased(g:"..a:name..", '"..a:name.."')"
    else
      exec "call add(g:"..a:name..", '"..y.."')"
      exec "call WriteUnreleased(g:"..a:name..", '"..a:name.."')"
    endif
  endfor
  " exec "let g:"..a:name.."=ReadUnreleased('"..a:name.."')"
  exec "call UnreleasedVariable('"..a:name.."')"
endfunction

function! ForceSet(name, value)
  exec "let g:"..a:name.."=ReadUnreleased('"..a:name.."')"
  let x=[]
  call extend(x, a:value)
  for y in x
    exec "let index=index(g:"..a:name..", '"..y.."')"
    if index==-1
      exec "call add(g:"..a:name..", '"..y.."')"
    endif
  endfor
  exec "call WriteUnreleased(g:"..a:name..", '"..a:name.."')"
  call UnreleasedVariable(a:name)
endfunction

function! ForceUnset(name, value)
  exec "let g:"..a:name.."=ReadUnreleased('"..a:name.."')"
  let x=[]
  call extend(x, a:value)
  for y in x
    exec "let index=index(g:"..a:name..", '"..y.."')"
    if index>=0
      exec "call remove(g:"..a:name..", index)"
    endif
  endfor
  exec "call WriteUnreleased(g:"..a:name..", '"..a:name.."')"
  call UnreleasedVariable(a:name)
endfunction

function! s:MatchesOneOfPatterns(pattern_string, term) abort
  let patterns = split(a:pattern_string, '|', 1)
  for p in patterns
    if a:term =~# '^' . p . '$'
      return 1
    endif
  endfor
  return 0
endfunction

command! -range -nargs=* Debug :call Debug(<f-args>)
function! Debug(opts, ...)
  let level = a:000[0]
  if g:debug >= level || ( exists('a:opts.verbose') && a:opts.verbose )
    let intend= a:000[1]
    let args=a:000[2:]
    let intend_str=""
    for x in range(intend)
      let intend_str.=" "
    endfor
    let o=join(args, ' ')
    let out=printf(intend_str.."%s", o)
    echo out
  endif
endfunction

" function! IfDebug(condition)
"   let l:vars = {}
"   for l:line in getline(1, '$')
"     let l:m = matchlist(l:line, '^\s*let\s\+\(\w\+\)\s*=\s*\(.*\)\s*$')
"     if len(l:m) > 0
"       let l:vars[l:m[1]] = trim(l:m[2])
"     endif
"   endfor
"   let l:result = a:condition
"   for [l:name, l:val] in items(l:vars)
"     let l:result = substitute(l:result, '\<' . l:name . '\>', l:val, 'g')
"   endfor
"   echo 'ifd: ' . l:result
" endfunction
" command! -nargs=+ Ifd call IfDebug(<q-args>)

function! Ifd(expr) abort
  let result = a:expr
  let tokens = []
  let tmp = a:expr
  let pat = '\v<([a-zA-Z_][a-zA-Z0-9_]*)>'
  let start = 0
  while 1
    let m = matchstr(tmp, pat, start)
    if m == ''
      break
    endif
    let mstart = match(tmp, pat, start)
    if index(tokens, m) == -1
      call add(tokens, m)
    endif
    let start = mstart + len(m)
  endwhile
  for token in tokens
    if index(['and','or','not','if','else','elseif','endif',
            \ 'let','call','return','function','endfunction'], token) >= 0
      continue
    endif
    let val = ''
    let found = 0
    for prefix in ['', 'g:', 's:', 'b:', 'w:', 't:']
      if exists(prefix . token)
        let val = string(eval(prefix . token))
        let found = 1
        break
      endif
    endfor
    if found
      let result = substitute(result, '\v<' . token . '>', val, 'g')
    endif
  endfor
  echo result
endfunction
command! -nargs=+ Ifd call Ifd(<q-args>)

function! SmartFold()
endfunction

function! GitRebase()
  !git pull --rebase
  " check all conflicts
  " git add src/Functions.vim
  !git rebase --continue "satisfied
  !git rebase --skip     "überspringen
  !git rebase --abort    "abbruch
  !git rebase --amend    "ändern
endfunction

function! GitRenameRemote(...)
  if len(a:000)>0
    let newname = join(a:000)
  else
    let newname=input("Rename [".w:gitRemote."]: ")
  endif
  exec "!git remote rename "..w:gitRemote.." "..newname
  " let w:gitRemote=newname
  call UpdateGit()
  " windo "call Statusline()"
  call Statusline()
endfunction

function! GitSetRemote(...)
  if len(a:000)>0
    let newurl = join(a:000)
  else
    let newurl=input("Set "..w:gitRemote.." [".w:gitRemoteUrl."]: ")
  endif
  exec "!git remote set-url "..w:gitRemote.." "..newurl
  call UpdateGit()
  call Statusline()
endfunction

function! GitRenameBranch(...)
  if len(a:000)>0
    let newname = join(a:000)
  else
    let newname=input("Rename [".w:gitBranch."]: ")
  endif
  exec "!git branch -m "..w:gitBranch.." "..newname
  let w:gitBranch=newname
  " windo "call Statusline()"
  call UpdateGit()
  call Statusline()
endfunction

function! GitRemoteAdd(...)
  if len(a:000)==1
    let newname = "origin ".a:000[0]
  elseif len(a:000)==2
    let newname = join(a:000, ' ')
  else
    let newname=input("Remote Add: ")
  endif
  exec "!git remote add "..newname
  call UpdateGit()
endfunction
command! -range -nargs=* GitRemoteAdd <line1>,<line2>:call GitRemoteAdd(<f-args>)

function! GitNewBranch(...)
  if len(a:000)>0
    let newname = join(a:000)
  else
    let newname=input("New: ")
  endif
  exec "!git branch -m "..w:gitBranch.." "..newname
  call UpdateGit()
endfunction

function! DebugCommand(list, delimeter=" ")
  let out=""
  for x in a:list
    let out=out..x..a:delimeter
  endfor
  echo out
endfunction

" Optimizing
" 1. Store Matches (That Matches A Structure Element) Per Function, Create A
" [ [ "NewMap", "-T"] ['test', 'test|t', 0] ]
" Matrix, Serving As Lookup Table.
" Consider Looping The Structure Only, If A New Parameter Does Not Exist In The Lookup Matrix
" (Consider Also Storing Non Existent Arguments In A Negative Lookup Matrix? To Avoid Searching A False Parameter Often)
" Occurs For That Function - This Reduces Calling The Very Often Computed Searching Algorithms
" 0.05 - 0.5
" 2. Work Trough Specs More Precisely Instead Of Occasionally Decisiontaking

let s:lookup_matrix={}
" Behaviour (OnDefaultFound_Ignore_Mainargs_FromNowOn)

let g:sh={}
function GetOpts(args_str, structure, delimeter='--')
  " todo add -silent
  " todo add n arguments
  let args_str=a:args_str
  let args=ParseArgs(args_str)
  let fn=FunctionName()
  " call Debug(opts, 1, 4, a:structure)
  function! _build() closure
    let opts={'default':args_str}
    for s in a:structure
      if s[2]==0
        let opts[s[0]]=0
      elseif s[2]=='n'
        let opts[s[0]]=[]
      elseif s[2]==1
        let opts[s[0]]=""
      elseif s[2]>1
        let opts[s[0]]=[]
      endif
    endfor
    return opts
  endfunction
  let opts=_build()
  call Debug(opts, 5, 0, string(opts))
  function! StructureHelper() closure
    if !exists('g:sh[fn]')
      let value={}
      " call add(g:sh, { fn: value })
      let g:sh[fn]={}
      " echo g:sh
      for s in a:structure
        let data = split(s[1], '|')
        for d in data
          " call add(g:sh[fn], { d: s })
          let g:sh[fn][d]=s
        endfor
      endfor
    endif
    return g:sh
  endfunction
  function! Check(arg, returnStructure=0) closure
    " let arg_check={ \
    "   'main': -1, \
    "   'value': -1, \
    "       }
    if StartsWithDash(a:arg)
      " LOGIC FÜR DAS SETZEN VON opts.insert opts.normal usw
      call Debug(opts, 1, 0, "Starts With Dash")
      " if IsInLookup(a:arg)
      "   call Debug(opts, 1, 0, "Is In Lookup")
      "   return !a:returnStructure && 1 || MatchesFromLookup(a:arg)
      " elseif IsInStructure(a:arg)
      if IsInStructure(a:arg)
        call Debug(opts, 1, 0, "Is In Structure")
        return !a:returnStructure && 1 || MatchesFromStructure(a:arg)
      else
        return 0
        " if !a:returnStructure && 0
        "   return 0
        "   else
        "     return []
        " endif
      endif
    else
      return 0
    endif
  endfunction
  function! StartsWithDash(arg)
    if a:arg[0:0]=='-' || a:arg[0:1]=='--'
      return 1
    else
      return 0
    endif
  endfunction
  function! StripDashes(arg)
    if a:arg[0:1]=='--'
      return a:arg[2:]
    endif
    if a:arg[0:0]=='-'
      return a:arg[1:]
    endif
    return a:arg
    " if  == "--"
    "   return substring(a:arg[2:])
    " endif
    " if a:arg[0:1] == "-"
    "   echo string(a:arg[1:])
    "   return string(a:arg[1:])
    " endif
  endfunction
  " function CheckArg(arg)
  "   return StatsWithDash(a:arg) && ( IsInLookup(a:arg) || IsInStructure(a:arg) )
  " endfunction
  function! MatchFromStructure(arg) closure
    " let i = 0
    if has_key(getopts.structure_helper, fn)
      if has_key(getopts.structure_helper[fn], a:arg)
        return getopts.structure_helper[fn][a:arg]
      else
        return []
      endif
    else
      return []
    endif
    " for k in getopts.structure_helper
    "   " call Debug(opts, 1,4, k)
    "   if index(k,a:arg)>=0
    "     call Debug(opts, 1,4, "Match: "..a:arg.." "..string(a:structure[i]))
    "     return a:structure[i]
    "   endif
    "   " let found_key=(name =~ '\v^('..k[1]..')$')
    "   " if found_key
    "   "   call add(found_keys, k)
    "   " endif
    "   let i+=1
    " endfor
    " return []
    " let matches=[]
    " for k in getopts.structure
    "   let match=(a:arg=~ '\v^('..k[1]..')$')
    "   if match
    "     call add(matches, k)
    "   endif
    " endfor
    " if a:feed_lookup
    "   let s:lookup_matrix[functionName][a:arg]=matches
    " endif
    " return matches
  endfunction
  function! IsInStructure(arg) closure
    let i = 0
    let matches=[]
    for k in getopts.structure_helper
      " echo name '=~' k[1]
      if index(k,a:arg)>=0
        call add(matches,structure[i])
        return 1
      endif
      " let found_key=(name =~ '\v^('..k[1]..')$')
      " if found_key
      "   call add(found_keys, k)
      " endif
      let i+=1
    endfor
    return 0
  endfunction
  " function! IsInLookup(arg) closure
  "   if has_key(s:lookup_matrix, functionName)
  "     if has_key(s:lookup_matrix[functionName], a:arg)
  "       return 1
  "     else
  "       return 0
  "     endif
  "   endif
  " endfunction
  " function! MatchesFromLookup(arg) closure
  "   return s:lookup_matrix[functionName][a:arg]
  " endfunction
  " argtypes         [1,0,0,1,0,0,0,0,1,0,0] oder [0,0,1,0,0,1,0,0,0,0,1,0,0]
  " cardinalities    [0,    n,        0,   ] oder [    2,    0,        1    ]
  " arg_is_default   [m,d,d,d,d,d,d,d,d,d d] oder [d,d,d,d,d,d,d,d,d,d,d,d,d]
  " delimeter_index  -1
  " default_index     9                            0                            oder [0, 6]
  " mainargcount     [1, 4, 0]                    [0]
  call Debug(opts, 1, 0, "============================")
  call Debug(opts, 1, 2, fn)
  call Debug(opts, 1, 2, args_str)
  call Debug(opts, 1, 2, args)
  let getopts={'args': args, 'structure': a:structure, 'structure_helper': StructureHelper() }
  " call Debug(opts, 1,4, getopts.structure_helper)
  " delimeter-arg='--'
  let specs={
    \ 'argtypes': [],
    \ 'cardinalities': [],
    \ 'arg_is_default': [],
    \ 'matches': [],
    \}
    " \ 'delimeter_index': -1,
    " \ 'default_index': -1,
    " \ 'mainargcount': []
  let ignore_flags=0
  " Specifications
  function! Specification() closure
    let arg_idx = 0
    let fill_n=0
    let bag_name=''
    call Debug(opts, 1, 1, "getopts.args: "..string(getopts.args))
    call Debug(opts, 1, 1, "RANGE: "..string(range(0,len(getopts.args)-1)))
    for arg_idx in range(0,len(getopts.args)-1)
      let stripped_arg=getopts.args[arg_idx]
      let match=[]
      call Debug(opts, 1, 1, "### ".getopts.args[arg_idx]." <- Opt")
      call Debug(opts, 1, 7, "getopts.args[arg_idx]: "..getopts.args[arg_idx])
      " Add Match
      let starts_with_dash=StartsWithDash(getopts.args[arg_idx])
      " call Debug(opts, 9, 10, "!ignore_flags && starts_with_dash ---> ", !ignore_flags, "&&", starts_with_dash)
      if !ignore_flags && starts_with_dash
        let stripped_arg=StripDashes(getopts.args[arg_idx])
        let match=MatchFromStructure(stripped_arg)
        call add(specs.matches, match)
      endif
      " First Argument Is No GetOpt
      if empty(match) && arg_idx==0
        let ignore_flags=1
      endif
      " Specs
      if !ignore_flags
        " Is Bag Value
        if !empty(bag_name)
          call add(specs.argtypes, 2)
          call add(specs.arg_is_default, 0)
          call add(specs.cardinalities, -1)
        " Is GetOpt
        elseif !empty(match)
          call add(specs.argtypes, 1)
          call add(specs.arg_is_default, 0)
          call add(specs.cardinalities, match[2])
        " Not In GetOpt
        elseif empty(match)
          call add(specs.argtypes, 0)
          call add(specs.arg_is_default, 1)
          call add(specs.cardinalities, -1)
        endif
      " Defaults
      else
        call add(specs.arg_is_default, 1)
        call add(specs.argtypes, 3)
        call add(specs.cardinalities, -1)
      endif
      " Start Default, Just In Case
      if specs.arg_is_default[arg_idx]==1
        let ignore_flags=1
      endif
      call Debug(opts, 1, 7, "specs: "..string(specs))
      call Debug(opts, 1, 10, "ignore_flags: "..ignore_flags)
      call Debug(opts, 1, 10, "getopts.args["..arg_idx.."] "..getopts.args[arg_idx])
      call Debug(opts, 1, 10, "arg_idx "..arg_idx)
      " call Debug(opts, 4, 10, specs)
      " Cut
      if !ignore_flags
        let default=''
        " echo specs.arg_is_default
        " echo specs.arg_is_default[arg_idx]
        if specs.argtypes[arg_idx]==1 || specs.argtypes[arg_idx]==2
          call Debug(opts, 1, 10, 'Cutting '..string(len(getopts.args[arg_idx])+1).." chars from left")
        " if arg_idx>0
          " if specs.argtypes[arg_idx-1]==1 && specs.cardinalities[arg_idx-1]==0
            " let str_from=len(getopts.args[arg_idx])
            " let default=args_str[start:]
            " echo getopts.args[arg_idx].." cut from "..args_str
            " let args_str=substitute(args_str, getopts.args[arg_idx]..' ', "", "")
            let args_str=args_str[len(getopts.args[arg_idx])+1:]
          " endif
          let opts.default=args_str
        endif
      endif
      " Processing
        if specs.argtypes[arg_idx]==1 && specs.cardinalities[arg_idx]==0
          " set-flag
          let opts[specs.matches[arg_idx][0]]=1
        elseif specs.argtypes[arg_idx]==1 && specs.cardinalities[arg_idx]==1
          " set fill-one
          " ignore StartsWithDash
          let bag_name=match[0]
          call Debug(opts, 1, 10, "bag_name", bag_name)
          let fill_n=1
        elseif specs.argtypes[arg_idx]==1 && specs.cardinalities[arg_idx]=='n'
          " set fill-until-delimeter
          " ignore StartsWithDash
          let bag_name=match[0]
          call Debug(opts, 1, 10, "bag_name", bag_name)
          let fill_n=-1
        elseif specs.argtypes[arg_idx]==1 && specs.cardinalities[arg_idx]=~'\d'
          " set fill-\d
          " ignore StartsWithDash
          let bag_name=match[0]
          call Debug(opts, 1, 10, "bag_name", bag_name)
          let fill_n=specs.cardinalities[arg_idx]
        elseif specs.argtypes[arg_idx]==2
          " fill-bag
          " todo FILL BAG - int string dict list
          call Debug(opts, 1, 10, "FILL BAG")
          call Debug(opts, 1, 12, 'bag_name: ', bag_name)
          " call Debug(opts, 1, 12, 'specs.matches', specs.matches)
          let bag_len=len(opts[bag_name])
          if bag_len==0
            let opts[bag_name]=getopts.args[arg_idx]
          elseif bag_len>0
            call add(opts[bag_name], [ getopts.args[arg_idx] ])
          endif
          call Debug(opts, 10, 12, "bag_name: ", bag_name, ", fill_n: ", fill_n, ", bag_len: ", bag_len, ', opts[bag_name]: :', opts[bag_name])
          if fill_n>0
            let fill_n-=1
          endif
          if fill_n==-1
            if getopts.args[arg_idx][0:1]==a:delimeter
              let fill_n=0
            endif
          endif
          if fill_n==0
            let bag_name=''
            call Debug(opts, 1, 10, "bag_name", bag_name)
          endif
        endif
    endfor
    return specs
  endfunction
  " echo Specification()
  function! BuildOpts() closure
    call Specification()
    call Debug(opts, 1, 10, "------------\nspecs: "..string(specs))
    let arg_idx = 0
    " for arg_idx in range(0,len(getopts.args)-1)
    "   " HERE
    " endfor
    call Debug(opts, 1,10,"opts: "..string(opts))
    " let opts.joined=join(opts.default, ' ')
    return opts
  endfunction
  " call Debug(opts, 1, 0, "TEST" s:lookup_matrix)
  return BuildOpts()
endfunction
" echo GetOpts(['-v', '-o', '-c', '-t','test', 'abc'], g:newmap_optschema)

function! ParseArgs(argstr)
  let args = []
  let current = ''
  let in_quote = 0
  let quote_char = ''
  for char in split(a:argstr, '\zs')
    if in_quote
      if char == quote_char
        let in_quote = 0
      else
        let current .= char
      endif
    elseif char == '"' || char == "'"
      let in_quote = 1
      let quote_char = char
    elseif char == ' '
      if current != ''
        call add(args, current)
        let current = ''
      endif
    else
      let current .= char
    endif
  endfor
  if current != ''
    call add(args, current)
  endif
  return args
endfunction

function! Profile(...)
  let i = 0
  let arg = a:000[i]
  if arg ==# 'on'
    exec "profile start "..g:tempprofile
    profile! func *
    profile! file *
  elseif arg ==# 'off'
    profile pause
  elseif arg ==# 'show'
    exec "e "..g:tempprofile
  elseif arg ==# 'end'
    qa!
  endif
endfunction
command! -range -nargs=* Profile <line1>,<line2>:call Profile(<q-args>)

" function! Arguments()
"   echo argv()
"   echo argc()
"   echo argv(i)
"   echo argv(-1)
" endfunction

function! VimConfiguration()
  return split(&runtimepath, ",")[1]
endfunction

function! IF(...)
  let search=""
  if g:mode=="Visual"
    " let search=VS()
    let i=":call SetMode(\"\\<C-F2\\>\", \"Normal\") \| :F "..join(VS(), ' ')..' '
    call UnsetMode()
    call feedkeys(i, 'n')
    return
  else
    if len(a:000)==1
      let search=join(a:000, ' ')
    elseif len(a:000)>1
      let search=join(a:000[:-1], ' ')
    endif
  endif
  let g:last_search=''..search
  if len(a:000)==1
    if search==""
    endif
    " search
    let winid=win_getid()
    silent exec "vimgrep "..search..' %'
    redraw!
    " vsplit
    vertical copen
    call win_gotoid(winid)
  elseif len(a:000)>1
    " search
    let winid=win_getid()
    silent exec "vimgrep "..search..' '..a:000[-1]
    redraw!
    " vsplit
    vertical copen
    call win_gotoid(winid)
  else
  endif
  redraw!
endfunction
command! -range -nargs=* IF <line1>,<line2>:call IF(<f-args>)

function! CDo(...)
  let searchterm=split(g:last_search, ' ')[:-2]
  let searchterm=join(searchterm, ' ')
  let i=":call SetMode(\"\\<C-F2\\>\", \"Normal\") \| :cdo \| s/"..searchterm..'//g'
  call feedkeys(i, 'n')
endfunction
command! -range -nargs=* CDo :call CDo(<f-args>)

function! CFDo(...)
  let searchterm=split(g:last_search, ' ')[:-2]
  let searchterm=join(searchterm, ' ')
  let i=":call SetMode(\"\\<C-F2\\>\", \"Normal\") \| :cfdo \| %s/"..searchterm..'//g'
  call feedkeys(i, 'n')
endfunction
command! -range -nargs=* CFDo :call CFDo(<f-args>)

function! COpen()
  let winid=win_getid()
  vertical copen
  vertical resize 45
  call win_gotoid(winid)
endfunction

function! R(...)
  if join(a:000, ' ')==''
    let x='r 1'
  else
    let x='r '..join(a:000, ' ')
  endif
  put=systemlist('source '..g:bashrc..'; '..x)
endfunction
command! -range -nargs=* R <line1>,<line2>:call R(<f-args>)

function! F(...)
  if join(a:000, ' ')==''
    let x=Folder_Repo_Or_Project_Only()..'/**'
  else
    let x=join(a:000, ' ')
  endif
  " search
  " let winid=win_getid()
  " silent "cex system('rg --vimgrep "..join(a:000, ' ')..")"
  " redraw!
  "cexpr map(glob(Folder_Repo_Or_Project_Only()..'/**', 0, 1), '{"filename": v:val}')
  " cexpr map(glob(x, 0, 1), '{"filename": v:val}')
  " call setqflist(
  "       \ systemlist('find . -maxdepth 1 -type f'),
  "       \  {_, f -> {'filename': f[2:], 'lnum': 1}}
  "       \ )
  "       \  " glob(x, 0, 1),
  call setqflist(map(glob(x, 0, 1), {_, f -> {'filename': f, 'lnum': 1, 'text': f}}))
  " vsplit
  " vertical copen
  " exec "resize 15"
  " call win_gotoid(winid)
  call COpen()
  redraw!
endfunction
command! -range -nargs=* F <line1>,<line2>:call F(<f-args>)

let s:hidden_all=0
function! ToggleHiddenAll()
  if s:hidden_all==0
    let s:hidden_all=1
    " set noshowmode
    " set noruler
    " set laststatus=0
    " set noshowcmd
  else
    let s:hidden_all=0
    " set showmode
    " set ruler
    " set laststatus=2
    " set showcmd
  endif
endfunction

" jump to same intendation level up/down

function! FindGitReposSystem()
  !find / -name .git -type d 2>/dev/null
  " Populate A FZF Function, Choosing A Repo
endfunction

function! __words()
  let c = 0
  redir => output
    " silent %s/[aeiou]//gn
    silent %s/\w//gn
  redir END
  let c = str2nr(matchstr(output, '\d\+'))
  echo c . " words found"
endfunction

function! __vowels()
  let c = 0
  redir => output
    silent %s/[aeiou]//gn
  redir END
  let c = str2nr(matchstr(output, '\d\+'))
  echo c . " vowels found"
endfunction

" function! ClipboardToUploader()
" FZF wieder zum laufen bringen.
" unterste zeile - c++ for example whole file word count | whole file double line count
" Kommentare aus VS() substituieren
" Try Enabling Statusline Only In One Buffer
" Force NewLines On Paste A Blockwised Yank Rectangle
" Uploader Chunkwise In Vim
" Put Registers
" Quick Command Assignments And Execution And Commands In Popup
" <leader><leader> show popup quickly without interferring <leader><leader> timeout
" put=execute('registers')
" vim is almost bash / textbased / i want to go away / to c
" LayoutBash is slow
" Make LayoutBash Only One File And Have Tabs To Tab Trough
" Fix Auto Intending
" Fix () {} auto closing [] curls "" '' `` ``` """ '''
" quicker file navigation
" <Tab> <S-Tab> Traverse Tab Buffers - LayoutBash Open File, but Easy Tab Traverse Instead
" Fix <A-h> Fix <A-l> in Terminal

" function ClipboardToUploader()
" Comments in vpn_roadwarrior_configuration
" Buffer At The Bottom Management (longpath)
" <leader><leader> shows path, where you located for g or p
" Push <C-g>/g <C-p>/p
" Kommentare Als Vimscript ausführen / In Dateien ausfindig machen
" Projektweise Und Fallback .vim_configuration mit Definierten Commands und
" Befehlssätzen
" Verschiedene Dateiformate haben verschiedene Kommentare
" Auto Intending Korrigieren
" Bubble Up Bubble Down Korrektur
" Ctrl A soll einen Block oder eine Funktion markieren
"   Ctrl-S jk wird die Markierung weiter nach oben oder unten erweitern
" Einfach Befehle Verändern / Popup List / Hinzufügen
" Liste Aller Buffer in FZF öffnen / Auswählen
" Tabweise Bufferliste Toggle Trough und Popup FZF
" <leader>s '<,'>s@@@g
" <leader><leader>s '<,'>s@{PASTE_FROM_REGISTER_"}@{Cursor Here}@g
" Fix C-c in Mobile, does not leave the visual selection
" Fix autoreload vimfiles, on save
" Quick git init --bare {somewhereelse} && Integration

" if &term =~ 'xterm' || &term =~ 'kitty' || &term =~ 'alacritty'
  " set ttimeoutlen=50
  " set ttimeoutlen=0
  " Enable modifyOtherKeys (Vim 8.2+ / 9+)
  " let &t_TI = "\<Esc>[>4;2m"
  " let &t_TE = "\<Esc>[>4;m"
" endif

function! __put_txt(lines)
endfunction

" put=execute('registers')
" p or P   inserts inline or characterwise (interlace, or overwrites parts of existing text)
" 0p 0P    prefixing it with a register should force linewise behaviour (THAT DOES NOT WORK IN MY CASE)
" :put     inserts below / treats blockwise register
" :put!    inserts above
"	if get(Part1, 'name') == get(Part2, 'name')
function! Mod(n,m)
  return ((a:n % a:m) + a:m) % a:m
endfunction

function! NewUUID()
  let g:seed = srand()
  let min=1000000000
  let nr=Mod(rand(g:seed), 9999999999)  " to echo a random number between 0-99
  let out=min+nr
  return out
endfunction

function! StaticWin(...) range
  let cursorpos=getcurpos()
  let opts = #{
    \ new: 0,
    \ right:0,
    \ left:0,
    \ top:0,
    \ bottom:0,
    \ foremost:0,
    \ staticWins: []
  \ }
  if !exists('t:staticWin')
    let staticWin_default=#{
      \ visibile_all: 1,
      \ staticWins: [],
      \ target: {}
      \ }
    call settabvar(tabpagenr(), 'staticWin', staticWin_default)
  endif
  let i = 0
  while i < len(a:000)
    let arg = a:000[i]
    if arg ==# 'new'
      let opts.new = 1
      let new = #{
        \ title: 'no-name',
        \ uuid: NewUUID(),
        \ direction: 'bottom',
        \ foremost:1,
        \ height:-1,
        \ width:-1,
        \ buffer: -1,
        \ visibile: 1
        \ }
      call extend(t:staticWin.staticWins, [new])
      let j = 0
      while j < len(a:000)
        let arg2 = a:000[j]
        if arg2 ==# '-f' || arg2 ==# '--foremost'
          let new.width=30
          let new.height=1
          let new.foremost = 1
        elseif arg2 ==# '-w' || arg2 ==# '--width'
          let j += 1
          let new.width = a:000[j]
        elseif arg2 ==# '-h' || arg2 ==# '--height'
          let j += 1
          let new.height = a:000[j]
        elseif arg2 ==# '-t' || arg2 ==# '--title'
          let j += 1
          let new.title = a:000[j]
        elseif arg2 ==# '-r' || arg2 ==# '--right'
          let new.direction='right'
        elseif arg2 ==# '-l' || arg2 ==# '--left'
          let new.direction='left'
        elseif arg2 ==# '-t' || arg2 ==# '--top'
          let new.direction='top'
        elseif arg2 ==# '-b' || arg2 ==# '--bottom'
          let new.direction='bottom'
        endif
        let j += 1
      endwhile
      function! _init(new)
        autocmd! WinResized	* StaticWin --win-resized
        let b:focusable=0
        let b:staticWin=a:new
        " setlocal nobuflisted buftype=nofile
        " setlocal nobuflisted
        " setlocal laststatus=0
        " set laststatus=1
      endfunction
      if new.direction=='right'
        exec "silent vertical new "..new.title
        call _init(new)
        if new.foremost==1
          wincmd L
          if new.width!=-1 | exec "Width "..new.width | endif
          wincmd w
        endif
      elseif new.direction=='left'
        exec "silent vertical new "..new.title
        call _init(new)
        if new.foremost==1
          wincmd H
          if new.width!=-1 | exec "Width "..new.width | endif
          wincmd w
        else
          wincmd x
          wincmd w
        endif
      elseif new.direction=='top'
        exec "silent new "..new.title
        call _init(new)
        if new.foremost==1
          wincmd K
          if new.height!=-1 | exec "Height "..new.height | endif
          wincmd w
        endif
      elseif new.direction=='bottom'
        exec "silent new "..new.title
        call _init(new)
        if new.foremost==1
          wincmd J
          if new.height!=-1 | exec "Height "..new.height | endif
          wincmd w
        else
          wincmd x
          wincmd w
        endif
      endif
      call CD('/')
    elseif arg ==# 'get'
      let i += 1
      function! FindTarget(title)
        for b in tabpagebuflist(tabpagenr())
          let tmp=getbufvar(b, 'staticWin')
          if !empty(tmp) && tmp.title==a:title
            return b
          endif
        endfor
      endfunction
      let bufnr=FindTarget(a:000[i])
      let i += 1
      while i < len(a:000)
        let arg = a:000[i]
        if arg ==# '-t' || arg ==# '--toggle'
        elseif arg ==# '-v' || arg ==# '--visibile' || arg ==# '--show' || arg ==# '--on'
          " call settabvar(tabpagenr(), 'staticWin_visibile', 1)
          " let t:staticWin.visibile=1
          let win=bufwinnr(bufnr)
          exec win.'hide'
        elseif arg ==# '-i' || arg ==# '--invisibile' || arg ==# '--hide' || arg ==# '--off'
          " call settabvar(tabpagenr(), 'staticWin_visibile', 0)
          let t:staticWin.visibile=0
        elseif arg ==# '--text'
          let i += 1
          let text=join(a:000[i:], ' ')
          if bufnr > 0
            call setbufline(bufnr, 1, text)
          endif
        elseif arg ==# '--hide'
          if bufnr > 0
            let win=bufwinnr(bufnr)
            exec win.."windo hide"
            " call setbufline(buf_staticWin.target.bufnr, 1, text)
          endif
        elseif arg ==# '--deal-focus'
          if exists('b:focusable') && b:focusable==0
            wincmd p
          endif
        endif
        let i += 1
      endwhile
    elseif arg ==# '--win-resized'
      if exists('b:staticWin')
        exec "Height "..b:staticWin.height
        exec "Width "..b:staticWin.width
      endif
    elseif arg ==# '--toggle-all'
      " call settabvar(tabpagenr(), 'staticWin_visibile', !gettabvar(tabpagenr(), 'staticWin_visibile'))
      let t:staticWin.visibile_all=!t:staticWin.visibile_all
    endif
  endwhile
  " echo t:staticWin.target
  " echo opts
  " echo t:staticWin
  call cursor(cursorpos[1], cursorpos[2])
endfunction
command! -range -nargs=* StaticWin <line1>,<line2>:call StaticWin(<f-args>)

function! __push_txt(...) range
  let i = 0
  let data=VS()
  while i < len(a:000)
    let arg = a:000[i]
    if arg ==# '-c' || arg ==# '--clipboard'
      " echo "clipboard enabled"
    elseif arg ==# '-r' || arg ==# '--register' || arg ==# '--reg'
      " echo "register enabled"
      if i+1<len(a:000)
        let r=a:000[i+1]
        echo r
        if r !~ '\v^-'
          " echo "parameter found after "..arg .. " " .. r
        " if r ==# '["0123456789acdefghijklmnopqrsuvwxy-*+.:%#/=]'
          let data=getreg('r')
        else
          let data=getreg('"')
        endif
      endif
    elseif arg ==# '-v' || arg ==# '--visual'
      let data=VS()
    elseif arg ==# '-n' || arg ==# '--norm' || arg ==# '--normal'
      let data=VS()
    endif
    let i += 1
  endwhile
  echo data
endfunction
" command! -range -bar -nargs=* RECP :call __push_txt(<f-args>)
" NewMap map <leader>aa :RECP --reg *<cr>
" NewMap map <leader>an :RECP --reg "<cr>
" NewMap map <leader>ab :RECP<cr>

function! Re()
  if exists('g:vim_advantages_got_sourced')
    unlet g:vim_advantages_got_sourced
  endif
endfunction

function! ReEnd()
  let g:vim_advantages_got_sourced='true'
endfunction

function! JumpToNextFile(dir) abort
    " dir = 1  → forward (like Ctrl-I)
    " dir = -1 → backward (like Ctrl-O)
    let jl = getjumplist()
    let jumplist = jl[0]
    let cur_idx = jl[1]
    let current_buf = bufnr('%')
    if a:dir > 0
        " Forward: search from cur_idx + 1 to the end
        let range = range(cur_idx + 1, len(jumplist) - 1)
    else
        " Backward: search from cur_idx - 1 down to 0
        let range = range(cur_idx - 1, 0, -1)
    endif
    for i in range
        let entry = jumplist[i]
        if entry.bufnr != current_buf && entry.bufnr > 0
            " Found a jump in a different file
            let steps = abs(i - cur_idx)
            execute 'normal! ' . steps . (a:dir > 0 ? "\<C-I>" : "\<C-O>")
            return
        endif
    endfor
    " No different file found in that direction
    echo "No more jumps to other files in this direction"
endfunction

let g:hostinfo="host@your-ip"
function! Download_Unreleased()
  echo "Outdated"
  return
  let rem="/home/user/.vim/plugged/vim_configuration/src.unreleased/"
  let loc=rem
  fun! SshD(file) closure
    let c = '!ssh '..g:hostinfo..' "cat '..rem..a:file..'" > '..loc..a:file
    exec c
    echo c
    exec "source "..loc..a:file
  endfunction
  SshD Functions.vim.unreleased
  SshD Functions.vim9.unreleased
" echo expand('%:p:h')
endfunction

function! TESTTEST()
  echo execute('scriptnames')->split('\n')->map({_,v -> v->substitute('^\s*\d\+:\s*','','')})->join('\n')
endfunction

function! VimGrep(count) abort
  " :copen<cr>:vimgrep "" **/*[D[D[D[D[D
  let x=""
  let i=0
  for i in range(a:count)
    let x.="../"
    let i =+ 1
  endfor
  let command=input(':', "vimgrep \"\" "..x.."**/*\<Home>\<Right>\<Right>\<Right>\<Right>\<Right>\<Right>\<Right>\<Right>\<Right>")
  exec command
  copen
endfunction

" function! ExampleGrep()
"   return
"   grep pattern **/*.vim
"   vimgrep pattern **/*.vim
"   copen
"   cdo s/pattern/text/gc
"   cdo s/pattern/text/g
"   cfdo %s/pattern/text/gc
"   cfdo %s/pattern/text/g
"   wall
"   cfdo update
"
"   cfirst
"   %s/pattern/text/gc
"   cnext
"   %s/pattern/text/gc
"
"   grep pattern *.lua
"   cdo s//NewPattern/gc \| update
"
"   " not tested
"   lgrep function -> call src/js/**/*.js
"   cfdo %s//new/g | lupdate
"
"   " // replace last search pattern
"   cdo s//new/gce | update
"   " e flag (no error message when nothing found)
"   grep -i
"   " -i setignore case
"   set ignorecase
"   " ripgrep / ag / git-grep are much faster
"   if executable('rg')
"     set grepprg=rg\ --vimgrep\ --smart-case
"     set grepformat=%f:%l:%c:%m:,%f:%l:%m
"   endif
"   cdo s//newpattern/gc
"   " press a for abort
"
"   cdo s//new/g | w!
"   set nobackup nowritebackup " temporarily
"   set backup& writebackup&
"
"   cfdo %s//new/gc | update
"
"   " but the best solution is
"   set hidden
" endfunction

" call Print("message")
" call vim9#Print2("message")
" vim9cmd vim9#Print("MEEESSAGE")
" vim9cmd vim9#Print2("MEEESSAGE")
" finish

" Development is progressing slowly due to an important decision-making stage.
" 0.03% Chance This Will Even Work

" Returns something close to mapping notation (best-effort)
" Works well for ascii, <C-a>–<C-z>, <F1>–<F12>, <C-F1> in many terminals

func! NEW()
  vnew | put=getbufline('#', 1, '$')
endfunction
command! -bar -nargs=0 NEW :call NEW()

func! SystemClipboard()
  let @+ = @:
endfun

func! PutCommand(nr=0)
  " put=":
  " put :
  if a:nr == 0
    let nnr=1
  else
    let nnr=a:nr
  endif
  let x=join(map(range(histnr(':')-nnr, histnr(':')-1), "histget(':', v:val)"), "\n")
  put=x
endfun

function! GrepSplit(args)
  NEW | exec '%!grep "'..a:args..'"' | exec '%!sort | uniq'
endfunction

func! Key2Notation(key) abort
    if type(a:key) == v:t_number
        let nr = a:key
        let c = nr2char(nr)
    else
        let c = a:key           " already string from getcharstr()
        let nr = char2nr(c)
    endif

    if nr >= 0 && nr <= 31
        " Ctrl + letter/symbol
        if nr == 0      | return '<Nul>'     | endif
        if nr == 27     | return '<Esc>'     | endif
        let letter = nr2char(nr + 64)       " 1 → A, 2 → B, …
        return '<C-' .. toupper(letter) .. '>'
    endif

    if c =~ '^[[:print:]]$'
        if c == ' '     | return '<Space>'   | endif
        if c == "\<Tab>"| return '<Tab>'     | endif
        return c
    endif

    " Try to guess function keys / modified fx from common term sequences
    " (very incomplete – terminals differ!)
    let seq = substitute(c, "\<", '', 'g')   " just in case

    if seq =~# '^[[1;[1-9]*[A-HOPZ~]$' || seq =~# '^O[A-Z]' || seq =~# '^\[\[.\+$'
        " Many <Fx>, <S-Fx>, <C-Fx> land here
        return '<' .. substitute(seq, '^[^[]*\[\[=\?', '', '') .. '>'   " crude
    endif

    " Fallback: show hex escape
    let hex = ''
    for i in range(0, strlen(c)-1)
        let hex ..= printf('\x%02x', char2nr(c[i]))
    endfor
    return printf('<%s>', hex)
endfunc

" Usage example
nnoremap <leader>K :<C-u>call ShowKeyNotation()<CR>

func! ShowKeyNotation() abort
    echon 'Press key/combo → '
    let k = getcharstr()
    redraw
    echo 'getcharstr() → ' .. string(k)
    echo 'Best-guess mapping notation → ' .. Key2Notation(k)
endfunc

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

function! Folder_Repo_Or_Project_Only()
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

" TODO Also Consider g:projects to check agains if its a "repo" not only .git
" containing folders
function! Folder_Repo(count, nr)
  let file = -1
  let c=a:count+a:nr
  let i = 0
  let file = w:git
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

function! RgDir(args)
  call fzf#vim#grep('rg --column --line-number --color=always --smart-case --files '.shellescape(split(a:args)[0]))

endfunction
command! -bang -nargs=* -complete=dir RgDir :call RgDir(<q-args>)
nnoremap <leader>rg :RgDir<space>

function! AgIn(path)
  let g:temporaryfix=0
  call fzf#vim#ag('', {'dir': a:path})
  unlet g:temporaryfix
endfunction
command! -nargs=+ -complete=dir AgIn call AgIn(<f-args>)

function! ColorScheme()
  colorscheme blue
  colorscheme darkblue
  colorscheme default
  colorscheme delek
  colorscheme desert
  colorscheme elflord
  colorscheme evening
  colorscheme habamax
  colorscheme industry
  colorscheme koehler
  colorscheme lunaperche
  colorscheme morning
  colorscheme murphy
  colorscheme pablo
  colorscheme peachpuff
  colorscheme quiet
  colorscheme retrobox
  colorscheme ron
  colorscheme shine
  colorscheme slate
  colorscheme sorbet
  colorscheme torte
  colorscheme wildcharm
  colorscheme zaibatsu
  colorscheme zellner
  colorscheme blue
  colorscheme default
  colorscheme elflord
  colorscheme industry
  colorscheme koehler
  colorscheme morning
  colorscheme slate
  colorscheme pablo
  colorscheme peachpuff
  colorscheme ron
  colorscheme shine
  colorscheme torte
  colorscheme zellner
  colorscheme darkblue
  colorscheme murphy
  colorscheme evening
  colorscheme desert
  colorscheme delek
  colorscheme slate
  colorscheme habamax
endfunction
colorscheme desert

fun! CloseOther()
  let win=winnr()
  let max_win=winnr('$')
  let arr=range(1,max_win)
  call filter(arr, 'v:val != '..win)
  " exec arr..'windo echo winnr()'
  for id in reverse(arr)
    " echo id
    " if win_id2win(id) > 0
    " endif
    let b=winbufnr(id)
    execute id.'wincmd q'
    execute b.'bd'
  endfor
endf
map <F12> :call CloseOther()<cr>
map <leader>p :DecidePush<cr>

function! Help()
  " if getbufvar(bufnr(), '&buftype') == 'terminal'
  "   echo "Terminal"
  " elseif getbufvar(bufnr(), '&buftype') == 'buffer'
  "   echo "Buffer"
  " endif
  echo "F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12"
endfunction

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " "
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else
            if getline('.') =~ "^\\s*" . comment_leader
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
    if GetMode()=="Visual"
      norm gv
    endif
endfunction

function! DeleteFile()
  let file=expand('%')
  let sure=input('Deleting File '.file.'. Are you sure? [type yes] ')
  if sure == "yes"
    redraw!
    call delete(file)
    bd
  endif
endfunction

function! JoinSplits(dir)
  " call win_gotoid(win_getid(winnr('l')))
  " call win_gotoid(win_getid(winnr('1l')))
  let total=winnr('$')
  let winid=win_getid()
  let target=winnr(a:dir)
  let buf=bufnr()
  " echo "total:" total
    \.", win:"win
    \.", target:"target
    \.", a:dir:"a:dir
  " exec "wincmd"a:dir
  " exec target'windo echo winnr()'
  exec "wincmd"a:dir
  split
  exec "b"buf
  let new_winid=win_getid()
  call win_gotoid(winid) | close
  call win_gotoid(new_winid)
endfunction

function! NewWindow(direction)
  echo "Implement NewWindow"
  if a:direction ==# "H" || a:direction ==# "h"
    vsplit
    <C-S-l>
  elseif a:direction ==# "J" || a:direction ==# "j"
  elseif a:direction ==# "K" || a:direction ==# "k"
  elseif a:direction ==# "L" || a:direction ==# "l"
  endif
endfunction

function! MoveOutOfSplit(dir)
  echo "Implement MoveOutOfSplit"
  let target=winnr(a:dir)
  let bufnr=bufnr()

  let opposite_direction=['l','k','j','h'][index(['h','j','k','l'], a:dir)]]
  if target==winnr()
    exec 'wincmd '..toupper(dir)
  else
    " exec winnr()..'wincmd q'
    wincmd q
    exec 'wincmd '..dir
    exec 'b'..bufnr
  endif
endfunction

function! DebugPaths()
  echo "CWD          "CWD()
  echo "POINTER     "POINTER()
  echo "POINTER_DIR "POINTER_DIR()
  echo "RELATIVE     "RELATIVE()
  echo "RELATIVE_DIR "RELATIVE_DIR()
  echo "ABSOLUTE     "ABSOLUTE()
  echo "ABSOLUTE_DIR "ABSOLUTE_DIR()
endfunction

function! NewFile()
  let path=POINTER_DIR().'/'
  let node = input('New File:  ['..path..']  ', path, 'file')
  call _newfile_andCD(node)
endfunction

" Environment
function! __dump(obj)
  return l:
endfunction
function! __load(json)
  let l:=a:json
endfunction

function! SaveDict(file, dict)
  call writefile([json_encode(a:dict)], a:file)
endfunction

function! LoadDict(file)
  return json_decode(join(readfile(a:file), "\n"))
endfunction

function! FindProjects()
  let list=systemlist("find . -name .git -type d")
  echo list
endfunction

function! Pretty(x, ...) abort
  let indent = get(a:000, 0, 0)
  let pad    = repeat(' ', indent)
  let pad2   = repeat(' ', indent + 2)
  if type(a:x) == v:t_dict
    if empty(a:x)
      return '{}'
    endif
    let lines = []
    for [key, val] in items(a:x)
      call add(lines, pad2 . string(key) . ': ' . Pretty(val, indent + 2))
    endfor
    return "{\n" . join(lines, ",\n") . "\n" . pad . "}"
  elseif type(a:x) == v:t_list
    if empty(a:x)
      return '[]'
    endif
    let lines = []
    for val in a:x
      call add(lines, pad2 . Pretty(val, indent + 2))
    endfor
    return "[\n" . join(lines, ",\n") . "\n" . pad . "]"
  elseif type(a:x) == v:t_string
    " Escape control chars so the cmdline can't misinterpret them
    let s = a:x
    let s = substitute(s, "\r", '\\r', 'g')
    let s = substitute(s, "\n", '\\n', 'g')
    let s = substitute(s, "\t", '\\t', 'g')
    return string(s)
  else
    " number, float, bool, funcref, etc.
    return string(a:x)
  endif
endfunction

function! J(x)
  return json_encode(a:x)
endfunction

function! CountWindowsInDirection(direction)
  let i = 0
  let last_win=winnr()
  while v:true
    " let next_win=winbufnr(winnr(i..a:direction))
    let next_win = winnr(i+1..a:direction)
    if next_win == last_win
      return i
    endif
    let last_win = next_win
    let i += 1
  endwhile
endfunction

function! DirectionBufWin(direction)
  return winbufnr(winnr(a:direction))
endfunction

function! GetBufDirectionIfTermDirect(direction)
  let win=DirectionBufWin(a:direction)
  if BufIsTerminal(win)
    return win
  " return [win, BufIsTerminal(win)]
  else
    return -1
  endif
endfunction

function! GetBufDirectionIfTerm(direction)
  for i in range(0, CountWindowsInDirection(a:direction))
    let win=DirectionBufWin(i+1..a:direction)
    if BufIsTerminal(win)
      return win
    endif
  endfor
  return -1
endfunction

function! FindSomeTerm()
  for dir in [ 'k', 'h', 'l', 'j' ]
    let buf = GetBufDirectionIfTerm(dir)
    if buf!=-1
      return [dir,buf]
    endif
  endfor
  return [ -1, -1 ]
endfunction

function! BufType(nr)
  echo getbufvar(a:nr, 'buftype')
endfunction

function! BufIsBuffer(nr)
  if getbufvar(a:nr, '&buftype') == 'buffer'
    return 1
  endif
  return 0
endfunction

function! BufIsTerminal(nr)
  if getbufvar(a:nr, '&buftype') == 'terminal'
    return 1
  endif
  return 0
endfunction

function! GetTargetTerm(direction)
  " if exists("b:target_term_fixed")
  "   return b:target_term_fixed
  " endif
  " if exists("b:target_term")
  "   return b:target_term
  " endif
  return SearchTargetTerm(a:direction)
endfunction

function! GetDirection(key)
  let directions={
    \  'F5': 'h',
    \  'F6': 'j',
    \  'F7': 'k',
    \  'F8': 'l'
    \}
  return directions[a:key]
endfunction

function! SearchTargetTerm(direction)
  let b:target_term=GetBufDirectionIfTerm(a:direction)
  return b:target_term
endfunction

function! FixTargetTerm(key)
  let directions={
    \  'F5': 'h',
    \  'F6': 'j',
    \  'F7': 'k',
    \  'F8': 'l'
    \}
  " if !exists("b:target_term")
  let direction=directions[a:key]
  " let win=DirectionBufWin(direction)
  " echo getbufvar(buf, )
  " echo direction buf
  " echo DirectionBufUntilTermOrEnd(direction)
  " echo CountWindowsInDirection(direction)
  " echo GetWinTermDirection(direction)
  let b:target_term_fixed=GetBufDirectionIfTerm(direction)
  " if BufIsTerminal(buf)
  "   let b:target_term=buf
  " else
  "   echo "Not A Terminal On"direction
  " endif
  " else
  "   echo b:target_term
  " endif
endfunction

function! ToArrayIfIsnt(data)
  if type(a:data)!=3
    return [a:data]
  endif
  return a:data
endfunction

map <leader>x :if exists("b:target_term") \| unlet b:target_term \| endif<cr>
function! List_CWD_OpenedWindows()
  let list = []
  for nr in range(1,winnr('$'))
    call extend(list, [getwinvar(nr, 'cwd')])
  endfor
  return list
endfunction

function! BuildString_Find_All_CWDS_slow(cwds)
  let out=""
  let len=len(a:cwds)
  let range=range(1,len)
  let i = 1
  while i < len
    let out=out.a:cwds[i]
    if i<len-1
      let out=out.' '
    endif
    let i+=1
	endwhile
  " echo out
  return 'find '.out.' -type f -name ="*.sh"'
endfunction

function! BuildString_Find_All_CWDS(cwds, pattern, postfix='')
  let cwds=uniq(uniq(a:cwds))
  let out=""
  let len=len(cwds)
  let range=range(1,len)
  let i = 1
  while i < len
    " if len>1 && i==1
    "   let out=out..'.,'
    " endif
    let out=out.cwds[i]..'/'..a:postfix
    " ..'/**'
    if i<len-1
      let out=out.','
    endif
    let i+=1
	endwhile
  " exec 'set path='..out
  " set path?
  " find *.sh
  return globpath(out, a:pattern)
endfunction

function! SelectTerm(keymap)
  if a:keymap=~#"F[1234]"
    echo "tab"
  elseif a:keymap=~#"F[5678]"
    echo "win"
  endif
endfunction

function! SelectCommand_callback(id, code, register)
  echo "Not Implemented"
endfunction

function! SelectCommand(keymap, info='')
  let Callback=function('SelectCommand_callback', ["window"])
  let list=[ 'Data', 'More Data', 'Data For The List' ]
  call SelectCommandPopup("Commands: ", list, Callback)
  return
  if a:keymap=~#"F[1234]"
    echo "tab"
  elseif a:keymap=~#"F[5678]"
    echo "win"
  endif
  " function! SelectCommand()
  "   let Callback=function('OpenFile_callback', ["window"])
  "   call FZFPopup("Open file: ", "file", CWD(), Callback)
  " endfunction
endfunction

" function! ConfigureExecute(keymap, shift=0, control=0, alt=0)
"   let vs=VS()
"   " echo a:shift a:control
"   " a:alt
"   call SelectCommand(a:keymap,"")
" endfunction

function! GetRepoLocation()
  if w:git!=-1
    return w:git
  else
    return getcwd()
  endif
endfunction

function! GetVimJsonLocation()
  if w:git!=-1
    return w:git.."/vim.json"
  else
    return (getcwd()=='/' ? getcwd() : getcwd()..'/').."vim.json"
  endif
endfunction

function! Execute2(keymap, shift=0, control=0, alt=0)
  echo "TEST"
  return
  " Example Execution Manager Data Structure
  let pocket={
    \ "mappings": [
      \ { "key": "F1", "command": "ls -al", "cc": 1, "cr": 1 },
      \ { "key": "F2", "command": "ls -al", "cc": 1, "cr": 0 },
      \ { "key": "F3", "command": "ls -al", "cc": 1, "cr": 0 },
      \ { "key": "F4", "command": "ls -al", "cc": 1, "cr": 0 },
    \ ],
    \ "commands": [
    \ { "name": "Build Uploader", "cmd": "source file.sh" },
    \ { "name": "Run Uploader", "cmd": "source file.sh" },
    \ { "name": "Test Uploader", "cmd": "source file.sh" },
    \ { "name": "Push Uploader", "cmd": "source file.sh" },
    \]
  \ }
  echo Format(pocket)
  " call DebugPaths()
  " echo RELATIVE_DIR()
  let holder=[]
  let cwds=uniq(List_CWD_OpenedWindows())
  let cmd=BuildString_Find_All_CWDS(cwds, '*.sh')
  let build=BuildString_Find_All_CWDS(cwds, 'build')
  let run=BuildString_Find_All_CWDS(cwds, 'run')
  let json=BuildString_Find_All_CWDS(cwds, 'vim.json')
  let new='new'
  call extend(holder,[cwds])
  call extend(holder,[cmd])
  call extend(holder,[build])
  call extend(holder,[run])
  call extend(holder,[json])
  call extend(holder,[new])
  echo Format(holder)
  let file=GetVimJsonLocation()
  call SaveDict(file, pocket)
  let loaded=LoadDict(file)
  echo loaded
  " echo cmd build run json
  " let vs=VS()
  "let cmd3=BuildString_Find_All_CWDS(cwds, 'run', '**')
  " let sh_files=systemlist(cmd)
  " echo sh_files
  " let [ key, leaders, fkey, vs ] = UtilHelper(a:keymap)
  " echo a:keymap
endfunction

hi QuickFixLine ctermbg=Yellow guibg=Yellow
function! COTests()
  " lopen copen cclose lclose cwindow height lwindow height cbottom lbottom
  " botright cwindow
  " botleft
	" au BufReadPost quickfix  setlocal modifiable
	" 	\ | silent exe 'g/^/s//\=line(".") .. " "/'
	" 	\ | setlocal nomodifiable
	" echo getqflist({'winid' : 1}).winid
	" echo getloclist(2, {'winid' : 1}).winid
  "  " get the title of the current quickfix list
  "  :echo getqflist({'title' : 0}).title
  "  " get the identifier of the current quickfix list
  "  :let qfid = getqflist({'id' : 0}).id
  "  " get the identifier of the fourth quickfix list in the stack
  "  :let qfid = getqflist({'nr' : 4, 'id' : 0}).id
  "  " check whether a quickfix list with a specific identifier exists
  "  :if getqflist({'id' : qfid}).id == qfid
  "  " get the index of the current quickfix list in the stack
  "  :let qfnum = getqflist({'nr' : 0}).nr
  "  " get the items of a quickfix list specified by an identifier
  "  :echo getqflist({'id' : qfid, 'items' : 0}).items
  "  " get the number of entries in a quickfix list specified by an id
  "  :echo getqflist({'id' : qfid, 'size' : 0}).size
  "  " get the context of the third quickfix list in the stack
  "  :echo getqflist({'nr' : 3, 'context' : 0}).context
  "  " get the number of quickfix lists in the stack
  "  :echo getqflist({'nr' : '$'}).nr
  "  " get the number of times the current quickfix list is changed
  "  :echo getqflist({'changedtick' : 0}).changedtick
  "  " get the current entry in a quickfix list specified by an identifier
  "  :echo getqflist({'id' : qfid, 'idx' : 0}).idx
  "  " get all the quickfix list attributes using an identifier
  "  :echo getqflist({'id' : qfid, 'all' : 0})
  "  " parse text from a List of lines and return a quickfix list
  "  :let myList = ["a.java:10:L10", "b.java:20:L20"]
  "  :echo getqflist({'lines' : myList}).items
  "  " parse text using a custom 'efm' and return a quickfix list
  "  :echo getqflist({'lines' : ['a.c#10#Line 10'], 'efm':'%f#%l#%m'}).items
  "  " get the quickfix list window id
  "  :echo getqflist({'winid' : 0}).winid
  "  " get the quickfix list window buffer number
  "  :echo getqflist({'qfbufnr' : 0}).qfbufnr
  "  " get the context of the current location list
  "  :echo getloclist(0, {'context' : 0}).context
  "  " get the location list window id of the third window
  "  :echo getloclist(3, {'winid' : 0}).winid
  "  " get the location list window buffer number of the third window
  "  :echo getloclist(3, {'qfbufnr' : 0}).qfbufnr
  "  " get the file window id of a location list window (winnr: 4)
  "  :echo getloclist(4, {'filewinid' : 0}).filewinid
<
	"						*setqflist-examples*
Th"e |setqflist()| and |setloclist()| functions can be used to set the various
at"tributes of a quickfix and location list respectively. Some examples for
us"ing these functions are below:
>
  "  " create an empty quickfix list with a title and a context
  "  :let t = 'Search results'
  "  :let c = {'cmd' : 'grep'}
  "  :call setqflist([], ' ', {'title' : t, 'context' : c})
  "  " set the title of the current quickfix list
  "  :call setqflist([], 'a', {'title' : 'Mytitle'})
  "  " change the current entry in the list specified by an identifier
  "  :call setqflist([], 'a', {'id' : qfid, 'idx' : 10})
  "  " set the context of a quickfix list specified by an identifier
  "  :call setqflist([], 'a', {'id' : qfid, 'context' : {'val' : 100}})
  "  " create a new quickfix list from a command output
  "  :call setqflist([], ' ', {'lines' : systemlist('grep -Hn main *.c')})
  "  " parse text using a custom efm and add to a particular quickfix list
  "  :call setqflist([], 'a', {'id' : qfid,
	"	\ 'lines' : ["a.c#10#L10", "b.c#20#L20"], 'efm':'%f#%l#%m'})
  "  " add items to the quickfix list specified by an identifier
  "  :let newItems = [{'filename' : 'a.txt', 'lnum' : 10, 'text' : "Apple"},
	"	    \ {'filename' : 'b.txt', 'lnum' : 20, 'text' : "Orange"}]
  "  :call setqflist([], 'a', {'id' : qfid, 'items' : newItems})
  "  " empty a quickfix list specified by an identifier
  "  :call setqflist([], 'r', {'id' : qfid, 'items' : []})
  "  " free all the quickfix lists in the stack
  "  :call setqflist([], 'f')
  "  " set the title of the fourth quickfix list
  "  :call setqflist([], 'a', {'nr' : 4, 'title' : 'SomeTitle'})
  "  " create a new quickfix list at the end of the stack
  "  :call setqflist([], ' ', {'nr' : '$',
	"		\ 'lines' : systemlist('grep -Hn class *.java')})
  "  " create a new location list from a command output
  "  :call setloclist(0, [], ' ', {'lines' : systemlist('grep -Hn main *.c')})
  "  " replace the location list entries for the third window
  "  :call setloclist(3, [], 'r', {'items' : newItems})
  let l:cmd = g:bashrc_source..'; wakeup 0 0 2'
  call job_start(l:cmd, {
    \ 'out_cb': {channel, msg -> execute('cgetexpr msg')},
    \ 'close_cb': {channel -> execute('lopen')},
    \ })
endfunction
" map <C-F8> :call COTests()<cr>
" unmap <C-F8>

function! GitCheckoutPrevback()
endfunction

function! GitCheckoutPrevbackCWD()
endfunction

function! GitCheckoutPrevnext()
endfunction

function! GitCheckoutPrevnextCWD()
endfunction

function! GitSwitch(branch)
  let x=systemlist("cd "..CWD().."; git switch "..a:branch)
  for i in x
    echo i
  endfor
  call DebugCommand(x)
  call DebugCommand(w:gitBranchList)
endfunction
command! -range -nargs=1 Switch <line1>,<line2>:call GitSwitch(<q-args>)

if !exists("g:lastStash")
  let g:lastStash=""
endif
function! GitStashPushAutoStash(...)
  " GetOpt2 --auto
  let message="stash-"..NewUUID()
  let g:lastStash=message
  " Add Stash UUID Functionality
  " Add UUID
  let x = systemlist("git stash push -m "..message)
  if !empty(expand('%'))
    e %
  endif
  " " call Debug(1, 0, x)
endfunction
command! -range -nargs=0 GitStashPushAutoStash <line1>,<line2>:call GitStashPushAutoStash(<q-args>)

function! GitStashPopAutoStash(...)
  " GetOpt2 --auto
  " Add Stash UUID Functionality
  " Check If git stash list Contains UUID
  " Remove UUID after POP
  let stashes=systemlist('git stash list')
  " for stash in filter(stashes,'v:val=~"'..g:lastStash..'"')
  " echo stashes
  " echo filter(copy(stashes),'v:val=~".*On.*stash-\\d\\{10}"')
  for stash in filter(copy(stashes),'v:val=~".*On.*stash-\\d\\{10}"')
    let name=substitute(stash,':.*',"","")
    " echo "git stash pop "..name
    let x = systemlist("git stash pop "..name)
    """ Debug
    """ for line in x
    """   echo line
    """ endfor
    if exists("g:lastStash")
      unlet g:lastStash
    endif
  endfor
  if !empty(expand('%'))
    e %
  endif
endfunction
command! -range -nargs=0 GitStashPopAutoStash <line1>,<line2>:call GitStashPopAutoStash(<q-args>)

function! GitStashPush()
  " Todo Add Message Argument
  !git stash push
endfunction
command! -range -nargs=0 GitStashPush <line1>,<line2>:call GitStashPush(<q-args>)

function! GitStashPop()
  " Todo Add Message Argument
  !git stash pop
endfunction
command! -range -nargs=0 GitStashPop <line1>,<line2>:call GitStashPop(<q-args>)

function! GitStashDrop()
  " Todo Add Message Argument
  !git stash drop
endfunction
command! -range -nargs=0 GitStashDrop <line1>,<line2>:call GitStashDrop(<q-args>)

function! GitStashCWD()
endfunction

function! GitApplyStash()
endfunction

command! -range -nargs=? Push <line1>,<line2>:call Push(<q-args>)
function! Push(commitmessage='')
  GitStatus
  GitAdd
  GitStatus
  " call system("read")
  " call input("Procceed? [<CR> Yes] [<C-c> Cancel]")
  call GitCommit(a:commitmessage)
  DecidePush
endfunction

command! -range -nargs=* DecidePush <line1>,<line2>:call DecidePush(<q-args>)
function! DecidePush(...)
  if IsGithubPush()
    call Github('push '..w:gitRemote..' '..w:gitBranch)
  else
    GitPush
  endif
  call AllStatusline()
endfunction

function! AllStatusline()
  let winnr=winnr()
  windo call Statusline()
  while winnr!=winnr()
    wincmd w
  endwhile
endfunction

function! GitDeleteBranchOnRemote(...)
  let args=join(a:000, ' ')
  if args==''
    " echo 'push '..w:gitRemote..' --delete '..w:gitBranch
    call Github('push '..w:gitRemote..' --delete '..w:gitBranch)
  else
    let remote=split(args, ' ')[0]
    let branch=split(args, ' ')[1]
    " echo 'push '..remote..' --delete '..branch
    call Github('push '..remote..' --delete '..branch)
  endif
  " GetOpts
  " --current (default)
  " :GitDeleteBranchOnRemoteOnRemote list
  " :GitDeleteBranchOnRemoteOnRemote --current
endfunction
command! -range -nargs=* GitDeleteBranchOnRemote <line1>,<line2>:call GitDeleteBranchOnRemote(<q-args>)

function! GitDeleteLastUnpushedCommit(...)
  let x = systemlist('git reset --soft HEAD~1')
  for y in x
    echo y
  endfor
endfunction
command! -range -nargs=* GitDeleteLastUnpushedCommit <line1>,<line2>:call GitDeleteLastUnpushedCommit(<q-args>)

function! GitDeleteInitialCommit(...)
  let x = systemlist('git update-ref -d HEAD')
  for y in x
    echo y
  endfor
endfunction
command! -range -nargs=* GitDeleteInitialCommit <line1>,<line2>:call GitDeleteInitialCommit(<q-args>)

command! -range -nargs=* Fetch <line1>,<line2>:call Fetch(<q-args>)
function! Fetch(remote='', branch='')
  let remote=a:remote
  if remote==''
    let remote=w:gitRemote
  endif
  let branch=a:branch
  if branch==''
    let branch=''
  endif
  let command="git fetch "..remote.." "..branch
  exec "!"..command
endfunction

function CleanEmptyArrayElements(arr)
  return filter(copy(a:arr), 'v:val != "^\ \*$"')
endfunction

command! -range -nargs=* Clone <line1>,<line2>:call Clone(<f-args>)
function! Clone(...)
  let clone_args=join(CleanEmptyArrayElements(a:000),' ')
  let clone_command="git clone "..clone_args
  let out=systemlist(clone_command)
  for o in out
    echo o
  endfor
endfunction

command! -range -nargs=* Pull <line1>,<line2>:call Pull(<q-args>)
function! Pull(...)
  let args=join(a:000, ' ')
  if args==''
    let pull_args=w:gitRemote.." "..w:gitBranch
  else
    let pull_args=join(a:000, ' ')
  endif
  " Todo GetOpts
  " GitStatus
  let pull_command="git pull "..pull_args.." --rebase"
  GitStashPushAutoStash
  let out=systemlist(pull_command)
  for o in out
    echo o
  endfor
  GitStashPopAutoStash
endfunction

" todo Github push -u github wurzeltal:main
" todo Github push github main

command! -range -nargs=? Stash <line1>,<line2>:call Stash(<q-args>)
function! Stash(commitmessage='')
  GitStatus
  let opts = #{
        \ verbose: 0,
        \ output: '',
        \ force: 0
        \ }
  echo opts
  return
  let i = 0
  while i < a:0
    let arg = a:000[i]
    if arg =~# '^--\?\w'
      if arg ==# '-v' || arg ==# '--verbose'
          let opts.verbose = 1
      elseif arg ==# '-f' || arg ==# '--force'
      endif
    endif
    let i += 1
  endwhile
  !git stash
endfunction

command! -range -nargs=? StashPush <line1>,<line2>:call StashPush(<q-args>)
function! StashPush(commitmessage='')
  " GitStatus
  !git stash push
endfunction

command! -range -nargs=? StashPop <line1>,<line2>:call StashPop(<q-args>)
function! StashPop(commitmessage='')
  " GitStatus
  !git stash pop
endfunction

command! -range -nargs=? PushRepo <line1>,<line2>:call PushRepo(<args>)
function! PushRepo(commitmessage='')
  GitStatus
  GitAddRepo
  call GitCommit(a:commitmessage)
  DecidePush
endfunction

function! Fetch_Last_Git_Message()
  if exists("b:isGitRepo") && b:isGitRepo=='true'
    let g:lastcommitmessage=systemlist('git log -1 --pretty=%B | head -n 1')[0]
  endif
endfunction

if !exists("g:set_git_message")
  let g:set_git_message=1
endif

function! Toggle_Set_Last_Git_Message()
  let g:set_git_message=!g:set_git_message
endfunction

if !exists("g:lastmessage")
  call Fetch_Last_Git_Message()
endif

function! UpdateLastCommitMessageWhenChanged(commitmessage='')
  if exists('g:lastcommitmessage')
    let message = input("Commit with Message: ['".g:lastcommitmessage."']  ")
    if message != ''
      let g:lastcommitmessage = message
    endif
  else
    echo "g:lastcommitmessage does not exists"
  endif
endfunction

command! -range -nargs=0 GitMessage <line1>,<line2>:call GitMessage()
function! GitMessage(commitmessage='')
  call Fetch_Last_Git_Message()
  if g:set_git_message
    if a:commitmessage==''
      call UpdateLastCommitMessageWhenChanged()
    endif
  endif
endfunction

command! -range -nargs=* PushCWD <line1>,<line2>:call PushCWD(<q-args>)
function! PushCWD(commitmessage='')
  " GitStatus
  GitAddCWD
  call GitCommit(a:commitmessage)
  " GitStatus
  DecidePush
endfunction

function! GetOptExample(...) abort
    let opts = #{verbose: 0, output: '', force: 0}
    let files = []
    let i = 0
    while i < a:0
        let arg = a:000[i]
        if arg =~# '^--\?\w'
            if arg ==# '-v' || arg ==# '--verbose'
                let opts.verbose = 1
            elseif arg ==# '-f' || arg ==# '--force'
                let opts.force = 1
            elseif arg =~# '^-\?-\?o\(utput\)\?='
                " Handle -o=value or --output=value
                let val = substitute(arg, '^-\?-\?o\(utput\)\?=', '', '')
                if empty(val)
                    let i += 1
                    let val = a:000[i]
                endif
                let opts.output = val
            elseif arg ==# '-o' || arg ==# '--output'
                let i += 1
                let opts.output = a:000[i]
            else
                echoerr "Unknown option: " .. arg
                return
            endif
        else
            call add(files, arg)
        endif
        let i += 1
    endwhile
    " Use opts and files...
    if opts.verbose
        echo "Running in verbose mode"
    endif
endfunction

function! GitMerge(branch)
  " !git merge --rebase
  " exec '!clear && git merge '..a:branch..' --no-commit --no-ff'
  exec '!clear && git merge '..a:branch..' --rebase'
endfunction
command! -range -nargs=* Merge <line1>,<line2>:call GitMerge(<f-args>)

command! -range -nargs=0 GitUnshallow <line1>,<line2>:call GitUnshallow()
function! GitUnshallow()
  !clear && git fetch --unshallow github
endfunction

function! GitInitRepositoryBare()
  !git init --bare
  !git config --file config http.receivepack true
  !git symbolic-ref HEAD refs/heads/main
endfunction

function! Install()
  SystemctlReload
  let $service_file=expand('%')
  echo $service_file
  !install_service() {
  \ sudo ln -s -t /etc/systemd/system `realpath $1`;
  \ };
  \install_service $service_file;
endfunction
command! -range -nargs=0 Install :call Install()

function! Enable()
  SystemctlReload
  let $service_file=expand('%:r')
  echo $service_file
  !enable_service() {
  \ sudo systemctl enable $1;
  \ };
  \enable_service $service_file;
endfunction
command! -range -nargs=0 Enable :call Enable()

function! ReloadFile()
  try
    silent e %
  catch
  finally
  endtry
endfunction
command! -range -nargs=0 Rel :call ReloadFile()

function! SystemctlReload()
  !reload_services() {
  \ sudo systemctl daemon-reload;
  \ };
  \reload_services;
endfunction
command! -range -nargs=0 SystemctlReload :call SystemctlReload()

function! Start()
  SystemctlReload
  let $service_file=expand('%:r')
  echo $service_file
  !start_service() {
  \ sudo systemctl start $1;
  \ };
  \start_service $service_file;
endfunction
command! -range -nargs=0 Start :call Start()

function! Stop()
  SystemctlReload
  let $service_file=expand('%:r')
  echo $service_file
  !stop_service() {
  \ sudo systemctl stop $1;
  \ };
  \stop_service $service_file;
endfunction
command! -range -nargs=0 Stop :call Stop()

function! Status()
  SystemctlReload
  let $service_file=expand('%:r')
  echo $service_file
  !status_service() {
  \ sudo systemctl status $1;
  \ };
  \status_service $service_file;
endfunction
command! -range -nargs=0 Status :call Status(<f-args>)



function! GitInitRepository()
  let output=systemlist("git init")
  " ; git branch -m "..a:branch
  echo output
  call UpdateGit()
  call Statusline()
endfunction

command! -range -nargs=* GitDiff <line1>,<line2>:call GitDiff(<f-args>)
command! -range -nargs=* Diff <line1>,<line2>:call GitDiff(<f-args>)
function! GitDiff(...)
  " Use GetOpt2
  " GitStatus
  let cmd = #{text: '--text', pager: '', cached: '', file: '%', post: '', repo: ''}
  let i = 0
  while i < len(a:000)
    let arg = a:000[i]
    if arg ==# '-a' || arg ==# '--all'
      let cmd.file=''
    elseif arg ==# '-t' || arg ==# '--text'
      let cmd.text='--text'
    elseif arg ==# '-n' || arg ==# '--no-text'
      let cmd.text=''
    elseif arg ==# '-p' || arg ==# '--no-pager'
      let cmd.pager=''
    elseif arg ==# '-c' || arg ==# '--cached'
      let cmd.cached='--cached'
    elseif arg ==# '--post'
      let cmd.post=a:000[i+1]
      let i+=1
    elseif arg==#'-l' || arg==# '--local'
      let cmd.repo=''
    elseif arg==#'-r' || arg==# '--remote'
      let cmd.repo=w:gitRemote.."/"..w:gitBranch
    endif
    let i += 1
  endwhile
  " !clear && git --no-pager diff --text %
  " !clear && git diff --text %
  " !clear && git diff --cached --text %
  " let args=join([ cmd.text, cmd.pager, cmd.cached, cmd.file ], ' ')
  echo cmd
  let x = [ cmd.text, cmd.pager, cmd.cached, cmd.file ]
  let cleaned=filter(x, 'v:val != "^\\s*$"')
  " exec "!clear && git diff "..join(cleaned, ' ')
  " exec "!clear && git diff "..w:gitRemote.."/"..w:gitBranch.." "..join(cleaned, ' ')
  " echo "!clear && git diff "..cmd.repo.." "..cmd.post.." "..join(cleaned, ' ')
  exec "!clear && git diff "..cmd.repo.." "..cmd.post.." "..join(cleaned, ' ')
  " exec "!clear && git diff "..w:gitBranch.." "..w:gitRemote.."/"..w:gitBranch.." "..join(cleaned, ' ')
  " let x =<< eval trim EOF
  " !clear && git diff {cmd.text} {cmd.pager} {cmd.cached} {cmd.file}
  " EOF
" exec trim(join(x,''))
endfunction

command! -range -nargs=0 GitDiffAll <line1>,<line2>:call GitDiffAll(<q-args>)
command! -range -nargs=0 DiffAll <line1>,<line2>:call GitDiffAll(<q-args>)
function! GitDiffAll()
  " !clear && git --no-pager diff --text
  " !clear && git diff --text
  GitDiff --all
endfunction

command! -range -nargs=0 GitDiffCWD <line1>,<line2>:call GitDiffCWD()
function! GitDiffCWD()
  " !clear && git diff
  GitDiff --all
endfunction

command! -range -nargs=0 GitAdd <line1>,<line2>:call GitAdd()
function! GitAdd()
  !clear && git add %
endfunction

command! -range -nargs=0 GitAddCWD <line1>,<line2>:call GitAddCWD()
function! GitAddCWD()
  " !clear && git add .
  !clear && git add -A
  " || git add -A
endfunction

command! -range -nargs=0 GitAddRepo <line1>,<line2>:call GitAddRepo()
function! GitAddRepo()
  " echo '!clear && git add'w:git
  exec '!clear && git add'w:git
  " || git add -A
endfunction

command! -range -nargs=0 GitRemoveCached <line1>,<line2>:call GitRemovemCached()
function! GitRemoveCached()
  !git rm -r --cached .
endfunction

command! -range -nargs=? GitCommit <line1>,<line2>:call GitCommit(<args>)
function! GitCommit(message='')
  call GitMessage(a:message)
  let msg=''
  if a:message==''
    let msg=g:lastcommitmessage
  else
    let msg=a:message
  endif
  " echo msg
  " call input(msg)
  " echo '!clear && git commit -m "'..msg..'"'
  exec '!clear && git commit -m "'..msg..'"'
endfunction

command! -range -nargs=? GitCommitRepo <line1>,<line2>:call GitCommitRepo(<args>)
function! GitCommitRepo(message='')
  GitAddRepo
  call GitMessage(a:message)
  let msg=''
  if a:message==''
    let msg=g:lastcommitmessage
  else
    let msg=a:message
  endif
  " echo msg
  " call input(msg)
  " echo '!clear && git commit -m "'..msg..'"'
  exec '!clear && git commit -m "'..msg..'"'
endfunction

command! -range -nargs=0 Log <line1>,<line2>:call Log()
function! Log()
  exec "!clear && git log"
endfunction

function! GithubPullNoMerge()
  !git pull github main --no-rebase
endfunction

command! -range -nargs=0 Status <line1>,<line2>:call GitStatus()
command! -range -nargs=0 GitStatus <line1>,<line2>:call GitStatus()
function! GitStatus()
  !clear && git status
endfunction

function! GithubIntegrateProject(repo)
  " check if current folder has .git files
  let tmp_folder="folder_tmp"
  if !isdirectory(tmp_folder)
    let git =<< trim eval END
    git clone {a:repo} {tmp_folder}
    # check if there are any files that gets overwritten
    # mv -i {tmp_folder}/{{.,}}* . 2>/dev/null
    # mv -i {tmp_folder}/* {tmp_folder}/.[!.]* . 2>/dev/null
    shopt -s dotglob nullglob
    mv -i {tmp_folder}/* .
    rm -r {tmp_folder}
END
    let output=system(join(git, "\n"))
    echo output
  endif
endfunction
command! -range -nargs=* GithubIntegrateProject <line1>,<line2>:call GithubIntegrateProject(<f-args>)

if !exists('g:github_user') | let g:github_user='your_username' | endif
if !exists('g:github_email') | let g:github_email='your_email' | endif
if !exists('g:github_pat') | let g:github_pat='{pat_TOKEN}' | endif
if !exists('g:github_ghp') | let g:github_ghp='{ghp_TOKEN}' | endif
function! Github(...)
  let args=join(a:000, ' ')
  Pull
  let $github_user=g:github_user
  let $github_email=g:github_email
  let $github_pat=g:github_pat
  let $gitRemote=w:gitRemote
  let $gitBranch=w:gitBranch
  let $args=args
  !github_feed() {
  \ username=$1;
  \ email=$2;
  \ pat=$3;
  \ git config --global user.name "$1";
  \ git config --global user.email "$2";
  \ git config --global credential.helper cache;
  \ echo "protocol=https" > /tmp/git-credentials;
  \ echo "host=github.com" >> /tmp/git-credentials;
  \ echo "username=$username" >> /tmp/git-credentials;
  \ echo "email=$email" >> /tmp/git-credentials;
  \ echo "password=$pat" >> /tmp/git-credentials;
  \ git credential approve < /tmp/git-credentials;
  \ };
  \ github_unfeed() {
  \   rm /tmp/git-credentials;
  \ };
  \ git config '--global' core.autocrlf false;
  \ github_feed $github_user $github_email $github_pat;
  \ git $args;
  \ github_unfeed;
  \ git config '--global' '--unset-all' core.autocrlf;
endfunction
command! -range -nargs=* Github <line1>,<line2>:call Github(<q-args>)
command! -range -nargs=0 GithubPush <line1>,<line2>:call Github('push '..w:gitRemote..' '..w:gitBranch)

function! Git(...)
  " todo: select remote branch, when selected branch was not found or local and remote branch are different ...
  Pull
  let args=join(a:000, ' ')
  let $command=args
  " push "..w:gitRemote.." "..w:gitBranch
  !clear && git $command
endfunction
command! -range -nargs=* Git <line1>,<line2>:call Git(<q-args>)
command! -range -nargs=0 GitPush <line1>,<line2>:call Git('push '..w:gitRemote..' '..w:gitBranch)


function! DB()
  let database=g:unreleased.."/database.sqlite3"
  let x="tagebuch"
    !store() {
    \  __where=""
    \  __orderby=""
    \  __limit=""
    \  __store_file=$database
    \  __store="x"
    \  # echo $@
    \  if [ "$1" == "create" ]; then
    \    sqlite3 $__store_file << EOF
    \    create table if not exists $2(${@:3});
    \EOF
    \  elif [ "$1" == "table" ]; then
    \    __store=$2
    \  elif [ "$1" == "getlast" ]; then
    \    __where=""
    \    __orderby="order by time desc"
    \    __limit="limit 1"
    \    l=$(sqlite3 $__store_file << EOF
    \    select ${@:2} from $__store $__where $__orderby $__limit;
    \EOF
    \    )
    \    echo $l
    \  elif [ "$1" == "get" ]; then
    \    echo """ select ${@:2} from $__store $__where $__orderby $__limit;"""
    \    l=$(sqlite3 $__store_file << EOF
    \    select ${@:2} from $__store $__where $__orderby $__limit;
    \EOF
    \    echo $l
    \    )
    \  elif [ "$1" == "add" ]; then
    \    sqlite3 $__store_file << EOF
    \    insert into $__store values(${@:2});
    \EOF
    \  elif [ "$1" == "addtimed" ]; then
    \    # TODO VALUES SEPERATION time='',\ndata=''
    \    sqlite3 $__store_file << EOF
    \    insert into $__store values(datetime('now', 'localtime'), ${@:2});
    \EOF
    \  elif [ "$1" == "difftime" ]; then
    \    l=`store getlast time`
    \    # echo $l
    \    # date -d"$l"
    \    last=$(date -d"$l" +%s)
    \    now=$(date +%s)
    \    echo $(($now-$last))
    \  fi
    \}
    \store $1
endfunction

function! FindGitProjects()
endfunction

function! GithubCreateProject(...)
  let $name=a:000[0]
  let $desc=join(a:000[1:], " ")
  let $github_ghp=g:github_ghp
  let command =<< eval trim EOF
  curl -s -H "Authorization: Bearer {$github_ghp}"
   -H "Accept: application/vnd.github+json"
   -H "X-GitHub-Api-Version: 2022-11-28"
   https://api.github.com/user
   | grep node_id | cut -d'"' -f4
EOF
  " extract node_id
  " echo command
  let node_id = trim(system(join(command,' ')))
  " echo node_id
  let vars = {
  \  "github_ghp": $github_ghp,
  \   "node_id": node_id,
  \   "name": $name,
  \   "desc": $desc
  \ }
  "   let command =<< trim EOF
  "   curl -X POST
  "     -H "Authorization: Bearer {$github_ghp}"
  "     -H "Content-Type: application/json"
  "     -d '{ "query": "mutation {
  "     createProjectV2(input: {ownerId: \"{$node_id}\", title: \"{$name}\"})
  "     { projectV2 { id number title url } }
  "     }"}'
  "     https://api.github.com/graphql
  " EOF
  let command =<< trim EOF
curl -X POST \
  -H "Authorization: Bearer {$github_ghp}"
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  -d '{
    "name": "{$name}",
    "description": "{$desc}",
    "private": false,
    "auto_init": true,
    "license_template": "mit"
  }' \
  https://api.github.com/user/repos
EOF
let create_command=join(command, ' ')
for [key, val] in items(vars)
  let create_command = substitute(create_command, '{$'..key..'}', val, 'g')
endfor
  " echo create_command
  let output = system(create_command)
  echo output
  " Deprecated REST API
  " !curl -X POST
  " \  -H "Authorization: Bearer $github_ghp"
  " \  -H "Accept: application/vnd.github+json"
  " \  -H "X-GitHub-Api-Version: 2022-11-28"
  " \  -H "Content-Type: application/json"
  " \  -d '{
  " \    "name": "$name",
  " \    "body": "$desc"
  " \  }'
  " \  https://api.github.com/user/projects
  " !curl -X POST
  " \   -H "Authorization: Bearer $github_ghp"
  " \   -H "Accept: application/vnd.github+json"
  " \   -H "X-GitHub-Api-Version: 2022-11-28"
  " \   -d '{"name": "To Do"}'
  " \   https://api.github.com/projects/PROJECT_ID/columns
  " TODO: Automatic Clone
  " TODO: Set Origin Of Current Folder
  " TODO: Automatic Push Current Directory
endfunction
command! -range -nargs=* GithubCreateProject <line1>,<line2>:call GithubCreateProject(<f-args>)

function! InitCommands()
  if !exists('b:released')
    let b:released="no"
  endif
  if !exists('b:spectrum')
    let b:spectrum="buffer"
  endif
  if !exists('b:savein')
    let b:savein="vimconfiguration"
  endif
endfunction

function! SaveCommands()
  function! _save_helper(spectrum, released, filepath, )
    let filtered=filter(copy(g:commands), { i,v ->
      \ v:val["savein"]==a:spectrum
      \ && v:val["released"]==a:released
      \ })
    if a:released=="yes"
      let postfix=""
    else
      let postfix=".unreleased"
    endif
    if !empty(filtered) && len(filtered)>0
      call WriteStructure(filtered, a:filepath.."/.commands"..postfix)
    endif
  endfunction
  call _save_helper("samedir", "yes", expand('%:p:h'))
  call _save_helper("samedir", "no", expand('%:p:h'))
  call _save_helper("repo", "yes", Folder_Repo_Or_Project_Only())
  call _save_helper("repo", "no", Folder_Repo_Or_Project_Only())
  call _save_helper("vimconfiguration", "yes", VimConfiguration())
  call _save_helper("vimconfiguration", "no", VimConfiguration())
endfunction

function! LoadCommands()
  " if !exists('b:commands')
  " call CommandDictInit()
  let g:commands=[]
  let b:commands={}
  " endif
  let commandorigins=[]
  function! _add(path) closure
    if index(commandorigins, a:path)==-1
      call add(commandorigins, a:path)
    endif
  endfunction
  " saved_in_vimconfiguration
  call _add(VimConfiguration()..'/.unreleased/.commands')
  call _add(VimConfiguration()..'/.commands')
  call _add(VimConfiguration()..'/.commands.unreleased')
  " saved_in_samedir *folder*
  call _add(expand('%:p:h')..'/.commands')
  call _add(expand('%:p:h')..'/.commands.unreleased')
  " saved_in_repo
  call _add(Folder_Repo_Or_Project_Only()..'/.commands')
  call _add(Folder_Repo_Or_Project_Only()..'/.commands.unreleased')
  " saved_in_buffer
  " unimplemented / extract from file
  " let file=globpath(cwd, a:filename)
  " echo file
  " while 1
  "   let file=globpath(cwd, a:filename)
  "   if !empty(file)
  "     call extend(paths, [file])
  "   endif
  "   if cwd=='/'
  "     break
  "   endif
  "   let cwd=GetParentDir(cwd)
  " endwhile
  " call DebugBuf(map(copy(reverse(paths)), '"Source: "..v:val'), 0)
  call DebugBuf("Commands", 1, 1)
  for cf in commandorigins
    if filereadable(cf)
      call DebugBuf("Loading: "..cf, 0, 1)
      try
        let d=join(Read(cf), '')
        let data=json_decode(d)
      catch
        call DebugBuf("Error Parsing File: "..cf, 0, 1)
      finally
        if !empty(data)
          call extend(g:commands, data)
          call DebugBuf(printf("Added %s commands", len(data)), 0, 1)
        endif
        call DebugBuf(printf("Nothing to add in %s", len(data)), 0, 1)
      endtry
    endif
  endfor
  call DebugBuf(join(map(copy(g:commands),
        \ {_, v -> {"buffer": v['bufferFile'], "key": v['key']}}
    \ ), "\n"),0 , 1)
  return g:commands
  " call LoadCommands(Folder_Repo_Or_Project_Only()..'/.commands_vim_configuration.unreleased')
  "" for page in copy(b:commands['pages'])
  ""   call DebugBuf(copy(page), '"Command: "..P(v:val)')
  "" endfor
  " for c in b:commands['pages']
  "   echo c['<F5>']['command']
  " endfor
  " echo filter(copy(g:commands), 'v:val["commandSpectrum"]=="buffer"&&v:val["commandOrigin"]=="'..expand('%:p')..'"')
  " let b:commands['buffer']=filter(copy(g:commands), 'v:val["commandSpectrum"]=="buffer"&&v:val["commandOrigin"]=="'..expand('%:p')..'"')
  " let b:commands['folder']=filter(copy(g:commands), 'v:val["commandSpectrum"]=="folder"&&v:val["commandOrigin"]=="'..expand('%:p:h')..'"')
  " let b:commands['repo']=filter(copy(g:commands), 'v:val["commandSpectrum"]=="repo"&&v:val["commandOrigin"]=="'..Folder_Repo_Or_Project_Only()..'"')
  " let b:commands['global']=filter(copy(g:commands), 'v:val["commandSpectrum"]=="global"&&v:val["commandOrigin"]=="'..VimConfiguration()..'/.unreleased/.commands"')
  "   " call DebugBuf(b:commands)
  " return [ g:commands,
  "       \ b:commands['buffer'],
  "       \ b:commands['folder'],
  "       \ b:commands['repo'],
  "       \ b:commands['global']
  "       \ ]
endfunction


" function! BuildCommandLines() abort
"   let folder = Folder_Repo_Or_Project_Only()
"   let lines = []
"   for page_idx in range(len(b:commands['pages']))
"     let page = b:commands['pages'][page_idx]
"     for key in keys(page)
"       let data = page[key]
"       " skip unset / cleared entries
"       if data is# -1
"         continue
"       endif
"       " skip entries not belonging to this dict
"       if type(data) != v:t_dict || !has_key(data, 'commandOrigin')
"         continue
"       endif
"       if data['commandOrigin'] != folder
"         continue
"       endif
"       let line = "let b:commands['pages'][" . page_idx . "]['" . key . "']=" . string(data)
"       call add(lines, line)
"     endfor
"   endfor
"   return lines
" endfunction

function! BuildCommandLines() abort
  let folder = Folder_Repo_Or_Project_Only()
  " let lines = []
  let data=json_encode(g:commands)
  for command in g:commands
    " if data['commandOrigin'] != folder
    "   continue
    " endif
    let line = "BCommandInit"
    call add(lines, "")
    call add(lines, line)
    for key in keys(command)
      let data = command[key]
      if data is# -1
        continue
      endif
      " skip unset / cleared entries
      if data is# -1
        continue
      endif
      " skip entries not belonging to this dict
      " if type(data) != v:t_dict || !has_key(key, 'commandOrigin')
      "   continue
      " endif
      if type(key)=='command' || type(data)==4 || type(data)==3
        let line = "let b:loading_command['".key."']=" . string(data)
      " if type(data)==4 || type(data)==3
      "   call DebugBuf("type 3 or 4")
      "   call DebugBuf(type(data))
      "   call DebugBuf(len(data))
      "   call DebugBuf(data)
      "   let line = "let b:loading_command['".key."']=".string(data)
      else
        let line = "BCommand " . key . " " . data
      endif
      call add(lines, line)
    endfor
    " let line = "BCommandFinish " . page_idx . " " . key
    let line = "BCommandFinish " . command['page'] . " " . command['key']
    call add(lines, line)
  endfor
  " call DebugBuf("saved")
  " return lines
endfunction

function! BCommandInit(...)
  let b:loading_command=EmptyCommand()
endfunction
command! -range -nargs=* BCommandInit <line1>,<line2>call BCommandInit(<f-args>)

let g:bcommand_timers=[]
let g:bcommand_index=0
let g:bcommand_items=[
 \ 'buffer',
 \ 'folder',
 \ 'repo',
 \ 'global'
 \ ]
let g:bcommand=g:bcommand_items[g:bcommand_index]
function! ToggleBCommand()
  let g:bcommand_index=Mod(g:bcommand_index+1, len(g:bcommand_items))
  let g:bcommand=g:bcommand_items[g:bcommand_index]
  for tid in g:bcommand_timers
    call timer_stop(tid)
  endfor
  function! DisplayTimers()
    let g:bcommand_index=0
    let g:bcommand=g:bcommand_items[g:bcommand_index]
    call DebugBuf(string(g:bcommand_timers))
    call DebugBuf(g:bcommand)
  endfunction
  call add(g:bcommand_timers, timer_start(5000, {_->DisplayTimers()}))
  call DebugBuf(string(g:bcommand_timers))
  call DebugBuf(g:bcommand)
endfunction
command! -range -nargs=* ToggleBCommand <line1>,<line2>call ToggleBCommand()

function! BCommandFinish(...)
  let page=a:000[0]
  let key=a:000[1]
  let str_finish=b:loading_command['commandOriginType']
  let str_finish.=' '.key
  let str_finish.=' '.string(b:loading_command['command'])
  let str_finish.=' '.b:loading_command['commandOrigin']
  let str_finish.=' '.expand('%:p')
  call DebugBuf(str_finish)
  call add(g:commands, copy(b:loading_command))
  if b:loading_command['commandSpectrum']=='buffer' && b:loading_command['commandOrigin']==expand('%:p')
    call DebugBuf("loaded buffer command")
    let b:commands['pages'][page][key]=copy(b:loading_command)
    return
  endif
  if b:loading_command['commandSpectrum']=='folder' && b:loading_command['commandOrigin']==expand('%:p:h')
    call DebugBuf("loaded folder command")
    let b:commands['pages'][page][key]=copy(b:loading_command)
    return
  endif
  if b:loading_command['commandSpectrum']=='repo' && b:loading_command['commandOrigin']==Folder_Repo_Or_Project_Only()
    call DebugBuf("loaded repo command")
    let b:commands['pages'][page][key]=copy(b:loading_command)
    return
  endif
  if b:loading_command['commandSpectrum']=='global'
    call DebugBuf("loaded global command")
    let b:commands['pages'][page][key]=copy(b:loading_command)
    return
  endif
  " echo b:loading_command
endfunction
command! -range -nargs=* BCommandFinish <line1>,<line2>call BCommandFinish(<f-args>)

function! BCommand(...)
  let data_key=a:000[0]
  let data_value=a:000[1]
  let b:loading_command[data_key]=data_value
endfunction
command! -range -nargs=* BCommand <line1>,<line2>call BCommand(<f-args>)

" function! CommandDictInit()
"   " if !exists('b:commands')
"   let b:commands={'pages': []}
"   let b:commands=CommandDictAddPage(CommandDictInitPage())
"   " if !exists('g:commands')
"   let g:commands=[]
"   " endif
"   return b:commands
"   " endif
" endfunction

" function! CommandDictInitPage()
"   return {
"         \ '<F5>': -1,
"         \ '<F6>': -1,
"         \ '<F7>': -1,
"         \ '<F8>': -1,
"         \ '<C-F5>': -1,
"         \ '<C-F6>': -1,
"         \ '<C-F7>': -1,
"         \ '<C-F8>': -1,
"         \ '<S-F5>': -1,
"         \ '<S-F6>': -1,
"         \ '<S-F7>': -1,
"         \ '<S-F8>': -1,
"         \ '<C-S-F5>': -1,
"         \ '<C-S-F6>': -1,
"         \ '<C-S-F7>': -1,
"         \ '<C-S-F8>': -1
"         \ }
" endfunction

function! EmptyCommand()
  " direction: hjkl
  " directionMode: HJKL, neighbor, foremost
  " directionSkipping: 0 1 2 3
  " commandOrigin: /path/to/.command.vim_configuration
  " commandMode: term buffer newbuffer
  " commandModeSession: -1 / none / bashsession / pythonsession
  " commandInterpreter: bash / vim / python
  " commandTargetBuffer: bufnr()
  " commandTargetWindow: winnr()
  " commandInput: vs() data file
  " commandOutputMode: put sendtoterm file clist commandline
  " command: 'ls -al; date'
  let command={
    \ "hash": NewUUID(),
    \ "name": -1,
    \ "key": -1,
    \ "page": -1,
    \ "direction": -1,
    \ "bufnr": -1,
    \ "directionMode": -1,
    \ "directionSkipping": -1,
    \ "commandSpectrum": -1,
    \ "savein": -1,
    \ "released": -1,
    \ "commandOrigin": -1,
    \ "commandMode": -1,
    \ "commandModeSession": -1,
    \ "commandInterpreter": -1,
    \ "commandTargetBuffer": -1,
    \ "commandTargetWindow": -1,
    \ "commandInput": -1,
    \ "commandOutputMode": -1,
    \ "command": -1
    \ }
  return command
endfunction

function! VimCommand(command='')
  call InitCommands()
  let c=EmptyCommand()
  let c['hash']=NewUUID()
  let c['name']='unnamed'
  let c['commandMode']='vim'
  let c['commandSpectrum']='buffer'
  let c['savein']=b:savein
  let c['released']=b:released
  let c['decision_mode']="check_direct"
  let c['decision_algorithm']="check_only_one_direction"
  let c['bufferFile']=''
  let c['commandInterpreter']='vim'
  let c['commandOutputMode']='put'
  let c['command']=a:command
  let c['direction']=g:default_direction
  return c
endfunction

function! TermCommand(command='')
  let c=EmptyCommand()
  let c['name']='unnamed'
  let c['commandMode']='term'
  let c['commandInterpreter']='term'
  let c['command']=a:command
  let c['direction']=g:default_direction
  return c
endfunction

function! CommandExample()
  let c=EmptyCommand()
  let c['name']='unnamed'
  let c['direction']=g:default_direction
  let c['directionMode']='foremost'
  let c['commandOrigin']=VimConfiguration()
  let c['commandSpectrum']='global'
  let c['savein']=b:savein
  let c['released']=b:released
  let c['decision_mode']="check_direct"
  let c['decision_algorithm']="check_only_one_direction"
  let c['bufferFile']=''
  let c['commandMode']='term'
  let c['commandModeSession']='none'
  let c['commandInterpreter']='term'
  let c['commandTargetBuffer']='-1'
  let c['commandTargetWindow']='-1'
  let c['commandInput']='-1'
  let c['commandOutputMode']='sendtoterm'
  let c['direction']=g:default_direction
  let c['command']=['', 'ls -al', '']
  return c
endfunction

" function! CommandPageInit()
"   " if !exists('b:commands')
"   call CommandPageExample()
"   " endif
" endfunction

" function! CommandPageExample()
"   let c=CommandExample()
"   let c['page']=0
"   let c['command']=['date']
"   let c['key']='<F5>'
"   let b:commands['pages'][0]['<F5>']=copy(c)
"   let c['command']=['ls -al']
"   let c['key']='<F6>'
"   let b:commands['pages'][0]['<F6>']=copy(c)
"   let c['command']=['activate']
"   let c['key']='<F7>'
"   let b:commands['pages'][0]['<F7>']=copy(c)
"   let c['command']=['deactivate']
"   let c['key']='<F8>'
"   let b:commands['pages'][0]['<F8>']=copy(c)
" endfunction

function! CommandDictAddPage(page)
  call extend(b:commands['pages'], [a:page])
  return b:commands
endfunction

function! QuickYank(args='', flags='') range
  let vs=VS()
  if a:args=='init'
    call setreg('a', '')
  elseif a:args=='paste'
    let reg=split(getreg('A'), '\%x00')
    call appendbufline(bufnr(), line('.'), reg)
    return
  endif
  call setreg('A', vs)
  let reg=getreg('A')
  call RS()
endfunction

function! EnsureEnvironment()
  if !exists("g:b_environment_set")
    let g:b_environment_set=1
    echo 'Dear User,'
    echo ' '
    echo '   This Will Install All Nessecary Files'
    echo '   bash | wget https://github.com/vim_configuration/vim_configuration.sh'
    echo ' '
    echo 'Your Sincerely'
    echo 'Author'
  endif
endfunction

function! AG()
  let p=CWD()
  :Ag
  call CD(p)
endfunction

" :echo split(&runtimepath, ',')[0]

function! SetEnvironment(user_dir='~', main_repo='', source_dir='', bashrc='~/.bashrc')
  let g:main_repo=a:main_repo
  let g:system_folders='/'
  let g:user_dir=a:user_dir
  let g:source_dir=a:source_dir
  let g:bashrc = a:bashrc
  let g:bashrc_source = "source ".g:bashrc
  let g:vimrc = "~/.vimrc"
  " let g:vim = "~/.vim/plugged/vim_configuration"
  let g:vim = $VIMRUNTIME
  let g:vim_configuration_src = split(&runtimepath, ",")[0]..'/plugged/vim_configuration/autoload/vim_configuration'
  let g:b_environment_set=1
endfunction
" call EnsureEnvironment()
call SetEnvironment()

let runtimepath=split(&runtimepath, ",")[0]
" if !g:is_wsl
"   let runtimepath=split(&runtimepath, ",")[0]
" else
"   let _runtime=systemlist("wslpath \"$(cmd.exe /c echo %USERPROFILE% 2>/dev/null | tr -d '\r' )\"")
"   let runtimepath=split(_runtime)[0]
" endif

if !exists('g:plugfile')
  let g:plugfile=g:runtimepath.."/autoload/plug.vim"
endif
let g:vim_configuration_src=runtimepath..'/plugged/vim_configuration/autoload/vim_configuration'
let g:vim_configuration_src=runtimepath..'/plugged/vim_configuration/src'
let g:vim_configuration=runtimepath..'/plugged/vim_configuration/'
let g:vim_configuration_src=runtimepath..'/plugged/vim_configuration/src'
let mapleader=","
function! SourceIfFileExists(file)
  if filereadable(a:file)
    exec "source "..a:file
  endif
endfunction
exec 'source '.g:vim_configuration_src.'/Commands.vim'
exec 'source '.g:vim_configuration_src.'/Generate.vim'
exec 'source '.g:generated_src.'/Generate.vim'
call SourceIfFileExists(g:vim_configuration.'/src.unreleased/HiddenFunctions.vim')
call SourceIfFileExists(g:vim_configuration.'/src.unreleased/HiddenFunctions.vim9')
" let unreleased=g:vim_configuration_src.'/Functions.vim.unreleased'
" General Variables
if !exists("g:__pattern") | let g:__pattern={} | endif
if !exists("g:allowChan") | let allowChan=0 | endif
if !empty("g:target") | let target="release" | endif
if !exists('g:date') | let g:date='~0' | endif
if !exists('g:vertical') | let g:vertical=1 | endif
if !exists("focus") | let focus=0 | endif
let g:wholepath=0
let term="bash"
let debugexec=1
let debugvars=0
let RunCommandsPrefix="./nvim.studio"
let lastRunCommand="run.sh"
let old_fkeys=[ "<F1>", "<F2>", "<F3>", "<F4>", "<F5>", "<F6>", "<F7>", "<F8>", "<F9>", "<F10>", "<F11>", "<F12>", "<F13>", "<F14>", "<F15>", "<F16>", "<F17>", "<F18>", "<F19>", "<F20>", "<F21>", "<F22>", "<F23>", "<F24>", "<F25>", "<F26>", "<F27>", "<F28>", "<F29>", "<F30>", "<F31>", "<F32>", "<F33>", "<F34>", "<F35>", "<F36>", "<F37>", "<F38>", "<F39>", "<F40>", "<F41>", "<F42>", "<F43>", "<F44>", "<F45>", "<F46>", "<F47>", "<F48>", "<F49>", "<F50>", "<F51>", "<F52>", "<F53>", "<F54>", "<F55>", "<F56>", "<F57>", "<F58>", "<F59>", "<F60>", "<F61>", "<F62>", "<F63>", "<F64>", "<F65>", "<F66>", "<F67>", "<F68>", "<F69>", "<F70>", "<F71>", "<F72>", ]
let s:comment_map = {    "c": '\/\/',   "cpp": '\/\/',   "go": '\/\/',   "java": '\/\/',   "javascript": '\/\/',   "lua": '--',   "scala": '\/\/',   "php": '\/\/',   "python": '#',   "ruby": '#',   "rust": '\/\/',   "sh": '#',   "desktop": '#',   "fstab": '#',   "conf": '#',   "profile": '#',   "bashrc": '#',   "bash_profile": '#',   "mail": '>',   "eml": '>',   "bat": 'REM',   "ahk": ';',   "vim": '"',   "tex": '%', }
let new_fkeys=[ "<F1>", "<F2>", "<F3>", "<F4>", "<F5>", "<F6>", "<F7>", "<F8>", "<F9>", "<F10>", "<F11>", "<F12>", "<S-F1>", "<S-F2>", "<S-F3>", "<S-F4>", "<S-F5>", "<S-F6>", "<S-F7>", "<S-F8>", "<S-F9>", "<S-F10>", "<S-F11>", "<S-F12>", "<C-F1>", "<C-F2>", "<C-F3>", "<C-F4>", "<C-F5>", "<C-F6>", "<C-F7>", "<C-F8>", "<C-F9>", "<C-F10>", "<C-F11>", "<C-F12>", "<C-S-F1>", "<C-S-F2>", "<C-S-F3>", "<C-S-F4>", "<C-S-F5>", "<C-S-F6>", "<C-S-F7>", "<C-S-F8>", "<C-S-F9>", "<C-S-F10>", "<C-S-F11>", "<C-S-F12>", "<M-F1>", "<M-F2>", "<M-F3>", "<M-F4>", "<M-F5>", "<M-F6>", "<M-F7>", "<M-F8>", "<M-F9>", "<M-F10>", "<M-F11>", "<M-F12>", "<M-S-F1>", "<M-S-F2>", "<M-S-F3>", "<M-S-F4>", "<M-S-F5>", "<M-S-F6>", "<M-S-F7>", "<M-S-F8>", "<M-S-F9>", "<M-S-F10>", "<M-S-F11>", "<M-S-F12>", ]
let _toggle={}
let toggleHistory=[]
let g:WindowChanged=0
let __pressedKey=""
let __pressedControl=""
let g:FileFinder_verbose=1
let f1 = [ g:vim_configuration_src."/Functions.vim", g:main_repo."/.bashrc"]
let projects=[ g:source_dir, g:main_repo ]
let g:executor_list={    "executor_list": {        "bash": "bash",        "bash external": "bash",        "python3": "python3",        "python3 external": "python3",    },    "machines_settings": g:vim.."/machines.settings"}
let g:RecursiveCounter=0
let g:clipboard_last=""
let g:clipboard_poll=""
let vlcb = 0
let vlce = 0
let s:wrapenabled = 0
let g:firstSearchOpenFile=1
let tFp=expand('%:p')
let g:tp=expand('%:h')
let g:user=system("whoami")
let g:user=substitute(g:user, "\n", '', '')
let g:bashset_save=["set | sed -E '/^_.*\(\)/,/^}$/d' | sed -E '/^(BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID)=/d' > "..g:source_dir.."/.bashset"]
let g:bashset_source=[g:bashrc_source.."; source "..g:source_dir..".bashset;"]
let g:bashset_restore=["cp "..g:source_dir.."/.bashset.1 > "..g:source_dir.."/.bashset"]
let g:pb=[]
let g:pe=[]
let x=[ "a", "b",  "a", "a", "b",  "a", "a", "b",  "a", "b" ]
let _PreviousCurrentFunction=""
let _CurrentFunction=""
let bufferNumber=-1
if !exists("MCommands") | let MCommands=[] | endif
if !exists("g:autosave_timer") | endif
if !empty("g:exec_type") | let exec_type=0 | endif
if !exists("g:modechanged") | let modechanged="Normal" | endif
let exec_types=[ "Default", "Vim", "Bash", "Python", "Rust" ]

exec 'source '.g:vim_configuration_src.'/Statusline.vim'
exec 'source '.g:vim_configuration_src.'/TextActions.vim'
exec 'source '.g:vim_configuration_src.'/Autocommands.vim'

syntax on

" function! s:disable_statusline(bn)
"   if a:bn == bufname('%')
"     set laststatus=1
"   else
"     set laststatus=2
"   endif
"   set laststatus=0
" endfunction
" au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * call s:disable_statusline('Information')


" TODO avoid overlapping
function! PathCompletion()
  " Avoid These In A Function Call?
  " ---> Compact WILDMENU --: set wildmode=longest:list,full
  " ---> Compact WILDMENU --: set wildmode=longest:full,full
  " ---> Compact WILDMENU --: set wildignore=*.o,*.pyc,*/.git/*,*/node_modules/*
  " ---> Compact WILDMENU --: set completeopt=menuone,preview
  set wildmenu
  set wildoptions=pum
  set wildmode=longest,full
  set wildignorecase
  " set wildmode=
  " set wildignore=
  " set suffixes=
  " set suffixes-=@
  inoremap <silent> <expr> / pumvisible() ? "\<C-r>=<SID>avoid_double_slash()<CR>" : "/\<C-x>\<C-f>"
  inoremap <silent> <expr> <Space> pumvisible() ? "\<C-x>\<C-f>" : " "
  function! s:avoid_double_slash() abort
    if getline('.')[col('.')-2] ==# '/'
      return ''
    endif
    return "/\<C-x>\<C-f>"
  endfunction
  " lacks integrity
  function! LastPath()
    let last_path=""
    let line=getline('.')
    let last_slash=stridx(line,'/')
    if last_slash==-1
      let last_path=line
    else
      let last_path=line[last_slash :]
    endif
    return last_path
  endfunction
  function! IsLastPath()
    return 1
  endfunction
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : IsLastPath() ? "\<C-x>\<C-f>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<C-r>=<SID>my_path_complete()<CR>" : "\<CR>\<C-r>=<SID>my_path_complete()<CR>"
  inoremap <expr> <C-e>   pumvisible() ? "\<C-e>" : "\<C-e>"
  function! s:my_path_complete() abort
    if getline('.')[col('.')-2] ==# '/'
      return "\<C-x>\<C-f>"
    endif
    return "\<C-c>"
  endfunction
endfunction
" call PathCompletion()
" PathCompletion Built In
"
set nomore
set hidden
" set shortmess+=FIcs
" set shortmess=FIcs
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/.git/*,*/node_modules/*,*/dist/*,*.o,*.pyc
set tabpagemax=50
" set tabstop=2
" filetype on
" set nu
" set ruler
" set mouse=a
" set list
" set number
" set expandtab
" set autoindent
" set softtabstop=2
" set shiftwidth=2
" set tabstop=2
" "Enable mouse click for nvim
" set mouse=a
" "Fix cursor replacement after closing nvim
" set guicursor=
" "Shift + Tab does inverse tab
" inoremap <S-Tab> <C-d>
" set whichwrap+=<,>,[,]
set wildmenu
set noswapfile
set verbose=0 " 0-9?
set encoding=utf-8
set fileencoding=utf-8
set termencoding=
set ttyfast
filetype on
filetype indent on
filetype plugin indent on
filetype plugin indent on
syntax on
syntax enable
set nocompatible
set incsearch
" consider if this makes sense
set ignorecase
set smartcase
set showcmd
set showmode
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set listchars=eol:$,space:·,tab:→\ ,trail:·,nbsp:␣,extends:»,precedes:«
set listchars=eol:$,
set listchars=

" set autoindent " copies indent from previous line, nothing fancier
set noautoindent
" fancier
set smartindent
" set nosmartindent
" set cindent " cindent
set nocindent

set omnifunc=syntaxcomplete#Complete
set list
" set list!
" set nolist!
" set nolist
set splitright
set splitbelow
set clipboard=unnamed
set clipboard=unnamedplus
set backspace=indent,eol,start
set mouse=a
set backspace=2
set virtualedit=all
set virtualedit=block
set tags=./tags;,tags
set timeout timeoutlen=700 ttimeoutlen=0
set ttimeoutlen=700
set laststatus=2
" set guioptions+=m  "menu bar
" set guioptions+=T  "toolbar
" set guioptions+=r  "scrollbar
set dir=~/tmp
set textwidth=0
" set completeopt=menu,preview

function! StripComments(input)
  " Alt A Alt D
	" :echo searchpair('\<if\>', '\<el\%[seif]\>', '\<en\%[dif]\>', 'W',
	"		\ 'getline(".") =~ "^\\s*\""')
	" :echo searchpair('{', '', '}', 'bW')
  " comments
  return a:input
endfunction

" Visual Selection

function! VS() range
  call CommandInfo()
  let [l:start_line, l:start_col]=getpos("'<")[1:2]
  let [l:end_line, l:end_col]=getpos("'>")[1:2]
  let [g:start_line, g:start_col]=getpos("'<")[1:2]
  let [g:end_line, g:end_col]=getpos("'>")[1:2]
  let lines=getline(l:start_line, l:end_line)
  fun! _prep_visualblock() closure
    for line in lines
      let line=line[l:start_col-1:l:end_col]
    endfor
    return lines
  endf
  fun! _prep_visual() closure
    let lines[0]=lines[0][l:start_col-1:]
    let lines[-1]=lines[-1][:l:end_col-1]
    return lines
  endf
  if IsNormal()
    return [getline('.')]
  elseif IsVisual()
    return _prep_visual()
  elseif IsVisualLine()
    return lines
  elseif IsVisualBlock()
    return _prep_visualblock()
  elseif IsInsert()
    return [getline('.')]
  endif
endfunction

function! RS()
  if IsAnyVisual()
    call setpos("'>", [g:start_line, g:start_col])
    call setpos("'<", [g:end_line, g:end_col])
    norm gv
  endif
endfunction

function! CommandInfo(flag='')
  let g:CI=[mode(0), mode(1), visualmode(1), a:flag=='c'?1:0, a:flag=='t'?1:0]
endfunction

function! IsTerminalInsert()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return terminalinsert && modee=="nt"
endfunction

function! IsTerminalNormal()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return !IsAnyVisual() && !terminalinsert && modee=="nt"
endfunction

function! IsTerminalVisual()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return !terminalinsert && modee=="nt"
endfunction

function! IsNormal()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return !IsAnyVisual() && modee=="n" || IsTerminalNormal()
endfunction

function! IsAnyVisual()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return visual!="" && visual=~#"[vV]"
endfunction

function! IsVisual()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return visual!="" && visual==#"v"
endfunction

function! IsVisualLine()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return visual!="" && visual==#"V"
endfunction

function! IsVisualBlock()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return visual!="" && visual==""
endfunction

function! IsInsert()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return modee=~?".*i.*"||IsTerminalInsert()
endfunction

function! IsCommand()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return command
endfunction

function! IsTerminal()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return modee =~?".*t"
endfunction

" Build

function! BuildPath(a, b)
  if a:a=~#".*/$"
    return a:a..a:b
  else
    return a:a.'/'.a:b
  endif
endfunction

function! RunThis()
  " call Open("l", "terminal", "new")<cr>
  call SendCustomCommandToTerm("l", [ './build/'..expand('%:t:r') ])
endfunction

function! CTagsProject()
  exec "!ctags -R --exclude=.git--exclude=vendor --exclude=node_modules --exclude=db --exclude=log "..CWD()
endfunction

function! BuildProject()
  exec "!gcc -o "
        \ CWD()."/build/".expand('%:t:r')
        \ " "
        \ expand('%')
endfunction

function! CTags()
  let filetype=expand('%:e')
  let map={
        \ 'cpp': "C++",
        \ 'html': "HTML",
        \ 'htm': "HTML",
        \ 'haml': "Haml",
        \ 'sass': "Sass",
        \ 'js': "Javascript",
        \ 'vim': "Vim",
        \ 'py': "Python",
        \ 'rs': "Rust",
        \ 'sh': "+Sh",
        \ }
  function! GetLanguages() closure
    let lang=GetDictValueCaseInsensitive(map, filetype)
    return '--languages='..lang
  endfunction
  echo 'ctags -R '..CWD()
  let x=systemlist('ctags -R '..CWD())
endfunction

function! BuildThis()
  exec "!gcc -o "
        \ expand('%:r')
        \ " "
        \ expand('%:p')
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

" Project Manager

function! JumpFile(path)
  let path=a:path
  let node = input('Open File:  ['..path..']  ', path, 'file')
  call _openfile_andCD(node)
  return
  if isdirectory(node)
    let dir=node
    " maybe take the next two lines out
    " exec "e "..file
    " return
  endif
  if filereadable(node)
    let file=node
    let parent=GetParentDir(file)
    if isdirectory(parent)
    endif
      exec "e "..file
      call MakeDirCurrentCWD(bufnr())
      return
  else
    let unreadable=node
    let parent=GetParentDir(unreadable)
    if isdirectory(parent)
    endif
      exec "e "..unreadable
      call MakeDirCurrentCWD(bufnr())
      return
  endif
endfunction

function! JumpProject()
  let path=CWD()
  let dir = input('Open Project:  ['..path..']  ', path, 'file')
  if isdirectory(dir)
    " call SetProject(dir)
  endif
endfunction

function! JumpProjectIn()
  call JumpProject()
endfunction

function! JumpProjectSetProjectOrigin(origin)
  call SetProjectOrigin(a:origin)
endfunction

function! JumpProjectBackup()
  let haystack=GetCWDOrigin()
  let needle=CWD()
  " update the project origin, when the needle path does differ at some point
  if stridx(haystack, needle) == -1
    call JumpProjectSetProjectOrigin(needle)
  endif
endfunction

function! JumpProjectUp()
  let path=CWD()
  " call SetProject(GetParentDir(path))
  call Statusline()
  call JumpProjectBackup()
endfunction

function! JumpProjectR()
  let a=split(CWD(), "/")
  let b=split(GetCWDOrigin(), "/")
  let la=len(a)
  let lb=len(b)
  if la<lb
    let p=BuildPath(CWD(), b[la])
    " call SetProject(p)
  endif
endfunction

function! JumpProjectDump()
  echo CWD()
  echo GetCWDOrigin()
endfunction

function! GetParentDir(path)
    let l:parent = fnamemodify(a:path, ':h')
    return l:parent
endfunction

function! Currentmain_repoRegister()
  if exists("w:main_repo")
    return 'window'
  " elseif exists("b:main_repo")
  "   return 'buffer'
  " elseif exists("t:main_repo")
  "   return 'tab'
  " elseif exists("g:main_repo")
  "   return 'global'
  endif
  return "/"
endfunction

function! GitTerm_Statusline_ExecKeys()
  return ''
  " if exists('b:state')
  " return b:state.exec_keys
  " return exists('b:state.exec_keys')&&b:state.type=='terminal'?' '..b:state.exec_keys:''
endfunction

function! GetCWD_Statusline()
  if Currentmain_repoRegister()[0] =~ "[wbgt]"
    " let x=Currentmain_repoRegister()[0]
    " let x.=" "..GetCWD_short()
    let x=GetCWD_short()
    return x
  else
    return '/'
  endif
endfunction

function! GetCWD_short(register="")
  return PathCharwise(CWD())
endfunction

function! GetDir(register="")
  return expand('%:p:h')
endfunction

function! SetProjectOrigin(path)
  let w:main_repo_origin=a:path
endfunction

function! GetCWDOrigin()
  if exists("w:main_repo_origin")
    return w:main_repo_origin
  else
    let w:main_repo_origin=CWD()
    return w:main_repo_origin
    " return '/'
  endif
endfunction

" function SetProject(path)
"   " if a:register[0] =~? "[w]"
"   " endif
"   let w:main_repo=a:path
"   let w:lastmain_repo=a:path
"   call JumpProjectBackup()
"   " if a:register == "buffer"
"   "   let b:main_repo=a:path
"   " endif
"   " if a:register == "tab"
"   "   let t:main_repo=a:path
"   " endif
"   " if a:register == "global"
"   "   let g:main_repo=a:path
"   " endif
"   call Statusline()
"   exec "cd "..w:main_repo
" endfunction

function! Basename(path)
  return ""
endfunction

function! SearchPhrases()
  let dict={ 'Empty Lines': '\s*$' }
  return dict
endfunction

function! POINTER()
  if exists("w:pointer")
    return w:pointer
  else
    return ''
  endif
endfunction

" Eating Lobster 🦞
function! ABSOLUTE()
  let r=expand('%:p')
  if r!=""
    return r
  else
    return getcwd()
  endif
endfunction

function! ABSOLUTE_DIR()
  if filereadable(ABSOLUTE())
    return GetParentDir(ABSOLUTE())
  elseif isdirectory(ABSOLUTE())
    return ABSOLUTE()
  endif
endfunction

function! RELATIVE_DIR()
  " KEEP IT POINTER, OTHERWISE FILE IS NOT READABLE ANYWAYS
  if filereadable(POINTER())
    return GetParentDir(RELATIVE())
  else
    return RELATIVE()
  endif
endfunction

function! RELATIVE()
  let g:cwd=CWD()
  let g:y=len(split(CWD(),'/'))
  let x=join(split(POINTER(),'/')[g:y:-1],'/')
  return x
endfunction

" echo POINTER()
" echo $cwd $y x POINTER()
" return substitute(POINTER(), $cwd, "", "")

" function RELATIVE()
"     " if isdirectory(a:path)
"     "   let w:relative=expand('%')
"     " elseif filereadable(a:path)
"     "   let w:relative=expand('%')
"     " else
"     "   let w:relative=RELATIVE()
"     " endif
"   " echo CWD()
"   " echo RELATIVE()
"
"   " let path=w:relative
"
"   if isdirectory(path)
"     " let path=expand('%')
"     return join(split(path,'/'),'/')
"   elseif filereadable(path)
"     " let path=expand('%')
"     return join(split(path,'/')[0:-1],'/')
"   else
"     " let path=w:relative
"     let aa=split(CWD(),'/')
"     let $a=len(aa)
"     let bb=split(w:relative,'/')
"     let $b=len(bb)
"     return join(split(CWD(),'/')[$a:-1],'/')
"     " join(split(CWD(),'/')[-1],'/')..
"     " return w:relative
"   endif
" endfunction

function! GetBasename()
  return expand('%:t')
endfunction

function! GetFilenameNoExt()
  return substitute(GetBasename(), ".rs", "", "")
endfunction

function! GetPath_Statusline()
  if g:wholepath==0
    return PathCharwise(expand('%:p'))
  elseif g:wholepath==1
    return expand('%:p')
  elseif g:wholepath==2
    return expand('%:t')
  endif
endfunction

function! GetPath()
  return expand('%:p:h')
endfunction

function! GetDirname()
  return expand('%:p:h')
endfunction

function! GetDirnameFromFile(path)
  let x=system("dirname ".a:path)
  return x
endfunction

function! GetFileName()
  return expand('%')
endfunction

function! GetLastsaved()
  if !exists("b:lastsaved")
    let b:lastsaved=0
  else
    return b:lastsaved
  endif
endfunction

function! IsPossibileDirectory(path)
  if a:path =~# ".*/\ *$"
    return 1
  endif
  return 0
endfunction

function! s:stepFile_completefunc(step)
  let path=expand('%:h')
  let l=systemlist('find '.path.' -maxdepth 1 -type f')
  let file=expand('%:t')
  let g:matches=l
endfunction

function! KeyToArray(key)
  " echo len(a:key)
  let out=[]
  for a in a:key
    call extend(out,[char2nr(a)])
  endfor
  return out
endfunction

" if !exists('*s:close_often')
function! s:close_often(winid, key) abort
  let k = KeyToArray(a:key)

  let ct = { '<C-Tab>': [ 128, 252, 4, 9 ],
        \ '<C-S-Tab>': [ 128, 252, 4, 128, 107, 66 ],
        \ '<C-p>': [ 16 ],
        \ '<S-Tab>': [ 128, 107, 66 ],
        \ '<Tab>': [ 9 ],
        \ '<Up>': [ 128, 107, 117 ],
        \ '<Down>': [ 128, 107, 100 ],
        \ '<Enter>': [ 13 ],
        \ '<C-,>': [ 128, 252, 4, 44 ],
        \ '<C-.>': [ 128, 252, 4, 46 ],
        \ 'j': [ 106 ],
        \ 'k': [ 107 ],
        \ }
  " if a:key ==# "<C-Tab>" || a:key ==# "<80><fc>"
  " if a:key ==# "<C-Tab>" || a:key ==# "\<80>\<fc>\<04>"
  if k == ct['<C-Tab>'] || k == ct['<Tab>']
    call s:stepFile_index(1)
    " call popup_close(a:winid)
    " call NextFile_popup(1)
    call s:stepFile_open()
    call win_execute(a:winid, printf('call cursor(%d,1)', g:temp_files_index+1))
    return 1
  " elseif a:key ==# "<C-S-Tab>" || a:key ==# "\<80>\<fc>\\<80>kB"
  elseif k == ct['<Down>'] || k == ct['j']
    call s:stepFile_index(1)
    " call popup_close(a:winid)
    " call NextFile_popup(0)
    " call popup_setoptions(a:winid, #{line: 'cursor-1'})
    call win_execute(a:winid, printf('call cursor(%d,1)', g:temp_files_index+1))
    return 1
  elseif k == ct['<C-S-Tab>'] || k == ct['<S-Tab>']
      call s:stepFile_index(-1)
      " call popup_close(a:winid)
      " call PreviousFile_popup(1)
      call s:stepFile_open()
      call win_execute(a:winid, printf('call cursor(%d,1)', g:temp_files_index+1))
    return 1
  elseif k == ct['<Up>'] || k == ct['k']
    call s:stepFile_index(-1)
    " call popup_close(a:winid)
    " call PreviousFile_popup(0)
    " call popup_setoptions(a:winid, #{firstline: 'cursor+2'})
    call win_execute(a:winid, printf('call cursor(%d,1)', g:temp_files_index+1))
    return 1
  " else
  "   call popup_close(a:winid)
  "   return 1
  " elseif index(['j','<Down>'], a:key)>=0
  "   call popup_close(a:winid)
  "   call NextFile_popup()
  "   return 0
  " elseif index(['k','<Up>'], a:key)>=0
  "   call popup_close(a:winid)
  "   call PreviousFile_popup()
  "   return 0
  " "   return 0
  elseif k == ct['<C-,>']
    " call CD('..')
    " exec bufnr('$') bufdo CD(WFilePrev())
    " call CD(g:stepFile_cwd)
    " call CD(WFilePrev())
    " let g:stepFile_cwd=CWD()
    " exec 'cd '..getcwd()
    " echo getcwd()
    " call chdir('..')
    " echo CWD() bufnr()
    " return 1
    " call CD(WFilePrev())

    " call CD(GetParentDir(g:path))
    " exec 'cd '..g:path
    " call CD(WFilePrev())
    " call chdir(s:path..'/..')
    call s:stepFile_repopup(a:winid, WFilePrev())
    return 1
  elseif k == ct['<C-.>']
    " call CD(WFileNext())
    " let entry=g:temp_files_list[g:temp_files_index]
    " if isdirectory(entry)
    " call CD(entry)
    call s:stepFile_repopup(a:winid, WFileNext())
    return 1
    " endif
  elseif k == ct['<C-p>']
    call popup_close(a:winid)
    call OpenFileFZFProject()
  elseif k == ct['<Enter>']
    let entry=g:temp_files_list[g:temp_files_index]
    if isdirectory(entry)
      call s:stepFile_repopup(a:winid, entry)
      return 1
    elseif filereadable(entry)
      exec "e! "..entry
      unlet g:temp_files_list
    endif
    call popup_close(a:winid)
    " let entry=g:temp_files_list[g:temp_files_index]
    " exec "e! "..entry
  else
    echom a:key
    echom k
    return 0
  endif

  call popup_close(a:winid)
  return 0
  return 1 " Eat All

endfunction
" endif

function! s:stepFile_index(step)
  if !exists('g:temp_files_list')
    call s:stepFile_init_index()
  endif
  let length=len(g:temp_files_list)
  let length=Length(g:temp_files_list)
  " let index=indexof(l, { i,v-> v:val =~ file })
  let g:temp_files_index=g:temp_files_index+(a:step)
  let g:temp_files_index=Mod(g:temp_files_index, length)
endfunction

function! s:stepFile_init_index()
  let g:temp_files_list=readdir('.')
  let file=expand('%:t')
  let g:temp_files_index=index(g:temp_files_list, "./".file)
endfunction

function! s:stepFile_repopup(winid, path='')
  call popup_close(a:winid)
  if a:path=='..'
    call CD(WFilePrev())
    call s:stepFile_init_index()
  elseif a:path==''
  else
    call CD(a:path)
    call s:stepFile_init_index()
  endif
  call StepFile_popup(0, 0)
endfunction


function! s:stepFile_open(winid=-1)
  let entry=g:temp_files_list[g:temp_files_index]
  if isdirectory(entry)
    " echo "is dir"
    " call CD(entry)
    " call s:stepFile_popup_repopup(a:winid)
  elseif filereadable(entry)
    exec "e! "..entry
  endif
endfunction

function! s:stepFile_popup(step=0, performFileOpening=0)
  " let x=0
  " for i in l
  "   let l[x]=path.."/"..i
  "   let x=x+1
  " endfor
  " if !exists(g:temp_files_index)
  "   let g:temp_files_index=0
  " endif

  call s:stepFile_index(a:step)

  " let g:stepFile_cwd=CWD()

  if a:performFileOpening
    call s:stepFile_open()
  endif

  let winid=popup_create(g:temp_files_list, #{
        \ pos: 'center',
        \ title: '  '.CWD().' ',
        \ zindex: 200,
        \ maxheight: 20,
        \ minwidth: 40,
        \ maxwidth: 80,
        \ border: [1,1,1,1],
        \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
        \ padding: [0,1,0,1],
        \ cursorline: 1,
        \ filter: function('s:close_often'),
        \ mapping: 0
        \ })
        " \ filtermode: 'n',
  " if index>=0 && index<=len(l)
  call win_execute(winid, printf('call cursor(%d,1)', g:temp_files_index+1))
  " endif
  " optional
  " call win_execute(winid, 'setlocal cursorlineopt=line')
endfunction

" function ListDirFiles(findstart, base) abort
"   if a:findstart
"     let line=getline('.')
"     let start=col('.')-1
"     while start > 0 && line[start -1 ] =~ '\f'
"       let start -= 1
"     endwhile
"     return start
"   else
"     let matches = []
"     for fname in s:files
"       if fname =~? '^' .. escape(a:base, '\')
"         call add(matches, fname)
"       endif
"     endfor
"     let cur=expand('%:t')
"     call sort(matches, {a,b -> a == cur ? -1 : b == cur ? 1 : a > b})
"     return matches
"   endif
" endfunction

function! MyCustomComplete(findstart, base)
  if a:findstart
  else
    return filter(copy(g:matches), 'v:val =~ "^'. a:base .'"')
  endif
endfunction

function! ShowMyCustomComplete()
  " let col=col('.') -1
  " call complete(col, g:matches)
  call feedkeys("i\<C-x>\<C-u>\<Esc>", 'in')
  " function ShowListNow()
  "   let col=col('.') -1
  "   call complete(col, g:matches)
  " endfunction
  " call feedkeys('i", 'n')
  " call feedkeys('\<C-r>=ShowListNow()\<CR>", 'n')
endfunction

" command! -nargs=* -complete=customlist,MyCmdComplete MyCmd echo "done"
" function MyCmdComplete(ArgLead, CmdLine, CursorPos)
"   return ['A', 'B', 'C']
" endfunction

" function CommandBuilderCommandLine(name, ...)
"   " let name = a:000[0]
"   " echo <q-args>
"   " let args = a:000[1:-2]
"   " let prompt = a:000[-1]
"   " echo name args prompt
"   " echo a:name
"   " echo a:000
" endfunction
" command! -nargs=* C :call CommandBuilderCommandLine(<q-args>)
" todo
" -complete=customlist,MyCmdComplete
"  vim getopts how to parse quoted strings in getopts of a function

if !exists("g:commandbuilder") | let g:commandbuilder={} | endif
function! s:commandbuilder(qargs)
  let args=ParseArgs(a:qargs)
  for arg in args[1:-1]
    let value = input('')
    call add(g:commandbuilder[args[0]], { arg: value })
  endfor
  " echo expand('<q-args>')
endfunction
" command! -nargs=* C :call s:vimgrep(<q-args>)

function! s:stepFile(step)
  let path=expand('%:h')
  let l=systemlist('find '.path.' -maxdepth 1 -type f')
  let file=expand('%:t')
  " echo file
  let x=0
  " for i in l
  "   let l[x]=path.."/"..i
  "   let x=x+1
  " endfor
  let length=len(l)
  let length=Length(l)
  " let index=indexof(l, { i,v-> v:val =~ file })
  let index=index(l, "./".file)
  let index=index+(a:step)
  let index=Mod(index, length)
  exec "e! "..l[index]
  " echo file
  " echo path
  " echo newindex length
  " echo l
endfunction

function! NextFile_completefunc()
  setlocal completefunc=MyCustomComplete
  call s:stepFile_completefunc(1)
  call ShowMyCustomComplete()
endfunction

function! PreviousFile_completefunc()
  setlocal completefunc=MyCustomComplete
  call s:stepFile_completefunc(-1)
  call ShowMyCustomComplete()
endfunction

" function InitFile_popup()
"   " Todo
"   " Carefully
"   " Critical
"   " let path=expand('%:h')
"   let g:path=CWD()
"   " let g:temp_files_list=systemlist('find '.path.' -maxdepth 1 -type f')
"   " if !exists('g:temp_files_list')
"   "   " let g:temp_files_list=systemlist('find '.path.' -maxdepth 1')
"   "   " let files=readdir('.', 'v:val !~# "^\."')
"   "   let items=readdir('.', {v->{
"   "         \ 'name': v,
"   "         \ 'dir': isdirecotry(v),
"   "         \ 'link': gettype(v) == 'link'
"   "         \ }})
"   "   let items=readdir('.')
"   "   " let g:temp_files_list=sort(items, {a,b -> a.dir ? -1 : b.dir ? 1 : a.name > # b.name})
"   "   let g:temp_files_list=items
"   " endif
" endfunction

function! StepFile_popup(step, performFileOpening)
  call s:stepFile_popup(a:step, a:performFileOpening)
endfunction

function! NextFile()
  call s:stepFile(1)
endfunction

function! PreviousFile()
  call s:stepFile(-1)
endfunction

function! MkDir(path)
    " silent exec "!mkdir -p "..path
    if !isdirectory(expand(a:path)) && !filereadable(expand(a:path))
      " call input(a:path)
      call mkdir(a:path, 'p')
    endif
endfunction

function! _newfile_andCD(path)
  call _openfile_andCD(a:path)
endfunction

function! _openfile_andCD(path)
  let path=a:path
  " exec "cd "..path
  if exists("path") && filereadable(path)
    call _openfile(path)
    " call CD(GetParentDir(path))
  elseif exists("path") && isdirectory(path)
    call MkDir(path)
    call CD(path)
    exec "e "..path
  elseif exists("path") && IsPossibileDirectory(path)
    call MkDir(path)
    call CD(path)
    exec "e "..path
  else
    call MkDir(GetParentDir(path))
    " call CD(GetParentDir(path))
    exec "hide e "..path
  endif
  " call MakeDirCurrentCWD(bufnr())
endfunction

function! _openfile_orCD(path)
  let path=a:path
  if exists("path") && filereadable(path)
    call _openfile(path)
  elseif exists("path") && isdirectory(path)
    call CD(path)
  else
    call MkDir(GetParentDir(path))
    call CD(GetParentDir(path))
    exec "e "..path
  endif
endfunction

function! _openfile(file)
  let file=a:file
  if exists("file") && filereadable(file)
    exec "e "..file
  endif
endfunction

function! Rewindmain_repo()
  let temp=w:main_repo
  call CD(w:lastmain_repo)
  let w:lastmain_repo=temp
endfunction

" function CD(path)
"   if exists('w:main_repo')
"     let w:lastmain_repo=w:main_repo
"   else
"     let w:lastmain_repo='/'
"   endif
"   let path=a:path
"   if exists("path") && isdirectory(path)
"     call SetProject(path)
"   else
"     echo "no file selected"
"   endif
" endfunction

function! OpenFileSetProject_callback(id, code, file)
  let path=GetTempfileLine(a:file)
  call CD(GetParentDir(path))
  " call _openfile(path)
  call _openfile_andCD(path)
endfunction

function! ThisIsFZF(bufnr)
  return &filetype ==# 'fzf'
  " return exists('b:fzf')
  return bufname(a:bufnr) =~# '^\(fzf\|FZF\)'
  return getbufvar(a:bufnr, '&filetype')==#'fzf'
  return &filetype ==# 'fzf'
  return win_gettype() == 'popup'
  return win_gettype(winnr()) == 'popup'
endfunction

function! IsPopup(winid)
  return win_gettype(a:winid) == 'popup'
  " echo popup_getpos(win_getid()) != {}
  " echo popup_getpos(winid) != {}
  let x={}
  try
    silent let x=popup_getpos(a:winid)
  catch
  endtry
  return !empty(x)
endfunction

function! MakeDirCurrentCWD(bufnr)
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

function! SetProject_callback(register, id, code)
  let path=GetTempfileLine(a:file)
  call CD(path)
endfunction

function! AgFile(title, register, path)
  echo "AG"
endfunction

function! Merge(...)
  let f = []
  for x in a:000
    call extend(f, x)
  endfor
  return f
endfunction

function! Projects()
  call Refresh('projects', 'GetProjects()')
  call OpenFilePopup("Projects", g:projects)
endfunction

function! ToggleTroughOpenedProjects(n=1)
  echo "Implement Toggle Project " .. a:n
endfunction

" fzf buildstring find in projects
" why file exists 3 times in the list?
function! FilesInProjects()
  let allfiles=[]
  " for p in g:projects
  "   call extend(allfiles, [globpath(p, "**")])
  " endfor
  " call Refresh('projects', 'GetProjects()')
  " call OpenFilePopup("Files In Projects", allfiles)
  call Popup_FZFBuildString("Files In Projects", g:projects)
endfunction

" function! PopupList(listname)
"   let title=toupper(a:listname[0])+""+a:listname[1:]
"   let list=ReadUnreleased(listname)
"   call OpenFilePopup(title, list)
" endfunction

function! FavoritesPopup()
  call Refresh('favorites', 'ReadUnreleased("favorites")')
  call Refresh('favoritefolders', 'GetFavoriteFolders()')
  call Refresh('favoritefolders_recursively', 'GetFavoriteFolders_Recursively()')
  call Refresh('favoritefolders_files', 'GetFavoriteFolders_Files()')
  call Refresh('favoritefolders_files_recursively', 'GetFavoriteFolders_Files_Recursively()')
  call Refresh('favoritefolders_glob', 'GetFavoriteFolders_Glob()')
  let f=[]
  call extend(f, g:favorites)
  call extend(f, g:favoritefolders_files)
  call extend(f, g:favoritefolders_files_recursively)
  call OpenFilePopup("Favorites", f)
endfunction

function! OpenFilePopup(title, list)
  function! OpenFile_callback(file)
    let path=GetTempfileLine(a:file)
    " consider len(path)==0 ||
    let path=path.''
    if !(path=="0" || path=="-1")
    ""    " if filereadable(path)
    ""    "   call _openfile_andCD(path)
    ""    " elseif isdirectory(path)
    ""    "   call _openfile_andCD(path)
    ""    " endif
      call _openfile_andCD(path)
    ""    call _openfile_andCD(path)
    else
      let g:fzfabort=1
    endif

    " if path!='-1' && path!=-1 && path!='0' && path!=0
    " endif
    call _cleanCallback(a:file)
  endfunction
  let Cb={job, status -> timer_start(0, {_ -> OpenFile_callback(g:outfile)})}
  let file=Popup(a:title, 'window', a:list, Cb, g:outfile)
endfunction

function _cleanCallback(file)
  if filereadable(a:file)
    call delete(a:file)
  endif
  " execute 'bd! '.bufnr('Find')
  " execute 'bwipeout! '.bufnr('Find')
  if exists('g:popup_bufnr') && g:popup_bufnr>-1
    execute 'bwipeout! '.g:popup_bufnr
  else
    echo "Todo: check g:popup_bufnr"
  endif
  " call setbufline(bufnr, 2, 'second line')
endfunction

function! CheckOs()
  echo "win32    " has('win32')
  echo "win64    " has('win64')
  echo "win32unix" has('win32unix')
  echo "mac      " has('mac')
  echo "macunix  " has('macunix')
  echo "osx      " has('osx')
  echo "unix     " has('unix')
  echo "linux    " has('linux')
  echo "android  " has('android')
  echo "bsd      " has('bsd')
  echo "wsl      " has('wsl')
endfunction
command! -range -nargs=0 CheckOs <line1>,<line2>call CheckOs()

" Check if running in WSL
let g:is_wsl = has('unix') && filereadable('/proc/version') &&
    \ (match(readfile('/proc/version')[0], 'Microsoft') >= 0 ||
    \  match(readfile('/proc/version')[0], 'microsoft') >= 0)
" let s:is_wsl = has('unix') && !empty(filter(readfile('/proc/version'), 'v:val =~? "microsoft"'))

if g:is_wsl
  let _runtime=systemlist("wslpath \"$(cmd.exe /c echo %USERPROFILE% 2>/dev/null | tr -d '\r' )\"")
  let g:SearchGitProjectsPath=expand('~').." ".._runtime[0]
else
  let g:SearchGitProjectsPath="/"
endif

if has('mac') || has('unix') || has('linux') || has('android')
  let g:outfile="/tmp/outfile_fzf"
  let g:stdin_tmp_file="/tmp/tmp_stdin_file"
  let g:tempfile="/tmp/tempfile_fzf"
  let g:tempprofile="/tmp/profile.log"
else
  let g:outfile=g:vim_configuration_path.."/outfile_fzf.unreleased"
  let g:stdin_tmp_file=g:vim_configuration_path.."/tmp_stdin_file.unreleased"
  let g:tempfile=g:vim_configuration_path.."/tempfile_fzf"
  let g:tempprofile=g:vim_configuration_path.."/profile.log"
endif

function Commands()
  function! Execute_callback(job, status, file)
    " let cj=ch_getjob(a:job)
    " let tj=term_getjob(a:job)
    " call input(a:job.." "..a:status)
      " ch_info({handle})
    let command=GetTempfileLine(a:file)
    let hash=split(command, ' ')[0]
    let exec=filter(copy(g:commandlist), 'v:val.hash=~"'..hash..'"')[0]
    " call input(command)
    if command != -1 && command != 0
      " call input(exec.commandMode)
      if exec.commandMode=='term'
        call SendCommandToThisTerm([exec.command])
        norm i
      else
        exec exec.command
      endif
      " call TERM(bufnr(), [ command ])
      "  norm i
    else
      echo "Errorhandling"
    endif
    call _cleanCallback(a:file)
  endfunction
  let Cb={job, status -> timer_start(0, {_ -> Execute_callback(job, status, g:outfile)})}
  let command_list=map(copy(g:commandlist), 'v:val.hash.." : "..v:val.name..GenSpaces(v:val.name)..v:val.command')
  " echo P(command_list)
  let file=Popup("Commands", 'window', command_list, Cb, g:outfile)
endfunction

function! GenSpaces(name)
  let sorted=sort(copy(g:commandlist), {a,b->len(b.name)-len(a.name)})
  let diff=len(sorted[0].name)-len(a:name)
  let out=""
  for d in range(0, diff)
    let out.=" "
  endfor
  return out
endfunction

function! TestFunction(bufnr)
  if &modifiable == 0 && &buftype!='terminal' && &buftype!='buffer'
    call setbufline(a:bufnr, 2, 'second line')
  endif
endfunction

function! TermPopup(title, termbuf, callback, outfile)
  let title=a:title
  let type='file'
  if type=="directory"
    let type="d"
  else
    let type="f"
  endif
  let g:FileFinder_result=""
  function! OnStdout(channel, msg)
  endfunction
  function! OnError(...)
    call popup_close(g:pnr) closure
    exec "bd "..a:termbuf
  endfunction
  function! OnExitTerm(bufname, job, code) closure
    call popup_close(g:pnr)
    exec "bd "..a:termbuf
  endfunction
  function! s:TermClose(job, status) abort
  endfunction
  let opts={
    \ 'hidden': 1,
    \ 'err_cb': 'OnError',
    \ 'term_name': 'Find',
    \ 'term_finish': 'close',
    \ 'exit_cb': function('s:TermClose'),
    \ }
  function! MyFilter(winid, key)
    echo a:key
    if a:key=='q'
      call popup_close(a:winid)
      " call OnPopupClose(a:winid, 'User pressed q')
      return 1
    endif
    return 0
  endfunction
  try
  let g:pnr=popup_create(a:termbuf, #{
    \ title: title,
    \ pos: 'center',
    \ minwidth: 80,
    \ minheight: 20,
    \ maxheight: 80,
    \ border: [1, 1, 1, 1],
    \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
    \ highlight: 'Pmenu',
    \ term_cols: 40,
    \ cursorline: 1,
    \ zindex: 200,
    \ filter: 'MyFilter',
    \ callback: a:callback,
    \ })
  let g:popup_bufnr=winbufnr(g:pnr)
  catch
  finally
  endtry
endfunction

function! Popup(title, register, list, callback, outfile)
  call Write(a:list, g:stdin_tmp_file)
  " if a:register =~ 'window\|buffer\|tab\|global'
  "   let title=a:title.." ["..a:register.."]"
  " else
  "   let title=a:title
  " endif
  " let list=a:list
  """ let type=type(list)
  """ " 1  |v:t_string|
  """ if type==1
  """   let lists=[list]
  """ " 3  |v:t_list|
  """ " 4  |v:t_dict|
  """ else
  """   let lists=list
  """ endif
  " function! File_Popup(title, paths, callback, type="file", maxdepth=10, register="")
  " endfunction
  " call File_Popup(
  "       \ title,
  "       \ list,
  "       \ function('OpenFile_callback', [a:outfile]),
  "       \ "file",
  "       \)
  " let paths
  " let title=' '..title..": "..join(paths, ' ')..' '
  let title=a:title
  let type='file'
  if type=="directory"
    let type="d"
  else
    let type="f"
  endif
  " let cmd=call('BuildList', [ "-maxdepth "..a:maxdepth.." -type "..type,  paths])
  " let cmd="cat | fzf"
  let cmd=['/bin/bash', '-c', 'fzf -i < '.g:stdin_tmp_file.' > '..a:outfile]
  let g:FileFinder_result=""
  function! OnStdout(channel, msg)
  endfunction
  function! OnError(...)
    call popup_close(g:pnr)
    exec "bd "..g:tnr
  endfunction
  function! OnExitTerm(bufname, job, code)
    call popup_close(g:pnr)
    exec "bd "..g:tnr
  endfunction
  function! s:FzfClose(job, status) abort
    " execute 'bwipeout! '.bufnr('Find')
    " execute 'bwipeout! '.bufnr('Find')
    " exec 'bd! '.bufnr('Find')
    " echo bufnr('Find')
  endfunction
  let opts={
        \ 'hidden': 1,
        \ 'err_cb': 'OnError',
        \ 'term_name': 'Find',
        \ 'term_finish': 'close',
        \ 'exit_cb': function('s:FzfClose'),
        \ }
        " \ 'exit_cb': {job, status -> OpenFile_callback(a:outfile)},
        " \ 'in_io': 'file',
        " \ 'in_name': g:stdin_tmp_file,
  let tnr=term_start(cmd, opts)
  let g:tnr=tnr
  " let job=term_getjob(tnr)
  " let chan=job_getchannel(job)
  " call ch_sendraw()
  " let list=['line1', 'line2', 'line3']
  " echo text
	" call ch_sendraw(chan, text)
	" call ch_close_in(chan)
  " let stdin = join(list, '\n')
  " let tnr=term_start(cmd, opts)
  " let job=term_getjob(tnr)
  " for l in list
  "   call job_stdin(job, l."\n")
  " endfor
  " call job_stdin(job, '')
  function! MyFilter(wnid, key)
    if a:key=='q'
      call popup_close(a:winid)
      call OnPopupClose(a:winid, 'User pressed q')
      return 1
    endif
    return 0
  endfunction
  " return
  try
  let g:pnr=popup_create(tnr, #{
    \ title: title,
    \ pos: 'center',
    \ minwidth: 80,
    \ minheight: 20,
    \ maxheight: 80,
    \ border: [1, 1, 1, 1],
    \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
    \ highlight: 'Pmenu',
    \ term_cols: 40,
    \ cursorline: 1,
    \ zindex: 200,
    \ callback: a:callback,
    \ })
  let g:popup_bufnr=winbufnr(g:pnr)
  " call setbufline(bufnr, 2, 'second line')
    " \ callback: function('OpenFile_callback', [a:outfile]),
    " \ callback: function('OpenFile_callback', [a:outfile]),
  catch
  finally
  endtry
endfunction

" function! Popup_FZFBuildString(title, register, paths)
function! Popup_FZFBuildString(title, paths)
  " if a:register =~ 'window\|buffer\|tab\|global'
  "   let title=a:title.." ["..a:register.."]"
  " else
  "   let title=a:title
  " endif
  function! OpenFile_callback(file)
    let path=GetTempfileLine(a:file)
    " consider len(path)==0 ||
    let path=path.''
    if !(path=="0" || path=="-1")
    ""    " if filereadable(path)
    ""    "   call _openfile_andCD(path)
    ""    " elseif isdirectory(path)
    ""    "   call _openfile_andCD(path)
    ""    " endif
      call _openfile_andCD(path)
    ""    call _openfile_andCD(path)
    else
      let g:fzfabort=1
    endif
    " if path!='-1' && path!=-1 && path!='0' && path!=0
    " endif
    call _cleanCallback(a:file)
  endfunction
  let Cb={job, status -> timer_start(0, {_ -> OpenFile_callback(g:outfile)})}
  let paths=a:paths
  let type=type(paths)
  if type==1
    let paths=[paths]
  else
    let paths=paths
  endif
  " \ function('OpenFile_callback', [g:outfile]),
  call Buildstring_Popup(
        \ a:title,
        \ paths,
        \ Cb,
        \ "file",
        \)
endfunction

function! Changemain_repo(title, register, path)
  if a:register =~ 'window\|buffer\|tab\|global'
    let title="Set ["..a:register[0].."]"
  else
    let title=a:title
  endif
  let path=a:path
  let type=type(path)
  if type==1
    let paths=[path]
  else
    let paths=path
  endif
  call Buildstring_Popup(
        \ title,
        \ paths,
        \ function('SetProject_callback', [g:outfile]),
        \ "directory",
        \)
endfunction

function! CB_OpenFileInBuffer(m)
  let m = a:m
  if Length(m)==0 | return "" | endif
  if Length(m)>0
    let m=m[0]
    if !empty(m)
      if isdirectory(m)
        call CD(m)
      else
        exec "e ".m
        call CD(GetDirname())
      endif
    endif
  endif
  call Redraw()
endfunction

function! Files(path)
  let g:temporaryfix=0
  " echo a:path
  " exec ":Files" a:path
  " exec "Files" a:path..'/'
  " echo a:path
  call fzf#vim#files(a:path)
  " call Redraw()
  " call fzf#run({'dir': a:path})
  " call fzf#run({'dir': a:path, 'window': { 'width': 0.9, 'height': 0.6 } })
  " call fzf#run({'dir': '/', 'window': { 'width': 0.9, 'height': 0.6 } })
  " call fzf#run(fzf#wrap('', { 'dir': a:path }, 0 ))
  " let opts = {'dir': '/'}
  " let window_opts = fzf#wrap('')
  " let opts['window'] = window_opts['window']
  " call fzf#run(opts)
  " call fzf#run({'dir': a:path, 'source': 'find .', 'sink': 'e', 'window': {'width':0.9, 'height': 0.6}})
  " let i=0
  " while i < 100
  "   let i += 1
  " endwhile
  unlet g:temporaryfix
endfunction

function! CommandLineFiles(path)
  " echo a:path
  " exec ":Files" a:path
  " call Redraw()
  call JumpFile(a:path..'/')
  " call MakeDirCurrent(a:path..'/')
endfunction

function! Redraw()
  redraw!
endfunction

function! CtrlShiftP()
  let m=system('( find / -maxdepth 10 2>/dev/null && find '.g:ftp.' -maxdepth 10 2>/dev/null ) | fzf')
  call Redraw()
  if !empty(m)
    if isdirectory(m)
      call CD(m)
    else
      exec "e ".m
      call CD(GetDirname())
    endif
  endif
endfunction

function! NERDTreeM_Shift(focus)
    try | NERDTreeFind | catch | try | call NERDTreeCWD() | catch | try | NERDTree  | endtry | endtry | endtry
endfunction

function! SelectFolder()
  let m=system('find '..g:user_dir..' -type d -maxdepth 10 2>/dev/null | fzf')
  echo m
endfunction

function! SelectFile()
  let m=system('find '.g:vim.' -maxdepth 7 | fzf')
  exec "e ".m
endfunction

function! GetDirs(path, maxdepth)
  let out=[]
  let j = system("find \"".a:path."\" -maxdepth ".a:maxdepth." -type d")
  for line in filter(split(j, "\n")[1:], "v:val!=''")
    call extend(out,[line])
  endfor
  return out
endfunction

function! GetFiles(path, name, maxdepth)
  let out=[]
  let j=system("find \"".a:path."\" -name \"".a:name."\" -maxdepth ".a:maxdepth." -type f")
  for line in filter(split(j, "\n")[1:], "v:val!=''")
    call extend(out,[line])
  endfor
  return out
endfunction

function! GetFilesAndDirs(path, name, maxdepth)
  let out=[]
  let j=system("find \"".a:path."\" -name \"".a:name."\" -maxdepth ".a:maxdepth)
  for line in filter(split(j, "\n")[1:], "v:val!=''")
    call extend(out,[line])
  endfor
  return out
endfunction

function! SearchOpenFile(...)
  let file=a:000[0]
  " echo file
  " echo a:000
  " echo expand(file)
  " let $v=get(a:,1,0)
  " e $v
  exec "hide e! ".file
  call CD(GetDirname())
endfunction

func! FindFiles(path, pattern, maxdepth)
  let files=[]
  let maxdepth=""
  if a:maxdepth>0
    let maxdepth="-maxdepth ".a:maxdepth
  redir =>j
  silent exec '!find '.a:path.' '.maxdepth.' -type f -name "'.a:pattern.'"'
  redir END
  for line in filter(split(j, "\n")[1:], "v:val!=''")
    call extend(files,[line])
  endfor
  return files
endfunc

function! LineNumberOnOff()
  set number!
  set norelativenumber
endfunction

" function CWD()
"   return getcwd()
"   " try
"   "   let m=systemlist('pwd')
"   "   return m
"   " catch
"   " endtry
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
    return '  '..GitBranch()
  else
    return ''
  endif
endfunction

function! GitBranch_Statusline_short()
  if exists('w:gitBranch')
    if w:gitBranch==-1
      return ''
    endif
    return '  '..GitBranch()[0:2]..'…'
  else
    return ''
  endif
endfunction

function! GitRemote_Statusline()
  if exists('w:gitRemote')
    if w:gitRemote==-1
      return ''
    endif
    return '  '..GitRemote()
  else
    return ''
  endif
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

function! SetProject(dir)
  " echo "TODO Async Backgrounded Job"
  return
  call system("curl http://localhost:8000/SetProject?project="..a:dir)
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

function! CWD_Statusline()
  if CWD()=='/'
    return '/'
  elseif exists('w:cwd')
    return w:cwd
  else
    return ''
  endif
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

function! GETCWD()
  if exists("w:cwd")
    return w:cwd
  endif
  return ''
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

function! WFilePrev()
  return '..'
endfunction

function! WFileNext()
  let split=split(RELATIVE(),'/')
  let len=len(split)
  if len>0
    let next=split(RELATIVE(),'/')[0]
    return next
  else
    return ''
  endif
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
  if w:git!=-1
  endif
  " echo "Not A Directory"
  let $folderrepo=Folder_Repo(0, 0)
endfunction

function! UpdateGit()
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

function! UpdateGit_OnSave()
  let w:gitDiff=FindDiff(w:cwd)
  call Statusline()
endfunction

function! SetPointer(path='')
  if a:path==''
    let p=expand("%:p")
  else
    let p = a:path
  endif
  if p==""
    let w:pointer=CWD()
  else
    let w:pointer=p
  endif
endfunction

function! REFRESH_CWD()
  try
    call execute("cd ".CWD())
  catch
  endtry
endfunction

function! PathLast(path)
  let parts = split(a:path, '/')
    if len(parts) > 3
      let x = '...'
    endif
  let x = x . '/' . join(parts[-3:], '/')
  return x
endfunction

function! IsFavorite()
  if index(g:favorites, expand('%:p')) >= 0
    return '✓ '
  else
    return ''
  endif
endfunction

function! FavoriteFile()
endfunction

function! FavoritePath()
endfunction

function! Favorite()
  let list=systemlist("ls -al")
  call Buildstring_Popup(
        \ "Favorites",
        \ list,
        \ "file",
        \)
endfunction

if !exists("g:shortenpath")
  let shortenpath=-1
endif

if !exists("g:shortenpath_file")
  let shortenpath_file=-1
endif

function! ToggleShortenPath()
  if g:shortenpath==0
    let g:shortenpath=-1
  else
    let g:shortenpath=0
  endif
  if g:shortenpath_file==1
    let g:shortenpath_file=-1
  else
    let g:shortenpath_file=1
  endif
  call Statusline()
endfunction

function! PathCharwise_All(path, except=0, appendslash=1, prependSlash=v:false, appendSlash=v:false)
  " let currentDir="test"..split(expand('%:p:h'), '/')[-1]
  " echo currentDir
  let except=a:except
  if filereadable(a:path)
    let except=a:except
  elseif isdirectory(a:path)
    let except=a:except
    let except=0
  endif
  if except==-1
    if a:appendSlash
      " return currentDir . a:path..'/'
      return a:path..'/'
    else
      " return currentDir . a:path
      return a:path
    endif
  endif
  let parts=split(a:path,'/')
  let out=''
  if a:path=='/'||a:prependSlash
    let out=''
  else
    let out='/'
  endif
  for i in range(0, len(parts)-1)
    if i>=len(parts)-except
      let out.=parts[i]
    else
      let out.=parts[i][0]
    endif
    if i <= len(parts)-2
      let out.='/'
    endif
    if i==len(parts)-1 && a:appendSlash
      let out.='/'
    endif
  endfor
  " return currentDir . out
  " bad fix
  if &buftype == 'terminal'
    if a:appendslash
      return ''
    else
      return '/'
    endif
  else
    if a:appendslash
      return out..'/'
    else
      return out
    endif
  endif
endfunction

function! PathCharwise(path, except=0)
    let except=a:except
    let parts = split(a:path, '/')
    if len(parts) <= 3
        if len(parts) > 1
          let x = '/'
        else
          let x = ''
        endif
        return x.join(map(parts[:-2], 'v:val[0]'), '/') . '/' . join(parts[-1:], '/')
    else
        if len(parts) > 3
            let x = '...'
        else
            let x = join(map(parts[:-4], 'v:val[0]'), '/')
        endif
        let x = x . '/' . join(parts[-3:], '/')
        return x
    endif
endfunction

function! SelectCommandPopup(title, list, callback)
  call Execution_Popup(
        \ a:title,
        \ a:list,
        \ a:callback,
        \)
endfunction

function! FZFPopup(title, type, path, callback)
  let path=a:path
  let type=type(path)
  if type==1
    let paths=[path]
  else
    let paths=path
  endif
  " echo type(function('SetProject_callback', ['w']))
  " echo type(a:callback)
  " if function('SetProject_callback', ['w']) == a:callback
  "   echo "TEST Bestandend"
  " endif
  " return
  call Buildstring_Popup(
        \ a:title,
        \ paths,
        \ a:callback,
        \ a:type,
        \)
endfunction

function! OpenFileCommandLineProject()
  call JumpFile(expand("%:h"))
endfunction

function! OpenFileCommandLineSameDir()
  " call JumpFile(CWD())
  call JumpFile(ABSOLUTE_DIR()..'/')
endfunction

function! OpenFileCommandLineCWD()
  " call JumpFile(CWD())
  call JumpFile(CWD()..'/')
endfunction

function! OpenFileCommandLineSystem()
  call JumpFile('/')
endfunction

function! OpenFileFZFRepo(backwards=0)
  let Callback=function('OpenFile_callback', ["window"])
  let file=Folder_Repo(a:backwards, 0)
  call FZFPopup("Open file: ", "file", file, Callback)
endfunction

function! OpenFileFZFProject()
  let Callback=function('OpenFile_callback', ["window"])

  call FZFPopup("Open file: ", "file", CWD(), Callback)
endfunction

function! OpenFileFZFSystem()
  let Callback=function('OpenFile_callback', ["window"])
  call FZFPopup("Open file: ", "file", g:system_folders, Callback)
endfunction

function! FindInFileFZFRepo(backwards=0)
  let Callback=function('OpenFile_callback', ["window"])
  if a:backwards==0
    let file=w:git
  elseif a:backwards==1
    let file=FindGit(GetParentDir(w:git))
  elseif a:backwards==2
    let file=FindGit(GetParentDir(FindGit(GetParentDir(w:git))))
  endif
  if file == -1
    " getcwd is not userfriendly
    " consider throwing a message
    let file=getcwd()
    " echo "No higher Repo"
    return
  endif
  call FZFPopup("Open file: ", "file", file, Callback)
endfunction

function! FindInFileFZFProject()
  let Callback=function('OpenFile_callback', ["window"])
  call FZFPopup("Open file: ", "file", CWD(), Callback)
  map <S-F3> :call AG()<CR>
  map <C-F3> :GFiles<CR>
endfunction

function! FindInFileFZFSystem()
  let Callback=function('OpenFile_callback', ["window"])
  call FZFPopup("Open file: ", "file", g:system_folders, Callback)
endfunction


function! SetProjectCommandLineProject()
  call JumpProject(CWD())
endfunction

function! SetProjectCommandLineSystem()
  call JumpProject('/')
endfunction

function! SetProjectFZFProject()
  let Callback=function('SetProject_callback', ["window"])
  call FZFPopup("Set Project: ", "directory", CWD(), Callback)
endfunction

function! SetProjectFZFSystem()
  let Callback=function('SetProject_callback', ["window"])
  call FZFPopup("Set Project: ", "directory", [ '/etc' ], Callback)
endfunction

function! SetProjectFZFProjectAndFile()
  let Callback=function('OpenFileSetProject_callback', ["w"])
  call FZFPopup("Set Project And File: ", "file", CWD(), Callback)
endfunction

function! SetProjectFZFSystemAndFile()
  let Callback=function('OpenFileSetProject_callback', ["w"])
  call FZFPopup("Set Project And File: ", "file", '/', Callback)
endfunction

" Window Manager

function! s:_term_nvim(p, commands)
  let chan=getbufvar(a:p, "terminal_job_id")
  let c=extend(a:commands, [""])
  call chansend(chan, c)
endfunction

function! s:_term_vim(p, commands)
  for c in a:commands
    call term_sendkeys(a:p, c)
    call term_sendkeys(a:p, '')
  endfor
endfunction

function! TERM(p, commands)
  if has('nvim')
    call s:_term_nvim(a:p, a:commands)
  else
    call s:_term_vim(a:p, a:commands)
  endif
endfunction

function! ClearTermOnWinLeave(bufnr)
  if bufname('%') == 'Find'
    call timer_start(50, {->execute('bwipeout! '..a:bufnr)})
  endif
endfunction

function! Open(direction, type="buffer", mode="copy", file="")
  " todo fix left insertmode
  let file=""
  let foremost=index(['H','J','K','L'], a:direction)>=0
  " call WinSwapBuf_Prep()
  call WinSwap_Prep()
  let projectpath=CWD()
  let g:saved_cwd=CWD()
  let previous_bufname = bufname('%')
  let previous_win = winnr('$')
  let h=0 | let j=0 | let k=0 | let l=0
  if a:direction==?"h"
    let h=1
  elseif a:direction==?"l"
    let l=1
  elseif a:direction==?"j"
    let j=1
  elseif a:direction==?"k"
    let k=1
  endif
  if a:type=="buffer"
    let buffer=1
    let terminal=0
  elseif a:type=="terminal"
    let buffer=0
    let terminal=1
  endif
  if terminal
    let arg=g:term
  elseif buffer
    let arg=buffer
  endif
  if h || l
    let vertical=1
  elseif j || k
    let vertical=0
  endif
  let swap=0
  if h || k
    let swap=1
  endif
  let insert=0
  if terminal
    let insert=1
    " let b:termpid=system('echo $$')
  endif
  let post=""
  let w:saved_cwd = getcwd()
  if vertical && buffer
    let pre="vsplit \|"
  elseif vertical && terminal
   let pre="vertical "
  elseif !vertical && buffer
    let pre="split \|"
  elseif !vertical && terminal
    let pre=""
  endif
  if terminal
    let arg = "terminal"
    let file=g:term
    " let post="setlocal nobuflisted buftype=nofile | setlocal nobuflisted"
  elseif buffer && exists("file") && file != ""
    let file = a:file
    let file=GetCwordIfReadableFile()
    " todo
    " when file exists in buffers, then execute "buffer ".#, else execute "e ".file
    let arg="e ".file
  elseif buffer
    let arg="enew"
  endif
  exec pre arg file
  " echo pre arg file
  " echo pre arg file
  " return
  " exec post
  let win = winnr()
  " exec previous_win "wincmd w"
  " if buffer
  "   let exec=""..arg
  "   exec arg
  " elseif terminal
  "   let exec="terminal"
  "
  "   if a:type=="buffer"
  "   elseif a:type=="terminal"
  "     if has('nvim')
  "       split
  "     endif
  "     exec "terminal" arg
  "   else
  "     execute "split | ".arg
  "   endif
  " endif
  if !HasState()
    call BufferSetup()
  endif
  call SetTerms(b:state.uuid, GetKey())
  let s:callbacks = { 'on_stdout': function('s:OnEvent'), 'on_stderr': function('s:OnEvent'), 'on_exit': function('s:OnEvent') }
  let uuid=NewUUID()
  " if a:direction=~"[HJKL]"
  "   " echo a:direction
  "   exec "wincmd "..a:direction
  " endif
  if a:mode=="file"
    " exec "b ".a:file
  elseif a:mode=="copy"
  elseif a:mode=="new" && a:type != "terminal"
    " enew
  elseif type(a:mode)==0
    if bufexists(a:mode)
      exec "b".a:mode
      " if BufVisibileInCurrentTab(bufnr())
      " endif
    endif
  endif
  if terminal && h
    exec "wincmd h"
  elseif h
    exec "wincmd h"
  elseif k
    exec "wincmd k"
  endif
  if swap
    wincmd x
  else
    " exec previous_win"wincmd w"
  endif
  " call WinSwapBuf_Back()
  if !terminal
    call CD(projectpath)
  else
    call CD(projectpath)
  endif
  if !insert && terminal
    startinsert
  endif
  if foremost
    if h | wincmd H | elseif j | wincmd J | elseif k | wincmd L | elseif l | wincmd L | endif
  " call WinSwapBuf_Back()
  " exec previous_win "wincmd w"
  call WinSwap_Back()
  endif
endfunction

function! TabHMove()
  tabmove -
endfunction

function! TabLMove()
  tabmove +
endfunction

function! TabH()
  let nr=tabpagenr()
  let len=tabpagenr('$')
  if nr==1
    tabnew
    0tabmove
  else
    tabprev
  endif
endfunction

function! TabL()
  let nr=tabpagenr()
  let len=tabpagenr('$')
  if len==nr
    tabnew
  else
    tabnext
  endif
endfunction

function! SwapWin(direction)
  let l:current_win=winnr()
  let l:current_buf=winbufnr(l:current_win)
  let l:neighbor_win=winnr(a:direction)
  if l:neighbor_win==l:current_win
    echo "no neighbor"
    return
  endif
  let l:neighbor_buf=winbufnr(l:neighbor_win)
  echo l:current_win l:current_buf l:neighbor_win l:neighbor_buf
  execute l:current_win "windo b" l:neighbor_buf
  execute l:neighbor_win "windo b" l:current_buf
endfunction

function! FindParent(layout, target_id, parent)
  let type = a:layout[0]
  if type == 'leaf'
    if a:layout[1] == a:target_id
      return [a:parent, a:layout]
    endif
    return []
  endif
  let children = a:layout[1]
  for child in children
    let result = FindParent(child, a:target_id, a:layout)
    if !empty(result)
      return result
    endif
  endfor
  return []
endfunction
function! SameContainer(id_a, id_b)
  let layout = winlayout()
  let res_a = FindParent(layout, a:id_a, [])
  let res_b = FindParent(layout, a:id_b, [])
  if empty(res_a) || empty(res_b)
    return {'same': 0, 'type': ''}
  endif
  let parent_a = res_a[0]
  let parent_b = res_b[0]
  let same = (parent_a is parent_b) || (parent_a == parent_b)
  return {'same': same, 'type': parent_a[0]}  " type: 'row' or 'col'
endfunction
function! IntegrateIn(direction)
  " echo "Realize This Somehow"
  " echo winlayout()
  " echo win_getid()
  " echo winnr(a:direction)
  " echo win_getid(winnr(a:direction))
  let this_id   = win_getid()
  let target_id = win_getid(winnr(a:direction))
  let result = SameContainer(this_id, target_id)
  if result.same
    echo 'Same ' . result.type
  else
    echo 'Different container'
  endif
  call win_splitmove(this_id, target_id, {'vertical': result.type == 'row'})
endfunction

function! CDLastWinProjectCWD()
  let lw=winnr('#')
  let lb=winbufnr(winnr('#'))
  " let cwd=getbufvar(lb, 'CWD()')
  let cwd=getwinvar(lw, 'cwd')
  echo cwd
endfunction

function! WinBufSwap_Back()
  let thiswin = winnr()
  let thisbuf = bufnr("%")
  let lastwin = winnr("#")
  let lastbuf = winbufnr(lastwin)
  exec  lastwin . " wincmd w" ."|". "buffer ". thisbuf ."|". thiswin ." wincmd w" ."|". "buffer ". lastbuf
endfunction

function! C() abort
  let g:cursorpos=getcurpos()
endfunction
command! -range -nargs=0 C call C()

function! CB() abort
  call cursor(g:cursorpos[1], g:cursorpos[2])
endfunction
command! -range -nargs=0 CB call CB()

function! TabSwap_Prep()
  let g:lasttab=tabpagenr()
endfunction

function! TabSwap_Back()
  execute "norm" g:lasttab "gt"
endfunction

function! WinSwap_Prep()
  let g:lastwin= winnr()
endfunction

function! WinSwap_Back()
  exec g:lastwin . " wincmd w"
endfunction

function! WinSwapBuf_Prep()
  let g:lastwin= winnr()
  let g:lastbuf= bufnr()
endfunction

function! BufPrep()
  let g:bufprep=bufnr()
endfunction

function! DiffOff()
  :windo diffoff
  :bufdo diffoff
endfunction

function! BufBack()
  exec "e" g:bufprep
endfunction

function! WinSwapBuf_Back()
  let g:thiswin= winnr()
  let g:thisbuf= bufnr()
    exec  g:lastwin . " wincmd w" ."|". "buffer ". g:thisbuf ."|". g:thiswin ." wincmd w" ."|". "buffer ". g:lastbuf ."|". g:lastwin . " wincmd w"
endfunction

function! WinFocus_Prep()
  let g:focusUUID=GetUUID()
endfunction

function! WinFocus_Back()
  if GetKeyH() || GetKeyK() || GetKeyJ() || GetKeyL()
    exec GetWinByUUID(g:focusUUID) "wincmd w"
  endif
endfunction

function! WinFocusBack()
  echo winnr("$")
endfunction

function! GetCurrentNeighborActive()
  let active=-1
  return
  if !has_key(g:hideToggles, bufnr())
    let g:hideToggles[bufnr()]={}
  endif
  if has_key(g:hideToggles[bufnr()], GetKey())
    let active= ! g:hideToggles[bufnr()][GetKey()]
    call remove(g:hideToggles[bufnr()], GetKey())
  else
    let active=0
  endif
  call extend(g:hideToggles[bufnr()], {GetKey(): active })
  return g:hideToggles[bufnr()][GetKey()]
endfunction

function! ToggleCurrentNeighbors()
endfunction

function! SwitchBackIfIsTerm()
  echo "switchback"
  let bufname = bufname('%')
  let bufnr = bufnr('%')
  let buftype = getbufvar(g:bufferNumber, "&buftype")
  if buftype!="terminal"
     let g:bufferNumber=GetBuf()
     let g:windowNumber=GetWin()
     echo "no term"
  endif
  echo g:bufferNumber
endfunction

function! GetCwordIfReadableFile()
  let cword=""
  let cword=expand('<cword>')
  let cword=expand('<cWORD>')
  let path=substitute(cword, '\n', "", 'g')
  if !filereadable(path)
    let path=""
  endif
  return path
endfunction

function! HideTerminal()
  if 1
    if IsThisTerminalVisibile()
      if IsTerminalFocus()
        if GetKey()=="b"
          execute 'b#'
        elseif GetKey()=="h"
          hide
        elseif GetKey()=="j"
          hide
        elseif GetKey()=="k"
          hide
        elseif GetKey()=="l"
          hide
        endif
      else
        let g:terminalBuffer=GetBufByUUID(AimTermName())
        let b=bufwinnr(g:terminalBuffer)
        exec b"hide"
      endif
    endif
  else
    if IsThisTerminalVisibile()
      let g:terminalBuffer=GetBufByUUID(AimTermName())
      let b=bufwinnr(g:terminalBuffer)
      exec b"hide"
    endif
  endif
endfunction

function! IsTerminalExists()
  return Length(GetTerms(AimTermNameWoId()))
endfunction

function! IsTerminalExistsX()
  let g:terminalBuffer=BufSell(AimTermName())
  if g:terminalBuffer > 0
    return 1
    return bufexists(g:terminalBuffer)
  else
    return 0
  endif
endfunction

function! IsTerminalFocus()
  let bufnr = bufnr("%")
  let g:terminalBuffer=GetBufByUUID(AimTermName())
  if bufnr == g:terminalBuffer
    return 1
  else
    return 0
  endif
endfunction

function! IsTerminalVisibile(num)
  let visible = {}
  for t in range(1, tabpagenr('$'))
      for b in tabpagebuflist(t)
          let visible[b] = 1
      endfor
  endfor
  return bufexists(a:num) && has_key(visible, a:num)
endfunction

function! IsThisTerminalVisibile()
  let visible = {}
  for t in range(1, tabpagenr('$'))
      for b in tabpagebuflist(t)
          let visible[b] = 1
      endfor
  endfor
  let g:terminalBuffer=BufSell(AimTermName())
  return bufexists(g:terminalBuffer) && has_key(visible, g:terminalBuffer)
endfunction

function! ScrollTerminalDown()
  let termwin=winnr()
  let b=GetWin()
  exec b" wincmd w"
  norm <c-\><c-n><End>i
  exec termwin" wincmd w"
endfunction

function! FocusTerminal()
  let win=winnr()
  let b=bufwinnr(g:terminalBuffer)
  exec b" wincmd w"
  norm <c-\><c-n><PageDown><PageDown>i
endfunction

function! TermClosed()
  if exists("t:exec_targets")
    for i in range(0,len(t:exec_targets)-1)
      if HasState()
        if t:exec_targets[i][1] == b:state.uuid
          let t:exec_targets[i][1]=-1
        endif
      endif
    endfor
  endif
endfunction

function! UnsetTerms(uuid)
endfunction

function! ExitTerminal()
  let i=GetBufByUUID(g:termname)
  if i>0
    execute "bd!" i
  endif
endfunction

function! SetTerms(uuid, k)
  if HasState()
    if IsTermWin() || IsVash()
      call Statusline()
    endif
  endif
endfunction

function! InsertIfTerminal()
  try
  if IsTermWin()
    if has('nvim')
      startinsert
    else
      if ! exists("modifiable")
        norm i
      endif
    endif
  endif
  catch
  endtry
endfunction

function! NeededCmdHeight(msg) abort
  let width = &columns
  let lines = 0
  for line in split(a:msg, "\n", 1)
    let lines += max([1, (strdisplaywidth(line) + width - 1) / width])
  endfor
  return lines
endfunction

function! EchoSafely(msg, ms=700) abort
  let needed = NeededCmdHeight(a:msg)
  let save_ch = &cmdheight
  if needed > &cmdheight
    let &cmdheight = needed
  endif
  echo a:msg
  function! Shrink(buf) closure
    call setbufvar(a:buf, '&cmdheight', 1)
  endfunction
  " let s:timer_id = timer_start(100, function('Shrink'))
  let s:timer_id = timer_start(a:ms, {_ -> Shrink(bufnr())})
  " call timer_stop(s:timer_id)
endfunction
command! -nargs=1 EchoSafely call EchoSafely(<q-args>)

" function FixBufNr(c, mode='right')
"   let c=a:c
"   if !bufexists(c['bufnr'])
"     let c['bufnr']=-1
"   endif
"   if c['bufnr']==-1
"     " let buf=term
"     let c['bufnr']=GetBufDirectionIfTerm(c['direction'])
"     if c['bufnr']==-1
"       let [c['direction'],c['bufnr']]=FindSomeTerm()
"     endif
"     if c['bufnr']==-1
"       call Open('J', "terminal", "new")
"       let [c['direction'],c['bufnr']]=FindSomeTerm()
"     endif
"   elseif !bufexists(c['bufnr'])
"     call Open('J', "terminal", "new")
"     let [c['direction'],c['bufnr']]=FindSomeTerm()
"   elseif BufExistsAndAlive(bufnr())
"     echo "Try To ReOpen"
"     " call Open('J', "terminal", buf)
"   endif
" endfunction
let FixBufNr_decision_mode = [
  \ "check_direct",
  \ "check_faraway",
  \]
let FixBufNr_decision_algorithm = [
  \ "check_clockwise",
  \ "check_only_one_direction",
  \ "check_multiple_directions",
  \]
function FixBufNr(decision_mode="check_direct", decision_algorithm="check_only_one_direction")
  fun! _not_implemented()
    echo "FixBufNr: Not Implemented"
  endfun
  "
  fun! _check_direct() closure
    return GetBufDirectionIfTermDirect(d)
  endfun
  fun! _check_faraway() closure
    return GetBufDirectionIfTerm(d)
  endfun
  let F_decision_mode_fun=a:decision_mode=="check_direct"?{ -> _check_direct()}:a:decision_mode=="check_faraway"?{ -> _check_faraway()}:{ -> _not_implemented()}
  "
  let d='l'
  fun! _check_clockwise()  closure
    let dirs=['l','j','h','k']
    for d in dirs
      let x = F_decision_mode_fun(d)
      if x!=-1 | return x | endif
    endfor
  endfun
  fun! _check_only_one_direction()  closure
    return F_decision_mode_fun(d)
  endfun
  fun! _check_multiple_directions() closure
    let dirs=['l','h']
    for d in dirs
      let x = F_decision_mode_fun(d)
      if x!=-1 | return x | endif
    endfor
  endfun
  let F_decision_algorithm_fun=a:decision_algorithm=="check_clockwise"?{ -> _check_clockwise()}:a:decision_algorithm=="check_only_one_direction"?{ -> _check_only_one_direction()}:a:decision_algorithm=="check_multiple_directions"?{ -> _check_multiple_directions()}:{ -> _not_implemented()}
  " return
  let buf=F_decision_algorithm_fun()
  call DebugBuf("Fixing Buf Nr: "..buf)
  let save_win = win_getid()
  if !bufexists(buf)
    " if d==-1 | let d="l" | endif
    call DebugBuf("In This Case, A Command Gets Send To A Term That Has Not Finished Being Created")
    call Open(d, "terminal", "new")
  else
    if GetBufDirectionIfTermDirect(d)==-1
      call DebugBuf("Try To ReOpen " .. d)
    call DebugBuf("In This Case, A Command Gets Send To A Term That Has Not Finished Being Created")
      call Open(d, "terminal", buf)
    endif
  endif
  call win_gotoid(save_win)
  return buf
  "
  " let c=a:c
  " if !bufexists(c['bufnr'])
  "   let c['bufnr']=-1
  " endif
  " if c['bufnr']==-1
  "   " let buf=term
  "   let c['bufnr']=GetBufDirectionIfTerm(c['direction'])
  "   if c['bufnr']==-1
  "     let [c['direction'],c['bufnr']]=FindSomeTerm()
  "   endif
  "   if c['bufnr']==-1
  "     call Open('J', "terminal", "new")
  "     let [c['direction'],c['bufnr']]=FindSomeTerm()
  "   endif
  " elseif !bufexists(c['bufnr'])
  "   call Open('J', "terminal", "new")
  "   let [c['direction'],c['bufnr']]=FindSomeTerm()
  " elseif BufExistsAndAlive(bufnr())
  "   echo "Try To ReOpen"
  "   " call Open('J', "terminal", buf)
  " endif
endfunction

function! DetermineCommandOrigin()
  if b:savein=="samedir"
    return expand('%:p:h')
  elseif b:savein=="repo"
    return Folder_Repo_Or_Project_Only()
  elseif b:savein=="vimconfiguration"
    return VimConfiguration()
  endif
endfunction

" let g:commands=[]
" let b:savein="vimconfiguration"
" let b:released="no"
" let b:spectrum="buffer"
" date
" ls
" commandSpectrum
" commandExpansion
" commandOrigin
"
" g:commands has all commands
" save_spot (VimConfiguration/ProjectRoot/SameDir/InFile)
" command_expansion_to_all_buffers_in_same_tab (yes/no)
" released (yes/no) (saved in *.released file)
" commandSpectrum (global/repo/folder/buffer)
  " Finding The Right Command
    " when a command has global flag *(1)
    " then, when a command has repo flag / load them (when you are inside the repo) *(1)
    " then when a command has folder flag / load them (when cwd or editing file are in the same folder) *(1)
    " and finally when a command has buffer flag / load them, when you are editing the corrosponding buffer *(1)
    " consider g:available_commands per key
  " when 2 commands conflict at one key, make them selectable with repeatd keypressing (reverse order)
  " (1) load them anyways when in vimconfiguration / sometimes, when in projectroot / samedir or infile

function! GetMatchingCommand()
  let c = ''
  let val = filter(copy(g:commands), { i,v ->
    \ v:val["key"]==g:keymap
    \ && v:val["commandSpectrum"]=="buffer"
    \ && v:val["bufferFile"]==expand('%:p')
    \ })
  let c=empty(val)?c:empty(val)?c:val[0]
  "
  let val = filter(copy(g:commands), { i,v ->
    \ v:val["key"]==g:keymap
    \ && v:val["commandSpectrum"]=="folder"
    \ })
  let c=empty(c)?c:empty(val)?c:val[0]
  "
  let val = filter(copy(g:commands), { i,v ->
    \ v:val["key"]==g:keymap
    \ && v:val["commandSpectrum"]=="repo"
    \ })
  let c=empty(c)?c:empty(val)?c:val[0]
  "
  let val = filter(copy(g:commands), { i,v ->
    \ v:val["key"]==g:keymap
    \ && v:val["commandSpectrum"]=="global"
    \ })
  let c=empty(c)?c:empty(val)?c:val[0]
  return c
endfunction

function! Command() range
  call InitCommands()
  " call TermPopup("TERM", 21, {_ -> TestFunction(21) }, g:outfile)
  " return
  let vs=VS()
  call DebugBuf(g:keymap, 1, 1)
  " call CommandPageInit()
  " call CommandPageInit()
  " call DebugBuf(P(b:commands))
  " call DebugBuf(P(allcommands))
  " call EchoSafely(printf("%s %s %s", g:mode, g:keymap, LoadCommands()), 1500)
  " call EchoSafely(Pretty(c), 1500)
  " echo g:keymap type(c)
  if g:mode=='visual'
    let c=TermCommand()
    let c['commandOrigin']=DetermineCommandOrigin()
    let c['savein']=b:savein
    let c['released']=b:released
    let c['decision_mode']="check_direct"
    let c['decision_algorithm']="check_only_one_direction"
    let c['bufferFile']=b:spectrum=='buffer'?expand('%:p'):''
    let c['commandSpectrum']=b:spectrum
    let c['command']=vs
    let c['page']=0
    let c['key']=g:keymap
    let c['direction']=g:default_direction
    " let b:commands['pages'][0][g:keymap]=c
    " call filter(copy(g:commands), '!(v:val["commandSpectrum"]==c["commandSpectrum"]&&v:val["commandOrigin"]==c["commandOrigin"]&&v:val["key"]==c["key"]&&v:val["page"]==c["page"])')
    " call DebugBuf(vs)
    " let g:commands=[]
    " let g:commands=[{'test': "asdf", 'test2': "asdf3"}, {'test': "asd", 'test2': "asdf"}]
    " echo g:commands
    " let asdf="<F6>"
    " call filter(g:commands, 'v:val["key"]!=asdf')
    let found_index=indexof(copy(g:commands), { i,v->
      \    v:val["key"]==c["key"]
      \ && v:val["commandSpectrum"]==c["commandSpectrum"]
      \ && v:val["bufferFile"]==c["bufferFile"]
      \ && v:val["page"]==c["page"]
      \ })
    " echo found_index
    if found_index>-1
      " remove(g:commands, found_index)
      call DebugBuf("overwriting")
      let g:commands[found_index]=c
    else
      call DebugBuf("notoverwriting")
      " echo c
      call add(g:commands, c)
    endif
    call SaveCommands()
  else
    let c=''
    let c=GetMatchingCommand()
    if !empty(c)
      let b:savein=c['savein']
      let b:released=c['released']
      let b:spectrum=c['commandSpectrum']
      " call DebugBuf(c)
    else
      call DebugBuf('No Command Found under '..g:keymap)
      return
    endif
    "
    " let c=g:commands['pages'][0][g:keymap]
  endif
  if type(c)==0 && c['command'] != -1
    call DebugBuf(c)
    call DebugBuf("Command Not Send\n"..Pretty(c))
  elseif type(c)!=3
    " call EchoSafely(Pretty(c), 700)
    " call EchoSafely("Command Send\n"..Pretty(c), 5000)
    "
    " Find Buffer
    let target_term_buffer=FixBufNr(c['decision_mode'], c['decision_algorithm'])
    if target_term_buffer==-1 || !BufVisibileInCurrentTab(target_term_buffer)
      call DebugBuf("BufNr: "..target_term_buffer)
    endif
    " let b:MapCommand[c['direction']..'t']={'bufnr': buf, 'dir': dir }
    " let buf=GetBufDirectionIfTerm(c['direction'])
    " let buf=winbufnr(win)
    if target_term_buffer!=-1
      " let buf=winbufnr(winnr(c['direction']))
      " call TERM(target_term_buffer, c['command'])
      call SendCommandToTermByBuf(target_term_buffer, c['command'])
      call DebugBuf("Command Send")
    else
      call DebugBuf(c)
      call DebugBuf("Command Not Send")
    endif
  else
    call DebugBuf(Pretty("Type Error"))
  endif
  " echo g:commands
endfunction

function! DebugBuf(data, clear=0, checkbuf=0)
  if a:checkbuf==1 || !exists('t:debugbuf')
    " Prep
    let save_win = win_getid()
    if !exists("t:debugbuf")
      " Not Existent
      " create
      vertical new
      wincmd J
      exec "resize 5"
      let t:debugbuf=bufnr()
    endif
    " Exists
    let isvisibile=BufVisibileInCurrentTab(t:debugbuf)
    if !isvisibile
      " show
      vertical new
      exec "b" t:debugbuf
      wincmd J
      exec "resize 5"
    else
      " push far right
      call win_gotoid(t:debugbuf)
      call EnsureRightmost(t:debugbuf)
    endif
    " Clear
    if a:clear==1
      call deletebufline(t:debugbuf, 1, '$')
    endif
    " Text
    call appendbufline(t:debugbuf, '$', split(a:data, ''))
    call win_gotoid(save_win)
    if a:clear==1
      call deletebufline(t:debugbuf, 1)
    endif
  else
    if a:clear==1
      call deletebufline(t:debugbuf, 1, '$')
    endif
    " let data=split(J(a:data), '\%x0')
    " let data=split(a:data, '\%x0')
    call appendbufline(t:debugbuf, '$', a:data)
  endif
endfunction

function! ExecuteInWin(winid, cmd)
  let save_win = win_getid()
  call win_gotoid(a:winid)
  execute a:cmd
  call win_gotoid(save_win)
endfunction

function! CountRightNeighbors(windid)
  let save = win_getid()
  call win_gotoid(a:winid)
  let current=winnr()
  let total = winnr('$')
  let right = total - current
  call win_gotoid(save)
  return right
endfunction

function! IsBufferVisibile(bufnr)
  return bufwinid(a:bufnr)
endfunction

function! IsRightmost(bufnr)
  let winid=bufwinid(a:bufnr)
  if winid==0
    return 0
  endif
  let save = win_getid()
  call win_gotoid(winid)
  let is_rightmost=(winnr() == winnr('$'))
  call win_gotoid(save)
  return is_rightmost
endfunction

function! PushWindowRight(winid)
  let save = win_getid()
  call win_gotoid(a:winid)
  wincmd L
  call win_gotoid(save)
endfunction

function! EnsureRightmost(bufnr)
  let winid=bufwinid(a:bufnr)
  if winid==0
    " echo "Buffer not visibile"
    return
  endif
  if IsRightmost(a:bufnr)
    " echo "Already Rightmost"
    return
  endif
  call PushWindowRight(winid)
  " echo "Pushed buffer " . a:bufnr . " to right"
endfunction

function! SigTermToTerm(direction)
  let x=['']
  let buf=winbufnr(winnr(a:direction))
  call TERM(buf, x)
endfunction

function! SendCustomCommandToTerm(direction, command)
  let x=a:command
  let buf=winbufnr(winnr(a:direction))
  call TERM(buf, x)
endfunction

function! DirectionAllMapCommand(direction) range
  let b:MapCommands['ht']=a:direction
  let b:MapCommands['jt']=a:direction
  let b:MapCommands['kt']=a:direction
  let b:MapCommands['lt']=a:direction
endfunction

function! DirectionMapCommand(direction) range
  let key=a:direction..'t'
  let b:MapCommands[key]=a:direction
endfunction

function! DirectionMapSmart(direction) range
  " todo execute (term)
  " todo execute (hjkl fallback term)
  " todo execute (newterm J or map(<F5>-<F8>, hjkl))
  call InitMapCommand(a:direction)
  set nomore
  let c = -1
  " let all=["k5", "k6","k7","k8"]
  let all=["\<F5>", "\<F6>","\<F7>","\<F8>"]
  let alll=["<F5>", "<F6>","<F7>","<F8>"]
  " let all=["\<F5>"[0]->char2nr(), "<F6>", "<F7>", "<F8>"]
  " while nr2char(c)!="\<F5>"
  " while nr2char(c)!="\<F5>"
    " let c = getcharstr()
  let boom=[ 0, 0, 0, 0 ]
  if g:keymap==',,<F5>' | let boom[0]=1 |
  elseif g:keymap==',,<F6>' | let boom[1]=1 |
  elseif g:keymap==',,<F7>' | let boom[2]=1 |
  elseif g:keymap==',,<F8>' | let boom[3]=1 | endif
  echo map(copy(alll), 'boom[v:key] ? v:val : repeat("-", len(v:val))')
  let index=-1
  let default='----'
  while index([120], c)==-1
    let c = getchar()
    echo "\r"
    redraw
    let index=index(all, c)
    if index>=0
      let boom[index]=!boom[index]
      " echo all[index] ':' boom[index] ':' boom
      " echo map(copy(alll), 'boom[v:key] ? v:val : default')
      let keys=filter(copy(alll), 'boom[v:key]')
      echo map(copy(alll), 'boom[v:key] ? v:val : repeat("-", len(v:val))')
    else
      let indexes=filter(range(len(boom)), 'boom[v:key]')
      for i in indexes
        let dir=nr2char(c)
        " echo "assigning ".. i .." to "..dir
        "echo "assigning ".. i .." to "..dir
        let pos=dir..'t'
        if pos=='ht'
          let b:MapCommands['ht']={ 'term': -1, 'dir': dir }
        elseif pos=='jt'
          let b:MapCommands['jt']={ 'term': -1, 'dir': dir }
        elseif pos=='kt'
          let b:MapCommands['kt']={ 'term': -1, 'dir': dir }
        elseif pos=='lt'
          let b:MapCommands['lt']={ 'term': -1, 'dir': dir }
        endif
        " echo Format(b:MapCommands)
      endfor
    endif
    " echo "\r" | redraw!
    " let keys=map(copy(alll), 'boom[v:key]')
    " for k in keys
    "   echom k
    " endfor
    " echo boom
    " let idx=-1
    " for f in boom
    "   let idx+=1
    "   if f==1
    "     echom alll[idx]
    "     " echo nr2char(alll[f])
    "   endif
    " endfor
    " let c = nr2char(getchar())
    " echo c index(all, c)
    " echo c type(c)
    " echo all[0] type(all[0])
  endwhile
endfunction

function InitMapCommand(direction)
  if !exists("b:MapCommands")
    let b:MapCommands={
    \ 'path': expand("%:p"),
    \ 'h': '',
    \ 'ht': '',
    \ 'j': '',
    \ 'jt': '',
    \ 'k': '',
    \ 'kt': '',
    \ 'l': '',
    \ 'lt': ''
    \ }
    call MapCommand(a:direction)
  endif
endfunction

function! MapCommand(direction) range
  let data = VS()
  call InitMapCommand(a:direction)
  if a:direction=='x'
    " echo b:MapCommands
    return
  endif
  let direction=a:direction
  function! _empty_type_string(d) closure
  return type(b:MapCommands[a:d])!=3 && b:MapCommands[a:d]=='' || a:d==direction
  endif
  endfunction
  " For Now Commands Get Assigned To All <F5-F8> Keys
  " Directions Bounds To The First Direction Set
  " No Target Term Redefinition Implemented Yet
  " Commands Can Be Changed But Not Assigned To Another Term
  if _empty_type_string('h')
    let b:MapCommands['h']=data
  endif
  if _empty_type_string('j')
    let b:MapCommands['j']=data
  endif
  if _empty_type_string('k')
    let b:MapCommands['k']=data
  endif
  if _empty_type_string('l')
    let b:MapCommands['l']=data
  endif
  if _empty_type_string('ht')
    let b:MapCommands['ht']={ 'buf': -1, 'dir': a:direction }
  endif
  if _empty_type_string('jt')
    let b:MapCommands['jt']={ 'buf': -1, 'dir': a:direction }
  endif
  if _empty_type_string('kt')
    let b:MapCommands['kt']={ 'buf': -1, 'dir': a:direction }
  endif
  if _empty_type_string('lt')
    let b:MapCommands['lt']={ 'buf': -1, 'dir': a:direction }
  endif
  call SavedCommandToTerm(a:direction)
endfunction

function! BufVisibileInCurrentTab(bufnr) abort
  for l:winnr in range(1, winnr('$'))
    if winbufnr(l:winnr) == a:bufnr
      return 1
    endif
  endfor
  return 0
endfunction

function! BufVisibileInCurrentTab_Winnr(bufnr) abort
  for l:winnr in range(1, winnr('$'))
    if winbufnr(l:winnr) == a:bufnr
      return l:winnr
    endif
  endfor
  return 0
endfunction

function! BufVisibileAndAlive(bufnr) abort
  for l:winnr in range(1, winnr('$'))
    if winbufnr(l:winnr) == a:bufnr
      if getbufvar(a:bufnr, '&buftype') ==# 'terminal'
        return term_getstatus(a:bufnr) ==# 'running'
      endif
      return 1
    endif
  endfor
  return 0
endfunction

function! BufExistsAndAlive(bufnr) abort
  if bufexists(a:bufnr)
    if getbufvar(a:bufnr, '&buftype') ==# 'terminal'
      return term_getstatus(a:bufnr) =~# 'running'
    endif
    return 0
  endif
  return 0
endfunction

function VSRewriteCommand(direction) range
  call InitMapCommand(a:direction)
  let b:MapCommands[a:direction]=VS()
  call SavedCommandToTerm(a:direction)
endfunction

function! SavedCommandToTerm(direction) range
  call InitMapCommand(a:direction)
  let com=b:MapCommands[a:direction]
  let term=b:MapCommands[a:direction..'t']
  let [buf, dir]=[ term.buf, term.dir ]
  " Todo Directions
  if !bufexists(term.buf)
    let term.buf=-1
  endif
  if term.buf==-1
    " let buf=term
    let term.buf=GetBufDirectionIfTerm(a:direction)
    if term.buf==-1
      let [term.dir,term.buf]=FindSomeTerm()
    endif
    if term.buf==-1
      call Open('J', "terminal", "new")
      let [term.dir,term.buf]=FindSomeTerm()
    endif
  elseif !bufexists(term.buf)
    call Open('J', "terminal", "new")
    let [term.dir,term.buf]=FindSomeTerm()
  elseif BufExistsAndAlive(bufnr())
    echo "Try To ReOpen"
    " call Open('J', "terminal", term.buf)
  endif
  " let b:MapCommand[a:direction..'t']={'buf': buf, 'dir': dir }
  " let buf=GetBufDirectionIfTerm(a:direction)
  " let buf=winbufnr(win)
  if term.buf!=-1
   " let buf=winbufnr(winnr(a:direction))
   call TERM(term.buf, com)
  endif
  return
  let b:MapCommands[a:direction..'t']
endfunction

function! SendVSToTerm(direction) range
  " Bug (VS in normalmode sometimes results in the last selected line)
  " let vs=StripComments(VS())
  let vs=VS()
  let buf=winbufnr(winnr(a:direction))
  call TERM(buf, vs)
endfunction

function! SendCommandToThisTerm(cmd) range
  let buf=winbufnr(winnr())
  call TERM(buf, a:cmd)
endfunction

function! SendCommandToTermByBuf(buf, cmd) range
  call TERM(a:buf, a:cmd)
endfunction

function! SendCommandToTermByDirection(direction, cmd) range
  let buf=winbufnr(winnr(a:direction))
  call TERM(buf, a:cmd)
endfunction

function! SendCommandToThisTerm(command) range
  let buf=bufnr()
  call TERM(buf, a:command)
endfunction

function! RedoCommandToTermWithSigTerm(direction)
  let x=['','[A']
  let buf=winbufnr(winnr(a:direction))
  call TERM(buf, x)
endfunction

function! RedoCommandToTerm(direction)
  let x=[ '[A' ]
  let buf=winbufnr(winnr(a:direction))
  call TERM(buf, x)
endfunction

function! SigTermToTerm_win(win)
  let x=['']
  call TERM(a:win, x)
endfunction

function! SendCustomCommandToTerm_win(win, command)
  let x=a:command
  call TERM(a:win, x)
endfunction

function! SendVSToTerm_win(win) range
  call TERM(a:win, vs)
endfunction

function! RedoCommandToTermWithSigTerm_win(win)
  let x=['','[A']
  call TERM(a:win, x)
endfunction

function! RedoCommandToTerm_win(win)
  let x=[ '[A' ]
  call TERM(a:win, x)
endfunction


function! CheckVS() abort
  if mode() =~# '[vV\<C-v>]'
    let [l:start_line, l:start_col]=getpos("'<")[1:2]
    let [l:end_line, l:end_col]=getpos("'>")[1:2]
    if l:start_line == l:end_line
      let l:selected_text=getline(l:start_line)[l:start_col-1:l:end_col-1]
      return l:selected_text
    else
      echo "Multiple-line slection detected."
      return 0
    endif
  else
    let [l:start_line, l:start_col]=getpos("'<")[1:2]
    let [l:end_line, l:end_col]=getpos("'>")[1:2]
    if l:start_line==0 || l:end_line==0
      echo "No visual selection available."
      return 0
    endif
    echo "Not in visual mode, but previous selection exits."
    return 0
  endif
endfunction

function! CWindow(focus=0)
  let leaveUnfocused=""
  if !a:focus
    let leaveUnfocused=" | wincmd p"
  endif
  if g:vertical
    let size=50
  else
    let size=15
  endif
  " exec GetVertical() "copen "..leaveUnfocused
  " copen | wincmd p
  exec GetVertical() "copen "..size.." "..leaveUnfocused
endfunction

function! ToggleVertical()
  if g:vertical==1
    let g:vertical=0
  else
    let g:vertical=1
  endif
  ToggleC
  " if IsQuickfixOpenAndFocused()
  "   cclose
  "   call CWindow()
  " elseif !IsQuickfixOpen1()
  "   call CWindow()
  " elseif IsQuickfixOpen1()
  "   call CWindow()
  " endif
endfunction

function! GetVertical()
  if g:vertical
    return "vertical"
  endif
  return ""
endfunction

function! IsQuickfixOpenAndFocused()
  if winnr('$') > 0 && getwinvar(winnr("$"), '&buftype') ==# 'quickfix'
    return 1
  else
    return 0
endfunction

function! IsQuickfixOpen1()
  for win in getwininfo()
    if win.quickfix
      return 1
    endif
  endfor
  return 0
endfunction

function! IsQuickfixOpen2()
  if !empty(filter(getwininfo(), 'v:val.quickfix && !v:val.loclist'))
    return 1
  else
    return 0
  endif
endfunction

function! ToggleC()
  if IsQuickfixOpen2()
    cclose
  else
    call CWindow()
  endif
endfunction

function! BashCWindow(cmd)
  exec "AsyncRun "..a:cmd
  call CWindow()
endfunction

function! SearchRight(switch)
  if a:switch=="<visual>"
    let input=CheckVS()
  elseif a:switch=="<cword>"
    let input=expand('<cword>')
  elseif a:switch=="<CWORD>"
    let input=expand('<CWORD>')
  elseif a:switch=="<input>"
    let input=input("search for: ")
  endif
  let cmd = g:bashrc_source..'; pwd; findd '..input
  exec "AsyncRun "..cmd
  call CWindow()
endfunction

function! AddInCommandLine()
endfunction

function! FloatTermTest(command)
  let cmd=call('BuildString', [g:main_repo, '~/Folder'])
  function! s:OnJobExit(Term_name, Exit_status) abort
    echo exit_code
  endfunction
  exec "FloatermNew --autoclose=2 "..cmd
endfunction

function! ExecuteRight_Scriptnames()
  redir=>m
    silent scriptnames
  redir END
  cgetexpr m
  call CWindow()
endfunction

function! LsRight(switch="")
  if a:switch==""
    let input=CWD()[0]
  elseif a:switch=="<visual>"
    let input=CheckVS()
  elseif a:switch=="<cword>"
    let input=expand('<cword>')
  elseif a:switch=="<CWORD>"
    let input=expand('<CWORD>')
  elseif a:switch=="<input>"
    let input=input("search for: ")
  endif
  let cmd = 'ls'
  let output=system(cmd)
  cgetexpr output
  call CWindow()
endfunction

" function! _buildLayout(layout)
"   function! _wincmd(operator)
"     if a:operator=~'[HJKL]'
"       if a:operator=="H"
"         wincmd H
"       elseif a:operator=="J"
"         wincmd J
"       elseif a:operator=="K"
"         wincmd K
"       elseif a:operator=="L"
"         wincmd L
"       endif
"       let g:debug_layout.="\nwincmd "..a:operator
"     endif
"   endfunction
"   function! _norm(norm)
"     if a:norm != ""
"       exec "norm "..a:norm
"     endif
"   endfunction
"   let x=a:layout
"   let c=0
"   let g:debug_layout=""
"   let operator="x"
"   for a in x
"     if c!=0
"       let operator=x[c][1]
"     endif
"     let norm=""
"     if len(a)>2
"       let norm=x[c][2]
"     endif
"     if operator=="s"
"       let spc="split"
"     elseif operator=="v"
"       let spc="vsplit"
"     endif
"     if c==0
"       let pre="e "
"     else
"       let pre=spc.." "
"     endif
"     let file=x[c][0]
"     if filereadable(file)
"       silent exec pre..file
"       let g:debug_layout.="\nexec "..pre..file
"       call _wincmd(operator)
"       call _norm(norm)
"     else
"       let filee=expand(file)
"       if !filereadable(filee)
"         let filee = g:vim_configuration_src.."/"..file
"       endif
"       if filereadable(filee)
"         silent exec pre..filee
"         let g:debug_layout.="\nexec "..pre.. filee
"         call _wincmd(operator)
"         call _norm(norm)
"       else
"         echo "file not found: "..file
"       endif
"     endif
"     let c=c+1
"   endfor
" endfunction

" Utilities

function! ContainsAll(haystack, needle)
    for l:item in a:list2
        if index(a:list1, l:item) == -1
            return 0
        endif
    endfor
    return 1
endfunction

function! CheckList(args)
    let l:lists = split(a:args, '\s\+')
    if len(l:lists) != 2
        echoerr "Please provide two lists"
        return
    endif
    let l:list1 = split(l:lists[0], ',')
    let l:list2 = split(l:lists[1], ',')
    if ContainsAll(l:list1, l:list2)
        echo "List1 contains all elements of List2"
    else
        echo "List1 does NOT contain all elements of List2"
    endif
endfunction

function! ContainsString(haystack, needle)
  if stridx(a:haystack, a:needle) == -1
    return 0
  else
    return 1
  endif
endfunction

function! FindStringColumns(searchstr) range
  let line = getline('.')
  let cols = []
  let pos = 0
  let searchstr=input('string: ')
  while 1
    let pos = match(line, '\V' . escape(searchstr, '\'), pos)
    if pos == -1
      break
    endif
    call add(cols, pos + 1)  " 1-based column numbers
    let pos += 1
  endwhile
  return cols
endfunction

function! FindCharColumns(searchchar)
  let searchchar=input('char: ')
  let x = map(
        \ split(getline('.'), '\zs'),
        \ {i,v -> [i+1, match(v, searchchar) >= 0 ? i+1 : -1]})
        \->filter({_,v -> v[1] != -1})
        \->map({_,v -> v[0]})
  return x
endfunction

function! GotoMarker(marker) range
  execute "norm `".upper(a:marker)
endfunction

function! CreateMarker(marker) range
  execute "norm m".upper(a:marker)
endfunction

function! Length(arr)
  let x=a:arr
  let i= 0
  while i < len(x)
    let i=i+1
  endwhile
  return i
endfunction

function! SearchNext(keymap) range
  let [ key, leaders, fkey, vs ] = UtilHelper(a:keymap)
  call feedkeys('/')
endfunction

function! SearchPrev(keymap) range
  let [ key, leaders, fkey, vs ] = UtilHelper(a:keymap)
  call feedkeys('? "sy?<C-r>s<CR>gN')
endfunction

function! ClipboardYank()
  " silent try
  "   silent call system('wl-copy || xclip -i -selection clipboard', @@)
  " catch
  "   call setreg('*', @@)
  " endtry
  try
    call setreg('*', @@)
    " call setreg('*', @@, 'ac')
  catch
    call setreg('"', @@)
    " call setreg('"', @@, 'ac')
  endtry
endfunction

function! ClipboardPaste(mode)
  " put=getreg('*')
  " call getreg('*')
  " put=getreg('"')
  " if (GetMode() == "v")
  "   call cursor(g:vlcb[0], g:vlcb[1]) | execute "normal! v" | call cursor(g:vlce[0], g:vlce[1])
  " endif
  " silent try
  "   silent let @@ = system('wl-paste >/dev/null 2>/dev/null && wl-paste -n || xclip -o -selection clipboard')
  " catch
  "   let @@ = getreg('*')
  " endtry
endfunction

func! ListMonths()
  call complete(col('.'), ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'])
  return ''
endfunc

function! ToggleLineStateGlobal()
  Implement
endfunction

function! ToggleLineState()
  let g:linestate = g:linestate+1
  let g:linestate = g:linestate % 3
  call SetLineState(g:linestate)
endfunction

function! StashAndFree(file)
  !clear && git stash save "my saved stash"
  exec "!git checkout ".a:file
  !git stash list
  !git stash pop
  !git stash push -p
  !git stash apply
  !git stash branch add-sidebar
endfunction

function! SwitchHeaderCode()
  let e=@%
  let f=split(e, "/")[-1]
  let name=system('cut -d. -f 1', f)
  let ext=system('cut -d. -f 2', f)
  let newext = ext
  let ext=substitute(ext, '\%x00', "", 'g')
  let newext=substitute(newext, '\%x00', "", 'g')
  let name=substitute(name, '\%x00', "", 'g')
  if ext=="cpp"
    let newext = "h"
  elseif ext=="h"
    let newext = "cpp"
  endif
  let p = expand('%:h')
  let g:out=p."/".name.".".newext
  e g:out
endfunction

function! Keys(tuple)
  let keys=[]
  let len=Length(a:tuple)
  for c in range(0,len-1)
    let key = a:tuple[c][0]
    call extend(keys , [key])
  endfor
  return keys
endfunction

function! Values(tuple)
  let values=[]
  let len=Length(a:tuple)
  for c in range(0,len-1)
    if Length(a:tuple[c]) > 2
      let value = a:tuple[c][1:]
    else
      let value = a:tuple[c][1]
    endif
    call extend(values, [value])
  endfor
  return values
endfunction

function! Items(t)
  let output=[]
  for iv in range(0, len(a:t[0])-1)
    let temp=[]
    for i in range(0, len(a:t)-1)
      call extend(temp, [a:t[i][iv]])
    endfor
    call extend(output, [ temp ])
  endfor
  return output
endfunction

command! -range -nargs=0 Tidy <line1>,<line2>call Tidy()
" function Tidy() range
"   call TidyHTML()
"   " norm gv
"   " call DeleteEmptyLines()
"   " norm gv
"   " norm =
" endfunction

function! TidyHTML2()
  let vs="'<,'>"
  let pattern="s/<[^>]*>/\r&\r/g"
  silent exec vs..pattern
endfunction

command! -range -nargs=+ REGEX <line1>,<line2>call REGEX(<q-args>)
function! REGEX(pattern)
  let vs="'<,'>"
  try | silent exec vs..a:pattern | catch | finally | endtry
  " silent exec vs..a:pattern
endfunction

function! Tidy() range
  REGEX s:<tr>:<tr>:g
  REGEX s:</tr>:</tr>:g
  REGEX s:<td>:<td>:g
  REGEX s:</td>:</td>:g
  norm gv=
  silent '<,'>DeleteEmptyLines
endfunction

function! CountRegex() range
  let pattern="s/^\\s*\\\"/&/gen"
  let m = 0
  try
    silent redir=>m
      silent exec "'<,'>".pattern
    silent redir END
  catch
    silent redir=>m
      silent exec pattern
    silent redir END
  endtry
  echo m
endfunction

function! AppendToClipboard()
    let @+ = @+ . getline(".") . "\n"
endfunction

function! StartsWith(longer, shorter) abort
  return a:longer[0:len(a:shorter)-1] ==# a:shorter
endfunction

function! EndsWith(longer, shorter) abort
  return a:longer[len(a:longer)-len(a:shorter):] ==# a:shorter
endfunction

function! Contains(longer, shorter) abort
  return stridx(a:longer, a:shorter) >= 0
endfunction

function! __util(c)
  let cmd = a:c
  execute "Imap ".cmd
  execute "Nmap ".cmd
  execute "Tmap ".cmd
  execute "Vmap ".cmd
endfunction

function! GetDictValueCaseInsensitive(dict, key_pattern)
  for [k, v] in items(a:dict)
    if tolower(k)==# tolower(a:key_pattern)
      return v
    endif
  endfor
  return v:null
endfunction

function! SubstGtoDollar()
  let [n, y, x, n]=getpos(".")
  let word=expand('<cword>')
  exec "%s/g:"..word.."/$"..word.."/g"
  call cursor(y,x)
endfunction

function! Hex_codes()
  redir=>M
    silent g/.*\(#\x*\)/s//\1/p
  redir END
  call setreg('*', M)
  call setreg('+', M)
endfunction

function! ListInQuickfix(dir)
  let dir = empty(a:dir) ? '.' : a:dir
  let files = systemlist('ls -1 ' . dir)
  call setqflist(map(files, {_, f -> {'filename': dir . '/' . f, 'lnum': 1}}))
  copen
endfunction

function! CopyFileNameToClipboard()
  let path=expand('%:p')
  call setreg('+', path)
endfunction

function! CopyWholePathToClipboard()
  let path=expand('%:p')
  call setreg('+', path)
endfunction

function! InsertFilename()
   let cmd=["call expand('%')",
         \ expand('%:p'),
         \ expand('%:h'),
         \ expand('%:f'),
         \ expand('%:p:r')
         \]
  call appendbufline(bufnr(), line('.'), cmd)
endfunction

function! RepeatLastCommand()
  norm :[A
endfunction

" Vim General

function! Reloadfile()
  :e!
endfunction

function! Implement()
  echo "Needs Implementation"
endfunction

function! ToggleZoom(zoom=1)
  if exists("t:restore_zoom") && (a:zoom == v:true || t:restore_zoom.win != winnr())
      exec t:restore_zoom.cmd
      unlet t:restore_zoom
  elseif a:zoom
      let t:restore_zoom = { 'win': winnr(), 'cmd': winrestcmd() }
      exec "normal \<C-W>\|\<C-W>_"
  endif
endfunction

function! Resize(keymap)
  let [ key, leaders, fkey, vs ] = UtilHelper(a:keymap)
  let vim_height = &lines
  let vim_width = &columns
  let buf_height = winheight(winnr())
  let buf_width = winwidth(winnr())
  let interval=5
  if IsShift()
    let new_height = buf_height-interval
    let new_width = buf_width-interval
  else
    let new_height = buf_height+interval
    let new_width= buf_width+interval
  endif
  echo key
  if IsControl()
    exec "resize ".new_height
  else
    exec "vertical resize ".new_width
  endif
  call DebugKeys()
endfunction

function! Width(width)
  exec "vertical resize "..a:width
endfunction
command! -nargs=1 Width call Width(<q-args>)

function! Height(height)
  exec "horizontal resize "..a:height
endfunction
command! -nargs=1 Height call Height(<q-args>)

function! Bigger()
  let vim_height = &lines
  let vim_width = &columns
  let buf_height = winheight(winnr())
  let buf_width = winwidth(winnr())
  exec "vertical resize "..vim_width
  exec "resize "..vim_height
endfunction
command! -nargs=0 Bigger call Bigger()

function! ShrinkH()
  horizontal resize -25
endfunction

function! ShrinkV()
  exec GetVertical() "resize -65"
endfunction

function! ExpandH()
  horizontal resize +25
endfunction

function! ExpandV()
  exec GetVertical() "resize +65"
endfunction
let redefine_SaveFile= 1
if g:redefine_SaveFile || !exists('*SaveFile')
  function! SaveFile()
    call C()
    try
      w!
    catch
      silent call SaveAsRoot()
    endtry
    call CB()
    " echo "File was saved"
    call UpdateGit_OnSave()
  endfunction
endif

if !exists('*SourceVim')
  function! SourceVim()
    " exec "so "..expand('%:p')
    Re
    exec "so "..g:vim_configuration_path.."/src/Functions.vim"
    ReEnd
    " call Statusline()
  endfunction
endif

function! ToggleRelativeNumber()
  if v:version > 703
    set relativenumber!
  endif
endfunction

" set nowrap
" set textwidth=0
" set wrapmargin=0

function! ToggleWrap()
  if s:wrapenabled
    set nowrap nolist nolinebreak
    unmap j
    unmap k
    unmap 0
    unmap ^
    unmap $
    let s:wrapenabled = 0
  else
    set nowrap nolist nolinebreak
    nnoremap j gj
    nnoremap k gk
    nnoremap 0 g0
    nnoremap ^ g^
    nnoremap $ g$
    vnoremap j gj
    vnoremap k gk
    vnoremap 0 g0
    vnoremap ^ g^
    vnoremap $ g$
    let s:wrapenabled = 1
  endif
endfunction

function! SetLineState(n)
  if a:n== 0
    set nonumber
    set norelativenumber
  elseif a:n== 1
    set number
    set relativenumber
  elseif a:n== 2
    set number
    set norelativenumber
  endif
endfunction

function! SaveAsRoot()
  try
    :silent w !clear; sudo tee %
    ":w !sudo tee %
    :e! %
    :o
    :u
  catch
    echo "File was not saved."
  endtry
endfunction

function! SaveVars(file, prefix)
  let b=json_encode(copy(g:)->filter('v:key =~# "^'.a:prefix.'"'))
  call system("python -m json.tool > ".a:file, b)
endfunction

function! LoadVars(file)
  try
    let b:data = json_decode(readfile(a:file))
  catch
  finally
  call extend(g:, b:data)
  endtry
endfunction

function! HasState()
  if exists("b:state")
    return 1
  else
    return 0
  endif
endfunction

function! BufferSetup()
  let g:RecursiveCounter=g:RecursiveCounter+1
  let uuid=NewUUID()
  let type=""
  if !HasState()
    if exists('b:NERDTree') && b:NERDTree.isTabTree()
      let b:TermOpened=1
      let type="NERDTree"
    elseif &buftype == 'terminal'
    let b:state={  'file': expand('%'),  'uuid': uuid,  'type': 'terminal',  'exec_keys': [],  'color': 'User2',  'term_title': "Terminal-".uuid,  'leftinvisualstate': 0, }
        if exists("g:previous_parent")
          unlet g:previous_parent
        endif
    else
       let b:state={  'file': expand('%'),  'uuid': uuid,  'type': 'buffer',  'exec_keys': [],  'color': 'User2',  'leftinvisualstate': 0, }
    endif
    if !exists("g:buffer_vars")
      let g:buffer_vars={}
      let g:buffer_vars[bufname()]={}
      let n="g:buffer_vars[".bufname()."]"
    elseif !has_key(g:buffer_vars, bufname())
        let g:buffer_vars[bufname()]={}
    endif
    let b:isGitRepo=system("echo -n `git rev-parse --is-inside-work-tree 2>/dev/null || echo -n false`")
    " let b:lastMasterBranch=system("if $isGitRepo; then echo -n `git log master --oneline | head -n 0 | awk '{print $1}'`; else echo -n '...'; fi")
    " let w:gitBranch=system("if $isGitRepo; then echo -n `git rev-parse --abbrev-ref HEAD`; else echo -n 'not a git repo'; fi")
    " let b:commitstatus=system("echo -n 'got commited (to be done)'")
    " let b:datetime=system("echo -n `date`")
  endif
endfunction

function! IsVash()
  if HasState()
    if b:state.type=='vash'
      return 1
    else
      return 0
    endif
  else
    return 0
  endif
endfunction

function! s:OnEvent(job_id, data, event) dict
endfunction

function! GetType()
  if IsTermWin()
    return 'Terminal'
  elseif IsBufWin()
    return 'Buffer'
  endif
endfunction

" Autocommands

function! BufferSetupAutoCMD()
endfunction

function! UpdateAutoCMD()
endfunction

function! BufReadPost()
endfunction

function BufCreateCommandInit()
   "call CommandDictInit()
  call LoadCommands()
  call MakeDirCurrentCWD(bufnr())
endfunction

function! BufReadPre()
endfunction

function! BufAdd()
endfunction

function! BufWinEnter()
  " call REFRESH_CWD()
  " call CD(expand('%:p:h'))
  " call InitLineState()
  " echo "BufReadPost"
  call LoadCommands()
endfunction

function! BufEnter()
  call Statusline()
  call CD(expand('%:p'))

  call InitCommands()
  " call DebugPaths()
  " call Statusline()
endfunction

function! BufNew()
  " if &buftype == 'terminal'
  "   let b:type='terminal'
  " elseif &buftype == 'buffer'
  "   let b:type='buffer'
  " else
  "   let b:type='buffer'
  " endif
endfunction

function! BufAdd()
  " if exists("g:lastmain_repo")
  "   call CD(g:lastmain_repo)
  " endif
  " call BufferSetup()
  " call TabBuffers('bufenter')
  " call MakeDirCurrentCWD(bufnr())
endfunction

function! BufDelete()
  " let nr = (bufnr('#') == -1 ? bufnr('%') : bufnr('#'))
  " call input(nr.." delete")
endfunction

function! BufWipeout()
  " call input(bufnr().." wipeout")
endfunction

function! TabNew()
  " if exists("g:lastmain_repo")
  "   call CD(g:lastmain_repo)
  " endif
endfunction

function! VimLeave()
  redraw!
endfunction

function! FocusLost()
endfunction

function! TermLeave()
endfunction

function! VimEnter()
  call InitCommands()
  call Refresh('projects', 'GetProjects()')
  "" " if &buftype == 'terminal'
  "" "   set wrap
  "" " elseif &buftype == 'buffer'
  "" "   set nowrap
  "" " endif
  "" call InitLineState()
  "" " call system("bash", g:bashset_restore)
  "" call Statusline()
  "" " call SetProject(getcwd())
  "" " call Layout_Vim()
  "" " redraw!
  "" call AutoInstallPlug()
  call InitPlug()
endfunction

function! TabClose()
  try
    tabclose
  catch
    qa!
  finally
  endtry
endfunction

function! WinEnter()
  call SetLineState(g:linestate)
  "" " StaticWin --deal-focus
  "" " StaticWin get Information --text expand('%')
  "" " if getbufvar(bufnr(), '&buftype') == 'terminal'
  "" " if win_gettype(winnr()) == ""
  "" "     endif
  "" " exec "set tags="..CWD().."/tags"
  "" " echo "set tags="..CWD().."/tags"
  "" " if HasState()
  "" " endif
  "" call Statusline()
  "" call SetLineState(g:linestate)
  "" " exec "cd "..CWD()
  "" " call REFRESH_CWD()
  "" " Simpliest solution for now.
  "" " Visual Selection gets losts
  "" call InsertIfTerminal()
  "" " if BufIsTerminal()
  "" "   startinsert
  "" " endif
  "" " call InitLineState()
  "" " let parent=CWD()
  "" " if isdirectory(parent)
  "" "   exec "cd "..parent
  "" " endif
endfunction

function! WinLeave()
  let g:lastmain_repo=CWD()
  call SetLineState(0)
endfunction

function! BufLeave()
	let last_buffer = bufnr("$")
  let last_winid = bufwinid(last_buffer)
  let g:lastmain_repo=getwinvar(last_winid, "main_repo")
  " if IsTermWin()
  " endif
endfunction

function! TabBuffers(method)
  " let buffers=gettabvar(tabpagenr(), 'buffers')
  let method=a:method
  if method == 'init'
    " delcommand Bd
    " if exists('*Bd') " Function
    " if exists('g:Bd') " Variable
    if !exists('#TabBuffers') " Autocmd group
    " echo exists("#TabBuffers")
    " if exists(':Bd') " Mapping
    " if exists(':Bd') == 0 " Command
      " augroup! TabBuffers
      augroup TabBuffers
        autocmd! BufAdd * :call TabBuffers_Add(str2nr(expand('<abuf>')))
        autocmd! BufEnter * let g:last_buffer=bufnr()
        autocmd! BufEnter * call TabBuffers_Add(bufnr())
        autocmd! BufDelete * call TabBuffers_Delete(str2nr(expand('<abuf>')))
      augroup END
      " augroup! TabBuffers
      " command! -bang -complete=buffer -nargs=? Bd
      "   \ let g:bn=empty(<q-args>) ? bufnr('%') : bufnr(<q-args>) |
      "   \ let name=empty(<q-args>) ? bufname('%') : bufname(<q-args>) |
      "   \ execute "bdelete".(<q-bang>?"!" : "") <q-args>
      "   " \ echom "Deleted buffer #". bn . " (" . name . ")"
    endif
  elseif method == 'merge'
    for i in range(0,winnr('$')+1)
      if index(t:buffers, bufnr()) == -1
        call extend(t:buffers, [winbufnr(i)])
      endif
    endfor
    only
  elseif method == 'next'
    let idx=index(t:buffers, bufnr())
    let len=len(t:buffers)
    let next=Mod(idx+1, len-1)
    echo idx+1 len next
    exec "b" t:buffers[next]
  elseif method == 'prev'
    let idx=index(t:buffers, bufnr())
    let len=len(t:buffers)
    let prev=Mod(idx-1, len-1)
    echo idx-1 len prev
    exec "b" t:buffers[prev]
  endif
  " call settabvar(tabpagenr(), 'buffers', uniq(sort(buffers)))
  " call settabvar(tabpagenr(), 'buffers', buffers)
endfunction
function! TabBuffers_Add(bufnr)
  if !exists('t:buffers')
    let t:buffers=[]
  endif
  "" if method == 'bufenter'
  ""   " echo bufnr
  ""   " echo t:buffers
  ""   call TabBuffers_Add(bufnr())
  ""   " call settabvar(tabpagenr(), 't:buffers', buffers)
  if index(t:buffers, a:bufnr) == -1
    " if buflisted(a:bufnr)
    "   \ && getbufvar(a:bufnr, '&buftype') !=# 'quickfix'
    if getbufvar(a:bufnr, '&buftype') !=# 'nofile'
    "   \ && getbufvar(a:bufnr, '&buftype') !=# 'terminal'
    "   \ && getbufvar(a:bufnr, '&buftype') !=# 'help'
      " if filereadable(FullPath(a:bufnr))
        call extend(t:buffers, [a:bufnr])
      " endif
    " endif
    endif
  endif
endfunction
function! TabBuffers_Delete(bufnr)
  if index(t:buffers, a:bufnr) > -1
    let buffers=filter(t:buffers, 'v:val!='..a:bufnr)
    let t:buffers=buffers
  endif
endfunction
call TabBuffers('init')


function! InitLineState()
  " Implement " LineState Global And BufferWise
  if IsTermWin()
    call InsertIfTerminal()
  endif
endfunction

function! InitPlug()
  call plug#begin()
    " Plug 'dense-analysis/ale'
    " Plug 'junegunn/fzf'
    " Plug 'junegunn/fzf.vim'
    " Plug 'skywind3000/asyncrun.vim'
    " Plug 'tpope/vim-dispatch'
    " Plug 'prabirshrestha/vim-lsp'
    " Plug 'mattn/vim-lsp-settings'
    " Plug 'prabirshrestha/asyncomplete.vim'
    " Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'vi0lin/vim_configuration'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
  call plug#end()
endfunction
" Execute In File

function! PyExec(keymap) range
  echo "Python"
endfunction

function! BashExec(keymap) range
  let [ key, leaders, fkey, vs ] = UtilHelper(a:keymap)
  let m=expand(g:bashrc_source)
  for x in vs
    let m=m."\n".x
  endfor
  let ccout=systemlist(m)
  let cout=""
  for c in ccout
    if cout==""
      let cout=c
    else
      let cout=cout."\n".c
    endif
  endfor
  redir @*>
    silent echon cout
  redir END
  if key[0]=='c' || key[0]=='C'
    exec "norm gv".key[0].'*'
  elseif key[0]=='o'
    let e = getpos("'>")
    call cursor(e[1], e[2])
    exec "norm ".key[0].'*'
  elseif key[0]=='a'
    let e = getpos("'>")
    call cursor(e[1], e[2])
    exec "norm ".key[0].'*'
  else
    exec "norm ".key[0].'*'
  endif
  if IsVisual()
    norm gv
  endif
endfunction

function! BashPaste(keymap) range
  let [ key, leaders, fkey, vs ] = UtilHelper(a:keymap)
  put=a
endfunction

function! BashCommandLine()
  let input=input('!')
  " let list=systemlist(input)
  exec "r ! source ".g:bashrc_source."; "..input
endfunction

function! RUST(arg='') range
  let vs = a:arg
endfunction

function! VIM(arg='') range
  let vs = a:arg
  redir=>v
    for c in vs | silent exec c | endfor
  redir END
  " let length=len(split(m,'\n'))
  " if length>0
  "   put=m
  " endif
  call PUTT(v)
endfunction

function! BASH(cmd='', mode='exec_vs') range
  if a:cmd==''
    let x=VS()
  else
    let x = EnsureArr(a:cmd)
  endif
  let c = join(x, '\n')
  let m = systemlist(g:bashrc_source.";".c)
  " if a:mode == 'exec_vs'
  "   let m = systemlist(g:bashrc_source.";".c)
  " elseif a:mode == 'exec_input_vs'
  "   let m = systemlist(g:bashrc_source.";".c, vs)
  " endif
  " call PUTT(m)
  put=m
endfunction

function! PYTHON(arg='')
  let c = a:arg
  try
    let m = system(g:bashrc_source."; cat | python3", c)
  catch
    try
      let m = system(g:bashrc_source."; cat | python3", c)
    endtry
  endtry
  call PUTT(m)
endfunction

function! TIN(...)
  let b = bufnr()
  call TERM(b, a:000)
  exec "wincmd w"
  call Win(b)
endfunction

function! Sys(...)
  let x = system(join(a:000))
  put=x
endfunction

function! Bash(args)
  let vs=a:args
  let c = join(vs, '\n')
  " let m = systemlist(g:bashrc_source.";".c)
  let m = system(g:bashrc_source.";".c)
  put=m
endfunction

function! Vim(args)
  " echo "len" len(a:args)
  " echo "a:args" a:args
  " echo "empty" empty(a:args)
  " echo "exists" exists(a:args)
  " echo "a:args[0]" a:args[0]
  " echo "type" type(a:000)
  " echo VS()
  if !empty(a:args)
    let command=a:args
  else
    let command=VS()
  endif
  redir=>m
    silent exec join(command)
  redir END
  put=trim(m)
endfunction

" Customizable FZF Integration
function! BuildString(options, paths)
  let fzf="fzf --multi -i --no-sort --tiebreak=length,begin,index"
  let fzf="fzf --multi -i --tiebreak=begin,length"
  let m = a:paths
  let len=len(m)-1
  let string=""
  let prefix='bash -c " ( '
  if g:outfile!=""
    let suffix=' ) | '.fzf.' > '.g:outfile.'"'
  else
    let suffix=' ) | '.fzf.' > "'
  endif
  for x in range(0, len)
    let string=string.."find ".m[x]." ".a:options." -not -path '*/.git/*' -not -path '*/.git.off/*' 2>/dev/null "
    if x < len
      let string=string.."; "
    endif
  endfor
  let string=prefix..string..suffix
  return string
endfunction

function! Buildstring_Popup(title, paths, callback, type="file", maxdepth=10, register="")
  if a:type=="directory"
    let type="d"
  else
    let type="f"
  endif
  let cmd=call('BuildString', [ "-maxdepth "..a:maxdepth.." -type "..type,  a:paths])
  let title=' '..a:title..": "..join(a:paths, ' ')..' '
  let g:FileFinder_result=""
  function! OnStdout(channel, msg)
  endfunction
  function! OnError(...)
  endfunction
  function! OnExitTerm(bufname, job, code)
  endfunction
  function! s:FzfClose(job, status) abort
  endfunction
  let opts={
        \ 'hidden': 1,
        \ 'err_cb': 'OnError',
        \ 'term_name': 'Find',
        \ 'term_finish': 'close',
        \ 'exit_cb': function('s:FzfClose'),
        \ }
  let tnr=term_start(cmd, opts)
  let g:tnr=tnr
  function! MyFilter(wnid, key)
    if a:key=='q'
      call popup_close(a:winid)
      call OnPopupClose(a:winid, 'User pressed q')
      return 1
    endif
    return 0
  endfunction
  try
  let g:pnr=popup_create(tnr, #{
    \ title: title,
    \ pos: 'center',
    \ minwidth: 80,
    \ minheight: 20,
    \ maxheight: 80,
    \ border: [1, 1, 1, 1],
    \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
    \ highlight: 'Pmenu',
    \ term_cols: 40,
    \ cursorline: 1,
    \ zindex: 200,
    \ callback: a:callback,
    \ })
  let g:popup_bufnr=winbufnr(g:pnr)
  catch
  finally
  endtry
endfunction

function! Execution_Popup(title, list, callback)
  let title=' '..a:title..' '
  function! OnStdout(channel, msg)
  endfunction
  function! OnError(...)
  endfunction
  function! OnExitTerm(bufname, job, code)
  endfunction
  let opts={
        \ 'hidden': 1,
        \ 'err_cb': 'OnError',
        \ 'term_name': 'Find',
        \ 'term_finish': 'close',
        \ }
  function! MyFilter(wnid, key)
    if a:key=='q'
      call popup_close(a:winid)
      call OnPopupClose(a:winid, 'User pressed q')
      return 1
    endif
    return 0
  endfunction
  let g:pnr=popup_create(0, #{
    \ title: title,
    \ pos: 'center',
    \ minwidth: 80,
    \ minheight: 20,
    \ maxheight: 80,
    \ border: [1, 1, 1, 1],
    \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
    \ highlight: 'Pmenu',
    \ term_cols: 40,
    \ cursorline: 1,
    \ zindex: 200,
    \ callback: a:callback,
    \ })
  let g:popup_bufnr=winbufnr(g:pnr)
endfunction

function! GetTempfileLine(file)
  let tempfile=a:file
  if !filereadable(tempfile)
    return
  endif
  let result = readfile(tempfile)
  if exists("result")
    if len(result)>0
      let result=result[0]
    endif
    if empty(result)
      return
    endif
    call delete(tempfile)
    return result
  endif
  return
endfunction

" Plugins
function! Has_Plug_Vim()
  let x=execute('scriptnames')->split("\\n")->map({_,v -> v->substitute('^\s*\d\+:\s*','','')})
  " echo x
  " for xi in x
  "   echo xi
  " endfor
  if len(filter(copy(x), "v:val=~'plug.vim'")) > 0
    return 1
  else
    return 0
  endif
endfunction

function! Sourced_Plug_Vim()
  if Has_Plug_Vim()
    return 1
  endif
  if !exists('g:Sourced_Plug_Vim') || g:Sourced_Plug_Vim==0
    if !Has_Plug_Vim()
      if filereadable(g:plugfile)
        exec "source "..g:plugfile
      endif
    endif
    if Has_Plug_Vim()
      let g:Sourced_Plug_Vim=1
    else
      let g:Sourced_Plug_Vim=0
    endif
  endif
  return g:Sourced_Plug_Vim
endfunction

function! PlugUpdate()
  :PlugInstall
  :PlugUpdate
endfunction
command! -bar -range -nargs=0 PlugUpdate call PlugUpdate()

function Update()
  exec "!git -C "..g:vim_configuration_path.." pull"
endfunction
command! -bar -range -nargs=0 Update call Update()

" Happens On Vim Enter
function! AutoInstallPlug()
  if Has_Plug_Vim() && !Sourced_Plug_Vim()
    let x=execute('scriptnames')->split("\\n")->map({_,v -> v->substitute('^\s*\d\+:\s*','','')})
    let f=filter(copy(x), "v:val=~'plug.vim'")
    if len(f) > 0
      exec "source" f[0]
    endif
  elseif !Has_Plug_Vim() && !Sourced_Plug_Vim()
    let httpplug="https://raw.githubusercontent.com/junegunn/vim-plug/refs/heads/master/plug.vim"
    " exec "!wget -q "..httpplug.." "..g:plugfile
    if !filereadable(expand(g:plugfile))
      exec "!wget "..httpplug.." "..g:plugfile
    endif
  endif
endfunction

if executable('clangd')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': {server_info->['clangd']},
    \ 'whitelist': ['c', 'cpp'],
    \ })
endif

set rtp+=/usr/bin/fzf

" Extend Visual Selection
let g:b=[]
let g:e=[]

function! PopSelection() range
  if len(g:pb) > 0
    norm 
    call setpos("'<", g:pb[-1])
    call setpos("'>", g:pe[-1])
    let g:pb=g:pb[0:-2]
    let g:pe=g:pe[0:-2]
    norm gv
  endif
endfunction

function! PushSelection() range
  let b = getpos("'<")
  let e = getpos("'>")
  call extend(g:pb, [b])
  call extend(g:pe, [e])
  norm gv
endfunction

function! BackupSelection()
  let b = getpos("'<")
  let e = getpos("'>")
  call extend(g:b, [b])
  call extend(g:e, [e])
endfunction

function! RestoreSelection()
  call setpos("'<", g:b)
  call setpos("'>", g:e)
  let g:b=[]
  let g:e=[]
endfunction

function! ResetVS()
  call setpos("'<", [0,0,0,0])
  call setpos("'>", [0,0,0,0])
  let g:b=[]
  let g:e=[]
  let g:pb=[]
  let g:pe=[]
endfunction

function! RightmostVirtualColumn()
  let reg_v = @v
  silent normal! gv"vy
  let max = 0
  for line in split(getreg('v'), '\n')
    let len = strlen(line)
    let max = max([len, max])
  endfor
  let @v = reg_v
  let max += min([virtcol("'<"), virtcol("'>")]) - 1
  return max
endfunction

function! VSPerLine()
  norm gv
  let X=[getpos("'<"), getpos("'>"), getpos("v"), getpos("."), getpos("$"), getpos("#"), getpos("*")]
  let from=X[0][2]
  let to=X[3][2]
  let [line_start,   v_column_start] = getpos("v")[1:2]
  let [line_end,     v_column_end] = getpos(".")[1:2]
  let lines=[]
  let lines = getline(line_start, line_end)
  let linesOut=[]
  for line in lines
    let to=RightmostVirtualColumn()
    call extend(linesOut, [line[from-1:to-1]])
  endfor
  return linesOut
endfunction

" function VS_Reselect()
"   if IsVisual()
"     norm gv
"     return VS()
"   else
"     return VS()
"   endif
" endfunction

function! VS_DebugKeys()
  if IsVisual()
    return VS()
  else
    return VS()
  endif
endfunction

function! KeepPointer()
  norm `Y
endfunction

function! SetKey(key)
  let g:__pressedKey=a:key
endfunction

function! GetKey()
  return g:__pressedKey
endfunction

function! CountString(string, pattern)
  let oc=0
  let result=0
  let index=0
  while result > -1
    let result=stridx(a:string, a:pattern, index)
    let index=result+1
    if result > -1
      let oc=oc+1
    endif
  endwhile
  return oc
endfunction

function! SplitA(k)
  let i4=CountString(a:k, "<leader>")
  let pos=i4*8
  let leaders=""
  if pos>0
    let leaders=a:k[0:pos-1]
  endif
  let key=a:k[pos:]
  let a=stridx(key, "F")
  let b=stridx(key, ">")
  let fkey=""
  if b==-1
  elseif a>-1 && key=~#"F"
    exec "let fkey='<'.key[".a.":".b."]"
  endif
  return [ key, leaders, fkey ]
endfunction

function! SetKeymap(key)
  let g:__pressedKeymap=a:key
endfunction

function! UtilHelper(keymap)
  let vs = VS()
  call SetKeymap(a:keymap)
  let [ key, leaders, fkey ] = SplitA(a:keymap)
  if ! empty(fkey)
    call SetKey(fkey)
  else
    call SetKey(key)
  endif
  return [ key, leaders, fkey, vs ]
endfunction

function! SetModeChanged(modechanged)
  let g:modechanged=a:modechanged
endfunction

function! GetModeChanged() range
  return g:modechanged
endfunction

function! SetMode(keymap, mode)
  let g:mode=a:mode
  let g:keymap=a:keymap
  " if a:keymap!=""
  "   let [ key, leaders, fkey, vs ] = UtilHelper(a:keymap)
  " endif
endfunction

function! UnsetMode()
  unlet g:mode
  unlet g:keymap
  let g:mode="Normal"
  let g:keymap=""
endfunction

function! GetMode()
  return g:mode
endfunction

" Statusline

function! SETCOLOR(m)
  set statusline+=%#User2%{(g:linestate)}
endfunction

function! COLOR(...)
  if HasState()
    if IsBuffer()
      call SETCOLOR(a:1)
    elseif IsTermWin()
      call SETCOLOR(a:1)
    endif
  endif
endfunction

function! HasStatuslineInitialized()
  if exists("b:statusline_initialized")
    return 1
  else
    return 0
  endif
endfunction

function! IsBufWin()
  return exists('b:state')&&b:state.type=='buffer'
endfunction

function! IsTermWin()
  return exists('b:state')&&b:state.type=='terminal'
endfunction

function! Statusline_TogglePath()
  let g:wholepath=Mod(g:wholepath+1, 2)
  call Statusline()
endfunction

" Layouts
" function! Layout_Bash()
"   call _tabnew_if_not_empty_buffer()
"   " Filename, [hjklHJKLvs], normalcommand
"   let layout=[
"     \ [ g:bashrc, "H"],
"     \ [ g:bashrc..'.unreleased', "H"],
"     \ [ g:vimrc, "v"],
"     \]
"   call _buildLayout(layout)
"   exe 1 .. "wincmd w"
" endfunction

function! LayoutBash()
  call _tabnew_if_not_empty_buffer()
  let layout=[
    \ g:bashrc,
    \ g:bashrc..'.unreleased',
    \ g:vimrc,
    \]
  exec "argadd".join(layout, ' ')
  silent exec "b"layout[0]
endfunction

function! LayoutVim()
  call _tabnew_if_not_empty_buffer()
  let layout=[
    \ g:vim_configuration_src."/Functions.vim",
    \ g:vim_configuration_src."/Map.vim",
    \ g:vim_configuration_src."/Commands.vim",
    \ g:vim_configuration_src."/../install.sh",
    \ g:vim_configuration_src."/../.gitignore",
    \ g:vim_configuration_src."/../plugin/vim_configuration.vim",
    \ g:vim_configuration_src."/../README.md",
    \ g:vim_configuration_src."/Autocommands.vim",
    \ g:vim_configuration_src."/Functions.vim9",
    \ g:vim_configuration_src."/Statusline.vim",
    \]
  " for file in layout
  "   exec "b".file
  " endfor
  " call extend(t:buffers, layout)
  " args **/*.py | args! **/*.py
  " exec "args".join(layout, ' ')
  " exec "args!".join(layout, ' ')
  " set eventignore=BufRead,FileType
  " args **/*.*
  " set eventignore=
  " rg --vimgrep pattern -> :cfdo edit
  " fzf.vim or telescope
  exec "argadd".join(layout, ' ')
  " exec "badd " . join(layout, ' ')
  exec "b"layout[0]
endfunction

function! IsBuffersAreEmpty()
  function! _isEmpty(winnr)
    let bufnr=winbufnr(a:winnr)
    let lines=getbufline(bufnr, 1, '$')
    return len(lines) == 0 || (len(lines) == 1 && lines[0] =~ '^\s*$')
  endfunction
  let w=1
  while w<=winnr('$')
    if !_isEmpty(w)
      return 1
      break
    endif
    let w+=1
  endwhile
  return 0
endfunction

function! _tabnew_if_not_empty_buffer()
  exec IsBuffersAreEmpty() ? "tabnew" : ""
endfunction

" function! LayoutVim()
"   call _tabnew_if_not_empty_buffer()
"   " Filename, [hjklHJKLvs], normalcommand
"     " \ [ "Statusline.vim", "v"],
"     " \ [ "Generate.vim", "s"],
"     " \ [ g:vimrc, "v"],
"   let layout=[
"     \ [ g:vim_configuration_src."/Functions.vim", "H"],
"     \ [ g:vim_configuration_src."/Map.vim", "v"],
"     \ [ g:vim_configuration_src."/Commands.vim", "v"],
"     \ [ g:vim_configuration_src."/../install.sh", "v"],
"     \ [ g:vim_configuration_src."/../.gitignore", "v"],
"     \ [ g:vim_configuration_src."/../plugin/vim_configuration.vim", "v"],
"     \ [ g:vim_configuration_src."/../readme.md", "v"],
"     \ [ g:vim_configuration_src."/Autocommands.vim", "J"],
"     \ [ g:vim_configuration_src."/Functions.vim9", "v"],
"     \ [ g:vim_configuration_src."/Statusline.vim", "v"],
"     \]
"     " \ [ g:bashrc, "v", "G"],
"     " \ [ "/usr/local/share/vim/vim91/plugin/vim_configuration.vim", "v"],
"     " \ [ g:source_dir.."/notes.md", "s"],
"   call _buildLayout(layout)
"   exe 1 .. "wincmd w"
"   Merge
" endfunction

if !exists("g:linestate") | let g:linestate=0 | call SetLineState(g:linestate) | endif
if !exists("g:mode") | call SetMode("", "Normal") | endif

" What is this <expr>?
command! -range -nargs=0 KeyHandler <line1>,<line2>:call KeyHandler(getchar())
function! KeyHandler(key)
  echo a:key
  return
  let l:keystr=n2char(a:key)
  if l:keystr ==# 'j'
    return 'j'
  elseif l:keystr ==# 'k'
    return 'k'
  else
    return ''
  endif
endfunction

nnoremap <expr> <leader>F KeyHandler(getchar())
nnoremap <leader>F :put=string(KeyToArray(getchar()))<cr>
" ---- grep settings -------------------------------------------------
" set grepprg=grep\ -nH\ --\ -r\ -w\ $*
" set grepprg=grep -nrw -- $*

function! OpenFileUnderCursor()
  hide e <cfile>
  " exec 'e '..expand("<cfile>")
  " exec ':call SearchOpenFile(expand("<cfile>"))'
  " let w:cwd=getcwd()
  " call CD(expand('%:p'))
  " call SetPointer(expand('%:p'))
endfunction

function! DebugReplacements()
  echo expand("<cWORD>")
  echo expand("<cword>")
  echo expand("<cexpr>")
  echo expand("<cfile>")
  echo expand("<afile>")
  echo expand("<abuf>")
  echo expand("<amatch>")
  echo expand("<sfile>")
  echo expand("<stack>")
  echo expand("<script>")
  echo expand("<slnum>")
  echo expand("<sflnum>")
  echo expand("<client>")
endfunction

" StaticWin --title Information --new --top --foremost

function! FullPath(bufnr)
  return fnamemodify(bufname(b), ':p')
endfunction
" Custom fzf command with your own list
function! FullPaths(buffers)
  let pack=[]
  for b in a:buffers
    " echo bufname(42)
    call extend(pack, [ fnamemodify(bufname(b), ':p') ])
  endfor
  return pack
endfunction

" [!TODO]
" Add A FZF Functionality, That Behaves The Same, But Extends Searching From A
" Directory Or A List Of Files
" Make The FZF Window Visibile Trough Passing Globs Or List Of Files Or A Path
" Make It Possibile To Change Between The Normal And The FZF Popup
let s:popup_id = -1
let s:timer_id = -1
let g:file_list = []
" Dateiliste einmalig befüllen (alle geladenen Buffer)
function! RefreshFileList() abort
  let g:file_list = []
  let g:file_bufnrs = []
  " NewMap map <F1> :echo g:file_bufnrs<cr>
  " let g:file_list=FullPaths(t:buffers)
  for buf in getbufinfo({'buflisted': 1})
    if index(t:buffers, buf.bufnr) > -1
      if buf.name != ''
          " call add(g:file_list, buf.name)
          " call add(g:file_list, fnamemodify(buf.name, ':p'))
          " call add(g:file_list, fnamemodify(buf.name, ':p'))
          call add(g:file_list, fnamemodify(buf.name, ':p'))
          call add(g:file_bufnrs, buf.bufnr)
      endif
    endif
  endfor
endfunction

" Dateiliste einmalig befüllen (alle geladenen Buffer)
function! RefreshFileListDir() abort
	" let tagfiles = glob("`find . -name tags -print`")
	" let &tags = substitute(tagfiles, "\n", ",", "g")
  " glob2regpat
  " globpath
  let g:file_list = []
  let g:file_bufnrs = []
  let files=split(globpath(Folder_Up(0, 0), "*"), '\n')
  for f in files
    if !isdirectory(f) && filereadable(f)
      call extend(g:file_list,[f])
      call extend(g:file_bufnrs,[f])
    endif
  endfor
  " let g:file_list = []
  " for file in files
  "   call add(g:file_list, file)
  " endfor
endfunction
" Popup schließen (Timer-Callback)
function! s:ClosePopup(timer_id) abort
    if s:popup_id != -1 && !empty(popup_getpos(s:popup_id))
        call popup_close(s:popup_id)
    endif
    let s:popup_id = -1
    let s:timer_id = -1
endfunction
function! s:ShowPopup() abort
    if s:timer_id != -1
        call timer_stop(s:timer_id)
    endif
    if s:popup_id != -1 && !empty(popup_getpos(s:popup_id))
        call popup_close(s:popup_id)
    endif
    let current_file = expand('%:p')
    echo current_file
    let lines = []
    let highlight_line = 1
    for i in range(len(g:file_list))
        " Zeige relativen Pfad statt nur Dateiname
        " let fname = fnamemodify(g:file_list[i], ':~:.')
        let fname = g:file_list[i]
        let prefix = '  '
        if g:file_list[i] ==# current_file
            let prefix = '▶ '
            let highlight_line = i + 1
        endif
        call add(lines, prefix . fname)
    endfor
    " Längste Zeile für minwidth berechnen
    let max_len = max(map(copy(lines), 'strwidth(v:val)'))
    " Verfügbare Höhe: fast gesamter Bildschirm
    let max_h = &lines - 4
    let s:popup_id = popup_create(lines, {
        \ 'pos':       'topright',
        \ 'line':      2,
        \ 'col':       &columns - 2,
        \ 'minwidth':  max_len + 2,
        \ 'maxwidth':  &columns - 4,
        \ 'minheight': min([len(g:file_list), max_h]),
        \ 'maxheight': max_h,
        \ 'border':    [1, 1, 1, 1],
        \ 'title':     ' Buffers (' . len(g:file_list) . ') ' . GETCWD() . ' ',
        \ 'padding':   [0, 1, 0, 1],
        \ 'zindex':    50,
        \ 'mapping':   0,
        \ 'focusable': 0,
        \ 'scrollbar': 1,
        \ })
    " Aktive Zeile hervorheben
    call win_execute(s:popup_id, 'syntax match PopupCurrent /^▶.*/')
    call win_execute(s:popup_id,
        \ 'highlight PopupCurrent ctermfg=Yellow guifg=#FFD700 gui=bold cterm=bold')
    " Aktive Zeile in die Mitte scrollen
    let scroll_to = max([1, highlight_line - (max_h / 2)])
    call popup_setoptions(s:popup_id, {'firstline': scroll_to})
    " Auto-Close nach 2,5 Sekunden
    let s:timer_id = timer_start(2500, function('s:ClosePopup'))
endfunction

" Zum nächsten Buffer springen
function! NextBuffer() abort
    if empty(g:file_list) | return | endif
    let current = expand('%:p')
    let idx = index(g:file_list, current)
    " let next_idx = (idx + 1) % len(g:file_list)
    let next_idx = Mod(idx + 1, len(g:file_list))
    " echo idx next_idx
    try
      " execute 'silent buffer ' . fnameescape(g:file_list[next_idx])
      " call execute('silent buffer ' . g:file_list[next_idx])
      " let next=g:file_list[next_idx]
      " call execute('silent buffer ' . next)
      " exec "badd " . next
      " execute 'buffer ' . t:buffers[next_idx]
      " silent call bufload(g:file_bufnrs[next_idx])
      " silent noautocmd execute 'buffer' g:file_bufnrs[next_idx]
      try
        silent noautocmd execute 'buffer' g:file_list[next_idx]
      catch
        silent noautocmd execute 'e' g:file_list[next_idx]
      endtry
      call MakeDirCurrentCWD(bufnr())
      " execute 'e ' . t:buffers[next_idx]
    catch
      echo g:file_list
      echo next_idx
      echo "execute 'buffer ' . fnameescape(g:file_list[next_idx])"
    endtry
    call s:ShowPopup()
endfunction

" Zum vorherigen Buffer springen
function! PrevBuffer() abort
    if empty(g:file_list) | return | endif
    let current = expand('%:p')
    let idx = index(g:file_list, current)
    " let prev_idx = (idx - 1 + len(g:file_list)) % len(g:file_list)
    let prev_idx = Mod(idx - 1 + len(g:file_list), len(g:file_list))
    try
      " execute 'silent buffer ' . fnameescape(g:file_list[prev_idx])
      " let prev=g:file_list[prev_idx]
      " exec "badd " . next
      " call execute('silent buffer ' . prev)
      " silent call bufload(g:file_bufnrs[prev_idx])
      " silent noautocmd execute 'buffer' g:file_bufnrs[prev_idx]
      try
        silent noautocmd execute 'buffer' g:file_list[prev_idx]
      catch
        silent noautocmd execute 'e' g:file_list[prev_idx]
      endtry
      call MakeDirCurrentCWD(bufnr())
      " execute 'buffer ' . t:buffers[prev_idx]
      " execute 'e ' . t:buffers[prev_idx]
    catch
      echo "execute 'buffer ' . fnameescape(g:file_list[prev_idx])"
    endtry
    call s:ShowPopup()
endfunction

" function! ShowPendingKeys(keys)
"   let lines = []
"   " Get all mappings that start with the pressed prefix
"   for mode in ['n', 'v', 'x']
"     for map in maplist()
"       if map.mode ==# mode && stridx(map.lhs, a:keys) == 0
"         call add(lines, map.lhs . '  →  ' . map.rhs)
"       endif
"     endfor
"   endfor
"   if empty(lines)
"     return
"   endif
"   let winid = popup_create(lines, {
"     \ 'pos': 'botleft',
"     \ 'line': &lines - &cmdheight - 1,
"     \ 'col': 1,
"     \ 'padding': [1, 2, 1, 2],
"     \ 'border': [1, 1, 1, 1],
"     \ 'time': 3000,
"     \ })
" endfunction
" nnoremap <leader> <Nop>
" " Show popup when leader is pressed, before the chain completes
" nnoremap <expr> <leader> ShowPendingKeysAndPassthrough('<leader>')
" function! ShowPendingKeysAndPassthrough(keys)
"   call ShowPendingKeys(a:keys)
"   return a:keys  " still pass the key through so chaining works
" endfunction
" let g:which_key_map = {
"   \ '<leader>f': 'find files',
"   \ '<leader>g': 'git',
"   \ '<leader>b': 'buffers',
"   \ }
" function! WhichKey(prefix)
"   let lines = []
"   for [key, desc] in items(g:which_key_map)
"     if stridx(key, a:prefix) == 0
"       let short = substitute(key, '^' . a:prefix, '', '')
"       call add(lines, short . '  →  ' . desc)
"     endif
"   endfor
"   call popup_create(lines, {'pos': 'botleft', 'line': &lines - 2, 'col': 1,
"     \ 'padding': [1,2,1,2], 'border': [1,1,1,1], 'time': 5000})
" endfunction
" nnoremap <expr> <leader> WhichKey('<leader>') .. ''
" " Plug 'liuchengxu/vim-which-key'
" " nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" local function s:smart_wincmd(direction)
"   local start_win = vim.api.nvim_get_current_win()
"   while true do
"     vim.cmd("wincmd " .. direction)
"     local current_win = vim.api.nvim_get_current_win()
"     " No valid window found in that direction, stay put
"     if current_win == start_win then
"       break
"     end
"     local bufnr = vim.api.nvim_win_get_buf(0)
"     local ft = vim.bo[bufnr].filetype
"     " If this window is NOT skippable, land here
"     if ft ~= "NvimTree" and vim.bo[bufnr].buftype ~= "nofile" then
"       break
"     end
"     " Otherwise loop and keep moving
"   end
" end

function Shorten()
endfunction

function! SmartWincmd(direction)
  let start_win = win_getid()
  let i = 1
  let traceroute=[]
  while 1
    let w=winnr(i..a:direction)
    let x=winnr(i-1..a:direction)
    let choice=1
    if choice==0 " traceroute without the first winnr or (current, if its last)
      if (i > 1 &&  w == x ) | break | endif
      call add(traceroute, w)
      if w == winnr() | break | endif
    elseif choice==1 " complete traceroute
      if i == 1
        call add(traceroute, winnr())
      endif
      if w == winnr() || (i > 1 &&  w == x ) | break | endif
      call add(traceroute, w)
    " elseif choice==2 " traceroute without the first winnr without current
    "   if w == winnr() || (i > 1 &&  w == x ) | break | endif
    "   " if there are more than one elements, echo (current) winnr() - if you
    "   " want the whole chain
    "   echo w
    endif
    let i += 1
  endwhile
  for w in traceroute[1:]
    let b=winbufnr(w)
    let staticWin=getbufvar(b, 'staticWin')
    if !empty(staticWin)
      continue
    endif
    " call win_gotoid(w)
    execute w.'wincmd w'
    break
  endfor
    " var current_win = win_getid()
    " if current_win == start_win
    "   break
    " endif
    " var bufnr = winbufnr(0)
    " var ft = getbufvar(bufnr, '&filetype')
    " var buftype = getbufvar(bufnr, '&buftype')
    " if ft != 'NvimTree' && buftype != 'nofile'
    "   break
    " endif
" echo traceroute
endfunction

call Statusline()

function! ExecVS() range
  let cursorpos=getcurpos()
  " let lines=VS()
  " eval join(lines, "\n")
  '<,'>source
  call cursor(cursorpos[1], cursorpos[2])
endfunction

function! ExecFunction()
  let cursorpos=getcurpos()
  let x=search('^[[:alpha:]$_]', 'bcW')
  let y=search('^[[:alpha:]$_]', 'W')
  let lines=getline(x, y)
  execute join(lines, "\n")
  call cursor(cursorpos[1], cursorpos[2])
endfunction

function! TEST()
  " echo VS()
  " echo "x,!"
endfunction

let gc=TermCommand()
let gc['command']='echo "TEST"'
call _command(gc)

let gc=TermCommand()
let gc['name']='Simple Command'
let gc['command']='echo "TEST"'
call _command(gc)

" Maybe Like This?
" COMMAND Simp Command
" echo "Test"
" ENDCOMMAND

let gc=VimCommand()
let gc['name']='Echo'
let gc['command']='echo "TEST"'
call _command(gc)

" todo Add Fix To NewMap (generated_src/...) Or Source Outside Of Generate.src
augroup NewtrCustomBindings
  autocmd!
  autocmd FileType netrw nnoremap <buffer> <C-l> :wincmd l<cr>
augroup END

let g:vim_advantages_got_sourced='true'
endif
