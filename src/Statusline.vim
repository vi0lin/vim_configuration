" Statusline.vim
if !exists("g:vim_advantages_got_sourced")

let g:ST_Mode=[]
call add(g:ST_Mode, {->mode()})
call add(g:ST_Mode, {->bufnr()})
call add(g:ST_Mode, {->PathCharwise_All(CWD(),1)})
call add(g:ST_Mode, {->PathCharwise_All(RELATIVE(),g:shortenpath_file)})
call add(g:ST_Mode, "%#User0#%=")
call add(g:ST_Mode, {->IsFavorite()})
call add(g:ST_Mode, {->GitName_Statusline()})
call add(g:ST_Mode, {->GitRemote_Statusline()})
call add(g:ST_Mode, {->GitBranch_Statusline()})
call add(g:ST_Mode, {->exists('b:state.exec_keys')&&b:state.type=='terminal'?b:state.exec_keys:''})
call add(g:ST_Mode, {->getcurpos()[1]..'/'..line('$')})
call add(g:ST_Mode, {->exists('b:state.exec_keys')&&b:state.type=='vash'?b:state.exec_keys:''})

function! Statusline()
  let b:sl=[]
      exe 'hi! StatusLineNC guibg=#222222 guifg=#885588'
      exe 'hi! StatusLine guibg=#55ff88 guifg=#005500'
      " buffer
      hi User1 guifg=#ffdad8  guibg=#080c0e ctermfg=88 ctermbg=236
      hi User2 guifg=#000000  guibg=#f80c0C ctermfg=238 ctermbg=233
      hi User3 guifg=#292b00  guibg=#F4505C ctermfg=88 ctermbg=236
      " term
      hi User4 guifg=#112605  guibg=#ae2e4B ctermfg=152 ctermbg=236
      hi User5 guifg=#051d00  guibg=#8d2c2d ctermfg=152 ctermbg=236
      hi User7 guifg=#ffffff  guibg=#880c0e ctermfg=152 ctermbg=236 gui=bold
      " other
      hi User8 guifg=#ffffff  guibg=#8b2f2b ctermfg=152 ctermbg=236
      hi User9 guifg=#ffffff  guibg=#F14025 ctermfg=152 ctermbg=236
      hi User0 guifg=#ffffff  guibg=#094afe ctermfg=152 ctermbg=236
    hi User0 guifg=#000000 guibg=#d3d3d3 ctermfg=152 ctermbg=233
      set statusline=
      let l:sl=''
      for i in range(len(g:ST_Mode)-1)
        if type(g:ST_Mode[i])==2
          let l:sl.='%#User2#%{g:ST_Mode['..i..']()} '
        else
          let l:sl.='%#User2#'..g:ST_Mode[i]
        endif
      endfor
      let &statusline=l:sl
      return
endfunction
call Statusline()

endif
