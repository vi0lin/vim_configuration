" filecycle.vim - cycle through the files in the current buffer's directory
"
"   TProject(1)   next file, wraps from the last file back to the first
"   TProject(-1)  previous file, wraps from the first file to the last
"   already bound to <Tab> / <S-Tab>, see src/Map.vim
"
" Shows where you are ("[12/340] name.ext") and opens the file directly.
" The directory listing is cached and only rescanned when the directory's
" own mtime changes (added/removed/renamed files update it on every common
" filesystem), so repeated Tab/S-Tab presses stay fast even in large or
" slow (network-mounted) folders.
"
" A file at or above g:filecycle_large_bytes asks for confirmation before
" loading; declining skips to the next candidate in the same direction.
" Cycling tries at most once around the whole directory, so a folder full
" of declined or unreadable files can never loop forever.
"
"   :FileCycleRefresh    force a rescan of the current directory
"   g:filecycle_large_bytes   size threshold in bytes (default 2 MiB)

if !exists('g:filecycle_large_bytes')
  let g:filecycle_large_bytes = 2 * 1024 * 1024
endif

let s:cache = {'dir': '', 'mtime': -1, 'files': []}

command! FileCycleRefresh let s:cache.dir = ''

function! TProject(dir) abort
  call s:Cycle(a:dir)
endfunction

function! s:Cycle(step) abort
  let dir = s:CurrentDir()
  if empty(dir)
    return s:Warn('no directory to cycle in (unnamed buffer, no cwd)')
  endif
  let files = s:Files(dir)
  let n = len(files)
  if n == 0
    return s:Warn('no files in ' . dir)
  endif
  if n == 1
    call s:Echo(printf('[1/1] %s (only file in %s)', files[0], dir))
    return
  endif

  let idx = index(files, expand('%:t'))
  " starting point when the current buffer is not one of these files: one
  " step before/after the list, so the first move lands on the first file
  " going forward, or the last file going backward
  let idx = idx >= 0 ? idx : (a:step > 0 ? -1 : 0)

  " at most n candidates, so a directory full of declined/unreadable files
  " (or any other reason nothing loads) can never loop forever
  for _ in range(n)
    let idx = (idx + a:step + n) % n
    let file = files[idx]
    let path = dir . '/' . file
    let size = getfsize(path)
    if size > g:filecycle_large_bytes && !s:ConfirmLarge(file, size)
      continue
    endif
    execute 'silent edit' fnameescape(path)
    call s:Echo(printf('[%d/%d] %s', idx + 1, n, file))
    return
  endfor
  call s:Warn('no file opened (every file in ' . dir . ' was skipped)')
endfunction

function! s:CurrentDir() abort
  let dir = expand('%:p:h')
  return isdirectory(dir) ? dir : (isdirectory(getcwd()) ? getcwd() : '')
endfunction

" Sorted list of regular file names (no directories) directly inside {dir}.
function! s:Files(dir) abort
  let mtime = getftime(a:dir)
  if s:cache.dir !=# a:dir || s:cache.mtime != mtime
    let s:cache.dir = a:dir
    let s:cache.mtime = mtime
    let s:cache.files = sort(readdir(a:dir, {n -> !isdirectory(a:dir . '/' . n)}))
  endif
  return s:cache.files
endfunction

function! s:ConfirmLarge(file, bytes) abort
  let mb = printf('%.1f', a:bytes / 1024.0 / 1024.0)
  let answer = confirm(printf('%s is %s MiB. Load it?', a:file, mb), "&Yes\n&No", 2) == 1
  " confirm() pauses for a keypress without returning to Vim's main loop the
  " way a finished command normally does, so anything echoed afterwards (the
  " next file being opened, our own status line) is still treated as part of
  " the SAME message burst as the dialog - and once that burst is long
  " enough, Vim pages it with "Press ENTER" instead of just showing it.
  " Redrawing right away closes out the dialog's messages first.
  redraw
  return answer
endfunction

" One line, never longer than the command line, never scrolling the screen
" (which is what makes Vim ask to press Enter).
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

function! s:Warn(msg) abort
  echohl WarningMsg
  call s:Echo('FileCycle: ' . a:msg)
  echohl None
endfunction
