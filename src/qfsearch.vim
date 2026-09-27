" qfsearch.vim - fast file-name search (:F), in-file search (:IF) and
" quickfix-list navigation that never moves you out of your window.
"
"   :F                   every file of the project (ProjectPath())
"   :F name              files whose path contains "name" (smart case)
"   :F *.cpp             glob, matched against the path inside the project
"   :F /abs/glob/*       an explicit path/glob is expanded as before
"   :IF text             lines containing "text" in the current file
"   :IF text path        ... in a file, directory or glob  (". " = cwd)
"   :IF /regex/ path     regular expression instead of plain text
"   '<,'>IF              search for the visually selected text
"   Both fill the quickfix list and show it, without opening any result.
"
"   <Down> / <Up>        QfSelectNext() / QfSelectPrev(): move the selection
"                        in the list only - no file is opened, the buffer in
"                        your window does not change
"   <C-Down> / <C-Up>    QfOpenNext() / QfOpenPrev(): move the selection AND
"                        show that entry: the file opens at the match in your
"                        editing window, a DirDiff entry opens as diff split.
"                        Your cursor stays in the window it was in.
"
"   g:qfsearch_map_keys      1 (default) installs the four keys above in
"                            normal mode; 0 to map them yourself
"   g:qfsearch_max_results   upper limit of entries (default 5000)
"
" Why it is fast:
"  - rg (or git grep / grep / find as fallback) does the searching, instead
"    of :vimgrep (which loads every file into Vim) or glob('**');
"  - the quickfix list is filled with autocommands suppressed: otherwise
"    every result file fires BufNew/BufAdd (cwd, git status, statusline)
"    - thousands of times for a big result;
"  - the project file list for :F is cached for a few seconds, so refining
"    a :F query does not rescan the disk;
"  - showing an entry only switches the buffer of one window; the jump there
"    and back runs without WinEnter/WinLeave.

if !exists('g:qfsearch_map_keys')
  let g:qfsearch_map_keys = 1
endif
if !exists('g:qfsearch_max_results')
  let g:qfsearch_max_results = 5000
endif
if !exists('g:qfsearch_file_cache_seconds')
  let g:qfsearch_file_cache_seconds = 10
endif

let s:file_cache = get(s:, 'file_cache', {})

command! -range -nargs=* F call s:FCommand(<q-args>)
command! -range -nargs=* IF call s:IFCommand(<range>, <line1>, <line2>, <q-args>)

" -----------------------------------------------------------------------
" :F - file names

" Kept as a function for any other code calling F(...) directly.
function! F(...) abort
  call s:FCommand(join(a:000, ' '))
endfunction

function! s:FCommand(args) abort
  let pattern = trim(a:args)
  let root = s:Root()
  if pattern =~# '^[/~]' || pattern =~# '^\./'
    " explicit path or glob, expanded exactly like the old :F did
    let files = filter(glob(pattern, 0, 1), 'filereadable(v:val)')
    let files = map(files, 'fnamemodify(v:val, ":p")')
    let root = ''
  else
    let files = s:ProjectFiles(root)
    if !empty(pattern)
      let files = filter(copy(files), {_, f -> s:PathMatches(strpart(f, len(root) + 1), pattern)})
    endif
  endif
  let truncated = len(files) > g:qfsearch_max_results
  let files = files[: g:qfsearch_max_results - 1]
  let items = map(files, {_, f -> {'filename': f, 'lnum': 1,
        \ 'module': empty(root) ? f : strpart(f, len(root) + 1), 'text': ''}})
  call s:SetList(items, 'F ' . pattern . (empty(root) ? '' : '  (' . root . ')'))
  call s:Echo(printf('F: %d file(s)%s', len(items), truncated ? ' (limit reached, refine the pattern)' : ''))
endfunction

" smart case: all lower case -> ignore case
function! s:PathMatches(path, pattern) abort
  let ic = a:pattern ==# tolower(a:pattern)
  if a:pattern =~# '[*?[]'
    return a:path =~ (ic ? '\c' : '\C') . glob2regpat(a:pattern)
  endif
  return ic ? stridx(tolower(a:path), a:pattern) >= 0 : stridx(a:path, a:pattern) >= 0
endfunction

function! s:ProjectFiles(root) abort
  let entry = get(s:file_cache, a:root, {})
  if !empty(entry) && localtime() - entry.time < g:qfsearch_file_cache_seconds
    return entry.files
  endif
  if executable('rg')
    let files = systemlist('rg --files --hidden --no-messages -g ' . shellescape('!.git')
          \ . ' ' . shellescape(a:root))
  elseif isdirectory(a:root . '/.git') || filereadable(a:root . '/.git')
    let files = map(systemlist('git -C ' . shellescape(a:root) . ' ls-files --cached --others --exclude-standard'),
          \ {_, f -> a:root . '/' . f})
  else
    let files = systemlist('find ' . shellescape(a:root)
          \ . ' \( -name .git -o -name node_modules \) -prune -o -type f -print 2>/dev/null')
  endif
  let files = sort(files)
  let s:file_cache[a:root] = {'time': localtime(), 'files': files}
  return files
endfunction

" -----------------------------------------------------------------------
" :IF - text inside files

" Kept as a function for any other code calling IF(...) directly.
function! IF(...) abort
  call s:IFCommand(0, 0, 0, join(a:000, ' '))
endfunction

function! s:IFCommand(range, line1, line2, args) abort
  let args = trim(a:args)
  if empty(args) && a:range > 0
    let args = s:VisualText()
    let path = '%'
  elseif empty(args)
    let args = input('IF: ')
    redraw
    let path = '%'
  else
    " last word is the path when there is more than one word, like before
    let words = split(args, ' ')
    let path = len(words) > 1 ? words[-1] : '%'
    let args = len(words) > 1 ? join(words[:-2], ' ') : args
  endif
  if empty(args)
    return
  endif
  let regex = args =~# '^/.\+/$'
  let pattern = regex ? args[1:-2] : args
  " compatible with CDo()/CFDo(): they take everything but the last word
  let g:last_search = pattern . ' ' . path

  if path ==# '%'
    let items = s:SearchBuffer(pattern, regex)
    let where = expand('%:t')
  else
    " no expand(): it would already expand a glob into a list of files
    let items = s:SearchFiles(pattern, regex, substitute(path, '^\~', escape($HOME, '\&'), ''))
    let where = path
  endif
  let truncated = len(items) > g:qfsearch_max_results
  let items = items[: g:qfsearch_max_results - 1]
  call s:SetList(items, 'IF ' . args . '  (' . where . ')')
  call s:Echo(printf('IF: %d match(es) for "%s" in %s%s', len(items), pattern, where,
        \ truncated ? ' (limit reached)' : ''))
endfunction

function! s:VisualText() abort
  let [l1, c1] = [line("'<"), col("'<")]
  let [l2, c2] = [line("'>"), col("'>")]
  if l1 != l2
    return getline(l1)[c1 - 1 :]
  endif
  return getline(l1)[c1 - 1 : c2 - 1]
endfunction

" The current buffer, searched in memory (also finds unsaved text).
function! s:SearchBuffer(pattern, regex) abort
  let buf = bufnr('%')
  if &buftype !=# ''
    let buf = winbufnr(winnr('#'))
  endif
  let ic = a:pattern ==# tolower(a:pattern) ? '\c' : '\C'
  let re = ic . (a:regex ? a:pattern : '\V' . escape(a:pattern, '\'))
  let items = []
  let lnum = 0
  for line in getbufline(buf, 1, '$')
    let lnum += 1
    let col = match(line, re)
    if col >= 0
      call add(items, {'bufnr': buf, 'lnum': lnum, 'col': col + 1, 'text': trim(line)})
      if len(items) > g:qfsearch_max_results
        break
      endif
    endif
  endfor
  return items
endfunction

" A file, a directory or a glob ("*.cpp", "src/**/*.h"), searched with rg,
" or grep when rg is not installed.
function! s:SearchFiles(pattern, regex, path) abort
  let smart = a:pattern ==# tolower(a:pattern)
  let globbed = a:path =~# '[*?[]'
  if globbed
    " the glob is matched below the part of the path that has no wildcards
    let base = fnamemodify(matchstr(a:path, '^[^*?[]*'), ':p')
    let base = isdirectory(base) ? base : fnamemodify(base, ':h')
    let base = substitute(base, '/\+$', '', '')
    let glob = strpart(fnamemodify(a:path, ':p'), len(base) + 1)
  else
    let base = substitute(fnamemodify(a:path, ':p'), '/\+$', '', '')
    let glob = ''
  endif
  if executable('rg')
    let cmd = 'rg --vimgrep --no-heading --no-messages --color=never'
          \ . (smart ? ' -i' : ' -s') . (a:regex ? '' : ' -F')
          \ . (globbed ? ' -g ' . shellescape(glob) : '')
          \ . ' -e ' . shellescape(a:pattern) . ' -- ' . shellescape(base)
    let re = '^\(.\{-}\):\(\d\+\):\(\d\+\):\(.*\)$'
  else
    let cmd = 'grep -rnIH --color=never --exclude-dir=.git --exclude-dir=node_modules'
          \ . (smart ? ' -i' : '') . (a:regex ? ' -E' : ' -F')
          \ . (globbed ? ' --include=' . shellescape(fnamemodify(glob, ':t')) : '')
          \ . ' -e ' . shellescape(a:pattern) . ' -- ' . shellescape(base)
    let re = '^\(.\{-}\):\(\d\+\):\(\)\(.*\)$'
  endif
  let dir = isdirectory(base)
  let items = []
  for line in systemlist(cmd . ' | head -n ' . (g:qfsearch_max_results + 1))
    let m = matchlist(line, re)
    if empty(m)
      continue
    endif
    let file = fnamemodify(m[1], ':p')
    call add(items, {'filename': file, 'lnum': str2nr(m[2]),
          \ 'col': empty(m[3]) ? 1 : str2nr(m[3]),
          \ 'module': (dir ? strpart(file, len(base) + 1) : fnamemodify(file, ':t')) . ':' . m[2],
          \ 'text': trim(m[4])})
  endfor
  return items
endfunction

" -----------------------------------------------------------------------
" filling and showing the list

function! s:SetList(items, title) abort
  " noautocmd: every new file name creates a buffer; without this each one
  " would run the BufNew/BufAdd autocommands (cwd, git, statusline)
  noautocmd call setqflist([], ' ', {'title': a:title, 'items': a:items})
  let winid = win_getid()
  if !getqflist({'winid': 0}).winid
    if exists('*COpen')
      silent call COpen()
    else
      silent botright copen
    endif
  endif
  call win_gotoid(winid)
  let qfwin = getqflist({'winid': 0}).winid
  if qfwin
    call win_execute(qfwin, 'call cursor(1, 1)')
  endif
endfunction

" -----------------------------------------------------------------------
" navigation

function! QfSelectNext() abort
  call s:Select(1)
endfunction

function! QfSelectPrev() abort
  call s:Select(-1)
endfunction

function! QfOpenNext() abort
  call s:Open(1)
endfunction

function! QfOpenPrev() abort
  call s:Open(-1)
endfunction

function! s:IsDirDiff() abort
  let ctx = getqflist({'context': 0}).context
  return type(ctx) == v:t_dict && get(ctx, 'dirdiff', 0) && exists('*DirDiffOpenIndex')
endfunction

" [new index, edge note] or [0, message] for an empty list
function! s:Target(delta) abort
  let qf = getqflist({'idx': 0, 'size': 0})
  if qf.size == 0
    return [0, 'the quickfix list is empty']
  endif
  let idx = qf.idx + a:delta
  let edge = idx < 1 ? '(first entry)' : idx > qf.size ? '(last entry)' : ''
  return [max([1, min([idx, qf.size])]), edge]
endfunction

" Move the selection only: nothing is opened, no buffer changes.
function! s:Select(delta) abort
  let [idx, note] = s:Target(a:delta)
  if idx == 0
    return s:Echo(note)
  endif
  call setqflist([], 'a', {'idx': idx})
  call s:QfCursor(idx)
  call s:Echo(s:Describe(idx) . (empty(note) ? '' : '  ' . note))
endfunction

" Move the selection and show the entry; the cursor stays where it is.
function! s:Open(delta) abort
  let [idx, note] = s:Target(a:delta)
  if idx == 0
    return s:Echo(note)
  endif
  if s:IsDirDiff()
    return DirDiffOpenIndex(getqflist({'idx': 0}).idx + a:delta)
  endif
  call setqflist([], 'a', {'idx': idx})
  call s:QfCursor(idx)
  let item = getqflist({'idx': idx, 'items': 0}).items[0]
  if item.bufnr > 0
    let origin = win_getid()
    let target = s:EditWindow()
    if target != origin
      noautocmd call win_gotoid(target)
    endif
    try
      execute 'silent keepjumps buffer' item.bufnr
      call cursor(item.lnum, max([item.col, 1]))
      silent! normal! zv
    catch
      call s:Echo(substitute(v:exception, '^Vim\%((\a\+)\)\=:', '', ''))
    finally
      if target != origin
        noautocmd call win_gotoid(origin)
      endif
    endtry
  endif
  call s:Echo(s:Describe(idx) . (empty(note) ? '' : '  ' . note))
endfunction

" The window a result is shown in: the current one if it is a normal file
" window, otherwise the last used normal window, otherwise a new one.
function! s:EditWindow() abort
  if &buftype ==# '' && win_gettype() ==# ''
    return win_getid()
  endif
  for nr in [winnr('#')] + range(1, winnr('$'))
    if nr > 0 && getwinvar(nr, '&buftype') ==# '' && win_gettype(nr) ==# ''
      return win_getid(nr)
    endif
  endfor
  let origin = win_getid()
  noautocmd silent topleft new
  let new = win_getid()
  noautocmd call win_gotoid(origin)
  return new
endfunction

function! s:QfCursor(idx) abort
  let qfwin = getqflist({'winid': 0}).winid
  if qfwin
    call win_execute(qfwin, 'call cursor(' . a:idx . ', 1)')
  endif
endfunction

function! s:Describe(idx) abort
  let size = getqflist({'size': 0}).size
  let item = getqflist({'idx': a:idx, 'items': 0}).items[0]
  let name = !empty(get(item, 'module', '')) ? item.module
        \ : item.bufnr > 0 ? fnamemodify(bufname(item.bufnr), ':~:.') . ':' . item.lnum : ''
  return printf('[%d/%d] %s  %s', a:idx, size, name, trim(item.text))
endfunction

" One line, never longer than the command line and never scrolling the
" screen (which is what makes Vim ask to press Enter).
function! s:Echo(msg) abort
  let msg = substitute(a:msg, '[\r\n\t]', ' ', 'g')
  let room = &columns - (&showcmd ? 11 : 0) - 1
  while !empty(msg) && strdisplaywidth(msg) > room
    let msg = strcharpart(msg, 0, strchars(msg) - 1)
  endwhile
  if !exists('*state') || state('s') !=# ''
    redraw
  endif
  echo msg
endfunction

function! s:Root() abort
  let root = exists('*ProjectPath') ? ProjectPath() : getcwd()
  if type(root) != v:t_string || empty(root) || !isdirectory(root)
    let root = getcwd()
  endif
  return substitute(fnamemodify(root, ':p'), '/\+$', '', '')
endfunction

if g:qfsearch_map_keys
  " nnoremap <silent> <Down>   :<C-u>call QfSelectNext()<CR>
  " nnoremap <silent> <Up>     :<C-u>call QfSelectPrev()<CR>
  " nnoremap <silent> <C-Down> :<C-u>call QfOpenNext()<CR>
  " nnoremap <silent> <C-Up>   :<C-u>call QfOpenPrev()<CR>
endif
