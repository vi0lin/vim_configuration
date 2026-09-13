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
"                       newline at end of file).
"   <Down> / <Up>       QuickfixNext() / QuickfixPrev(): the same in a DirDiff
"                       list, :cnext / :cprev in any other list
"   <CR> in the list    open the file under the cursor
"
" Which files are listed (4 kinds):
"   left        only in left
"   right       only in right
"   different   in both, but different
"   same        in both and identical
"
"   :DirDiffFilter left right       show exactly these kinds
"   :DirDiffFilter +same -left      show / hide single kinds
"   :DirDiffFilter                  print the current filter
"   L R D S in the list             toggle left / right / different / same
"
"   g:dirdiff_show      default filter, e.g. ['left', 'right', 'different']
"   g:dirdiff_exclude   names/patterns that are skipped (diff -x)

let s:kinds  = ['left', 'right', 'different', 'same']
let s:labels = {'left': 'only in left', 'right': 'only in right',
      \ 'different': 'different', 'same': 'same'}
let s:qfkeys = {'L': 'left', 'R': 'right', 'D': 'different', 'S': 'same'}

if !exists('g:dirdiff_show')
  let g:dirdiff_show = ['left', 'right', 'different']
endif
if !exists('g:dirdiff_exclude')
  let g:dirdiff_exclude = ['.git', '.hg', '.svn', 'node_modules', '__pycache__', '*.zip']
endif

" All files of a DirDiff run, per quickfix list id. Only needed for the
" filter; navigation works from the quickfix list alone.
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
        let inleft  = getftype(left . '/' . rel) !=# ''
        let inright = getftype(right . '/' . rel) !=# ''
        let kind = !inleft ? 'right' : !inright ? 'left'
              \ : identical ? 'same' : 'different'
        call add(files, {'rel': rel, 'kind': kind, 'pos': len(files)})
      endif
      break
    endfor
  endfor

  if failed && empty(files)
    return s:Error('diff failed: ' . join((empty(errors) ? output : errors)[:2], ' | '))
  endif

  call setqflist([], ' ', {'title': 'DirDiff',
        \ 'context': {'dirdiff': 1, 'left': left, 'right': right}})
  let id = getqflist({'id': 0}).id
  call filter(s:sessions, {key, _ -> getqflist({'id': str2nr(key)}).id != 0})
  let s:sessions[id] = {'files': files, 'visible': [], 'current_pos': -1}

  if empty(files)
    echo 'DirDiff: the directories are empty'
    return
  endif
  call s:Refresh(id, 1)
  if !empty(errors)
    call s:Error(len(errors) . ' file(s) could not be compared, e.g. ' . errors[0])
  endif
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
    echo 'DirDiff shows: ' . join(s:ShowList(), ', ')
          \ . '   (kinds: ' . join(s:kinds, ', ') . ')'
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
    echo 'DirDiff shows: ' . join(g:dirdiff_show, ', ')
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
    call win_execute(tab.windows[0], 'diffoff!')
  endfor

  " 2. the two windows, next to each other
  let lwin = s:FindWin('left')
  let rwin = s:FindWin('right')
  if lwin && rwin && !s:SideBySide(lwin, rwin)
    execute win_id2win(rwin) . 'close'
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

  " 3. diff exactly these two
  call win_execute(lwin, 'diffthis')
  call win_execute(rwin, 'diffthis')
  diffupdate
  call s:EqualWidths()

  " jump to the first change
  keepjumps normal! gg
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
    echo 'DirDiff: no files listed, see :DirDiffFilter'
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

" Rebuild the quickfix entries from the stored result and the filter.
function! s:Refresh(id, first) abort
  if !has_key(s:sessions, a:id)
    " result is gone (e.g. this file was sourced again): run the diff again
    let ctx = getqflist({'id': a:id, 'context': 0}).context
    return DirDiff(ctx.left, ctx.right)
  endif
  let session = s:sessions[a:id]
  let ctx = getqflist({'id': a:id, 'context': 0}).context
  let show = s:ShowList()
  let session.visible = filter(copy(session.files), {_, f -> index(show, f.kind) >= 0})

  let counts = {'left': 0, 'right': 0, 'different': 0, 'same': 0}
  for f in session.files
    let counts[f.kind] += 1
  endfor
  let summary = join(map(copy(s:kinds), {_, k -> index(show, k) >= 0
        \ ? k . ' ' . counts[k] : '(' . k . ' ' . counts[k] . ')'}), ' | ')

  call setqflist([], 'r', {
        \ 'id':      a:id,
        \ 'title':   'DirDiff ' . ctx.left . ' <-> ' . ctx.right . '   ' . summary,
        \ 'items':   map(copy(session.visible), {_, f -> {'module': f.rel, 'text': s:labels[f.kind]}}),
        \ 'context': ctx})

  if !getqflist({'winid': 0}).winid
    call s:OpenQfWindow()
  endif
  if empty(session.visible)
    echo 'DirDiff: no files listed   ' . summary . '   (hidden kinds in brackets)'
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
    echo 'DirDiff: ' . summary . '   (hidden kinds in brackets)'
  else
    call s:OpenEntry(idx, &buftype ==# 'quickfix')
  endif
endfunction

" Open entry {idx} of the current (DirDiff) quickfix list. Returns problems.
function! s:OpenEntry(idx, stay_in_qf, ...) abort
  let qf = getqflist({'id': 0, 'size': 0, 'context': 0})
  if a:idx < 1 || a:idx > qf.size
    return ['no entry ' . a:idx]
  endif
  let items = getqflist({'idx': a:idx, 'items': 0}).items
  let item = len(items) == 1 ? items[0] : items[a:idx - 1]
  let session = get(s:sessions, qf.id, {})
  if a:idx <= len(get(session, 'visible', []))
    let session.current_pos = session.visible[a:idx - 1].pos
  endif
  let side = get(w:, 'dirdiff_side', 'right')

  call setqflist([], 'a', {'id': qf.id, 'idx': a:idx})
  let problems = DirDiffOpen(qf.context.left . '/' . item.module,
        \ qf.context.right . '/' . item.module)

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
    if !empty(notes)
      let msg .= '   ! ' . join(notes, ', ')
      echohl WarningMsg
    endif
    echo strpart(msg, 0, &columns - 12)
    echohl None
  else
    call s:Error(join(problems, ' | '))
  endif
  return problems
endfunction

function! s:OpenQfWindow() abort
  let winid = win_getid()
  if exists('*COpen')
    call COpen()
  else
    botright copen
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
    execute a:cmd fnameescape(a:file)
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
    call win_execute(win_getid(lnr), 'vertical resize ' . (winwidth(lnr) + winwidth(rnr)) / 2)
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
function! s:GotoEditWindow() abort
  if &buftype ==# ''
    return
  endif
  for nr in [winnr('#')] + range(1, winnr('$'))
    if nr > 0 && getwinvar(nr, '&buftype') ==# ''
      execute nr . 'wincmd w'
      return
    endif
  endfor
  topleft new
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

function! s:Normalize(dir) abort
  if empty(a:dir)
    return ''
  endif
  return substitute(fnamemodify(a:dir, ':p'), '[/\\]\+$', '', '')
endfunction

function! s:Error(msg) abort
  echohl ErrorMsg | echomsg 'DirDiff: ' . a:msg | echohl None
endfunction

augroup DirDiffQuickfix
  autocmd!
  autocmd FileType qf call s:QfMaps()
augroup END
