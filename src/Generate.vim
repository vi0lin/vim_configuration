" Todo - Unify noremap and map commands
if !exists("g:vim_advantages_got_sourced")

if !exists('g:commandlist')
  let g:commandlist=[]
endif

function! _command(...) range
  call add(g:commandlist, a:000)
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

endif
