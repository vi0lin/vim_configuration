" Todo - Unify noremap and map commands
if !exists("g:vim_advantages_got_sourced")

if !exists('g:commandlist')
  let g:commandlist=[]
endif

function! _command(command) range
  call add(g:commandlist, a:command)
endfunction

" visual :<C-u>
" insert :<C-o>
function! _map(opts) range
  let map=[]
  let opts=a:opts
  let key=opts.key
  if opts.silent | let silent="<silent>" | else | let silent="" | endif
  if opts.noremap 
   let nore="nore" 
  else
    let nore="" 
  endif
  function! _prefix(mode) closure
    let prefix=''
    if !opts.unchanged
      if a:mode=='normal'
      elseif a:mode=='visual'
        " let prefix="<C-u>"
      elseif a:mode=='command'
        let prefix=""
      elseif a:mode=='terminal'
        let prefix="<C-\\><C-n>"
      elseif a:mode=='insert'
        " let prefix="<C-o>"
        let prefix=""
      elseif a:mode=='x'
      elseif a:mode=='s'
      elseif a:mode=='o'
      elseif a:mode=='l'
      endif
    endif
    return prefix
  endfunction
  function! _setmode(mode) closure
    if opts.unchanged
      return ''
    endif
    let setmode=prefix..':call SetMode("'.escape(key, "<>").'", "'..a:mode..'") \|'
    return setmode
  endfunction
  function! _build(values) closure
    call add(map, join(filter(a:values, 'v:val!=""'), ' '))
  endfunction
  if opts.normal 
    let prefix=_prefix('normal')
    let setmode=_setmode("Normal")
    call _build([ 'n'..nore..'map', silent, key, setmode, opts.default ])
  endif
  if opts.visual 
    let prefix=_prefix('visual')
    let setmode=_setmode("Visual")
    call _build([ 'v'..nore..'map', silent, key, setmode, "'<,'>"..opts.default ])
  endif
  if opts.command 
    let prefix=_prefix('command')
    let setmode=_setmode("Command")
    call _build([ 'c'..nore..'map', silent, key, setmode, opts.default ])
  endif
  if opts.terminal 
    let prefix=_prefix('terminal')
    let setmode=_setmode("Terminal")
    call _build([ 't'..nore..'map', silent, key, setmode, opts.default ])
  endif
  if opts.insert 
    let prefix=_prefix('insert')
    let setmode=_setmode("Insert")
    call _build([ 'i'..nore..'map', silent, key, setmode, opts.default ])
  endif
  if opts.x
    let prefix=_prefix('x')
    let setmode=_setmode("X")
    call _build([ 'x'..nore..'map', silent, key, setmode, opts.default ])
  endif
  if opts.s
    let prefix=_prefix('s')
    let setmode=_setmode("S")
    call _build([ 's'..nore..'map', silent, key, setmode, opts.default ])
  endif
  if opts.o
    let prefix=_prefix('o')
    let setmode=_setmode("O")
    call _build([ 'o'..nore..'map', silent, key, setmode, opts.default ])
  endif
  if opts.l
    let prefix=_prefix('l')
    let setmode=_setmode("L")
    call _build([ 'l'..nore..'map', silent, key, setmode, opts.default ])
  endif
  return map
endfunction

let s:newmaps=[]
let g:newmap_optschema = [
  \ [ 'a', 'A|a', 0],
  \ [ 'aa', 'AA|aa', 0],
  \ [ 'aaa', 'AAA|aaa', 0],
  \ [ 'all', 'all|All|ALL', 1],
  \ [ 'normal', 'N|n', 0],
  \ [ 'visual', 'V|v', 0],
  \ [ 'x', 'X|x', 0],
  \ [ 's', 'S|s', 0],
  \ [ 'command', 'C|c', 0],
  \ [ 'terminal', 'T|t', 0],
  \ [ 'o', 'O|o', 0],
  \ [ 'insert', 'I|i', 0],
  \ [ 'l', 'L|l', 0],
  \ [ 'silent', 'Silent|silent', 0],
  \ [ 'noremap', 'No|no|noremap|Noremap', 0],
  \ [ 'unmap', 'unmap|u', 0],
  \ [ 'dry', 'dry|d', 0],
  \ [ 'verbose', 'verbose|debug', 0],
  \ [ 'leaders', 'leaders', 1],
  \ [ 'key', 'k|key', 1],
  \ [ 'vs', 'vs', 1],
  \ [ 'unchanged', 'un|unchanged', 0],
  \ [ 'command', 'command', 0],
  \ [ 'shift', 'shift', 0],
  \ [ 'alt', 'alt|meta', 0],
  \ ]

function! NewMap(args)
  let opts=GetOpts(a:args, g:newmap_optschema)
  if opts.a
    let opts.all = 1
  endif
  if opts.aa
    let opts.all = 2
  endif
  if !opts.a && !opts.aa && !opts.all
    let opts.all=0
  endif
  if opts.key==''
    let opts.key=split(opts.default, ' ')[0]
    let opts.default=join(split(opts.default, ' ')[1:], ' ')
  endif
  if opts.all >= 1
    let opts.normal=1
    let opts.visual=1
    let opts.terminal=1
  endif
  if opts.all >= 2
    let opts.insert=1
    let opts.command=1
  endif
  if opts.all >= 3
    let opts.x=1
    let opts.s=1
    let opts.o=1
    let opts.l=1
  endif
  if len(opts.default)>0
  if !opts.normal
  \ && !opts.visual
  \ && !opts.command
  \ && !opts.insert
  \ && !opts.terminal
  \ && !opts.x
  \ && !opts.s
  \ && !opts.o
  \ && !opts.l
    let opts.normal=1
  endif
  if opts.noremap
    let noremap="nore"
  else
    let noremap=""
  endif
  let silent=""
  if opts.silent
    let silent = "<silent>"
  endif
  " if opts.all
  "   let opts.normal=1
  "   let opts.visual=1
  "   let opts.command=1
  "   let opts.insert=1
  "   let opts.terminal=1
  "   let opts.x=1
  "   let opts.s=1
  "   let opts.o=1
  "   let opts.l=1
  " endif
  " let opts={'command': -1, 'shift': -1, 'alt': -1}
  " let opts.command=1
  " let opts.shift=1
  " let opts.alt=1
  let bitmask=[0, 0, 0]
  if opts.command
    let bitmask[0]=1
  endif
  if opts.shift
    let bitmask[1]=1
  endif
  if opts.alt
    let bitmask[2]=1
  endif
  let modifiers=[]
  let n=float2nr(pow(2,3))
  let [x,y,z]=[0,0,0]
  for i in range(0,n-1)
    let bin=printf('%03b', i)
    let bin=split(bin, '\zs')
    let x=""
    if bin[0]&&bitmask[0]
      let x.="C-"
    endif
    if bin[1]&&bitmask[1]
      let x.="S-"
    endif
    if bin[2]&&bitmask[2]
      let x.="A-"
    endif
    if index(modifiers, x)==-1
      call extend(modifiers, [x])
    endif
  endfor
  " exec "for n in range("..opts.nr..")"
  for a in modifiers
    let obj=copy(opts)
    " echo obj
    let obj.key=substitute(obj.key, '{modifiers}', a, 'g')
    let obj.default=substitute(obj.default, '{modifiers}', a, 'g')
    call extend(g:newmap_buildfile, _map(obj))
    let gc=VimCommand()
    call _command(gc)
  endfor
  " echo g:newmap_buildfile
  " endfor
  endif
endfunction
command! -range -nargs=+ NewMap call NewMap(<q-args>)
command! -range -nargs=+ NewMapKeycheck call NewMapKeycheck(<q-args>)

function! NewMapKeyCheckAll(...)
  for n in s:newmaps
    echo GetOpts(n.args, g:newmap_optschema)
  endfor
endfunction

function! FunctionName()
  let x = expand('<sfile>')
  return substitute(x, '\v.*\ (\w*).*', '\1', '')
endfunction
command! -range -nargs=* FunctionName call FunctionName(<q-args>)

function! NewMapEcho(...)
  let parts=filter(copy(a:000), 'v:val!=""')
  echo join(parts, ' ')
endfunction
command! -nargs=* NewMapEcho :call NewMapEcho(<f-args>)

function! NewMapExec(...)
  let parts=filter(copy(a:000), 'v:val!=""')
  exec join(parts, ' ')
endfunction
command! -nargs=* NewMapExec :call NewMapExec(<f-args>)

let g:newmap_buildfile=[]
let g:newmap_buildfile_dicts=[]
function! NewMapBuildFile(...)
  let parts=filter(copy(a:000), 'v:val!=""')
  call add(g:newmap_buildfile, join(parts, ' '))
endfunction
command! -nargs=* NewMapBuildFile :call NewMapBuildFile(<f-args>)
function! NewMapBuildFile2(...)
  let parts=filter(copy(a:000), 'v:val!=""')
  call add(g:newmap_buildfile, join(parts, ' '))
endfunction
command! -nargs=* NewMapBuildFile :call NewMapBuildFile(<f-args>)
function! GenerateWeak()
  if exists('g:vim_advantages_got_sources')
    unlet g:vim_advantages_got_sourced
  endif
  exec 'source '.g:vim_configuration_src.'/Map.vim'
  let g:newmap_buildfile=[]
  let g:newmap_buildfile_dicts=[]
endfunction
command! -range -nargs=0 GenerateWeak call GenerateWeak()

function! Generate()
  if exists('g:vim_advantages_got_sourced')
    unlet g:vim_advantages_got_sourced
  endif
  exec 'source '.g:vim_configuration_src.'/Map.vim'
  call Write(g:newmap_buildfile, g:generated_src..'/Generate.vim')
  call Write(g:newmap_buildfile_dicts, g:generated_src..'/Generate.vim', 'a')
  let g:newmap_buildfile=[]
  let g:newmap_buildfile_dicts=[]
  exec 'source '.g:generated_src.'/Generate.vim'
  echo "Done"
endfunction
command! -range -nargs=0 Generate call Generate()

function! SaveCommands()
  let folder = Folder_Repo_Or_Project_Only()
  " echo folder
  " call Write(b:commands, folder . ".commands_vim_configuration.unreleased")
  if folder != -1
    let source_commands_script = BuildCommandLines()
    call Write(source_commands_script, folder.."/.commands_vim_configuration.unreleased")
  else
    call EchoSafely("No Project Or Repo Found In Path Hierarchy")
  endif
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
  let lines = []
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
  call DebugBuf("saved")
  return lines
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
  if b:loading_command['commandOriginType']=='buffer' && b:loading_command['commandOrigin']==expand('%:p')
    call DebugBuf("loaded buffer command")
    let b:commands['pages'][page][key]=copy(b:loading_command)
    return
  endif
  if b:loading_command['commandOriginType']=='folder' && b:loading_command['commandOrigin']==expand('%:p:h')
    call DebugBuf("loaded folder command")
    let b:commands['pages'][page][key]=copy(b:loading_command)
    return
  endif
  if b:loading_command['commandOriginType']=='repo' && b:loading_command['commandOrigin']==Folder_Repo_Or_Project_Only()
    call DebugBuf("loaded repo command")
    let b:commands['pages'][page][key]=copy(b:loading_command)
    return
  endif
  if b:loading_command['commandOriginType']=='global'
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

function! CommandDictInit()
  " if !exists('b:commands')
  let b:commands={'pages': []}
  let b:commands=CommandDictAddPage(CommandDictInitPage())
  " if !exists('g:commands')
  let g:commands=[]
  " endif
  return b:commands
  " endif
endfunction

function! CommandDictInitPage()
  return {
        \ '<F5>': -1,
        \ '<F6>': -1,
        \ '<F7>': -1,
        \ '<F8>': -1,
        \ '<C-F5>': -1,
        \ '<C-F6>': -1,
        \ '<C-F7>': -1,
        \ '<C-F8>': -1,
        \ '<S-F5>': -1,
        \ '<S-F6>': -1,
        \ '<S-F7>': -1,
        \ '<S-F8>': -1,
        \ '<C-S-F5>': -1,
        \ '<C-S-F6>': -1,
        \ '<C-S-F7>': -1,
        \ '<C-S-F8>': -1
        \ }
endfunction

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
    \ "commandOriginType": -1,
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
  let c=EmptyCommand()
  let c['hash']=NewUUID()
  let c['name']='unnamed'
  let c['commandMode']='vim'
  let c['commandOriginType']='buffer'
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
  let c['commandOrigin']=Vim_Advantages_Path()
  let c['commandOriginType']='global'
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

function! CommandPageInit()
  " if !exists('b:commands')
  call CommandPageExample()
  " endif
endfunction

function! CommandPageExample()
  let c=CommandExample()
  let c['page']=0
  let c['command']=['date']
  let c['key']='<F5>'
  let b:commands['pages'][0]['<F5>']=copy(c)
  let c['command']=['ls -al']
  let c['key']='<F6>'
  let b:commands['pages'][0]['<F6>']=copy(c)
  let c['command']=['activate']
  let c['key']='<F7>'
  let b:commands['pages'][0]['<F7>']=copy(c)
  let c['command']=['deactivate']
  let c['key']='<F8>'
  let b:commands['pages'][0]['<F8>']=copy(c)
endfunction

function! CommandDictAddPage(page)
  call extend(b:commands['pages'], [a:page])
  return b:commands
endfunction

function! LoadAllCommands()
  " if !exists('b:commands')
  call CommandDictInit()
  " endif
  call LoadCommands()
  call LoadCommands(Folder_Repo_Or_Project_Only()..'/.commands_vim_configuration.unreleased')
  "" for page in copy(b:commands['pages'])
  ""   call DebugBuf(copy(page), '"Command: "..P(v:val)')
  "" endfor
  " for c in b:commands['pages']
  "   echo c['<F5>']['command']
  " endfor
  return b:commands
endfunction

function! LoadCommands(filename='.commands_vim_configuration')
  let cwd=CWD()
  let finish=0
  let paths=[]
  while 1
    let file=globpath(cwd, a:filename)
    if !empty(file)
      call extend(paths, [file])
    endif
    if cwd=='/'
      break
    endif
    let cwd=GetParentDir(cwd)
  endwhile
  " call DebugBuf(map(copy(reverse(paths)), '"Source: "..v:val'), 0)
  for x in reverse(paths)
    exec "source" x
  endfor
endfunction

endif
