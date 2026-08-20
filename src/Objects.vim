function! InitCommands()
  if !exists('b:released')
    let b:released="no"
  endif
  if !exists('b:spectrum')
    let b:spectrum="buffer"
  endif
  if !exists('b:savein')
    let b:savein="vim_configuration"
  endif
endfunction

function! ResetCommands(...)
  echo "does not work"
  let g:cmdstorage.get('commands')=[]
  call g:cmdstorage.save()
  return
  " call g:cmdstorage.save()
  function! _write_file_helper(released, filepath)
    if a:released=="yes"
      let postfix=""
    else
      let postfix=".unreleased"
    endif
    if filereadable(a:filepath)
      call Write([], a:filepath.."/.commands"..postfix, '')
    endif
  endfunction
  call _write_file_helper("yes", expand('%:p:h'))
  call _write_file_helper("no", expand('%:p:h'))
  call _write_file_helper("yes", ProjectPath())
  call _write_file_helper("no", ProjectPath())
  call _write_file_helper("yes", VimConfiguration())
  call _write_file_helper("no", VimConfiguration())
endfunction
command! -range -nargs=* ResetCommands <line1>,<line2>call ResetCommands(<f-args>)

" function! SaveCommands()
"   call DebugBuf("SaveCommands")
"   function! _save_helper(save, released)
"     " call DebugBuf("save: ", a:save)
"     let filtered=filter(copy(g:cmdstorage.get('commands')), { i,v ->
"       \ v:val.get("save")==a:save
"       \ && v:val.get("save.released")==a:released
"       \ })
"     " let states=map(copy(filtered), "v:val.state")
"     let states=map(copy(filtered), "v:val.serialize()")
"     let postfix=a:released=='no'?".unreleased":''
"     if !empty(filtered) && len(filtered)>0
"       call WriteStructure(states, filtered[0].get('save.path').."/.commands"..postfix)
"     endif
"   endfunction
"   " call _save_helper("in_vim_configuration", "yes")
"   call _save_helper("in_vim_configuration", "no")
"   " call _save_helper("in_repo_dir", "yes")
"   " call _save_helper("in_repo_dir", "no")
"   " call _save_helper("in_same_dir", "yes")
"   " call _save_helper("in_same_dir", "no")
"   " " call _save_helper("samedir", "yes", expand('%:p:h'))
"   " " call _save_helper("samedir", "no", expand('%:p:h'))
"   " " call _save_helper("repo", "yes", ProjectPath())
"   " " call _save_helper("repo", "no", ProjectPath())
"   " " call _save_helper("in_vim_configuration", "yes", VimConfiguration())
"   " " call _save_helper("in_vim_configuration", "no", VimConfiguration())
" endfunction

function! RefreshCommands()
  for c in g:cmdstorage.get('commands')
    let updated=CommandTemplate()
    for [k,v] in items(updated)
      if !has_key(c, k)
        call c.set(k, v)
      endif
    endfor
    " let c=updated
  endfor
  call g:cmdstorage.save()
endfunction

" function! LoadCommands()
"   " if !exists('b:commands')
"   " call CommandDictInit()
"   " let g:cmdstorage.set('commands', [])
"   let b:commands={}
"   " endif
"   " let commandorigins=[]
"   " function! _add(path) closure
"   "   if index(commandorigins, a:path)==-1
"   "     call add(commandorigins, a:path)
"   "   endif
"   " endfunction
"   " " saved_in_vim_configuration
"   " " call _add(VimConfiguration()..'/.unreleased/.commands')
"   " call _add(VimConfiguration()..'/.commands')
"   " call _add(VimConfiguration()..'/.commands.unreleased')
"   " " saved_in_samedir *folder*
"   " call _add(expand('%:p:h')..'/.commands')
"   " call _add(expand('%:p:h')..'/.commands.unreleased')
"   " " saved_in_repo
"   " call _add(ProjectPath()..'/.commands')
"   " call _add(ProjectPath()..'/.commands.unreleased')
"   function! _load_helper(path, released)
"     let data=[]
"     let path=Command().set('save', a:path).get("save.path")..'/.commands'..(a:released=='no'?'.unreleased':'')
"     " call DebugBuf(path)
"     " call DebugBuf(a:path)
"     " call DebugBuf(a:released)
"     if filereadable(path)
"       " call DebugBuf("Loading: "..path)
"       let array=Read(path)[0]
"       for state_serialized in json_decode(array)
"         " echo len(Read(path))
"         " echo state_serialized
"         let c=Command().deserialize(state_serialized)
"         let overwrite_this=CommandTemplate()
"         " echo overwrite_this.get('cmdtype.term.autocc')
"         for [key,Value] in items(c)
"           " if key == 'cmdtype.term.autocd'
"           "       \ && key == 'cmdtype.term.autocd.path'
"           "       \ && key == 'cmdtype.term.autocc'
"             let overwrite_this[key]=Value
"           " endif
"         endfor
"         call add(data, overwrite_this)
"       endfor
"       " for state in states
"       "   echo state
"       " endfor
"       " for state in _data
"       "   " call DebugBuf(state)
"       "   echo state
"       "   let c=Command().deserialize(state)
"       "   " call DebugBuf(c.get('command'))
"       "   " call add(data, )
"       " endfor
"       try
"       catch
"         call DebugBuf("Error Parsing File: "..path)
"       finally
"         if !empty(data)
"           " let updated=CommandTemplate()
"           " for [k,v] in items(data)
"           "   " echo k
"           "   " echo v
"           "   let updated[k]=v
"           " endfor
"           " call extend(g:cmdstorage.get('commands'), [updated])
"           call extend(g:cmdstorage.get('commands'), data)
"           " call DebugBuf(printf("Added %s commands", len(data)))
"           " call DebugBuf(map(copy(data), {_, v -> {"buffer": v['extend.buffer.path'], "command": v['command'], "key": v['key']}}))
"         endif
"         " call DebugBuf(printf("Nothing to add in %s", len(data)))
"       endtry
"     endif
"   endfunction
"   call DebugBufClear()
"   " call DebugBufHeight(10)
"   call DebugBuf("Commands")
"   " call _save_helper("in_vim_configuration", "yes")
"   call _load_helper("in_vim_configuration", "no")
"   " call _save_helper("in_repo_dir", "yes")
"   " call _save_helper("in_repo_dir", "no")
"   " call _save_helper("in_same_dir", "yes")
"   " call _save_helper("in_same_dir", "no")
"   " saved_in_buffer
"   " unimplemented / extract from file
"   " let file=globpath(cwd, a:filename)
"   " echo file
"   " while 1
"   "   let file=globpath(cwd, a:filename)
"   "   if !empty(file)
"   "     call extend(paths, [file])
"   "   endif
"   "   if cwd=='/'
"   "     break
"   "   endif
"   "   let cwd=GetParentDir(cwd)
"   " endwhile
"   " call DebugBuf(map(copy(reverse(paths)), '"Source: "..v:val'))
"   " call DebugBuf(join(map(copy(g:cmdstorage.get('commands')), {_, v -> {"buffer": v['extend.buffer.path'], "key": v['key']}}
"     \ ), "\n"),0 , 0)
"   return g:cmdstorage.get('commands')
"   " call LoadCommands(ProjectPath()..'/.commands_vim_configuration.unreleased')
"   "" for page in copy(b:commands['pages'])
"   ""   call DebugBuf(copy(page), '"Command: "..P(v:val)')
"   "" endfor
"   " for c in b:commands['pages']
"   "   echo c.get('<F5>')['command']
"   " endfor
"   " echo filter(copy(g:cmdstorage.get('commands')), 'v:val["extend"]=="buffer"&&v:val["commandSaveinFolder"]=="'..expand('%:p')..'"')
"   " let b:commands['buffer']=filter(copy(g:cmdstorage.get('commands')), 'v:val["extend"]=="buffer"&&v:val["commandSaveinFolder"]=="'..expand('%:p')..'"')
"   " let b:commands['folder']=filter(copy(g:cmdstorage.get('commands')), 'v:val["extend"]=="folder"&&v:val["commandSaveinFolder"]=="'..expand('%:p:h')..'"')
"   " let b:commands['repo']=filter(copy(g:cmdstorage.get('commands')), 'v:val["extend"]=="repo"&&v:val["commandSaveinFolder"]=="'..ProjectPath()..'"')
"   " let b:commands['global']=filter(copy(g:cmdstorage.get('commands')), 'v:val["extend"]=="global"&&v:val["commandSaveinFolder"]=="'..VimConfiguration()..'/.unreleased/.commands"')
"   "   " call DebugBuf(b:commands)
"   " return [ g:cmdstorage.get('commands'),
"   "       \ b:commands['buffer'],
"   "       \ b:commands['folder'],
"   "       \ b:commands['repo'],
"   "       \ b:commands['global']
"   "       \ ]
" endfunction

function! EmptyCommand()
  return Command()
  " echo Command().set("save", "in_vim_configuration").get("save.path")
endfunction

function! VimCommand(command='')
  call InitCommands()
  " let c=EmptyCommand()
  let c=CommandTemplate()
  call c.set('hash', NewUUID())
  call c.set('name', 'unnamed')
  call c.set('commandMode', 'vim')
  call c.set('extend', 'buffer')
  call c.set('save', b:savein)
  call c.set('released', b:released)
  call c.set('extend.buffer.path', '')
  call c.set('commandInterpreter', 'vim')
  call c.set('commandOutputMode', 'put')
  call c.set('command', a:command)
  call c.set('direction', g:default_direction)
  return c
endfunction

function! TermCommand(command='')
  " let c=EmptyCommand()
  let c=CommandTemplate()
  call c.set('hash', NewUUID())
  call c.set('name', 'unnamed')
  call c.set('commandMode', 'term')
  call c.set('commandInterpreter', 'term')
  call c.set('command', a:command)
  call c.set('direction', g:default_direction)
  return c
endfunction

function! CommandTemplate()
  " let c=EmptyCommand()
  let c=Command()
  call c.set('command', ['', 'ls -al', ''])
  call c.set('command', [])
  call c.set('name', 'unnamed')
  call c.set('direction', g:default_direction)
  call c.set('commandOutputMode', "sendtoterm")
  call c.set('directionMode', 'foremost')
  call c.set('extend.repo.path', exists('w:cwd')?ProjectPath():'')
  call c.set('commandFolder', expand('%:p:h'))
  call c.set('extend', 'buffer')
  call c.set('loadCondition', 'bufferopened')
  call c.set('extend.buffer.path', expand('%:p'))
  call c.set('target', 'Local')
  call c.set('cmdtype.term.autocc', 0)
  call c.set('cmdtype.term.autocd', 'cd_to_project_root')
  call c.set('cmdtype.term.autocd_path', '')
  call c.set('save', 'in_vim_configuration')
  call c.set('released', 'no')
  call c.set('decision_mode', "check_direct")
  call c.set('decision_algorithm', "check_find_first_term")
  call c.set('commandMode', 'term')
  call c.set('commandModeSession', 'none')
  call c.set('commandInterpreter', 'term')
  call c.set('commandTargetBuffer', '-1')
  call c.set('commandTargetWindow', '-1')
  call c.set('commandInput', '-1')
  call c.set('commandOutputMode', 'sendtoterm')
  return c
endfunction

function! CommandTemplateWithUUID()
  let c=CommandTemplate()
  call c.set("hash", NewUUID())
  return c
endfunction

function! s:build_defaults(schema, ...) abort
  let prefix = a:0 ? a:1 : ''
  let state = {}
  for [key, Item] in items(a:schema)
    let path = prefix ==# '' ? key : prefix . '.' . key
    " call DebugBuf(key)
    if type(Item)==4
      if has_key(Item, 'default')
        let state[path] = Item.default
      elseif get(Item, 'type', '') ==# 'bool'
        let state[path] = 0
      elseif get(Item, 'type', '') ==# 'list'
        let state[path] = []
      elseif get(Item, 'type', '') ==# 'string'
        let state[path] = ''
      elseif get(Item, 'type', '') ==# 'lambda_value'
        let state[path] = {}
      elseif get(Item, 'type', '') ==# 'multiselect'
        let state[path] = []
      elseif get(Item, 'type', '') ==# 'toggle' && has_key(Item, 'values') && !empty(Item.values)
        let state[path] = Item.values[0]
      endif
      if has_key(Item, 'sub')
        call extend(state, s:build_defaults(Item.sub, path))
      endif
    endif
  endfor
  return state
endfunction
function! s:get(path) abort dict
  let item = s:find_item(self.schema, a:path)
  " if type(item) == v:t_dict && has_key(item, 'type') ^^ item['type'] == 'list'
  "   return item.value(self)
  " endif
  if type(item) == v:t_dict && has_key(item, 'lambda_value')
    return item.lambda_value(self)
  endif
  return get(self.state, a:path, v:null)
endfunction
function! s:set(path, value) abort dict
  let old = get(self.state, a:path, v:null)
  let self.state[a:path] = a:value
  " call lambda if it exists
  let item = s:find_item(self.schema, a:path)
  if type(item) == v:t_dict && has_key(item, 'lambda')
    call item.lambda(a:path, old, a:value)
  endif
  return self
endfunction
function! s:find_item(schema, path) abort
  let parts = split(a:path, '\.')
  let current = a:schema
  for part in parts
    if type(current) != v:t_dict || !has_key(current, part)
      return v:null
    endif
    let current = current[part]
    if has_key(current, 'sub') && part != parts[-1]
      let current = current.sub
    endif
  endfor
  return current
endfunction

function! New(schema) abort
  function! _new(schema) abort
    let obj = {
      \ 'schema': a:schema,
      \ 'state':  s:build_defaults(a:schema),
      \ 'get':         function('s:get'),
      \ 'set':         function('s:set'),
    \ }
    return obj
  endfunction
  return _new(a:schema)
endfunction

let cmdstorage_schema= {
  \ 'commands': {
  \   'type': 'list',
  \   'value': [],
  \ }
  \}
function! CmdStorage() abort
  function! _cmdstorage(schema) abort
    let obj = {
      \ 'schema': a:schema,
      \ 'state':  s:build_defaults(a:schema),
      \ 'get':                      function('s:get'),
      \ 'set':                      function('s:set'),
      \ 'find':                     function('s:find'),
      \ 'find_by_key':              function('s:find_by_key'),
      \ 'additem':                  function('s:additem'),
      \ 'additems':                 function('s:additems'),
      \ 'delete':                   function('s:delete'),
      \ 'save':                     function('s:save'),
      \ 'load':                     function('s:load'),
    \ }
    return obj
  endfunction

  function! s:find_by_key(keymap=g:keymap) abort dict
    " let updated = CommandTemplate()
    " let c={ 'buffer': [],'folder': [],'repo': [], 'global': [] }
    call self.load()
    let c=[]
    let val = filter(copy(self.get('commands')), { i,v ->
      \ v:val.get("key")==a:keymap
      \ && v:val.get("extend")=="buffer"
      \ && v:val.get("extend.buffer.path")==expand('%:p')
      \ })
    if !empty(val)
      call extend(c, val)
    endif
    " let val = filter(copy(g:cmdstorage.get('commands')), { i,v ->
    "   \ v:val.get("key")==a:keymap
    "   \ && v:val.get("extend")=="folder"
    "   \ && v:val.get("commandFolder")==expand('%:p:h')
    "   \ })
    " if !empty(val)
    "   call extend(c, val)
    " endif
    "
    let val = filter(copy(self.get('commands')), { i,v ->
      \ v:val.get("key")==a:keymap
      \ && v:val.get("extend")=="repo"
      \ && v:val.get("extend.repo.path")==ProjectPath()
      \ })
    if !empty(val)
      call extend(c, val)
    endif
    "
    let val = filter(copy(self.get('commands')), { i,v ->
      \ v:val.get("key")==a:keymap
      \ && v:val.get("extend")=="global"
      \ })
    if !empty(val)
      call extend(c, val)
    endif
    " call DebugBuf(c)
    " return updated
    " for [k,v] in items(c)
    "   let updated[k]=v
    " endfor
    " return updated
    " call EnsureDebugBuf()
    " let rglobal= reduce(c['global'], {acc,item->extend(acc, {item.key: get(acc, item.key, []) + [item]})}, {})
    " call DebugBuf(input)
    " call DebugBuf(c)
    return c
  endfunction

  function! s:find(key) abort dict
    " copy(g:cmdstorage.get('commands')
    let c=self.get('commands')
    let val = filter(copy(c), { i,v ->
      \ (v:val.get("key")==a:key && (
      \ ( v:val.get("extend")=="buffer"
      \    && v:val.get("extend.buffer.path")==expand('%:p') )
      \ || ( v:val.get("extend")=="repo"
      \    && v:val.get("extend.repo.path")==ProjectPath() )
      \ || ( v:val.get("extend")=="global" )
      \ )
      \ )
    \ })
    return val
  endfunction

  function! s:additem(name, value) abort dict
    call add(self.get(a:name), a:value)
  endfunction

  function! s:additems(name, value) abort dict
    call extend(self.get(a:name), a:value)
  endfunction

  function! s:delete(item) abort dict
  endfunction

  function! s:save() abort dict
    function! _save_helper(save, released) closure
      let filtered=filter(copy(self.get('commands')), { i,v ->
        \ v:val.get("save")==a:save
        \ && v:val.get("save.released")==a:released
        \ })
      " echo filtered
      if empty(filtered)
        return
      endif
      let states=[]
      for cmd in filtered
        call add(states, cmd.serialize())
      endfor
      " let states=map(copy(filtered), "v:val.serialize()")
      let postfix=a:released=='no'?".unreleased":''
      let path=filtered[0].get('save.path').."/.commands"..postfix
      " if !empty(filtered) && len(filtered)>0
      call DebugBuf(filtered[0].get('save.path').."/.commands"..postfix)
      " echo states
      call WriteStructure(states, path)
      call DebugBuf("commands saved")
      " endif
    endfunction
    call _save_helper("in_vim_configuration", "no")
    " call _save_helper("in_repo_dir", "yes")
    " call _save_helper("in_repo_dir", "no")
    " call _save_helper("in_same_dir", "yes")
    " call _save_helper("in_same_dir", "no")
  endfunction

  function! s:load() abort dict
    call self.set('commands', [])
    function! _load_helper(path, released) closure
      " call self.set('commands', [])
      " let g:cmdstorage=CmdStorage()
      let data=[]
      let path=Command().set('save', a:path).get("save.path")..'/.commands'..(a:released=='no'?'.unreleased':'')
      if filereadable(path)
        try
          let _read=Read(path)
          let array=len(_read)>0?_read[0]:[]
          let iter=len(_read)>0?json_decode(array):[]
          if len(iter)==0
            call input("rm "..path.." [yY]")
            call system("rm "..path)
            return
          endif
          for state_serialized in iter
            let c=Command().deserialize(state_serialized)
            call add(data, c)
          endfor
        catch
          call DebugBuf("Error Parsing File: "..path)
        finally
          if !empty(data)
            call self.additems('commands', data)
          endif
        endtry
      endif
    endfunction
    call _load_helper("in_vim_configuration", "no")
    call _load_helper("in_vim_configuration", "yes")
    call _load_helper("in_repo_dir", "no")
    call _load_helper("in_repo_dir", "yes")
    call _load_helper("in_same_dir", "no")
    call _load_helper("in_same_dir", "yes")
    return self.get('commands')
  endfunction
  return _cmdstorage(g:cmdstorage_schema)
endfunction

let cmd_schema= {
  \ 'cmdtype': {
  \   'type': 'toggle',
  \   'togglekey': ['t', 'T'],
  \   'values': ['vim', 'term'],
  \   'sub': {
  \     'vim': {
  \       'type': 'group',
  \       'label': 'Vim options',
  \       'when': {s -> s.cmdtype ==# "vim"},
  \       'sub': {
  \         'behaviour': {
  \           'type': 'toggle',
  \           'togglekey': ['b', 'B'],
  \           'values': ['execute_inplace'],
  \           'default': 'execute_inplace',
  \           'when': {s -> s.cmdtype ==# "vim"},
  \         },
  \       },
  \     },
  \     'term': {
  \       'type': 'group',
  \       'label': 'Term options',
  \       'when': {s -> s['cmdtype'] ==# "term"},
  \       'sub': {
  \         'behaviour': {
  \           'type': 'toggle',
  \           'togglekey': ['b', 'B'],
  \           'values': ['sendtoterm', 'sendtopopup'],
  \           'default': 'sendtoterm',
  \           'when': {s -> s['cmdtype'] ==# "term"},
  \           'sub': {
  \             'sendtoterm': {
  \               'type': 'group',
  \               'label': 'Term options',
  \               'when': {s -> s['cmdtype.term.behaviour'] ==# "sendtoterm"},
  \               'sub': {
  \                 'term_winid': {
  \                   'type': 'toggle',
  \                   'togglekey': ['b', 'B'],
  \                   'values': {->g:select_execution_window['terminals']},
  \                   'default': '-1',
  \                 },
  \               }
  \             }
  \           }
  \         },
  \         'autocc': {
  \           'type': 'bool',
  \           'togglekey': ['c', 'C'],
  \           'default': 0,
  \           'when': {s -> s['cmdtype'] ==# "term"},
  \           'sub': {
  \             'test': {'type':'bool', 'default': 0}
  \           }
  \         },
  \         'autocd': {
  \           'type': 'toggle',
  \           'togglekey': ['d', 'D'],
  \           'values': [ "no", "cd_to_bufferfile", "cd_to_project_root", "cd_to_configured_autocd_path" ],
  \           'default': 'cd_to_project_root',
  \           'when': {s -> s['cmdtype'] ==# "term"},
  \             'sub': {
  \               'path': {'type': "string", 'default': '','when': {s -> s['cmdtype.term.autocd'] == "cd_to_configured_autocd_path" } },
  \             },
  \         },
  \       },
  \     },
  \   },
  \ },
  \ 'extend': {
  \   'type': 'toggle',
  \   'togglekey': ['g', 'G'],
  \   'label': 'Erweitern auf',
  \   'values': ['buffer', 'repo', 'global'],
  \   'default': 'buffer',
  \   'sub': {
  \     'buffer': {
  \       'type': 'group',
  \       'label': 'Buffer options',
  \       'when': {s -> s.extend ==# "buffer"},
  \       'sub': {
  \         'path': {
  \            'type': "string",
  \            'default': '',
  \            'when': {s -> s.extend ==# "buffer"},
  \         },
  \       }
  \     },
  \     'repo': {
  \       'type': 'group',
  \       'label': 'Buffer options',
  \       'when': {s -> s.extend ==# "repo"},
  \       'sub': {
  \         'path': {
  \           'type': "string",
  \           'default': '',
  \           'when': {s -> s.extend ==# "repo"},
  \         },
  \       },
  \     }
  \   }
  \ },
  \ 'key': {
  \   'type': 'string',
  \ },
  \ 'command': {
  \   'type': 'list',
  \   'default': [],
  \ },
  \ 'hash': {
  \   'type': 'number',
  \   'default': -1,
  \ },
  \ 'load': {
  \   'type': 'toggle',
  \   'togglekey': ['l', 'L'],
  \   'values': ['always', 'buffer_matches', 'same_dir', 'in_repository'],
  \   'default': 'always',
  \ },
  \ 'save': {
  \   'type': 'toggle',
  \   'togglekey': ['s', 'S'],
  \   'values': ['in_vim_configuration', 'in_repo_dir', 'in_same_dir' ],
  \   'default': 'in_vim_configuration',
  \   'sub': {
  \     'path': {
  \       'type': 'lambda_value',
  \       'lambda_value': {s->s.get('save')=="in_vim_configuration"?VimConfiguration():s.get('save')=="in_repo_dir"?ProjectPath():s.get('save')=="in_same_dir"?expand('%:p:h'):''},
  \     },
  \     'released': {
  \       'type': 'toggle',
  \       'togglekey': ['r', 'R'],
  \       'values': ['yes', 'no' ],
  \       'default': 'no',
  \     },
  \   },
  \ },
  \}
  " \ 'debug': {
  " \   'type': 'bool',
  " \   'default': 0,
  " \   'sub': {
  " \     'level': {
  " \       'type': 'toggle',
  " \       'togglekey': ['d', 'D'],
  " \       'values': [1,2,3],
  " \       'when': {s -> s.debug},
  " \     }
  " \   }
  " \ }
  " \}

function! Command() abort
  function! _command(schema) abort
    let obj = {
      \ 'schema': a:schema,
      \ 'state':  s:build_defaults(a:schema),
      \ 'get':         function('s:get'),
      \ 'set':         function('s:set'),
      \ 'toggle':      function('s:toggle'),
      \ 'multiselect': function('s:multiselect'),
      \ 'visible':     function('s:visible'),
      \ 'serialize':   function('s:serialize'),
      \ 'deserialize': function('s:deserialize'),
      \ 'configure':   function('s:configure'),
      \ 'select':      function('s:select'),
    \ }
    return obj
  endfunction
  " call DebugBufClear()
  " call DebugBuf("test", 3)
  function! s:select() abort dict closure
  endfunction
  " add closure?

  function! s:configure() abort dict
      call DebugBuf('IN configure self = storage[0] = ' . (self is g:cmdstorage.get('commands')[0]))
    " Make Debug Buf Right For Command Exposure of the last command
    " ,s ,v ,z ,b ,b - work with leader - for changing last command on the fly
    " [ 'j', 'J' ] add values like this for toggle buttons
    " or enable s:configure - mode like before with getchar()
    " call DebugBuf(self.schema)
    " call DebugBuf(self.state)
    function! _update_keys(key, Item) closure
      let l:key=a:key
      let l:Item=a:Item
      let l:up="_"
      let l:down="_"
      if has_key(l:Item, 'type') && ( l:Item['type']=='toggle' || l:Item['type']=='bool') && has_key(l:Item, 'togglekey')
        let l:up=l:Item['togglekey'][0]
        let l:down=l:Item['togglekey'][1]
      endif
      return [l:up, l:down]
    endfunction
    function! _toggle(pressed_key, visible) closure
      function! _t(pressed_key, key_prefixed, key, Item) closure
        let l:key=a:key
        let l:Item=a:Item
        let key_prefixed=a:key_prefixed
        " call add(output, a:key_prefixed)
        if has_key(l:Item, 'type')
          " call DebugBuf(l:Item)
          if l:Item['type']=='bool'
            if has_key(l:Item, 'togglekey')
            endif
          endif
        endif
        if (has_key(l:Item, 'type') && ( l:Item['type']=='toggle' || l:Item['type']=='bool') && has_key(l:Item, 'togglekey'))
          let up=l:Item['togglekey'][0]
          let down=l:Item['togglekey'][1]
          if l:Item['type']=="toggle"
            let index=index(l:Item['values'], self.get(key_prefixed))
            let n=0
            if a:pressed_key==l:Item['togglekey'][0]
              let n=-1
            elseif a:pressed_key==l:Item['togglekey'][1]
              let n=1
            endif
            if n!=0
              " call input("self.set("..key_prefixed..", l:Item['values'][Mod(index+n, len(l:Item['values']))])")
              call self.set(key_prefixed, l:Item['values'][Mod(index+n, len(l:Item['values']))])
              call DebugBuf('SET '. key_prefixed . ' = ' . self.get(key_prefixed))
              call g:cmdstorage.save()
              call DebugBuf("storage still sees it? ". string(g:cmdstorage.get("commands")[0].get(key_prefixed)))
              call DebugBuf("IN configure self.get('extend') = storage[0].get('extend') = " . (self.get(key_prefixed) is g:cmdstorage.get('commands')[0].get(key_prefixed)))
              call DebugBuf("IN configure self = storage[0] = " . (self is g:cmdstorage.get("commands")[0]))
            endif
          elseif l:Item['type']=='bool' && index(l:Item['togglekey'], a:pressed_key)>-1
            " call DebugBuf(self.get(key_prefixed))
            " call DebugBuf(!self.get(key_prefixed))
            " call input("self.set("..key_prefixed..", !self.get(key_prefixed))")
            call self.set(key_prefixed, !self.get(key_prefixed))
          endif
        endif
        if has_key(l:Item, 'sub')
          for [l:k, l:I] in items(l:Item['sub'])
            call _t(a:pressed_key, key_prefixed.."."..l:k, l:k, l:I)
          endfor
        endif
      endfunction
      for [l:key,l:Item] in items(a:visible)
        call _t(a:pressed_key, l:key, l:key, l:Item)
      endfor
    endfunction
    function! _set_print(pressed_key, visible, prefix='') closure
      " call DebugBuf(Pretty(a:visible))
      function! _print_item(key, Item) closure
        let l:key=a:key
        let l:Item=a:Item
        let [l:up, l:down]=_update_keys(l:key, l:Item)
        " let item = self.get(key)
        " let key=!empty(a:prefix)?aprefix.."."..key:''..key
        let data=string(self.get(key))
        " echo "data: "..data
        call add(output, '['..l:up..'|'..l:down..'] -- '..l:key..": "..data)
        if has_key(l:Item, 'sub')
          for [l:key2, l:Item2] in items(l:Item['sub'])
            " call add(output, key..'.'..key2)
            " call DebugBuf(key..'.'..key2)
             call _print_item(l:key..'.'..l:key2, l:Item2)
          endfor
        endif
      endfunction
      for [l:key, l:Item] in items(a:visible)
        let up="_"
        let down="_"
        call _print_item(l:key, l:Item)
        redraw!
        " if type(v)==4
        " if has_key(v, 'sub')
        "   call _print(v['sub'], key)
        " endif
        " endif
      endfor
      " call DebugBuf(self.state)
    endfunction
    " call _print(cfg.visible())
    let output=[]
    call DebugBufClear()
    call _set_print(v:null, self.visible())
    let charstr=''
    while index(['q', 'j', 'k', ''], charstr)==-1
      call DebugBuf(output)
      " call DebugBuf(g:cmdstorage.get('commands'))
      " call DebugBuf(self.get('extend'))
      " call DebugBuf(g:cmdstorage.get('commands'))
      call DebugBuf("!!!"..self.get('extend'))
      let charstr=getcharstr()
      let output=[]
      call _toggle(charstr, self.visible())
      call DebugBufClear()
      call _set_print(charstr, self.visible())
      " let _charstr=getcharstr()
      call g:cmdstorage.save()
    endwhile
    " call g:cmdstorage.save()
  endfunction

  function! s:toggle(path) abort dict
    let item = s:find_item(self.schema, a:path)
    if type(item) != v:t_dict || get(item, 'type', '') !=# 'toggle'
      " call DebugBuf('Not a toggle: ' . a:path)
      return
    endif
    let values = get(item, 'values', [])
    if empty(values) | return | endif
    let current = self.get(a:path)
    let idx = index(values, current)
    let next = values[(idx + 1) % len(values)]
    call self.set(a:path, next)
  endfunction
  function! s:multiselect(path, value) abort dict
    let current = self.get(a:path)
    if type(current) != v:t_list
      let current = []
    endif
    let idx = index(current, a:value)
    if idx >= 0
      call remove(current, idx)          " remove if already selected
    else
      call add(current, a:value)         " add if not selected
    endif
    call self.set(a:path, current)
  endfunction
  function! s:visible(...) abort dict
    " Returns only the currently visible part of the schema
    return s:filter_visible(self.schema, self.state, '')
  endfunction
  function! s:serialize() abort dict
    return json_encode(self.state)
  endfunction
  function! s:deserialize(json) abort dict
    let self.state = json_decode(a:json)
    return self
  endfunction
  function! s:filter_visible(schema, state, prefix) abort
    let result = {}
    for [key, item] in items(a:schema)
      let path = a:prefix ==# '' ? key : a:prefix . '.' . key
      " check visibility condition
      let visible = 1
      if has_key(item, 'when')
        let visible = item.when(a:state)
      endif
      if !visible | continue | endif
      if has_key(item, 'lambda_value') | continue | endif
      let result[key] = copy(item)
      if has_key(item, 'sub')
        let result[key].sub = s:filter_visible(item.sub, a:state, path)
      endif
    endfor
    return result
  endfunction
  let cfg = _command(g:cmd_schema)
  " Toggle / Multiselect
  " call cfg.toggle('extend')                  " cycles through values
  " call cfg.multiselect('tags', 'vim')      " add/remove from list
  " Get / Set
  " cfg.set('extend.repo.path', VimConfiguration())
  " call DebugBuf(cfg.get('extend.repo.path'))
  " cfg.set('extend.buffer.path', expand('%:p'))
  " call DebugBuf(cfg.get('extend.buffer.path'))
  " cfg.set('extend.autocd.path', ProjectPath())
  " call cfg.set('debug', 1)
  " Visibility
  " let visible = cfg.visible()              " returns only currently active tree
  " call DebugBuf(visible)
  " call DebugBuf(visible)
  " Serialization
  " let json = cfg.serialize()
  " call DebugBuf(json)
  " call cfg.deserialize(json)
  " call cfg.set('key', "<F5>")
  " call cfg.toggle('extend')
  " call cfg.set('command', ['ls -al', 'date'])
  " echo cfg.get('command')
  " call cfg.configure()
  return cfg
endfunction
" {s->s.save=="in_vim_configuration"?VimConfiguration():s.save=="in_repo_dir"?ProjectPath():s.save=="in_same_dir"?expand('%:p:h'):''}
"
function InitCmdStorage()
  if !exists('g:cmdstorage')
    let g:cmdstorage=CmdStorage()
    " let g:cmdstorage.get('commands')=g:cmdstorage.get('commands')
    " echo g:cmdstorage.get('commands')
    " echo g:cmdstorage.get('commands')[0].get('cmdtype.term.autocc')
      " .set('commands', g:cmdstorage.get('commands'))
  endif
endfunction

function! NoCommands()
  if exists('g:cmdstorage')
    unlet g:cmdstorage
  endif
endfunction
command! -range -nargs=0 NoCommands :call NoCommands()
function! ReloadCommands()
  call NoCommands()
  call InitCmdStorage()
  call g:cmdstorage.load()
endfunction
command! -range -nargs=0 ReloadCommands :call ReloadCommands()
" call ReloadCommands()

" \   'lambda': {p,o,n -> DebugBuf('Extend changed to '..n)},

" function! CommandPageInit()
"   " if !exists('b:commands')
"   call CommandPageExample()
"   " endif
" endfunction

" function! CommandPageExample()
"   let c=CommandTemplate()
"   let c.get('page')=0
"   let c.get('command')=['date']
"   let c.get('key')='<F5>'
"   let b:commands['pages'][0]['<F5>']=copy(c)
"   let c.get('command')=['ls -al']
"   let c.get('key')='<F6>'
"   let b:commands['pages'][0]['<F6>']=copy(c)
"   let c.get('command')=['activate']
"   let c.get('key')='<F7>'
"   let b:commands['pages'][0]['<F7>']=copy(c)
"   let c.get('command')=['deactivate']
"   let c.get('key')='<F8>'
"   let b:commands['pages'][0]['<F8>']=copy(c)
" endfunction

function! CommandDictAddPage(page)
  call extend(b:commands['pages'], [a:page])
  return b:commands
endfunction

