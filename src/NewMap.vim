" Todo - Unify noremap and map commands
if !exists("g:vim_advantages_got_sourced")

function! _map(opts) range
  let map=[]
  let opts=a:opts
  let key=opts.key
  if opts.all
    let opts.normal=1
    let opts.visual=1
    let opts.command=1
    let opts.insert=1
    let opts.terminal=1
    let opts.x=1
    let opts.s=1
    let opts.o=1
    let opts.l=1
  endif
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
      elseif a:mode=='command'
      elseif a:mode=='terminal'
        let prefix="<C-\\><C-n>"
      elseif a:mode=='insert'
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
    call _build([ 'v'..nore..'map', silent, key, setmode, opts.default ])
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

function! NewMapKeyCheckAll(...)
  for n in s:newmaps
    echo GetOpts(n.args, g:newmap_optschema)
  endfor
  " let args=a:000[1:]
  " echo "Press ["..args[0][0].."]\nSkip <C-Left>"
  " Waiting For This To Set A Flag True
  " echo "map "..args[0][1].." :let g:FlagReceived=1<cr>"
  " exec "map "..args[0][1].." :let g:FlagReceived=1<cr>"
  """ o let i = 0
  """ o function! Callback(timer) abort closure
  """ o   echo "Running async: ".a:timer i
  """ o   let i += 1
  """ o   sleep 1
  """ o   if g:FlagReceived
  """ o     exec "unmap "..args[0][1].." :call NewMapKeyCheckT(...)"
  """ o   else
  """ o     call timer_start(0, function('Callback'))
  """ o   endif
  """ o endfunction
  """ o call timer_start(0, function('Callback'))
  " while 1
  "   if g:FlagReceived
  "     let g:FlagReceived=0
  "     break
  "   endif
  " endwhile
endfunction

function! FunctionName()
  let x = expand('<sfile>')
  return substitute(x, '\v.*\ (\w*).*', '\1', '')
  """ let opts=GetOpts(a:args, [])
  """ " echo opts
  """ return
  """ if opts.args==0
  """   " echo substitute(expand('<sfile>'), '.*\.\.|\s', '', '')
  """   return substitute(expand('<sfile>'), 'function (.*)\[\d\]\.\..*', '\1',  '')
  """   " let x="function SFN[2]..FunctionName"
  """ elseif opts.args==1
  """   return substitute(expand('<sfile>'), 'function (.*)\[\d\]\.\..*', '\1' , '')
  """   " return expand('<file>')
  """   " function! GetCurrentFunctionName()
  """   "   let line = getline(search('^[[:alpha:]$_]', 'bcnW'))
  """   "   return matchstr(line, '\w\+')
  """   " endfunction
  """ elseif opts.args==2
  """   " returnhl argsMsg
  """   return getline(search('^[^ \t#/]\\{2}.*[^:]\s*$', 'bWn'))
  """   " returnhl None
  """ elseif opts.args==3
  """   return getline(search('^[[:alpha:]$_]', 'bcnW'))
  """ elseif opts.args==4
  """   return substitute(getline(search('^[[:alpha:]$_]', 'bcnW')), '', '', '')
  """ elseif opts.args==5
  """   " put expand('<sfile>')
  """   let x = expand('<sfile>')
  """   return substitute(x, '.*\s\(.*\)\[\d\].*', '\1', '')
  """ endif
endfunction
command! -range -nargs=* FunctionName call FunctionName(<q-args>)
" NewMap -n -no <f1> :FunctionName 3<cr>:FunctionName 1<cr>

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
let s:newmaps=[]
let g:newmap_optschema = [
  \ [ 'all', 'A|a|all|All', 0],
  \ [ 'normal', 'N|n|normal|Normal', 0],
  \ [ 'visual', 'V|v|visual|Visual', 0],
  \ [ 'x', 'X|x', 0],
  \ [ 's', 'S|s', 0],
  \ [ 'command', 'C|c|command|command', 0],
  \ [ 'terminal', 'T|t|terminal|Terminal', 0],
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
  \ ]

function! NewMap(args)
  " echo functionName
  " echo a:000
  " :call F.Map.new(name, map)
  " try
  " call add(s:newmaps, { 'args': a:000 } )
  " endtry
  " echo len(s:newmaps)
  let opts=GetOpts(a:args, g:newmap_optschema)
  if opts.key==''
    let opts.key=split(opts.default, ' ')[0]
    let opts.default=join(split(opts.default, ' ')[1:], ' ')
  endif
  " call Debug(3, opts)
  " echo opts
  " return
  " if len(opts.args)>0
  " echo opts
  " endif
  " for n in s:newmaps
  " echo opts
  " put /
  " \(if\|&&\)\@<!\s\+
  " put :
  " '<,'>s/\%\(if\|&&\)\@<!\s\+/\r\\ /g
  " In Command Line <C-r>/
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
  if opts.all
    let opts.normal=1
    let opts.visual=1
    let opts.command=1
    let opts.insert=1
    let opts.terminal=1
    let opts.x=1
    let opts.s=1
    let opts.o=1
    let opts.l=1
  endif
  " let command=join(filter([opts.default], 'v:val!=""'), ' ')
  " temporarily
  " echo _map(opts)
  "
  call extend(g:newmap_buildfile, _map(opts))
  " echo g:newmap_buildfile
  " if opts.all
  "   call NewMapBuildFile("A"..noremap.."map", silent, command)
  " else
  "   if opts.normal
  "     " call NewMapBuildFile("n"..noremap.."map", silent, command)
  "     " call NewMapBuildFile("n"..noremap.."map", silent, command)
  "     " call NewMapBuildFile(noremap.."map", silent, command)
  "     call NewMapBuildFile("N"..noremap.."map", silent, command)
  "   endif
  "   if opts.visual
  "     " call NewMapBuildFile("v"..noremap.."map", silent, command)
  "     call NewMapBuildFile("V"..noremap.."map", silent, command)
  "   endif
  "   if opts.command
  "     " call NewMapBuildFile("c"..noremap.."map", silent, command)
  "     call NewMapBuildFile("C"..noremap.."map", silent, command)
  "   endif
  "   if opts.insert
  "     call NewMapBuildFile("I"..noremap.."map", silent, command)
  "   endif
  "   " Idea To Fix Open Leaving unchanged
  "   " if opts.terminal && opts.unchanged2
  "   "   call NewMapBuildFile("T"..noremap.."mapunchanged2", silent, command)
  "   " endif
  "   if opts.terminal && opts.unchanged
  "     call NewMapBuildFile("T"..noremap.."mapunchanged", silent, command)
  "   elseif opts.terminal
  "     " call NewMapBuildFile("t"..noremap.."map", silent, command)
  "     call NewMapBuildFile("T"..noremap.."map", silent, command)
  "   endif
  "   if opts.x
  "     " call NewMapBuildFile("x"..noremap.."map", silent, command)
  "     call NewMapBuildFile("X"..noremap.."map", silent, command)
  "   endif
  "   if opts.s
  "     " call NewMapBuildFile("s"..noremap.."map", silent, command)
  "     call NewMapBuildFile("S"..noremap.."map", silent, command)
  "   endif
  "   if opts.o
  "     " call NewMapBuildFile("o"..noremap.."map", silent, command)
  "     call NewMapBuildFile("O"..noremap.."map", silent, command)
  "   endif
  "   if opts.l
  "     " call NewMapBuildFile("l"..noremap.."map", silent, command)
  "     call NewMapBuildFile("L"..noremap.."map", silent, command)
  "   endif
  "   if opts.unmap
  "     call NewMapBuildFile("unmap", silent, command)
  "   endif
  " endif
    " let opts=GetOpts(n.args, g:newmap_optschema)
    " echo opts.map opts.silent n.args[0] opts.command
    " let map=""
    " let silent=""
    " let noremap=""
    "" if opts.noremap | let noremap="noremap" | endif
    "" if opts.silent | let silent = "<silent>" | endif
    "" if opts.all | endif
    "" if opts.map | endif
    "" if opts.normal | endif
    "" if opts.visual | endif
    "" if opts.command | endif
    "" if opts.insert | endif
    "" if opts.terminal | endif
    "" if opts.x | endif
    "" if opts.s | endif
    "" if opts.o | endif
    "" if opts.l | endif
    "" " exec join(n.args,)
    " let keymapping=n.args[0]
    "" let args=n.args[1:]
    "" let command=join(args, ' ')
    " exec map silent keymapping command
  " endfor
  """ real let args=split(a:000[0], ' ')
  """ real let map = join(args[0:], ' ')
  """ real let key=args[1]
  """ real try
  """ real   exec map
  """ real endtry
  " let name = a:000[:0][0]
  " let arg = a:000[1:]
  " call F.NewAssignment(name, arg)
  "
  " echo string(opts)
  " call add(g:newmap_buildfile_dicts, json_encode(opts))
  endif
endfunction
command! -range -nargs=+ NewMap call NewMap(<q-args>)
command! -range -nargs=+ NewMapKeycheck call NewMapKeycheck(<q-args>)

function! GenerateWeak()
  if exists('g:vim_advantages_got_sources')
    unlet g:vim_advantages_got_sourced
  endif
  exec 'source '.g:vim_configuration_src.'/Map.vim'
  " echo g:newmap_buildfile
  " echo g:newmap_buildfile_dicts
  " return json_decode(join(readfile(a:file), "\n"))
  let g:newmap_buildfile=[]
  let g:newmap_buildfile_dicts=[]
endfunction
command! -range -nargs=0 GenerateWeak call GenerateWeak()

function! Generate()
  if exists('g:vim_advantages_got_sourced')
    unlet g:vim_advantages_got_sourced
  endif
  exec 'source '.g:vim_configuration_src.'/Map.vim'
  call Write(g:newmap_buildfile, g:generated_src..'/NewMap.vim')
  call Write(g:newmap_buildfile_dicts, g:generated_src..'/NewMap.vim', 'a')
  let g:newmap_buildfile=[]
  let g:newmap_buildfile_dicts=[]
  exec 'source '.g:generated_src.'/NewMap.vim'
  echo "Done"
endfunction
command! -range -nargs=0 Generate call Generate()

endif
