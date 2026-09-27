" Statusline.vim
if !exists("g:vim_advantages_got_sourced")
  autocmd! BufWritePost Statusline.vim
  " autocmd! BufWritePost Statusline.vim call C()
  autocmd! BufWritePost Statusline.vim call C() | source % | call CB()
endif

if !exists("g:vim_advantages_got_sourced") || 1
let g:breakpoint=60
let g:ST_Mode=[]

" Todo: Toggle Statusline
call add(g:ST_Mode, [ 1, {->''..winnr()..' '}, {->''..winnr()..' '}, ''])
" call add(g:ST_Mode, [ 1, {->Mode()}, {->Mode()}, ''])
" call add(g:ST_Mode, [ 1, {->Mode()}, {->toupper(' '..mode())..' '}, ''])
" call add(g:ST_Mode, [ 1, {->' '}, {->' '}, {->IsTerm()}])
call add(g:ST_Mode, [ 1, {->Is_select_execution_window()}, {->Is_select_execution_window()}, {->IsTerm()}])
call add(g:ST_Mode, [ 1, {->' '..bufnr()..' '}, {->' '..bufnr()..' '}, ''])
call add(g:ST_Mode, [ 1, {->fnamemodify(ProjectPath(), ":t")}, {->fnamemodify(ProjectPath(), ":t")}, ''])
call add(g:ST_Mode, [ 1, {->"\  "..GitBranch_Statusline()}, {->"\  "..GitBranch_Statusline_short()}, ''])
call add(g:ST_Mode, [ 2, {->expand("%:p:t").." "}, {->expand("%:p:t").." "}, ''])
"" call add(g:ST_Mode, [ 2, {->GitRemote_Statusline()}, {->GitRemote_Statusline(3)}, ''])
"" call add(g:ST_Mode, [ 2, {->GitPushTo_Statusline()}, {->GitPushTo_Statusline(3)}, ''])
call add(g:ST_Mode, [ 2, "%#User0# %= %<", "%#User0# %= %<", ''])
call add(g:ST_Mode, [ 2, {->PathShortForm_when_small(CWD(), 2, "")}, {->PathShortForm_when_small(CWD(), 2, "")}, ''])
call add(g:ST_Mode, [ 2, {->IsFavorite()}, '', ''])
call add(g:ST_Mode, [ 2, {->GitDiff_Statusline()}, {->GitDiff_Statusline()}, ''])
call add(g:ST_Mode, [ 2, {->GitTerm_Statusline_ExecKeys()}, '', ''])
call add(g:ST_Mode, [ 2, {-> '  '..getcurpos()[1]..'/'..line('$')}, '', ''])
call add(g:ST_Mode, [ 2, {->exists('b:state.exec_keys')&&b:state.type=='vash'?b:state.exec_keys:''}, '', ''])
" call add(g:ST_Mode, [ 2, {->PathCharwise_All(CWD(),1,1)}, '', ''])
" call add(g:ST_Mode, [ 2, {->PathCharwise_All(RELATIVE(),g:shortenpath_file,0)}, {->PathCharwise_All(RELATIVE(),g:shortenpath_file,1)}, ''])

"
" call add(g:ST_Mode, [ 2, {->GitName_Statusline()}, {->GitName_Statusline_short()}, ''])
" Ctrl+v u 2026
" …
" Ctrl+v u 2713
" ✓

" function! IsTerm()
"   " if getwinvar(winnr(), '&buftype')=='terminal'
"   " if &buftype=='terminal'
"   " if getwinvar(winnr(), '&buftype')=='terminal'
" "  if b:st"ate.type=='terminal'
"   if 'terminal'=='terminal'
"     return 1
"   else
"     return 0
"   endif
" endfunction

function! Mode()
  if mode() =='n'
    return "Nor…"
  elseif mode() =='i'
    return "Ins…"
  elseif mode() =='v'
    return "Vis…"
  else
    return "Term"
  endif
endfunction

" function! Statusline()
"   let b:sl=[]
"       exe 'hi! StatusLineNC guibg=#222222 guifg=#885588'
"       exe 'hi! StatusLine guibg=#55ff88 guifg=#005500'
"       " buffer
"       hi User1 guifg=#2fdad8  guibg=#580c9e ctermfg=225 ctermbg=25433
"       hi User2 guifg=#828282  guibg=#080c0C ctermfg=255 ctermbg=0
"       hi User3 guifg=#292b00  guibg=#F4505C ctermfg=255 ctermbg=0
"       " term
"       hi User4 guifg=#112605  guibg=#ae2e4B ctermfg=052 ctermbg=236
"       hi User5 guifg=#051d00  guibg=#8d2c2d ctermfg=152 ctermbg=236
"       hi User7 guifg=#ffffff  guibg=#880c0e ctermfg=152 ctermbg=2364 gui=bold
"       " other
"       hi User8 guifg=#ffffff  guibg=#8b2f2b ctermfg=152 ctermbg=236
"       hi User9 guifg=#ffffff  guibg=#F14025 ctermfg=152 ctermbg=236
"       " Space Between
"       hi User0 guifg=#ffffff  guibg=#094afe ctermfg=255 ctermbg=0
"       "
"       " hi User0 guifg=#000000 guibg=#d3d3d3 ctermfg=152 ctermbg=233
"       " hi User0 guifg=#000000 guibg=#d3d3d3 ctermfg=255255255 ctermbg=233
"       "
"       set statusline=
"       let w:w=1
"       function! MyFunc()
"         if winwidth(winnr())>=g:breakpoint
"           let w:w=1
"         else
"           let w:w=2
"         endif
"         return ''
"       endfunction
"       let l:sl='%{MyFunc()}'
"       for i in range(len(g:ST_Mode)-1)
"           " if buf_width>=g:ST_Mode[i][0]
"           "   let func=1
"           " else
"           "   let func=2
"           " endif
"           let usercolor=g:ST_Mode[i][0]
"           let usercolor_b=g:ST_Mode[i][0]+3
"           let usercolor_t=g:ST_Mode[i][0]+6
"           if type(g:ST_Mode[i][1])==2
"             " let l:sl.='%#User'..usercolor..'#%{(type(g:ST_Mode['..i..'][w:w])==2?g:ST_Mode['..i..'][w:w]():g:ST_Mode['..i..'][w:w])}'
"             let l:sl.='%#User'..usercolor..'#%{(type(g:ST_Mode['..i..'][3])==2&&g:ST_Mode['..i..'][3]()||g:ST_Mode['..i..'][3]==""?(!exists("b:state")?(type(g:ST_Mode['..i..'][w:w])==2?g:ST_Mode['..i..'][w:w]():g:ST_Mode['..i..'][w:w]):""):"")}'
"             let l:sl.='%#User'..usercolor_b..'#%{(type(g:ST_Mode['..i..'][3])==2&&g:ST_Mode['..i..'][3]()||g:ST_Mode['..i..'][3]==""?(exists("b:state")&&b:state.type=="buffer"?(type(g:ST_Mode['..i..'][w:w])==2?g:ST_Mode['..i..'][w:w]():g:ST_Mode['..i..'][w:w]):""):"")}'
"             let l:sl.='%#User'..usercolor_t..'#%{(type(g:ST_Mode['..i..'][3])==2&&g:ST_Mode['..i..'][3]()||g:ST_Mode['..i..'][3]==""?(exists("b:state")&&b:state.type=="terminal"?(type(g:ST_Mode['..i..'][w:w])==2?g:ST_Mode['..i..'][w:w]():g:ST_Mode['..i..'][w:w]):""):"")}'
"             " let l:sl.='%#User2#%{winwidth(winnr())>=50?g:ST_Mode['..i..'][1]():g:ST_Mode['..i..'][2]()}\ '
"           " elseif type(g:ST_Mode[i][w:w])==1
"           else
"             let l:sl.='%#User'..usercolor..'#'..g:ST_Mode[i][w:w]
"             " let l:sl.='%#User'..usercolor..'#%{exists("b:state")&&b:state.type=="buffer"?'..g:ST_Mode[i][w:w]..":''}"
"             " let l:sl.='%#User'..usercolor_t..'#%{exists("b:state")&&b:state.type=="terminal"?'..g:ST_Mode[i][w:w]..":''}"
"           endif
"       endfor
"       let &statusline=l:sl
"       return
" endfunction

" call Statusline()

function BuildStatusline(nr)
  if mode()=='n'
    let prefix="User"
    let x=0
  else
    let prefix="User"
    let x=3
  endif
  let num=x+a:nr
  return '%#'..prefix..num..'#'
endfunction

function s:color(nr)
  if mode()=='n'
    let prefix="User"
    let x=0
  else
    let prefix="User"
    let x=3
  endif
  let num=x+a:nr
  return '%#'..prefix..num..'#'
endfunction

" hi NPrim0 guifg=#ffffff  guibg=#000000 ctermfg=10 ctermbg=200
" hi NPrim1 guifg=#ffffff  guibg=#000000 ctermfg=10 ctermbg=200
" hi NPrim2 guifg=#ffffff  guibg=#000000 ctermfg=10 ctermbg=200
" hi NPrim3 guifg=#ffffff  guibg=#000000 ctermfg=10 ctermbg=200
" hi NPrim4 guifg=#ffffff  guibg=#000000 ctermfg=10 ctermbg=200
" 
" hi TPrim0 guifg=#ffffff  guibg=#000000 ctermfg=10 ctermbg=200
" hi TPrim1 guifg=#ffffff  guibg=#000000 ctermfg=10 ctermbg=200
" hi TPrim2 guifg=#ffffff  guibg=#000000 ctermfg=10 ctermbg=200
" hi TPrim3 guifg=#ffffff  guibg=#000000 ctermfg=10 ctermbg=200
" hi TPrim4 guifg=#ffffff  guibg=#000000 ctermfg=10 ctermbg=200



function! IsTerm()
  return 1
endfunction

function! s:DefineHighlights()
  hi! StatusLineNC guibg=#222222 guifg=#885588
  hi! StatusLine guibg=#55ff88 guifg=#005500
  hi User1 guifg=#2fdad8  guibg=#580c9e ctermfg=225 ctermbg=25433
  hi User2 guifg=#828282  guibg=#080c0C ctermfg=255 ctermbg=0
  hi User3 guifg=#292b00  guibg=#F4505C ctermfg=255 ctermbg=0
  hi User4 guifg=#112605  guibg=#ae2e4B ctermfg=052 ctermbg=236
  hi User5 guifg=#051d00  guibg=#8d2c2d ctermfg=152 ctermbg=236
  hi User7 guifg=#ffffff  guibg=#880c0e ctermfg=152 ctermbg=2364 gui=bold
  hi User8 guifg=#ffffff  guibg=#8b2f2b ctermfg=152 ctermbg=236
  hi User9 guifg=#ffffff  guibg=#F14025 ctermfg=152 ctermbg=236
  hi User0 guifg=#ffffff  guibg=#094afe ctermfg=255 ctermbg=0
endfunction

def! StatuslineRender(): string
  const variant: number = winwidth(0) >= g:breakpoint ? 1 : 2
  w:w = variant
  var offset: number = -1
  if !exists('b:state')
    offset = 0
  elseif get(b:state, 'type', '') ==# 'buffer'
    offset = 3
  elseif get(b:state, 'type', '') ==# 'terminal'
    offset = 6
  endif
  var out: string = ''
  var prev_flag: bool = false
  var last_hl: number = 0
  for seg in g:ST_Mode
    if type(seg[1]) != v:t_func
      out ..= '%#User' .. seg[0] .. '#' .. seg[1]
      prev_flag = false
      last_hl = seg[0]
      continue
    endif
    last_hl = seg[0] + 6
    if offset < 0
      continue
    endif
    var text: any = ''
    try
      const Cond: any = seg[3]
      if type(Cond) == v:t_func ? !Cond() : Cond !=# ''
        continue
      endif
      const Item: any = seg[variant]
      text = type(Item) == v:t_func ? Item() : Item
      if type(text) != v:t_string
        text = type(text) == v:t_number ? string(text) : ''
      endif
    catch
      g:statusline_last_error = v:exception .. ' @ ' .. v:throwpoint
      text = '!'
    endtry
    if text ==# ''
      continue
    endif
    if prev_flag && strlen(text) > 1 && text[0] ==# ' '
      text = text[1 :]
    endif
    prev_flag = true
    out ..= '%#User' .. (seg[0] + offset) .. '#' .. substitute(text, '%', '%%', 'g')
  endfor
  return out .. '%#User' .. last_hl .. '#'
enddef

function! Statusline()
  if !get(s:, 'highlights_defined', 0)
    call s:DefineHighlights()
    let s:highlights_defined = 1
  endif
  let fmt = '%{%StatuslineRender()%}'
  if &statusline !=# fmt
    let &statusline = fmt
    redrawstatus!
  else
    " [Was always redrawstatus! -- on EVERY BufEnter every window's status
    "  line was re-evaluated (all the terminal windows included), although
    "  only the entered window changed. Vim already redraws that one.]
    redrawstatus
  endif
endfunction

augroup StatuslineHighlights
  autocmd!
  autocmd ColorScheme * call s:DefineHighlights()
augroup END

endif
