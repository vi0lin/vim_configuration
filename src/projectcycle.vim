" projectcycle.vim - cycle through "projects" instead of single files
"
" A project is a directory: normally a git repository root (found the same
" way FindGit() already does, by walking up from a file looking for .git),
" falling back to an entry of g:projects for a project directory that is not
" itself a git repo.
"
"   ProjectCycleBufferNext() / ProjectCycleBufferPrev()   -> bind to <F2> / <S-F2>
"     Cycles only through projects that currently have at least one open
"     buffer. Switches to that project's most recently used open buffer -
"     use this to hop between the projects you are already working on.
"
"   ProjectCycleAllNext() / ProjectCycleAllPrev()   -> bind to <C-F2> / <C-S-F2>
"     Cycles through every project in g:projects, whether or not it has a
"     buffer open yet. Switches to an already open buffer for it if there is
"     one (same as above), otherwise opens the project's root directory so
"     you can browse into it (netrw, if you have it enabled).
"
" Both directions wrap around: past the last project goes back to the first,
" and back from the first goes to the last.
"
"   :ProjectCycleRefresh   forces g:projects to be rebuilt (calls
"                          UpdateProjects(), which this file does not define)
"
" NOTE ON KEYS: <F2>, <C-F2> and <S-F2> already have other mappings further
" down in Map.vim (SelectRemote, ToggleWrap, :F, :IF, GetKeys, ...); the last
" NewMap for a given key wins. This file only defines the functions below -
" wire them up in Map.vim yourself where you want them to take priority, for
" example:
"
"   NewMap -no -n <F2>      :call ProjectCycleBufferNext()<cr>
"   NewMap -no -n <S-F2>    :call ProjectCycleBufferPrev()<cr>
"   NewMap -no -n <C-F2>    :call ProjectCycleAllNext()<cr>
"   NewMap -no -n <C-S-F2>  :call ProjectCycleAllPrev()<cr>

command! ProjectCycleRefresh call s:RefreshProjects()

function! ProjectCycleBufferNext() abort
  call s:Cycle(1, 0)
endfunction

function! ProjectCycleBufferPrev() abort
  call s:Cycle(-1, 0)
endfunction

function! ProjectCycleAllNext() abort
  call s:Cycle(1, 1)
endfunction

function! ProjectCycleAllPrev() abort
  call s:Cycle(-1, 1)
endfunction

" ---------------------------------------------------------------------------

function! s:Cycle(step, all) abort
  let projects = a:all ? s:AllProjects() : s:OpenProjects()
  let n = len(projects)
  if n == 0
    return s:Warn(a:all ? 'no projects (g:projects is empty; :ProjectCycleRefresh?)'
          \ : 'no project has an open buffer right now')
  endif
  if n == 1
    return s:Select(projects[0], 1, 1, projects, a:all ? 'all projects' : 'open projects')
  endif

  let current = s:ProjectOf(expand('%:p'))
  let idx = index(projects, current)
  let idx = idx >= 0 ? idx : (a:step > 0 ? -1 : 0)
  let idx = (idx + a:step + n) % n
  call s:Select(projects[idx], idx + 1, n, projects, a:all ? 'all projects' : 'open projects')
endfunction

" Switch to {dir}'s most recently used open buffer, or open its root
" directory if it has none open yet.
function! s:Select(dir, pos, total, projects = [], title = 'projects') abort
  let projects = a:projects
  let target = s:MostRecentBuffer(a:dir)
  if target > 0
    execute 'silent buffer' target
    call s:Echo(printf('[%d/%d] %s -> %s', a:pos, a:total,
          \ fnamemodify(a:dir, ':t'), bufname(target)))
  else
    execute 'silent edit' fnameescape(a:dir)
    call s:Echo(printf('[%d/%d] %s (no open buffer, opened the directory)',
          \ a:pos, a:total, fnamemodify(a:dir, ':t')))
  endif
  if exists('*XbmCyclePopup') && !empty(projects)
    call XbmCyclePopup(a:title,
          \ map(copy(projects), 'fnamemodify(v:val, ":~")'), a:pos - 1)
  endif
endfunction

" Every project (see the header) that has at least one open buffer right
" now, most recently used project first... no: sorted, for a stable cycle
" order regardless of use order (recency only decides which buffer within a
" project you land on, not the project order itself).
function! s:OpenProjects() abort
  let seen = {}
  for buf in s:RealBuffers()
    let dir = s:ProjectOf(buf.name)
    if !empty(dir)
      let seen[dir] = 1
    endif
  endfor
  return sort(keys(seen))
endfunction

" Every project in g:projects (built by this configuration's own
" UpdateProjects()/GetProjects()), normalised and de-duplicated. Rebuilt
" only on demand (:ProjectCycleRefresh) or the first time it is needed, since
" scanning for projects can itself be slow - not on every keypress.
function! s:AllProjects() abort
  if !exists('g:projects')
    call s:RefreshProjects()
  endif
  let dirs = {}
  for p in get(g:, 'projects', [])
    if isdirectory(p)
      let dirs[s:Normalize(p)] = 1
    endif
  endfor
  return sort(keys(dirs))
endfunction

function! s:RefreshProjects() abort
  if exists('*UpdateProjects')
    call UpdateProjects()
  endif
endfunction

" The project a file belongs to: its git root (walking up, same as
" FindGit()), or else the closest matching entry of g:projects, or '' if
" neither applies.
function! s:ProjectOf(path) abort
  if empty(a:path)
    return ''
  endif
  let path = fnamemodify(a:path, ':p')
  if exists('*FindGit')
    let git = FindGit(path)
    if type(git) == v:t_string && !empty(git)
      return s:Normalize(git)
    endif
  endif
  let best = ''
  for p in get(g:, 'projects', [])
    let p = s:Normalize(p)
    if (path . '/')[0 : len(p)] ==# p . '/' && len(p) > len(best)
      let best = p
    endif
  endfor
  return best
endfunction

" Buffer number of {dir}'s most recently used loaded, listed, real buffer,
" or 0 if it has none.
function! s:MostRecentBuffer(dir) abort
  let best = 0
  let best_time = -1
  for buf in s:RealBuffers()
    if s:ProjectOf(buf.name) ==# a:dir && buf.lastused > best_time
      let best = buf.bufnr
      let best_time = buf.lastused
    endif
  endfor
  return best
endfunction

" Listed buffers that represent a real file - open (loaded) or not, since a
" buffer that is merely listed but currently unloaded (e.g. without 'hidden'
" set) is still a file the user has open from their point of view.
function! s:RealBuffers() abort
  return filter(getbufinfo({'buflisted': 1}),
        \ {_, b -> getbufvar(b.bufnr, '&buftype') ==# '' && !empty(b.name)})
endfunction

function! s:Normalize(dir) abort
  return substitute(fnamemodify(a:dir, ':p'), '[/\\]\+$', '', '')
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
  call s:Echo('ProjectCycle: ' . a:msg)
  echohl None
endfunction
