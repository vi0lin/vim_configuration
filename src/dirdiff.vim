" dirdiff.vim - compare two directories, changed files go to the quickfix list
"
"   :DirDiff {left} {right}        (or :call DirDiff('dir1', 'dir2'))
"
"   In the quickfix window:
"     <Down> / <Up>   show next / previous file pair, focus stays in the list
"     <CR>            show the pair under the cursor and jump into the diff
"   Anywhere:
"     :call DirDiffNext()  /  :call DirDiffPrev()

command! -nargs=* -complete=dir DirDiff call DirDiff(<f-args>)

if !exists("g:left")
  let g:left = "/your/dirdiff/left/path"
endif
if !exists("g:right")
  let g:right = "/your/dirdiff/right/path"
endif

function GetLeft()
  if !exists("g:left")
    return input('Left dir: ', '', 'dir')
  else
    return g:left
  endif
endfunction

function GetRight()
  if !exists("g:right")
    return input('Right dir: ', '', 'dir')
  else
    return g:right
  endif
endfunction

let g:filepairs = []
function! DirDiff(...) abort
  let left  = s:Normalize(a:0 >= 1 ? a:1 : GetLeft())
  let right = s:Normalize(a:0 >= 2 ? a:2 : GetRight())
  if !isdirectory(left) || !isdirectory(right)
    return s:Error('both arguments must be existing directories')
  endif
  if !executable('diff')
    return s:Error('external "diff" command not found in $PATH')
  endif
  " -r recursive, -q names only, -N treat missing files as empty, so files
  " (and whole subdirectories) that exist on one side only are listed as well
  let output = systemlist('diff -rqN ' . shellescape(left) . ' ' . shellescape(right))
  " if v:shell_error > 1
  "   return s:Error('diff failed: ' . join(output, ' | '))
  " endif
  let head  = 'Files ' . left . '/'
  let mid   = ' and ' . right . '/'
  let tail  = ' differ'
  let items = []
  let pairs = []
  for line in output
    " Line is 'Files L/rel and R/rel differ'. rel occurs twice, so its length
    " follows from the line length - robust even if rel contains ' and '.
    let n = (len(line) - len(head) - len(mid) - len(tail)) / 2
    if n <= 0 | continue | endif
    let rel = strpart(line, len(head), n)
    if line !=# head . rel . mid . rel . tail | continue | endif
    let lfile  = left . '/' . rel
    let rfile  = right . '/' . rel
    let status = !filereadable(lfile) ? 'only in right'
          \    : !filereadable(rfile) ? 'only in left'
          \    : 'modified'
    call add(pairs, [lfile, rfile])
    call add(items, {
          \ 'filename': filereadable(lfile) ? lfile : rfile,
          \ 'module':   rel,
          \ 'text':     status})
  endfor
  call setqflist([], ' ', {
        \ 'title':   'DirDiff ' . left . '  <->  ' . right,
        \ 'items':   items,
        \ 'context': {'dirdiff': 1, 'pairs': pairs}})
  if empty(items)
    cclose
    echo 'DirDiff: no differences'
    return
  endif
  call s:OpenEntry(1, 1)
endfunction

" Show two files side by side in diff mode.
" Reuses the two DirDiff windows if they exist, and turns off every other
" diff in the current tab first.
function! DirDiffOpen(left, right) abort
  let lwin = s:FindWin('left')
  let rwin = s:FindWin('right')

  " Must happen before switching buffers: 'diff' is window-local and would
  " otherwise stick to the new buffer (or come back when the old one is shown)
  diffoff!

  if lwin
    call win_gotoid(lwin)
    execute 'edit' fnameescape(a:left)
  elseif rwin
    call win_gotoid(rwin)
    execute 'leftabove vsplit' fnameescape(a:left)
  else
    call s:GotoEditWindow()
    execute 'edit' fnameescape(a:left)
  endif
  let w:dirdiff_side = 'left'
  diffthis

  if rwin
    call win_gotoid(rwin)
    execute 'edit' fnameescape(a:right)
  else
    execute 'rightbelow vsplit' fnameescape(a:right)
  endif
  let w:dirdiff_side = 'right'
  diffthis

  " jump to the first change
  keepjumps normal! gg
  if !diff_hlID(1, 1)
    silent! keepjumps normal! ]c
  endif
endfunction

function! DirDiffNext() abort
  call s:OpenEntry(getqflist({'idx': 0}).idx + 1, &buftype ==# 'quickfix')
endfunction

function! DirDiffPrev() abort
  call s:OpenEntry(getqflist({'idx': 0}).idx - 1, &buftype ==# 'quickfix')
endfunction

" ---------------------------------------------------------------------------

function! s:OpenEntry(idx, stay_in_qf) abort
  let qf = getqflist({'context': 0, 'size': 0})
  if !s:IsDirDiffList()
    return s:Error('the current quickfix list is not a DirDiff list')
  endif
  if a:idx < 1 || a:idx > qf.size
    echo 'DirDiff: no more files'
    return
  endif

  call setqflist([], 'a', {'idx': a:idx})
  let [left, right] = qf.context.pairs[a:idx - 1]
  call DirDiffOpen(left, right)

  botright copen
  call cursor(a:idx, 1)
  if !a:stay_in_qf
    wincmd p
  endif
  redraw
  echo printf('DirDiff [%d/%d] %s', a:idx, qf.size, getqflist()[a:idx - 1].text)
endfunction

function! s:IsDirDiffList() abort
  let ctx = getqflist({'context': 0}).context
  return type(ctx) == v:t_dict && get(ctx, 'dirdiff', 0)
endfunction

function! s:InDirDiffQfWindow() abort
  let info = get(getwininfo(win_getid()), 0, {})
  return !get(info, 'loclist', 0) && s:IsDirDiffList()
endfunction

" <Up>/<Down> in the quickfix window; normal behaviour for any other list
function! s:QfArrow(delta) abort
  if !s:InDirDiffQfWindow()
    execute 'normal! ' . (a:delta > 0 ? 'j' : 'k')
    return
  endif
  call s:OpenEntry(line('.') + a:delta, 1)
endfunction

function! s:QfEnter() abort
  if !s:InDirDiffQfWindow()
    execute "normal! \<CR>"
    return
  endif
  call s:OpenEntry(line('.'), 0)
endfunction

function! s:FindWin(side) abort
  for nr in range(1, winnr('$'))
    if getwinvar(nr, 'dirdiff_side', '') ==# a:side
      return win_getid(nr)
    endif
  endfor
  return 0
endfunction

" Go to a window showing a normal file (not quickfix, help, file tree, ...)
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
  autocmd FileType qf nnoremap <buffer> <silent> <Down> :<C-u>call <SID>QfArrow(1)<CR>
  autocmd FileType qf nnoremap <buffer> <silent> <Up>   :<C-u>call <SID>QfArrow(-1)<CR>
  autocmd FileType qf nnoremap <buffer> <silent> <CR>   :<C-u>call <SID>QfEnter()<CR>
augroup END
