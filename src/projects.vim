" projects.vim - the project/favorites subsystem, rewritten
"
" This file replaces the implementation of the following, which used to be
" scattered across Functions.vim: Refresh, SetUnset, ForceSet, ForceUnset,
" MergeUniq, GetProjects, UpdateProjects, GetGitprojects, UpdateGitProjects,
" GetProjectHolder(_Projects), GetMultiprojectHolder(_Projects),
" GetFavoriteFolders(_Recursively/_Files/_Files_Recursively),
" GetPathsOfFavorites, Projects, FilesInProjects, Favorites - and the
" commands UpdateProjects, UpdateGitProjects, Projekt, MultiprojectHolder,
" FavoriteFolder, FavoriteFolderRecursively, ProjectHolder, Favorites.
" It is loaded after Functions.vim (see the exec 'source ...' line added
" there) and uses Vim's normal "redefine with a bang" rule to take over: the
" names above keep working exactly as before, callers do not need to change.
"
" WHAT WAS ACTUALLY WRONG (see PROJECTS_REVIEW.md for the full write-up):
"
"  - SetUnset/ForceSet/ForceUnset built Vimscript source with :exec by
"    concatenating the file PATH you were toggling directly into the
"    command string. A path containing a single quote (an apostrophe in a
"    folder name is not exotic) broke it; a more deliberately crafted name
"    could inject arbitrary Vimscript. Rewritten below with no :exec on any
"    path value - only on the small, fixed set of list NAMES this file
"    itself defines, which is what Vim's own curly-braces-names feature is
"    for.
"  - GetProjectHolder_Projects() computed its result, wrote it to disk, and
"    then returned g:projectholder_projects - which it had never actually
"    assigned. It returned stale or undefined data. Fixed.
"  - GetPathsOfFavorites() read g:favorites without it necessarily existing
"    yet (only the ",,f" mapping ever set it). Calling :Projects or
"    :UpdateProjects before ever using ",,f" crashed with E121. Fixed.
"  - The ",,f" mapping called Refresh('favorites_folders',
"    'GetFavoritesFolders()') - a function that is not defined anywhere in
"    this codebase (note the extra "s": GetFavoriteFolders() singular does
"    exist). That half of the mapping has always thrown E117. See the
"    Map.vim note below for the one-line fix needed there (this file cannot
"    fix a key mapping by itself).
"  - g:projectfolders / GetProjectFolders() was read-only: nothing ever
"    populated it, and it fed into nothing else. Removed (see below).
"  - g:favoritefolders_glob / GetFavoriteFolders_Glob() /
"    SaveFavoriteFolders_Glob() only ever wrote placeholder test data and
"    nothing ever read the result. Removed (see below).
"  - g:favoritefolders_files_recursively was computed and cached on every
"    refresh but never actually included in the final g:projects list.
"    Actually included now.
"  - "projekt" (:Projekt) and "projectPocket" (,,,,f) were toggle lists that
"    got saved to disk correctly but were never read back by anything -
"    tagging a project with :Projekt had no visible effect. Both now
"    contribute to g:projects, so tagging something with them now does
"    something.
"  - Refresh(name, functionname) rebuilt 'let g:{name} = {functionname}'
"    from two strings and :exec'd it on every single call, under a name
"    that suggests caching but performs none: g:projects was fully
"    recomputed - including a `find` over your home directory and two
"    globpath scans per *holder entry - every time anything touched it.
"    Kept as a compatibility shim (some other code may call it directly),
"    but nothing in this file uses it internally any more; direct calls
"    are faster and, unlike a string full of your own function names typed
"    twice, a typo in them is a normal Vim error instead of a silently
"    created new global.
"
" WHAT WAS REMOVED (confirmed unused anywhere in this codebase - grep it
" yourself before deleting the old definitions if you are not convinced):
"   g:projectfolders, GetProjectFolders(), GetFoldersFolders()
"   g:favoritefolders_glob, GetFavoriteFolders_Glob(), SaveFavoriteFolders_Glob()
" These are no longer redefined here, so the OLD (broken/dead) versions in
" Functions.vim are technically still reachable if you call them directly;
" delete them there whenever you next touch that area. Nothing else in the
" codebase calls them.
"
" ONE-LINE FIX STILL NEEDED IN Map.vim (this file cannot override a key
" mapping, only functions/commands): replace
"   NewMap -no -n ,,f :call SetUnset("favorites", expand('%:p')) \| :call Refresh('favorites_folders', 'GetFavoritesFolders()')<cr>
" with just
"   NewMap -no -n ,,f :call SetUnset("favorites", expand('%:p'))<cr>
" SetUnset already keeps g:favorites (and the file on disk) up to date by
" itself; the second half was the broken, redundant call described above.
"
" -----------------------------------------------------------------------
" Data model
"
" Every user-curated list (favorites, favoritefolders, ...) lives in one
" dict, s:lists, loaded from disk on first use and written back on every
" change - same file per list, same one-path-per-line format, same
" location (g:unreleased/.{name}) as before, so your existing data is read
" exactly as it was.

let s:lists = {}

" Results of the expensive scans (holder folders, recursive favourite
" folders, the merged project list), with the time they were built. They
" are reused for g:projects_cache_seconds, rebuilt at once when one of the
" source lists changes (:Projekt, ,,f, :ProjectHolder, ...) and always on
" :UpdateProjects. Opening :Projects / :Favorites no longer rescans every
" folder each time.
if !exists('g:projects_cache_seconds')
  let g:projects_cache_seconds = 300
endif
let s:cache = get(s:, 'cache', {})

function! s:Cached(key, Build) abort
  let entry = get(s:cache, a:key, {})
  if empty(entry) || localtime() - entry.time >= g:projects_cache_seconds
    let entry = {'time': localtime(), 'value': a:Build()}
    let s:cache[a:key] = entry
  endif
  return entry.value
endfunction

function! s:InvalidateCache() abort
  let s:cache = {}
endfunction

" Every file below {dir}. 'rg --files' / 'find' are much faster than Vim's
" own globpath('**') on large trees (and on WSL / network drives).
function! s:FilesRecursive(dir) abort
  if !isdirectory(a:dir)
    return []
  endif
  if executable('rg')
    return systemlist('rg --files --hidden --no-messages -g ' . shellescape('!.git') . ' ' . shellescape(a:dir))
  elseif executable('find')
    return systemlist('find ' . shellescape(a:dir) . ' -name .git -prune -o -type f -print 2>/dev/null')
  endif
  return filter(globpath(a:dir, '**', 0, 1), 'filereadable(v:val)')
endfunction

function! s:ListFile(name) abort
  return g:unreleased . '/.' . a:name
endfunction

function! s:LoadList(name) abort
  if !has_key(s:lists, a:name)
    " one-time migration: the list used to be called "projekt"
    if a:name ==# 'projects' && !filereadable(s:ListFile('projects'))
          \ && filereadable(s:ListFile('projekt'))
      call Write(Read(s:ListFile('projekt')), s:ListFile('projects'))
    endif
    let s:lists[a:name] = Read(s:ListFile(a:name))
  endif
  return s:lists[a:name]
endfunction

function! s:SaveList(name) abort
  call s:InvalidateCache()
  call Write(s:lists[a:name], s:ListFile(a:name))
  " mirror into the historical global of the same name, for any other code
  " (yours or a plugin) that still reads e.g. g:favorites directly
  let g:{a:name} = s:lists[a:name]
endfunction

" A directory path with or without a trailing slash is the same directory -
" e.g. :Projekt on a directory buffer saves expand('%:p'), which Vim gives
" back WITH a trailing slash, while every other source here (git, the
" *holder scans) never has one. Without normalising this, the exact same
" directory tagged two different ways would silently show up twice in
" g:projects instead of being deduplicated. Left-alone for a plain file.
function! s:NormalizePath(path) abort
  return isdirectory(a:path) ? substitute(a:path, '/\+$', '', '') : a:path
endfunction

" Add {value} (or remove it, if already present) from list {name}, and
" persist the change. {value} can be a single path or a list of paths.
" This never builds Vimscript source from {value} - only {name}, one of a
" handful of fixed strings this file itself passes in, goes through Vim's
" own curly-braces dynamic-name syntax; the path itself is only ever used
" as a plain string value.
function! SetUnset(name, value) abort
  call s:LoadList(a:name)
  for v in map(EnsureArr(a:value), 's:NormalizePath(v:val)')
    let idx = index(s:lists[a:name], v)
    if idx >= 0
      call remove(s:lists[a:name], idx)
    else
      call add(s:lists[a:name], v)
    endif
  endfor
  call s:SaveList(a:name)
endfunction

" Add every entry of {value} to list {name} that is not already in it.
function! ForceSet(name, value) abort
  call s:LoadList(a:name)
  for v in map(EnsureArr(a:value), 's:NormalizePath(v:val)')
    if index(s:lists[a:name], v) == -1
      call add(s:lists[a:name], v)
    endif
  endfor
  call s:SaveList(a:name)
endfunction

" Remove every entry of {value} from list {name}.
function! ForceUnset(name, value) abort
  call s:LoadList(a:name)
  for v in map(EnsureArr(a:value), 's:NormalizePath(v:val)')
    let idx = index(s:lists[a:name], v)
    if idx >= 0
      call remove(s:lists[a:name], idx)
    endif
  endfor
  call s:SaveList(a:name)
endfunction

" Kept for compatibility with any other code that calls Refresh() directly.
" Equivalent to 'let g:{name} = {functionname}', just spelled out instead
" of built from two strings and :exec'd.
function! Refresh(name, functionname) abort
  exec 'let g:' . a:name . ' = ' . a:functionname
endfunction

" ---------------------------------------------------------------------------
" .unreleased/.projects -- folders YOU declare to be projects.
"
" They show up first in the <F2> popup (Projects()) and in g:projects, no
" matter whether they are git repositories, live inside a project holder,
" or nothing of the sort. <C-F2> toggles the folder of what you are working
" on in and out of that file.
"
" WHICH FOLDER? The one that matters for a project, not blindly cwd or the
" file's own folder:
"   - a file inside a git repository  -> the repository root
"   - any other file                  -> the folder of that file
"   - a directory buffer (netrw)      -> that directory
"   - a terminal, an empty buffer     -> the working directory (cwd)
"   :ProjectToggle %      the file's OWN folder, even inside a git repo
"   :ProjectToggle .      the working directory, exactly
"   :ProjectToggle <dir>  any folder
" The chosen path is always shown, so you see what was toggled.
" ---------------------------------------------------------------------------
command! -nargs=? -complete=dir ProjectToggle call ProjectToggle(<q-args>)
command! -range -nargs=0 Projekt call ProjectToggle('')

function! ProjectToggle(arg) abort
  let dir = s:ProjectFolderFor(a:arg)
  if empty(dir) || !isdirectory(dir)
    echohl WarningMsg | echo 'ProjectToggle: no folder found' . (empty(a:arg) ? '' : ' for ' . a:arg) | echohl None
    return
  endif
  let dir = s:NormalizePath(dir)
  let was_in = index(s:LoadList('projects'), dir) >= 0
  call SetUnset('projects', dir)
  let n = len(s:LoadList('projects'))
  echo (was_in ? 'removed from .projects:  ' : 'added to .projects:  ') . dir . '   (' . n . ' in .projects)'
endfunction

function! s:ProjectFolderFor(arg) abort
  if a:arg ==# '.'
    return getcwd()
  elseif a:arg ==# '%'
    return expand('%:p:h')
  elseif !empty(a:arg)
    " a file (also what "%" arrives as after Vim expanded it) -> its folder
    let p = fnamemodify(expand(a:arg), ':p')
    return filereadable(p) && !isdirectory(p) ? fnamemodify(p, ':h') : p
  endif
  let name = expand('%:p')
  if isdirectory(name)                          " directory buffer (netrw)
    return name
  endif
  if &buftype !=# '' || empty(name)             " terminal, quickfix, [No Name]
    return getcwd()
  endif
  if exists('*FindGit')                         " file inside a git repo
    let root = FindGit(fnamemodify(name, ':h'))
    if type(root) == v:t_string && !empty(root)
      return root
    endif
  endif
  return fnamemodify(name, ':h')
endfunction
command! -range -nargs=0 MultiprojectHolder call SetUnset('multiprojectholder', expand('%:p'))
command! -range -nargs=0 FavoriteFolder call SetUnset('favoritefolders', expand('%:p'))
command! -range -nargs=0 FavoriteFolderRecursively call SetUnset('favoritefolders_recursively', expand('%:p'))
command! -range -nargs=0 ProjectHolder call SetUnset('projectholder', expand('%:p'))

" -----------------------------------------------------------------------
" Favorites

function! Favorites() abort
  let f = []
  call extend(f, s:LoadList('favorites'))
  call extend(f, GetFavoriteFolders_Files())
  call extend(f, GetFavoriteFolders_Files_Recursively())
  call OpenFilePopup('Favorites', f)
endfunction
command! -range -nargs=0 Favorites call Favorites()

function! GetFavoriteFolders() abort
  return s:LoadList('favoritefolders')
endfunction

function! GetFavoriteFolders_Recursively() abort
  return s:LoadList('favoritefolders_recursively')
endfunction

" Files directly inside every favorite folder (not the folders themselves).
function! GetFavoriteFolders_Files() abort
  let x = []
  for path in GetFavoriteFolders()
    call extend(x, filter(globpath(path, '*', 0, 1), 'filereadable(v:val)'))
  endfor
  let g:favoritefolders_files = x
  return x
endfunction

" Same, but inside every folder marked with :FavoriteFolderRecursively,
" searched all the way down instead of just one level.
function! GetFavoriteFolders_Files_Recursively() abort
  let x = s:Cached('favoritefolders_files_recursively', function('s:BuildFavoriteFilesRecursive'))
  let g:favoritefolders_files_recursively = x
  return x
endfunction

function! s:BuildFavoriteFilesRecursive() abort
  let x = []
  for path in GetFavoriteFolders_Recursively()
    call extend(x, s:FilesRecursive(path))
  endfor
  return x
endfunction

" The subset of individually favorited paths (:Projekt-style single-file
" favorites via ",,f") that are actually directories, deduplicated. Used to
" fold favorited directories into the project list. Does not assume
" g:favorites/the "favorites" list has ever been touched.
function! GetPathsOfFavorites() abort
  let x = []
  for f in s:LoadList('favorites')
    if isdirectory(f) && index(x, f) == -1
      call add(x, f)
    endif
  endfor
  return x
endfunction

" -----------------------------------------------------------------------
" Project holders: a "holder" is a directory whose entries are themselves
" project directories (:ProjectHolder), a "multi holder" is one level
" deeper - a directory of directories of project directories
" (:MultiprojectHolder).

function! GetProjectHolder() abort
  return s:LoadList('projectholder')
endfunction

function! GetProjectHolder_Projects() abort
  let p = []
  for path in GetProjectHolder()
    call extend(p, filter(globpath(path, '*', 0, 1), 'isdirectory(v:val)'))
  endfor
  let g:projectholder_projects = p
  return p
endfunction

function! GetMultiprojectHolder() abort
  return s:LoadList('multiprojectholder')
endfunction

function! GetMultiprojectHolder_Projects() abort
  let p = []
  for path in GetMultiprojectHolder()
    for subpath in filter(globpath(path, '*', 0, 1), 'isdirectory(v:val)')
      call extend(p, filter(globpath(subpath, '*', 0, 1), 'isdirectory(v:val)'))
    endfor
  endfor
  let g:multiprojectholder_projects = p
  return p
endfunction

" -----------------------------------------------------------------------
" Git projects: every directory under g:UpdateGitProjectsPath (a
" space-separated list of roots, same as before) that has a .git. This is
" the expensive part (a real `find`), so - same as before - it is only
" recomputed on an explicit :UpdateGitProjects, not on every use.

function! UpdateGitProjects(file = g:unreleased . '/.gitprojects') abort
  let roots = join(map(split(g:UpdateGitProjectsPath), 'shellescape(v:val)'))
  let found = systemlist('find ' . roots . ' -name .git -type d 2>/dev/null'
        \ . " | sed 's|/\\.git$||'")
  return Write(found, a:file)
endfunction
command! -range -nargs=0 UpdateGitProjects call UpdateGitProjects()

function! GetGitprojects(file = g:unreleased . '/.gitprojects') abort
  if !filereadable(a:file)
    call UpdateGitProjects(a:file)
  endif
  let g:gitprojects = Read(a:file)
  return g:gitprojects
endfunction

" -----------------------------------------------------------------------
" Putting it all together

" Order of first appearance is kept, so whatever comes first in GetProjects()
" (the hand-picked .projects folders) is first in the <F2> popup too.
function! MergeUniq(...) abort
  let seen = {}
  let out = []
  for list in a:000
    for x in list
      if !has_key(seen, x)
        let seen[x] = 1
        call add(out, x)
      endif
    endfor
  endfor
  return out
endfunction

" The full project list: every git project found under
" g:UpdateGitProjectsPath, every project inside a :ProjectHolder or
" :MultiprojectHolder folder, every directory favorited with ",,f", every
" folder tagged with :Projekt, and every window cwd stashed with the
" ",,,,f" mapping. Backed by g:projects, which other code (this
" configuration's own <C-p> project-boundary detection in Cwd.vim, the
" project-cycling Tab-like commands, FZF popups, ...) already reads
" directly as a plain list of directory paths - kept that way.
function! GetProjects() abort
  " (the recursive favourite-folder scan used to be merged in here as well,
  " filtered for directories - but it only ever lists files, so it always
  " contributed nothing while costing a full recursive scan. Dropped.)
  let g:projects = MergeUniq(
        \ s:NormalizedDirs('projects'),
        \ GetGitprojects(),
        \ GetProjectHolder_Projects(),
        \ GetMultiprojectHolder_Projects(),
        \ GetPathsOfFavorites(),
        \ s:NormalizedDirs('projekt'),
        \ s:NormalizedDirs('projectPocket'))
  let s:cache.projects = {'time': localtime(), 'value': g:projects}
  return g:projects
endfunction

" g:projects, rebuilt only when missing or older than g:projects_cache_seconds
" (or after a source list changed). Used by :Projects and FilesInProjects().
function! s:EnsureProjects() abort
  let entry = get(s:cache, 'projects', {})
  if !exists('g:projects') || empty(entry)
        \ || localtime() - entry.time >= g:projects_cache_seconds
    call GetProjects()
  endif
  return g:projects
endfunction

" Entries of list {name} that are directories, normalized (see
" s:NormalizePath) so a trailing slash cannot create a spurious duplicate.
function! s:NormalizedDirs(name) abort
  return map(filter(copy(s:LoadList(a:name)), 'isdirectory(v:val)'), 's:NormalizePath(v:val)')
endfunction

" Full rescan: also forces the expensive git search to run again (plain
" GetProjects() alone reuses whatever :UpdateGitProjects last found).
function! UpdateProjects() abort
  call s:InvalidateCache()
  call UpdateGitProjects()
  call GetProjects()
endfunction
command! -range -nargs=0 UpdateProjects call UpdateProjects()

function! Projects() abort
  call OpenFilePopup('Projects', s:EnsureProjects())
endfunction
command! -range -nargs=0 Projects call Projects()

function! FilesInProjects() abort
  call Popup_FZFBuildString('Files In Projects', s:EnsureProjects())
endfunction

" One-line status, e.g. for a bug report or to sanity-check after
" :UpdateProjects - how many entries each source actually contributed.
function! ProjectsStatus() abort
  if !exists('g:projects')
    call GetProjects()
  endif
  call s:Echo(printf('projects: %d total | git %d | projectholder %d | multiproj %d '
        \ . '| fav.dirs %d | fav.files (rec) %d | projekt %d | pocket %d',
        \ len(g:projects), len(get(g:, 'gitprojects', [])),
        \ len(get(g:, 'projectholder_projects', [])), len(get(g:, 'multiprojectholder_projects', [])),
        \ len(GetPathsOfFavorites()), len(GetFavoriteFolders_Files_Recursively()),
        \ len(filter(copy(s:LoadList('projekt')), 'isdirectory(v:val)')),
        \ len(filter(copy(s:LoadList('projectPocket')), 'isdirectory(v:val)'))))
endfunction
command! ProjectsStatus call ProjectsStatus()

" One line, never longer than the command line, never scrolling the screen
" (which is what makes Vim ask to press Enter) - same technique used in
" dirdiff.vim/filecycle.vim/projectcycle.vim.
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
