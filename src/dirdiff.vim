" dirdiff.vim - compare two directories, the files go to the quickfix list
"
"   :DirDiff {left} {right}     or  :call DirDiff()  (uses g:left / g:right,
"                                                     asks if they are not set)
"
"   <C-Down> / <C-Up>   DirDiffNext() / DirDiffPrev(): next / previous file.
"                       Every time: all diffs (all tabs) are switched off, the
"                       left and right file are opened in a vertical split and
"                       diffed. Works from any window, even if another
"                       quickfix list is active (the last DirDiff list is
"                       selected again). Without any DirDiff list, DirDiff()
"                       is started.
"                       Files are always shown as they are on disk (buffers
"                       without unsaved changes are reloaded). The message
"                       warns about unsaved changes and about differences
"                       Vim does not show (line endings, encoding, BOM,
"                       newline at end of file). All commands run silently,
"                       so Vim never asks to press Enter.
"   <Down> / <Up>       QuickfixNext() / QuickfixPrev(): the same in a DirDiff
"                       list, :cnext / :cprev in any other list
"   <CR> in the list    open the file under the cursor
"
" Which files are listed (5 kinds):
"   left        only in left, no same-named file anywhere on the right
"   right       only in right, no same-named file anywhere on the left
"   different   in both, at the same relative path, but different
"   same        in both, at the same relative path, and identical
"   moved       one file was only in left and one only in right, but they
"               have the same file name (e.g. the directory layout differs,
"               or the file moved to another folder). Only paired up when
"               that name is unique on both the left-only and right-only
"               side; with several candidates it is left ambiguous and shown
"               as ordinary "left"/"right" entries instead of guessing.
"
"   :DirDiffFilter left right       show exactly these kinds
"   :DirDiffFilter +same -left      show / hide single kinds
"   :DirDiffFilter                  print the current filter
"   L R D S M in the list           toggle left / right / different / same / moved
"
"   g:dirdiff_show      default filter, e.g. ['left', 'right', 'different']
"   g:dirdiff_exclude   names/patterns that are skipped (diff -x)

let s:kinds  = ['left', 'right', 'different', 'same', 'moved']
let s:labels = {'left': 'only in left', 'right': 'only in right',
      \ 'different': 'different', 'same': 'same'}
let s:qfkeys = {'L': 'left', 'R': 'right', 'D': 'different', 'S': 'same', 'M': 'moved'}

if !exists('g:dirdiff_show')
  let g:dirdiff_show = ['left', 'right', 'different', 'moved']
endif
if !exists('g:dirdiff_exclude')
  let g:dirdiff_exclude = ['.git', '.hg', '.svn', 'node_modules', '__pycache__', '*.zip']
endif

" Bump on every behaviour-relevant change, so :DirDiffVersion (and anyone
" reading a bug report) can tell which version of this file is actually
" loaded - useful since several older revisions of this file circulated
" while it was being developed.
let s:version = '2026-09-15: moved-file matching + ambiguous-match reporting'
command! DirDiffVersion echo 'DirDiff ' . s:version

" All files of a DirDiff run, per quickfix list id. Only needed for the
" filter; navigation works from the quickfix list alone.
" 's:schema' guards against a session that was built by a different version
" of this file: if this script gets re-sourced (:PlugUpdate, a vimrc reload,
" ...) while an older DirDiff list is still open, its cached data can use a
" different shape. Bump this number whenever that shape changes, so a
" mismatch is detected and the list is rebuilt instead of causing an error
" like "E716: Key not present in Dictionary".
let s:schema = 2
let s:sessions = get(s:, 'sessions', {})

command! -nargs=* -complete=dir DirDiff call DirDiff(<f-args>)
command! -nargs=* -complete=customlist,DirDiffFilterComplete DirDiffFilter call DirDiffFilter(<f-args>)

function! GetLeft()
  return s:AskDir('left', 'Left dir: ')
endfunction

function! GetRight()
  return s:AskDir('right', 'Right dir: ')
endfunction

" ---------------------------------------------------------------------------
" public functions

function! DirDiff(...) abort
  let left  = s:Normalize(a:0 >= 1 ? a:1 : GetLeft())
  let right = s:Normalize(a:0 >= 2 ? a:2 : GetRight())
  if !isdirectory(left) || !isdirectory(right)
    return s:Error('both arguments must be existing directories')
  endif
  if !executable('diff')
    return s:Error('external "diff" command not found in $PATH')
  endif

  " -r recursive, -q names only, -s also report identical files,
  " -N treat missing files as empty (so one-sided files are reported too)
  let excludes = join(map(copy(g:dirdiff_exclude), '"-x " . shellescape(v:val)'))
  let output = systemlist('diff -rqsN ' . excludes . ' '
        \ . shellescape(left) . ' ' . shellescape(right))
  let failed = v:shell_error > 1
  let errors = filter(copy(output), 'v:val =~# "^diff: "')

  let head  = 'Files ' . left . '/'
  let mid   = ' and ' . right . '/'
  let files = []
  for line in output
    if stridx(line, head) != 0
      continue
    endif
    for [tail, identical] in [[' differ', 0], [' are identical', 1]]
      if strpart(line, len(line) - len(tail)) !=# tail
        continue
      endif
      " 'Files L/rel and R/rel differ': rel occurs twice, so its length
      " follows from the line length - robust even if rel contains ' and '
      let n = (len(line) - len(head) - len(mid) - len(tail)) / 2
      let rel = strpart(line, len(head), n)
      if n > 0 && line ==# head . rel . mid . rel . tail
        " 'identical' can only be reported by diff for two real files, so
        " both sides are guaranteed to exist - no need to stat() either one.
        " (Skipping this halves the filesystem calls on a tree that is
        " mostly unchanged, which is the common case and was slow on
        " network drives / WSL mounts with many files.)
        let kind = identical ? 'same' :
              \ getftype(left . '/' . rel) ==# '' ? 'right' :
              \ getftype(right . '/' . rel) ==# '' ? 'left' : 'different'
        call add(files, {'leftrel': rel, 'rightrel': rel, 'kind': kind, 'pos': len(files)})
      endif
      break
    endfor
  endfor
  let [files, ambiguous_note] = s:MatchMoved(files, left, right)

  if failed && empty(files)
    return s:Error('diff failed: ' . join((empty(errors) ? output : errors)[:2], ' | '))
  endif

  call setqflist([], ' ', {'title': 'DirDiff',
        \ 'context': {'dirdiff': 1, 'left': left, 'right': right}})
  let id = getqflist({'id': 0}).id
  call filter(s:sessions, {key, _ -> getqflist({'id': str2nr(key)}).id != 0})
  " 'pending_note' is shown together with the first file that gets opened,
  " in ONE message. Echoing it separately right after opening that file
  " would print a second message before Vim redraws - and that second
  " message is exactly what makes Vim ask to press Enter.
  let note = join(filter([
        \ empty(errors) ? '' : len(errors) . ' file(s) could not be compared, e.g. ' . errors[0],
        \ ambiguous_note], {_, s -> !empty(s)}), '; ')
  let s:sessions[id] = {'files': files, 'visible': [], 'current_pos': -1,
        \ 'pending_note': note, 'schema': s:schema}

  if empty(files)
    call s:Echo('DirDiff: the directories are empty'
          \ . (empty(note) ? '' : '   ! ' . note))
    return
  endif
  call s:Refresh(id, 1)
endfunction

" <C-Down> / <C-Up>
function! DirDiffNext() abort
  call s:Go(1)
endfunction

function! DirDiffPrev() abort
  call s:Go(-1)
endfunction

" <Down> / <Up>: DirDiff navigation in a DirDiff list, :cnext / :cprev otherwise
function! QuickfixNext() abort
  if s:IsDirDiff(0)
    call s:Go(1)
  else
    call s:QfCommand('cnext')
  endif
endfunction

function! QuickfixPrev() abort
  if s:IsDirDiff(0)
    call s:Go(-1)
  else
    call s:QfCommand('cprevious')
  endif
endfunction

" Set which kinds are listed, see the top of this file.
function! DirDiffFilter(...) abort
  if a:0 == 0
    call s:Echo('DirDiff shows: ' . join(s:ShowList(), ', ')
          \ . '   (kinds: ' . join(s:kinds, ', ') . ')')
    return
  endif
  let show = s:ShowList()
  let reset = 0
  for arg in a:000
    let op = matchstr(arg, '^[+-]')
    let kind = substitute(arg, '^[+-]', '', '')
    if index(s:kinds, kind) < 0
      return s:Error('unknown kind "' . kind . '", use: ' . join(s:kinds, ', '))
    endif
    if op ==# ''
      if !reset
        let show = []
        let reset = 1
      endif
      call add(show, kind)
    elseif op ==# '+'
      call add(show, kind)
    else
      call filter(show, {_, k -> k !=# kind})
    endif
  endfor
  let g:dirdiff_show = filter(copy(s:kinds), {_, k -> index(show, k) >= 0})

  if s:IsDirDiff(0)
    call s:Refresh(getqflist({'id': 0}).id, 0)
  else
    call s:Echo('DirDiff shows: ' . join(g:dirdiff_show, ', '))
  endif
endfunction

function! DirDiffFilterComplete(arglead, cmdline, cursorpos) abort
  let op = matchstr(a:arglead, '^[+-]')
  return filter(map(copy(s:kinds), {_, k -> op . k}), {_, k -> stridx(k, a:arglead) == 0})
endfunction

" Switch off all diffs, show both files in a vertical split and diff them.
" Returns a list of problems (empty when everything worked).
function! DirDiffOpen(left, right) abort
  let problems = []

  " 1. all diffs off: every window in every tab page, and hidden buffers.
  "    Must happen before switching buffers: 'diff' is window-local and would
  "    otherwise stick to the new buffer or come back with the old one.
  for tab in gettabinfo()
    call win_execute(tab.windows[0], 'silent diffoff!')
  endfor

  " 2. the two windows, next to each other
  let lwin = s:FindWin('left')
  let rwin = s:FindWin('right')
  if lwin && rwin && !s:SideBySide(lwin, rwin)
    execute 'silent ' . win_id2win(rwin) . 'close'
    let rwin = 0
  endif

  if lwin
    call win_gotoid(lwin)
    call s:Run('edit', a:left, problems)
  elseif rwin
    call win_gotoid(rwin)
    if !s:Split('leftabove vsplit', a:left, problems) | return problems | endif
  else
    call s:GotoEditWindow()
    call s:Run('edit', a:left, problems)
  endif
  let w:dirdiff_side = 'left'
  let lwin = win_getid()

  if rwin
    call win_gotoid(rwin)
    call s:Run('edit', a:right, problems)
  else
    call win_gotoid(lwin)
    if !s:Split('rightbelow vsplit', a:right, problems) | return problems | endif
  endif
  let w:dirdiff_side = 'right'
  let rwin = win_getid()

  " 3. diff exactly these two. 'silent' also swallows the output of an
  "    external diff program ('diffopt' without "internal"), which would
  "    otherwise end in a "Press ENTER" prompt.
  call win_execute(lwin, 'silent diffthis')
  call win_execute(rwin, 'silent diffthis')
  silent diffupdate
  call s:EqualWidths()

  " jump to the first change
  silent keepjumps normal! gg
  if !diff_hlID(1, 1)
    silent! keepjumps normal! ]c
  endif

  " 4. verify, so a failure never goes unnoticed
  for [win, file] in [[lwin, a:left], [rwin, a:right]]
    let shown = get(get(getbufinfo(winbufnr(win)), 0, {}), 'name', '')
    if simplify(shown) !=# simplify(fnamemodify(file, ':p'))
      call add(problems, 'window shows "' . shown . '" instead of "' . file . '"')
    elseif !getwinvar(win_id2win(win), '&diff')
      call add(problems, 'diff is off for "' . file . '"')
    endif
  endfor
  if !s:SideBySide(lwin, rwin)
    call add(problems, 'the two files are not side by side')
  endif
  let others = filter(getwininfo(), {_, w -> w.winid != lwin && w.winid != rwin
        \ && gettabwinvar(w.tabnr, w.winnr, '&diff')})
  if !empty(others)
    call add(problems, len(others) . ' other window(s) still in diff mode')
  endif
  return problems
endfunction

" Keys in the quickfix window (global so it survives re-sourcing this file)
function! DirDiffQfKey(key) abort
  let info = get(getwininfo(win_getid()), 0, {})
  if get(info, 'loclist', 0) || !s:IsDirDiff(0)
    execute 'normal! ' . (v:count ? v:count : '') . (a:key ==# 'CR' ? "\<CR>" : a:key)
  elseif a:key ==# 'CR'
    call s:OpenEntry(line('.'), 0)
  else
    let kind = s:qfkeys[a:key]
    call DirDiffFilter((index(s:ShowList(), kind) >= 0 ? '-' : '+') . kind)
  endif
endfunction

" ---------------------------------------------------------------------------
" internals

function! s:Go(delta) abort
  let stay_in_qf = &buftype ==# 'quickfix'
  if !s:SelectDirDiffList()
    call DirDiff()
    return
  endif
  let qf = getqflist({'idx': 0, 'size': 0})
  if qf.size == 0
    call s:Echo('DirDiff: no files listed, see :DirDiffFilter')
    return
  endif
  let idx = qf.idx + a:delta
  let edge = idx < 1 ? 'first' : idx > qf.size ? 'last' : ''
  " at the ends the current pair is opened again (repairs the view)
  let idx = max([1, min([idx, qf.size])])
  call s:OpenEntry(idx, stay_in_qf, empty(edge) ? '' : '(' . edge . ' file)')
endfunction

" Make a DirDiff list the current quickfix list: the current one, or the
" newest one in the quickfix history. Returns 0 if there is none.
function! s:SelectDirDiffList() abort
  if s:IsDirDiff(0)
    return 1
  endif
  let cur = getqflist({'nr': 0}).nr
  for nr in range(getqflist({'nr': '$'}).nr, 1, -1)
    if s:IsDirDiff(nr)
      execute 'silent ' . (nr < cur ? 'colder ' . (cur - nr) : 'cnewer ' . (nr - cur))
      return 1
    endif
  endfor
  return 0
endfunction

function! s:IsDirDiff(nr) abort
  let ctx = getqflist({'nr': a:nr, 'context': 0}).context
  return type(ctx) == v:t_dict && get(ctx, 'dirdiff', 0) && has_key(ctx, 'left')
endfunction

" Session for {id}, or {} if it is missing or was built by a different
" version of this file (see 's:schema'). In that case the whole comparison
" is transparently run again, instead of continuing with data in the wrong
" shape and running into an error later.
function! s:Session(id) abort
  if has_key(s:sessions, a:id) && get(s:sessions[a:id], 'schema', 0) == s:schema
    return s:sessions[a:id]
  endif
  let ctx = getqflist({'id': a:id, 'context': 0}).context
  if type(ctx) == v:t_dict && has_key(ctx, 'left') && has_key(ctx, 'right')
    call DirDiff(ctx.left, ctx.right)
  else
    call s:Error('lost track of this DirDiff list, please run :DirDiff again')
  endif
  return {}
endfunction

" Rebuild the quickfix entries from the stored result and the filter.
function! s:Refresh(id, first) abort
  let session = s:Session(a:id)
  if empty(session)
    return
  endif
  let ctx = getqflist({'id': a:id, 'context': 0}).context
  let show = s:ShowList()
  let session.visible = filter(copy(session.files), {_, f -> index(show, f.kind) >= 0})

  let counts = {'left': 0, 'right': 0, 'different': 0, 'same': 0, 'moved': 0}
  for f in session.files
    let counts[f.kind] += 1
  endfor
  let summary = join(map(copy(s:kinds), {_, k -> index(show, k) >= 0
        \ ? k . ' ' . counts[k] : '(' . k . ' ' . counts[k] . ')'}), ' | ')

  call setqflist([], 'r', {
        \ 'id':      a:id,
        \ 'title':   'DirDiff ' . ctx.left . ' <-> ' . ctx.right . '   ' . summary,
        \ 'items':   map(copy(session.visible), {_, f -> s:Item(f)}),
        \ 'context': ctx})

  if !getqflist({'winid': 0}).winid
    call s:OpenQfWindow()
  endif
  if empty(session.visible)
    call s:Echo('DirDiff: no files listed   ' . summary . '   (hidden kinds in brackets)')
    return
  endif

  if a:first || session.current_pos < 0
    call s:OpenEntry(1, 1)
    return
  endif

  " keep the pair that is shown, or move on to the next one that is listed
  let idx = len(session.visible)
  for i in range(len(session.visible))
    if session.visible[i].pos >= session.current_pos
      let idx = i + 1
      break
    endif
  endfor
  if session.visible[idx - 1].pos == session.current_pos
    call setqflist([], 'a', {'id': a:id, 'idx': idx})
    call s:QfCursor(idx)
    call s:Echo('DirDiff: ' . summary . '   (hidden kinds in brackets)')
  else
    call s:OpenEntry(idx, &buftype ==# 'quickfix')
  endif
endfunction

" Open entry {idx} of the current (DirDiff) quickfix list. Returns problems.
function! s:OpenEntry(idx, stay_in_qf, ...) abort
  let qf = getqflist({'id': 0, 'size': 0, 'context': 0})
  let session = s:Session(qf.id)
  if empty(session)
    " a stale session (e.g. an older version of this file still loaded from
    " a previous :source) was rebuilt from scratch instead of causing an
    " error; it already opened its first entry
    return []
  endif
  if a:idx < 1 || a:idx > qf.size
    return ['no entry ' . a:idx]
  endif
  let items = getqflist({'idx': a:idx, 'items': 0}).items
  let item = len(items) == 1 ? items[0] : items[a:idx - 1]
  let visible = get(session, 'visible', [])
  if a:idx <= len(visible)
    let session.current_pos = visible[a:idx - 1].pos
  endif
  let side = get(w:, 'dirdiff_side', 'right')
  " shown once, together with whichever file is opened first, then discarded:
  " a separate message right after opening a file is exactly what makes Vim
  " ask to press Enter (two messages before the next redraw)
  let pending_note = get(session, 'pending_note', '')
  let session.pending_note = ''

  call setqflist([], 'a', {'id': qf.id, 'idx': a:idx})
  " leftrel/rightrel differ only for a "moved" entry; for every other kind
  " they are the same relative path (a missing side simply opens empty).
  let file = a:idx <= len(visible) ? visible[a:idx - 1]
        \ : {'leftrel': item.module, 'rightrel': item.module}
  let problems = DirDiffOpen(qf.context.left . '/' . file.leftrel,
        \ qf.context.right . '/' . file.rightrel)

  if !getqflist({'winid': 0}).winid
    call s:OpenQfWindow()
  endif
  call s:EqualWidths()
  call s:QfCursor(a:idx)
  let target = a:stay_in_qf ? getqflist({'winid': 0}).winid : s:FindWin(side)
  if target
    call win_gotoid(target)
  endif

  redraw
  if empty(problems)
    let notes = s:Notes(s:FindWin('left'), s:FindWin('right'))
    let msg = printf('DirDiff [%d/%d] %s: %s', a:idx, qf.size, item.text, item.module)
    if a:0 && !empty(a:1)
      let msg .= '  ' . a:1
    endif
    let warnings = notes + (empty(pending_note) ? [] : [pending_note])
    if !empty(warnings)
      let msg .= '   ! ' . join(warnings, ', ')
      echohl WarningMsg
    endif
    call s:Echo(msg)
    echohl None
  else
    call s:Error(join(problems, ' | '))
  endif
  return problems
endfunction

function! s:OpenQfWindow() abort
  let winid = win_getid()
  if exists('*COpen')
    silent call COpen()
  else
    silent botright copen
  endif
  call win_gotoid(winid)
  call win_execute(getqflist({'winid': 0}).winid, 'call s:QfMaps()')
endfunction

function! s:QfCursor(idx) abort
  let qfwin = getqflist({'winid': 0}).winid
  if qfwin
    call win_execute(qfwin, 'call cursor(' . a:idx . ', 1)')
  endif
endfunction

function! s:QfMaps() abort
  nnoremap <buffer> <silent> <CR> :<C-u>call DirDiffQfKey('CR')<CR>
  for key in keys(s:qfkeys)
    execute 'nnoremap <buffer> <silent> ' . key . ' :<C-u>call DirDiffQfKey("' . key . '")<CR>'
  endfor
endfunction

function! s:QfCommand(cmd) abort
  try
    execute a:cmd
  catch
    echohl ErrorMsg | echo substitute(v:exception, '^Vim\%((\a\+)\)\=:', '', '') | echohl None
  endtry
endfunction

function! s:ShowList() abort
  let show = type(g:dirdiff_show) == v:t_list ? g:dirdiff_show : split(g:dirdiff_show, '[ ,]\+')
  return filter(copy(s:kinds), {_, k -> index(show, k) >= 0})
endfunction

" Pair up one-sided files that have the same file name, so a project whose
" directory layout differs between left and right (or where a file simply
" moved to another folder) still gets a real diff instead of an empty side.
" Only paired when the name is unique among the left-only and right-only
" files; with more than one candidate on either side it stays ambiguous and
" the files are left as ordinary "left" / "right" entries. Returns
" [files, ambiguous_note] - the note is empty when nothing was ambiguous.
function! s:MatchMoved(files, left, right) abort
  let byName = {'left': {}, 'right': {}}
  for side in ['left', 'right']
    for f in filter(copy(a:files), {_, f -> f.kind ==# side})
      let name = fnamemodify(f[side . 'rel'], ':t')
      let byName[side][name] = get(byName[side], name, []) + [f]
    endfor
  endfor

  let paired = {}  " pos -> 1, to drop the original left/right entries
  let moved = []
  let ambiguous = []  " file names seen on both sides but with >1 candidate
  for [name, ls] in items(byName.left)
    let rs = get(byName.right, name, [])
    if empty(rs)
      continue
    endif
    if len(ls) != 1 || len(rs) != 1
      call add(ambiguous, name)
      continue
    endif
    let lf = ls[0]
    let rf = rs[0]
    call add(moved, {'leftrel': lf.leftrel, 'rightrel': rf.rightrel, 'kind': 'moved',
          \ 'identical': s:FilesEqual(a:left . '/' . lf.leftrel, a:right . '/' . rf.rightrel),
          \ 'pos': min([lf.pos, rf.pos])})
    let paired[lf.pos] = 1
    let paired[rf.pos] = 1
  endfor

  let note = empty(ambiguous) ? '' : printf(
        \ '%d file name(s) matched more than one candidate and were left unmatched, e.g. %s',
        \ len(ambiguous), ambiguous[0])
  if empty(moved)
    return [a:files, note]
  endif

  let result = filter(copy(a:files), {_, f -> !has_key(paired, f.pos)}) + moved
  call sort(result, {a, b -> a.pos - b.pos})
  for i in range(len(result))
    let result[i].pos = i
  endfor
  return [result, note]
endfunction

" 'moved' entries need a content check per matched pair. Comparing in Vim
" (readfile) instead of spawning 'diff' avoids one process start per pair,
" which is the slow part when many files were reorganised into new folders.
" Very large files still go through the external 'diff', to avoid pulling
" them into memory as a Vim List.
let s:filesequal_max_bytes = get(g:, 'dirdiff_filesequal_max_bytes', 5 * 1024 * 1024)

function! s:FilesEqual(left, right) abort
  if !filereadable(a:left) || !filereadable(a:right)
    return 0
  endif
  let lsize = getfsize(a:left)
  let rsize = getfsize(a:right)
  if lsize != rsize
    return 0
  endif
  if lsize >= 0 && lsize <= s:filesequal_max_bytes
    return readfile(a:left, 'b') ==# readfile(a:right, 'b')
  endif
  call system('diff -q ' . shellescape(a:left) . ' ' . shellescape(a:right))
  return v:shell_error == 0
endfunction

" Text shown in the quickfix list for one file entry.
function! s:Item(f) abort
  if a:f.kind ==# 'moved'
    return {'module': a:f.leftrel . '  ->  ' . a:f.rightrel,
          \ 'text': a:f.identical ? 'moved, identical' : 'moved, different'}
  endif
  return {'module': a:f.leftrel, 'text': s:labels[a:f.kind]}
endfunction

" :edit / :vsplit {file}, report errors instead of silently stopping, and
" make sure the window shows what is on disk: with 'hidden' a buffer that was
" loaded before keeps its old text when the file changed outside of Vim
" (Vim only shows the W11 prompt, and after [O]K it never reloads).
function! s:Run(cmd, file, problems) abort
  let full = simplify(fnamemodify(a:file, ':p'))
  let was_loaded = !empty(filter(getbufinfo({'bufloaded': 1}),
        \ {_, b -> simplify(b.name) ==# full}))
  let save_autoread = &g:autoread
  set autoread
  try
    execute 'silent' a:cmd fnameescape(a:file)
    if was_loaded && !&modified && filereadable(a:file)
      silent edit
    endif
  catch
    call add(a:problems, a:file . ': ' . substitute(v:exception, '^Vim\%((\a\+)\)\=:', '', ''))
  finally
    let &g:autoread = save_autoread
  endtry
endfunction

" Things that make the diff look different from what 'diff' reported
function! s:Notes(lwin, rwin) abort
  let notes = []
  let bufs = {'left': winbufnr(a:lwin), 'right': winbufnr(a:rwin)}
  for side in ['left', 'right']
    if getbufvar(bufs[side], '&modified')
      call add(notes, side . ' has unsaved changes')
    endif
  endfor
  if !filereadable(expand('#' . bufs.left . ':p')) || !filereadable(expand('#' . bufs.right . ':p'))
    return notes
  endif
  for [opt, what] in [['&fileformat', 'line endings'], ['&fileencoding', 'encoding'],
        \ ['&bomb', 'BOM'], ['&endofline', 'newline at end of file']]
    let lv = string(getbufvar(bufs.left, opt))
    let rv = string(getbufvar(bufs.right, opt))
    if lv !=# rv
      call add(notes, printf('%s differ (%s / %s)', what, lv, rv))
    endif
  endfor
  return notes
endfunction

function! s:Split(cmd, file, problems) abort
  let before = winnr('$')
  call s:Run(a:cmd, a:file, a:problems)
  if winnr('$') == before
    call add(a:problems, 'could not split the window for ' . a:file)
    return 0
  endif
  return 1
endfunction

" left window directly left of the right window, same height
function! s:SideBySide(lwin, rwin) abort
  if !win_id2win(a:lwin) || !win_id2win(a:rwin)
    return 0
  endif
  let [lrow, lcol] = win_screenpos(a:lwin)
  let [rrow, rcol] = win_screenpos(a:rwin)
  return lrow == rrow && winheight(a:lwin) == winheight(a:rwin)
        \ && lcol + winwidth(a:lwin) + 1 == rcol
endfunction

" give both files the same width
function! s:EqualWidths() abort
  let lnr = win_id2win(s:FindWin('left'))
  let rnr = win_id2win(s:FindWin('right'))
  if lnr && rnr
    call win_execute(win_getid(lnr), 'silent vertical resize ' . (winwidth(lnr) + winwidth(rnr)) / 2)
  endif
endfunction

function! s:FindWin(side) abort
  for nr in range(1, winnr('$'))
    if getwinvar(nr, 'dirdiff_side', '') ==# a:side
      return win_getid(nr)
    endif
  endfor
  return 0
endfunction

" Go to a window showing a normal file (not quickfix, terminal, file tree, ...)
" Returns 1 when it had to create a new, empty window.
function! s:GotoEditWindow() abort
  if &buftype ==# ''
    return 0
  endif
  for nr in [winnr('#')] + range(1, winnr('$'))
    if nr > 0 && getwinvar(nr, '&buftype') ==# ''
      execute nr . 'wincmd w'
      return 0
    endif
  endfor
  silent topleft new
  return 1
endfunction

" Use g:left / g:right if they are real directories, otherwise ask
function! s:AskDir(name, prompt) abort
  let dir = get(g:, a:name, '')
  if empty(dir) || !isdirectory(fnamemodify(dir, ':p'))
    let dir = input(a:prompt, dir, 'dir')
    redraw
    if !empty(dir)
      let g:[a:name] = dir
    endif
  endif
  return dir
endfunction

" Extra exclude patterns (bare names, no path) found automatically for one
" side: git submodules from .gitmodules, and, if g:dirdiff_respect_gitignore
" is set, whatever that side's own .gitignore rules hide there - only when
" the side is actually a git working tree, and only entire ignored
" directories (via --directory) rather than every file inside them, to keep
" this fast even for a huge ignored build/vendor folder.
" GNU diff's -x only matches a bare file name, not a path, so only the last
" path component of each excluded entry is used here. That is broad enough
" for "build/", "node_modules/", a vendored submodule, and so on, but does
" not distinguish a rule that is meant for one specific nested path from an
" unrelated file or folder elsewhere that happens to share its name.
function! s:AutoExcludes(dir) abort
  let names = {}
  if g:dirdiff_exclude_submodules && filereadable(a:dir . '/.gitmodules')
    for line in readfile(a:dir . '/.gitmodules')
      let path = matchstr(line, '^\s*path\s*=\s*\zs.\{-}\s*$')
      if !empty(path)
        let names[fnamemodify(path, ':t')] = 1
      endif
    endfor
  endif
  if g:dirdiff_respect_gitignore
        \ && (isdirectory(a:dir . '/.git') || filereadable(a:dir . '/.git'))
    for entry in systemlist('git -C ' . shellescape(a:dir)
          \ . ' ls-files --others -i --exclude-standard --directory 2>/dev/null')
      let names[fnamemodify(substitute(entry, '/$', '', ''), ':t')] = 1
    endfor
  endif
  return keys(names)
endfunction

function! s:Normalize(dir) abort
  if empty(a:dir)
    return ''
  endif
  return substitute(fnamemodify(a:dir, ':p'), '[/\\]\+$', '', '')
endfunction

function! s:Error(msg) abort
  echohl ErrorMsg
  " echomsg keeps the whole text in :messages, s:Echo shows one line of it
  silent echomsg 'DirDiff: ' . a:msg
  call s:Echo('DirDiff: ' . a:msg)
  echohl None
endfunction

" Print one line and make sure Vim does not ask to press Enter afterwards.
" A message that is too long, or output of a command, scrolls the screen;
" Vim then waits for Enter, often on an empty command line.
function! s:Echo(msg) abort
  let msg = substitute(a:msg, '[\r\n\t]', ' ', 'g')
  let room = &columns - (&showcmd ? 11 : 0) - 1
  while !empty(msg) && strdisplaywidth(msg) > room
    let msg = strcharpart(msg, 0, strchars(msg) - 1)
  endwhile
  " state('s'): the screen has scrolled for messages, so Vim would ask to
  " press Enter (not available in every version)
  if !exists('*state') || state('s') !=# ''
    redraw
  endif
  echo msg
endfunction

augroup DirDiffQuickfix
  autocmd!
  autocmd FileType qf call s:QfMaps()
augroup END
