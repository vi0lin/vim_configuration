" Todo NewMap Checker
if !exists("g:vim_advantages_got_sourced")

import autoload "./Functions.vim9" as F

let g:FlagReceived=0
"  \ [ 'args', 'args|Args', '*'],
let s:newmap_optschema = [
  \ [ 'all', 'A|a|all|All', 0],
  \ [ 'map', 'M|m|map|Map', 0],
  \ [ 'normal', 'N|n|normal|Normal', 0],
  \ [ 'visual', 'V|v|visual|Visual', 0],
  \ [ 'x', 'X|x', 0],
  \ [ 's', 'S|s', 0],
  \ [ 'command', 'C|c|command|command', 0],
  \ [ 'terminal', 'T|t|terminal|Terminal', 0],
  \ [ 'o', 'O|o', 0],
  \ [ 'insert', 'I|i', 0],
  \ [ 'l', 'L|l', 0],
  \ [ 'silent', 'Silent|silent', 0],
  \ [ 'noremap', 'No|no|noremap|Noremap', 0],
  \ ]

function NewMapKeyCheckAll(...)
  for n in s:newmaps
    echo GetOpts(n.args, s:newmap_optschema)
  endfor
  " let args=a:000[1:]
  " echo "Press ["..args[0][0].."]\nSkip <C-Left>"
  " Waiting For This To Set A Flag True
  " echo "map "..args[0][1].." :let g:FlagReceived=1<cr>"
  " exec "map "..args[0][1].." :let g:FlagReceived=1<cr>"
  """ o let i = 0
  """ o function! Callback(timer) abort closure
  """ o   echo "Running async: ".a:timer i
  """ o   let i += 1
  """ o   sleep 1
  """ o   if g:FlagReceived
  """ o     exec "unmap "..args[0][1].." :call NewMapKeyCheckT(...)"
  """ o   else
  """ o     call timer_start(0, function('Callback'))
  """ o   endif
  """ o endfunction
  """ o call timer_start(0, function('Callback'))
  " while 1
  "   if g:FlagReceived
  "     let g:FlagReceived=0
  "     break
  "   endif
  " endwhile
endfunction

function FunctionName(...)
  let opts=GetOpts(a:000, [])
  " echo opts
  if opts.args==0
    " echo substitute(expand('<sfile>'), '.*\.\.|\s', '', '')
    return substitute(expand('<sfile>'), 'function (.*)\[\d\]\.\..*', '\1',  '')
    " let x="function SFN[2]..FunctionName"
  elseif opts.args==1
    return substitute(expand('<sfile>'), 'function (.*)\[\d\]\.\..*', '\1' , '')
    " return expand('<file>')
    " function! GetCurrentFunctionName()
    "   let line = getline(search('^[[:alpha:]$_]', 'bcnW'))
    "   return matchstr(line, '\w\+')
    " endfunction
  elseif opts.args==2
    " returnhl argsMsg
    return getline(search('^[^ \t#/]\\{2}.*[^:]\s*$', 'bWn'))
    " returnhl None
  elseif opts.args==3
    return getline(search('^[[:alpha:]$_]', 'bcnW'))
  elseif opts.args==4
    return substitute(getline(search('^[[:alpha:]$_]', 'bcnW')), '', '', '')
  elseif opts.args==5
    " put expand('<sfile>')
    let x = expand('<sfile>')
    return substitute(x, '.*\s\(.*\)\[\d\].*', '\1', '')
  endif
endfunction
command! -range -nargs=* FunctionName call FunctionName(<f-args>)
" NewMap -n -no <f1> :FunctionName 3<CR>:FunctionName 1<cr>

let s:newmaps=[]
function! NewMap(...)
  let functionName = FunctionName(5)
  " echo functionName
  " echo a:000
  " :call F.Map.new(name, map)
  " try
  " call add(s:newmaps, { 'args': a:000 } )
  " endtry
  " echo len(s:newmaps)
  let opts=GetOpts(a:000, s:newmap_optschema)
  " echo opts
  " return
  " if len(opts.args)>0
  " echo opts
  " endif
  " for n in s:newmaps
  " echo opts
  " put /
  " \(if\|&&\)\@<!\s\+
  " put :
  " '<,'>s/\%\(if\|&&\)\@<!\s\+/\r\\ /g
  " In Command Line <C-r>/
  if !opts.normal
  \ && !opts.visual
  \ && !opts.command
  \ && !opts.insert
  \ && !opts.terminal
  \ && !opts.x
  \ && !opts.s
  \ && !opts.o
  \ && !opts.l
    let opts.map=1
  endif
  if opts.noremap
    let noremap="nore"
  else
    let noremap=""
  endif
  let silent=""
  if opts.silent
    let silent = "<silent>"
  endif
  if opts.all
    let opts.normal=1
    let opts.visual=1
    let opts.command=1
    let opts.insert=1
    let opts.terminal=1
    let opts.x=1
    let opts.s=1
    let opts.o=1
    let opts.l=1
  endif
  function! Echo(...)
    let parts=filter(copy(a:000), 'v:val!=""')
    echo join(parts, ' ')
  endfunction
  command! -nargs=* Echo :call Echo(<f-args>)
  function! Exec(...)
    let parts=filter(copy(a:000), 'v:val!=""')
    exec join(parts, ' ')
  endfunction
  command! -nargs=* Exec :call Exec(<f-args>)
  " temporarily
  if opts.all
    call Exec("Amap", silent, join(opts.args, ' '))
  else
    if opts.map
      call Exec(noremap.."map", silent, join(opts.args, ' '))
    endif
    if opts.normal
      call Exec("n"..noremap.."map", silent, join(opts.args, ' '))
    endif
    if opts.visual
      call Exec("v"..noremap.."map", silent, join(opts.args, ' '))
    endif
    if opts.command
      call Exec("c"..noremap.."map", silent, join(opts.args, ' '))
    endif
    if opts.insert
      call Exec("i"..noremap.."map", silent, join(opts.args, ' '))
    endif
    if opts.terminal
      call Exec("t"..noremap.."map", silent, join(opts.args, ' '))
    endif
    if opts.x
      call Exec("x"..noremap.."map", silent, join(opts.args, ' '))
    endif
    if opts.s
      call Exec("s"..noremap.."map", silent, join(opts.args, ' '))
    endif
    if opts.o
      call Exec("o"..noremap.."map", silent, join(opts.args, ' '))
    endif
    if opts.l
      call Exec("l"..noremap.."map", silent, join(opts.args, ' '))
    endif
  endif
    " let opts=GetOpts(n.args, s:newmap_optschema)
    " echo opts.map opts.silent n.args[0] opts.command
    " let map=""
    " let silent=""
    " let noremap=""
    "" if opts.noremap | let noremap="noremap" | endif
    "" if opts.silent | let silent = "<silent>" | endif
    "" if opts.all | endif
    "" if opts.map | endif
    "" if opts.normal | endif
    "" if opts.visual | endif
    "" if opts.command | endif
    "" if opts.insert | endif
    "" if opts.terminal | endif
    "" if opts.x | endif
    "" if opts.s | endif
    "" if opts.o | endif
    "" if opts.l | endif
    "" " exec join(n.args,)
    " let keymapping=n.args[0]
    "" let args=n.args[1:]
    "" let command=join(args, ' ')
    " exec map silent keymapping command
  " endfor
  """ real let args=split(a:000[0], ' ')
  """ real let map = join(args[0:], ' ')
  """ real let key=args[1]
  """ real try
  """ real   exec map
  """ real endtry
  " let name = a:000[:0][0]
  " let arg = a:000[1:]
  " call F.NewAssignment(name, arg)
endfunction
command! -range -nargs=+ NewMap call NewMap(<f-args>)
command! -range -nargs=+ NewMapKeycheck call NewMapKeycheck(<q-args>)

NewCommand command! -range -nargs=+ Debug call Debug(<f-args>)
" set <F8>=ük8
" NewMap -map ük8 :echo "KEYMAPPING"<cr>
" NewMap -map <F8> :echo "KEYMAPPING"<cr>
" NewMap -map <C-F8> :echo "TEST"<cr>
" NewMap -map :echo "test"
" NewMap -map :echo "TEST"

" NewMap -map <C-S-i> :echo "Implement Bufferjump"<cr>
" NewMap -map <C-S-o> :echo "Implement Bufferjump"<cr>
" Jump to previous or next file
" nnoremap <silent> <leader><C-O> :call JumpToNextFile(-1)<CR>
" nnoremap <silent> <leader><C-I> :call JumpToNextFile(1)<CR>
NewMap -n -no -silent <C-S-o> :call JumpToNextFile(-1)<CR>
NewMap -n -no -silent <C-S-i> :call JumpToNextFile(1)<CR>
" unmap <silent> <leader><C-O>
" unmap <silent> <leader><C-I>

" Map.vim
NewMap -n -no <C-s> <Nop>
NewMap -i -no <C-s> <Nop>
NewMap -v -no <C-s> <Nop>

NewMap -map <leader><leader>f :call FavoriteFile()<CR>
NewMap -map <leader><leader>f :call FavoriteFile()<CR>
NewMap -map <leader><leader>p :call FavoritePath()<CR>
NewMap -map <C-8> :call Favorite()<CR>

NewMap -map <leader>= :Equal<cr>
NewMap -map <leader>e :Equal<cr>

NewMap -n -no ,s :so %<cr>
NewMap -map <C-Space> :call SelectCommand()<cr>

NewMap -map <leader>t :Tidy<cr>

if !exists("g:currentMapping")
  let currentMapping=0
endif
let mapping={
  \ "global": 1,
  \ "executor": 0,
  \ "navigator": 0,
  \ "diary": 0,
  \ }

" cmap <F9> <C-R>I
" cmap <F10> <C-R>O
" cmap <F11> <C-R>P

" NewMap -no <leader>q :q<CR>
NewMap -no <M-q> :q<CR>
NewMap -t -no <M-q> <c-\><c-n>:q<CR>

function Inc(...)
  " put=[a:000]
  " return
  let opts=GetOpts(a:000, [
    \ [ 'group', 'group|g', 0],
    \ [ 'newlines', 'NewLines|N', '*' ],
    \ [ 'test', 'test|t', '0' ]
    \ ])
  " if opts.group | echo "group flag set" | endif
  " if opts.test | echo "test flag set" | endif
  " echo opts.newlines
  " put=opts
endfunction
command -range -nargs=* Inc :call Inc(<f-args>)
" Inc -N a1 a1 -N a1 1: a1 a1: --group -t

" x=468.40
" y=20
" x-y
" print("TEST!")

NewMap -v -no <F5> :<C-u>call SendCommandToTerm("h")<cr>
NewMap -v -no <F6> :<C-u>call SendCommandToTerm("j")<cr>
NewMap -v -no <F7> :<C-u>call SendCommandToTerm("k")<cr>
NewMap -v -no <F8> :<C-u>call SendCommandToTerm("l")<cr>
NewMap -n -no <F5> :call SendCommandToTerm("h")<cr>
NewMap -n -no <F6> :call SendCommandToTerm("j")<cr>
NewMap -n -no <F7> :call SendCommandToTerm("k")<cr>
NewMap -n -no <F8> :call SendCommandToTerm("l")<cr>
NewMap -i -no <F5> <C-o>:call SendCommandToTerm("h")<cr>
NewMap -i -no <F6> <C-o>:call SendCommandToTerm("j")<cr>
NewMap -i -no <F7> <C-o>:call SendCommandToTerm("k")<cr>
NewMap -i -no <F8> <C-o>:call SendCommandToTerm("l")<cr>
NewMap -c -no <F5> :call SendCommandToTerm("h", 1)<cr>
NewMap -c -no <F6> :call SendCommandToTerm("j", 1)<cr>
NewMap -c -no <F7> :call SendCommandToTerm("k", 1)<cr>
NewMap -c -no <F8> :call SendCommandToTerm("l", 1)<cr>
NewMap -t -no <F5> <C-\><C-n>:call SendCommandToTerm("h")<cr>
NewMap -t -no <F6> <C-\><C-n>:call SendCommandToTerm("j")<cr>
NewMap -t -no <F7> <C-\><C-n>:call SendCommandToTerm("k")<cr>
NewMap -t -no <F8> <C-\><C-n>:call SendCommandToTerm("l")<cr>

" map <F5> :call RedoCommandToTerm("h")<cr>
" map <F6> :call RedoCommandToTerm("j")<cr>
" map <F7> :call RedoCommandToTerm("k")<cr>
NewMap -map <F8> :w!<cr>:call RedoCommandToTerm("l")<cr>

NewMap -map <C-F5> :call SigTermToTerm("h")<cr>
NewMap -map <C-F6> :call SigTermToTerm("j")<cr>
NewMap -map <C-F7> :call SigTermToTerm("k")<cr>
NewMap -map <C-F8> :call SigTermToTerm("l")<cr>

NewMap -map <C-S-F5> :call RedoCommandToTermWithSigTerm("h")<cr>
NewMap -map <C-S-F6> :call RedoCommandToTermWithSigTerm("j")<cr>
NewMap -map <C-S-F7> :call RedoCommandToTermWithSigTerm("k")<cr>
NewMap -map <C-S-F8> :w!<cr>:call RedoCommandToTermWithSigTerm("l")<cr>

NewMap -v -no <F11> :<C-u>call Move('h')<cr>
NewMap -n -no <F11> :call Move('h')<cr>
NewMap -i -no <F11> <C-o>:call Move('h')<cr>
NewMap -c -no <F11> :call Move('h')<cr>
NewMap -t -no <F11> <C-\><C-n>:call Move('h')<cr>

NewMap -v -no <S-F11> :<C-u>call Move('l')<cr>
NewMap -n -no <S-F11> :call Move('l')<cr>
NewMap -i -no <S-F11> <C-o>:call Move('l')<cr>
NewMap -c -no <S-F11> :call Move('l', 'c')<cr>
NewMap -t -no <S-F11> <C-\><C-n>:call Move('l', 't')<cr>

" noremap <F12> :call BulkMove("cword")<cr>
" vnoremap <F12> :call BulkMove("visual")<cr>

" nmap <F1>m :%    g/^\s*"/GlobalMove<cr>
" xmap <F1>m :g/^\s*"/GlobalMove<cr>

" Amap <F2> :NERDTreeFind<cr>

NewMap -a <leader>h     :call Open("h", "buffer", "new")<cr>
NewMap -a <leader>j     :call Open("j", "buffer", "new")<cr>
NewMap -a <leader>k     :call Open("k", "buffer", "new")<cr>
NewMap -a <leader>l     :call Open("l", "buffer", "new")<cr>
NewMap -a <leader>H     :call Open("H", "buffer", "new")<cr>
NewMap -a <leader>J     :call Open("J", "buffer", "new")<cr>
NewMap -a <leader>K     :call Open("K", "buffer", "new")<cr>
NewMap -a <leader>L     :call Open("L", "buffer", "new")<cr>
NewMap -a <leader><leader>h     :call Open("h", "terminal", "new")<cr>
NewMap -a <leader><leader>j     :call Open("j", "terminal", "new")<cr>
NewMap -a <leader><leader>k     :call Open("k", "terminal", "new")<cr>
NewMap -a <leader><leader>l     :call Open("l", "terminal", "new")<cr>
NewMap -a <leader><leader>H     :call Open("H", "terminal", "new")<cr>
NewMap -a <leader><leader>J     :call Open("J", "terminal", "new")<cr>
NewMap -a <leader><leader>K     :call Open("K", "terminal", "new")<cr>
NewMap -a <leader><leader>L     :call Open("L", "terminal", "new")<cr>
"
" Amap <A-h>     :call Open("h", "buffer", "new")<cr>
" Amap <A-j>     :call Open("j", "buffer", "new")<cr>
" Amap <A-k>     :call Open("k", "buffer", "new")<cr>
" Amap <A-l>     :call Open("l", "buffer", "new")<cr>
NewMap -a <A-H>     :call Open("H", "buffer", "new")<cr>
NewMap -a <A-J>     :call Open("J", "buffer", "new")<cr>
NewMap -a <A-K>     :call Open("K", "buffer", "new")<cr>
NewMap -a <A-L>     :call Open("L", "buffer", "new")<cr>
NewMap -a <A-S-h>     :call Open("h", "terminal", "new")<cr>
NewMap -a <A-S-j>     :call Open("j", "terminal", "new")<cr>
NewMap -a <A-S-k>     :call Open("k", "terminal", "new")<cr>
NewMap -a <A-S-l>     :call Open("l", "terminal", "new")<cr>
NewMap -a <A-S-H>     :call Open("H", "terminal", "new")<cr>
NewMap -a <A-S-J>     :call Open("J", "terminal", "new")<cr>
NewMap -a <A-S-K>     :call Open("K", "terminal", "new")<cr>
NewMap -a <A-S-L>     :call Open("L", "terminal", "new")<cr>
" Amap <leader><C-h> :call Open("h", "buffer", "copy")<cr>
" Amap <leader><C-j> :call Open("j", "buffer", "copy")<cr>
" Amap <leader><C-k> :call Open("k", "buffer", "copy")<cr>
" Amap <leader><C-l> :call Open("l", "buffer", "copy")<cr>
" Amap <leader><C-S-h> :call Open("H", "buffer", "copy")<cr>
" Amap <leader><C-S-j> :call Open("J", "buffer", "copy")<cr>
" Amap <leader><C-S-k> :call Open("K", "buffer", "copy")<cr>
" Amap <leader><C-S-l> :call Open("L", "buffer", "copy")<cr>

NewMap -a <A-S-Left>     :call Open("h", "terminal", "new")<cr>
NewMap -a <A-S-Down>     :call Open("j", "terminal", "new")<cr>
NewMap -a <A-S-Up>       :call Open("k", "terminal", "new")<cr>
NewMap -a <A-S-Right>    :call Open("l", "terminal", "new")<cr>
NewMap -a <A-S-Left>     :call Open("H", "terminal", "new")<cr>
NewMap -a <A-S-Down>     :call Open("J", "terminal", "new")<cr>
NewMap -a <A-S-Up>       :call Open("K", "terminal", "new")<cr>
NewMap -a <A-S-Right>    :call Open("L", "terminal", "new")<cr>
NewMap -a <A-Left>       :call Open("h", "buffer", "new")<cr>
NewMap -a <A-Down>       :call Open("j", "buffer", "new")<cr>
NewMap -a <A-Up>         :call Open("k", "buffer", "new")<cr>
NewMap -a <A-Right>      :call Open("l", "buffer", "new")<cr>
NewMap -a <A-Left>       :call Open("H", "buffer", "new")<cr>
NewMap -a <A-Down>       :call Open("J", "buffer", "new")<cr>
NewMap -a <A-Up>         :call Open("K", "buffer", "new")<cr>
NewMap -a <A-Right>      :call Open("L", "buffer", "new")<cr>
" Amap <A-<C-h>> :call Open("h", "buffer", "copy")<cr>
" Amap <A-<C-j>> :call Open("j", "buffer", "copy")<cr>
" Amap <A-<C-k>> :call Open("k", "buffer", "copy")<cr>
" Amap <A-<C-l>> :call Open("l", "buffer", "copy")<cr>
" Amap <A-<C-S-h>> :call Open("H", "buffer", "copy")<cr>
" Amap <A-<C-S-j>> :call Open("J", "buffer", "copy")<cr>
" Amap <A-<C-S-k>> :call Open("K", "buffer", "copy")<cr>
" Amap <A-<C-S-l>> :call Open("L", "buffer", "copy")<cr>

" NewMap -a <leader>q :q!<CR>
NewMap -a <C-q> :hide<CR>
NewMap -a <C-S-q> :bd!<CR>
NewMap -a <C-S-q> :q!<CR>
NewMap -a <C-A-q> :qa!<CR>
NewMap -a <A-q> :call TabClose()<cr>
NewMap -a <leader><leader>r :redraw!<cr>
" Amap <leader>ser  :call ServiceMenu()<cr>
NewMap -a <S-F2> :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
NewMap -a <leader>c call CountRegex()<cr>
" Amap <leader>c :call COP('P')<cr>
" Amap <leader>x :call CUT('P')<cr>
" NewMap -a <leader>z :call CreateMarker('P')<cr>
" Amap <leader>m :call LeaderDot("'<,'>")<cr>
" Amap <leader><leader>m :call LeaderDot("%")<cr>
" Nmap <leader>m :call LeaderDot("")<cr>
" Was Nmap
NewMap -n <C-S-A> :call IncRange()<cr>
" Was Nmap
NewMap -n <C-S-X> :call DecRange()<cr>
NewMap -v af :call Vaf()<cr>
NewMap -v if :call Vif()<cr>
NewMap -v <C-S-A> :call IncRange()<cr>
NewMap -v <C-S-X> :call DecRange()<cr>
NewMap -t <leader>X :TIN tail -f $receiver<cr>

NewMap -map <A-S-n> <C-w>+
NewMap -map <A-S-m> <C-w>-
NewMap -map <A-S-u> <C-w><
NewMap -map <A-S-i> <C-w>>

NewMap -map <A-n> 12<C-w>+
NewMap -map <A-m> 12<C-w>-
NewMap -map <A-u> 12<C-w><
NewMap -map <A-i> 12<C-w>>

" map <leader>h :call TabH()<cr>
" map <leader>t :call TabL()<cr>

" map <leader>g :call TabH()<cr>
" map <leader>h :call TabL()<cr>

NewMap -map <A-h> :call TabH()<cr>
NewMap -map <A-l> :call TabL()<cr>

NewMap -map <C-S-M-h> :wincmd H<cr>
NewMap -map <C-S-M-j> :wincmd J<cr>
NewMap -map <C-S-M-k> :wincmd K<cr>
NewMap -map <C-S-M-l> :wincmd L<cr>

" NewMap -map <leader><leader>a :call VSP()<cr>
NewMap -map <C-S-h> :call SwapWin("h")<cr>
NewMap -map <C-S-j> :call SwapWin("j")<cr>
NewMap -map <C-S-k> :call SwapWin("k")<cr>
NewMap -map <C-S-l> :call SwapWin("l")<cr>
NewMap -t -no <C-S-h> <c-\><c-n>:call SwapWin("h")<cr>
NewMap -t -no <C-S-j> <c-\><c-n>:call SwapWin("j")<cr>
NewMap -t -no <C-S-k> <c-\><c-n>:call SwapWin("k")<cr>
NewMap -t -no <C-S-l> <c-\><c-n>:call SwapWin("l")<cr>

NewMap -n -no <leader>fuc :call OpenFileUnderCursor()<cr>
NewMap -n -no <leader><leader>fb :LayoutBash<cr>
NewMap -n -no <leader><leader>fv :LayoutVim<cr>

NewMap -map <m-;> :call ToggleOverviewRight()<cr>
NewMap -map <leader><leader><F4> :redraw \\| let c=input("Test: ")<cr>!source ".$workdir."/.bashrc; git_selector "TEST"
NewMap -map <C-S-F9> :call PreviewBuffer()<CR>
" map <M-F12> :call Info()<CR>
NewMap -map <C-F2> :call ToggleWrap()<CR>
NewMap -map <leader><leader><leader>w :call ToggleWrap()<CR>
NewMap -map <leader>in :call Intend()<cr>
NewMap -map <leader><leader><leader><space> :IntelligentSelecting<cr>
NewMap -map <leader>. @q
" map <leader>s :call NvimStudioSubstitution("selection")<cr>
" map <leader>S :call NvimStudioSubstitution("file")<cr>
NewMap -v <C-l> <C-w>l
NewMap -v <C-h> <C-w>h
NewMap -v <C-k> <C-w>k
NewMap -v <C-j> <C-w>j
NewMap -n -no <silent> <C-h> :call SmartWincmd('h')<CR>
NewMap -n -no <silent> <C-j> :call SmartWincmd('j')<CR>
NewMap -n -no <silent> <C-k> :call SmartWincmd('k')<CR>
NewMap -n -no <silent> <C-l> :call SmartWincmd('l')<CR>
NewMap -v <BS> :call backspace()<CR>
NewMap -v & :&<CR>
NewMap -v <leader>F :echo VS()<cr>
NewMap -v <leader><leader>g :call AppendToEndRange()<CR>
NewMap -v <leader>G :AppendAll<CR>
NewMap -v <leader>u :!uniq<CR>
NewMap -v <M-v> :call VPaste("Visual")<CR>
NewMap -v <M-c> :call VCopy("Visual")<CR>
NewMap -v <M-x> :call VCut("Visual")<CR>
" NewMap -v <c-c> "*y
NewMap -t <c-o> <c-\><c-n><c-o>
" was imap
NewMap -i <C-l> <C-w>li
" was imap
NewMap -i <C-h> <C-w>hi
" bring back in? umlaute auf c-k
" imap <C-k> <C-w>ki
" was imap
NewMap -i <C-j> <C-w>ji
NewMap -t <C-h> <C-\><C-n><C-h>h
NewMap -t <C-j> <C-\><C-n><C-j>j
NewMap -t <C-k> <C-\><C-n><C-k>k
NewMap -t <C-l> <C-\><C-n><C-w>l
NewMap -t <C-h> <C-h>h
NewMap -t <C-j> <C-j>j
NewMap -t <C-k> <C-k>k
NewMap -t <C-l> <C-w>l
NewMap -t -no <C-l> <C-\><C-n>:wincmd l<cr>
NewMap -t -no <C-h> <C-\><C-n>:wincmd h<cr>
NewMap -t -no <C-k> <C-\><C-n>:wincmd k<cr>
NewMap -t -no <C-j> <C-\><C-n>:wincmd j<cr>
NewMap -t -no <C-l> l<cr>
NewMap -t -no <C-h> h<cr>
NewMap -t -no <C-k> k<cr>
NewMap -t -no <C-j> j<cr>
" was imap
NewMap -i <c-w><c-w> <c-w><c-w>
NewMap -t  :call ExitTerminal()<CR>
" was imap
NewMap -i <A-'> ä
" was imap
NewMap -i <A-"> Ä
" was imap
NewMap -i <A-;> ö
" was imap
NewMap -i <A-:> Ö
" was imap
NewMap -i <A-[> ü
" was imap
NewMap -i <A-{> Ü
" was imap
NewMap -i <A--> ß
NewMap -t <ScrollWheelUp> <C-\><C-n>
NewMap -t <S-ScrollWheelUp> <C-\><C-n>
NewMap -t <ScrollWheelDown> <C-\><C-n>
NewMap -t <S-ScrollWheelDown> <C-\><C-n>
NewMap -t <Esc> i
NewMap -t <LeftMouse> <C-\><C-n>

NewMap -map <leader><leader><leader>m :call Toggle_Set_Last_Git_Message()<CR>
NewMap -map <leader><leader><leader>l :call ToggleLineState()<CR>
NewMap -map <leader><leader><leader>L :call ToggleLineStateGlobal()<CR>
NewMap -map <leader><leader>s :call Statusline_TogglePath()<cr>

NewMap -map <leader><leader>d :echo g:debug_layout<cr>
NewMap -map <leader><leader>B :call Boilerplate_Test()<cr>
" vmap <C-Space> :call LineUp()<cr>
NewMap -map <leader><Space> :call GetCCWD()<cr>

" map <F9>  :BuildProject<cr>
" map <F10> :RunProject<cr>
" map <F11> :MakeProject<cr>
" map <F12> :CTagsProject<cr>

""" map <leader><F9>   :ToggleVertical<cr>
""" map <F9>   :Build<cr>
""" map <S-F9> :ToggleC<cr>
""" map <C-F9> :AsyncStop<cr>
""" map <F10> :Run<cr>
""" map <S-F10> :cclose<cr>
""" map <C-F10> :AsyncStop<cr>

" nnoremap <silent> <localleader> :<c-u>WhichKey '.'<cr>

" set timeoutlen=300

" colorscheme delek

" nmap <F1> :RepeatLastCommand<cr>

" NewMap -n <leader>a :AddFunctionUserInput<cr>
" NewMap -v <leader>a :AddFunctionVisualSplit<cr>

" nmap <silent> <C-s> :w!<CR>
" vmap <silent> <C-s> :w!<CR>
" imap <silent> <C-s> :w!<CR>l

NewMap -n <silent> <C-s> :SaveFile<cr>
NewMap -v <silent> <C-s> :SaveFile<cr>
" was imap
NewMap -i <silent> <C-s> :SaveFile<CR>l

NewMap -n -no <localleader>f :InsertFunction<CR>
NewMap -n -no <space>f :InsertFilename<CR>

" map <leader>c :call CTags()<cr>

NewMap -map <leader><Space> :call ToggleZoom()<cr>

NewMap -map <silent> <S-F1> :SearchCword<cr>

" map <F1> :call EXEC()<cr>
" map <S-F1> :EXECINPUT<cr>
NewMap -map <leader><F1> :EXECTOGGLE<cr>
NewMap -map <leader><leader><F1> :INTERPRETERTOGGLE<cr>

" map <leader>v :call VIM(VS())<cr>
NewMap -map <leader>b :call BASH(VS())<cr>
NewMap -map <leader>b :call Bash(VS())<cr>
" map <leader>p :call PYTHON(VS())<cr>
" map <leader>r :call RUST(VS())<cr>

NewMap -map <localleader>iv :call VIM(input("vimscript: "), 'exec_input_vs')<cr>
NewMap -map <localleader>ib :call BASH(input("bash: "), 'exec_input_vs')<cr>
NewMap -map <localleader>ip :call PYTHON(input("python: "), 'exec_input_vs')<cr>
NewMap -map <localleader>ir :call RUST(input("rust: "), 'exec_input_vs')<cr>

NewMap -n -no <space>p :CopyFileNameToClipboard<CR>
NewMap -n -no <space>P :CopyWholePathToClipboard<CR>
NewMap -n -no <space>r :InsertReceiver<CR>
NewMap -n -no <leader>dd :call Rewindworkdir()<cr>

"" nnoremap <C-p>              :OpenFileFZFProject<CR>
"" nnoremap <A-p>              :OpenFileFZFRepo<CR>
"" nnoremap <A-S-p>            :call OpenFileFZFRepo(1)<CR>
"" nnoremap <A-S-C-p>          :call OpenFileFZFRepo(2)<CR>
"" nnoremap <C-A-p>            :OpenFileFZFSystem<CR>
"" " nnoremap <C-S-p>            :OpenFileFZFRepo<CR>
"" nnoremap <C-->              :FindInFileFZFProject<CR>
"" nnoremap <A-->              :FindInFileFZFRepo<CR>
"" nnoremap <A-S-->            :call FindInFileFZFRepo(1)<CR>
"" nnoremap <A-S-C-->          :call FindInFileFZFRepo(2)<CR>
"" nnoremap <C-A-->            :FindInFileFZFSystem<CR>
"" " nnoremap <C-S-p>            :FindInFileFZFRepo<CR>

NewMap -map <leader>p                                         :call Files(Folder_Up(0))<cr>
NewMap -map <leader><leader>p                                 :call Files(Folder_Up(1))<cr>
NewMap -map <leader><leader><leader>p                         :call Files(Folder_Up(2))<cr>
NewMap -map <leader><leader><leader><leader>p                 :call Files(Folder_Up(3))<cr>
NewMap -map <leader><leader><leader><leader><leader>p         :call Files(Folder_Up(4))<cr>
NewMap -map <leader><leader><leader><leader><leader><leader>p :call Files(Folder_Up(5))<cr>

NewMap -map <C-b> :Buffers<cr>


NewMap -map <leader>g                                         :call RgDir(Folder_Up(0))<cr>
NewMap -map <leader><leader>g                                 :call RgDir(Folder_Up(1))<cr>
NewMap -map <leader><leader><leader>g                         :call RgDir(Folder_Up(2))<cr>
NewMap -map <leader><leader><leader><leader>g                 :call RgDir(Folder_Up(3))<cr>
NewMap -map <leader><leader><leader><leader><leader>g         :call RgDir(Folder_Up(4))<cr>
NewMap -map <leader><leader><leader><leader><leader><leader>g :call RgDir(Folder_Up(5))<cr>

NewMap -map <leader>vcd :call CD(Vim_Advantages_Path())<cr>

NewMap -no <C-p>              :call Files(Folder_Project())<CR>
NewMap -no <C-S-p>            :call Files(Folder_Repo())<CR>
NewMap -no <A-p>              :call Files(Folder_Repo())<CR>
NewMap -no <A-S-p>            :call Files(Folder_Repo(1))<CR>
NewMap -no <A-C-p>            :call Files(Folder_Repo(1))<CR>
NewMap -no <A-S-C-p>          :call Files('/')<CR>
" noremap <A-S-C-p>            :call Files(Folder_System())<CR>
" nnoremap <C-S-p>          :OpenFileFZFRepo<CR>
"
NewMap -no <C-g>              :call AgIn(Folder_Project())<CR>
NewMap -no <C-S-g>            :call AgIn(Folder_Repo())<CR>
NewMap -no <A-g>              :call AgIn(Folder_Repo())<CR>
NewMap -no <A-S-g>            :call AgIn(Folder_Repo(1))<CR>
NewMap -no <A-C-g>            :call AgIn(Folder_Repo(1))<CR>
NewMap -no <A-S-C-g>          :call AgIn('/'))<CR>
" noremap <A-S-C-g>            :call AgIn(Folder_System())<CR>
"  nnoremap <C-S-p>          :OpenFileFZFRepo<CR>

" map <F3> :call Files(expand($main_repo))<CR>
" map <S-F3>  :exec "cd "..GetProject().." | Ag"<CR>

" nnoremap <C-g>              :OpenFileCommandLineProject<CR>
" nnoremap <C-S-g>            :OpenFileCommandLineRepo<CR>
" nnoremap <C-A-g>            :OpenFileCommandLineSystem<CR>

NewMap -n -no <leader>o              :OpenFileCommandLineSameDir<CR>
NewMap -n -no <leader>.              :OpenFileCommandLineCWD<CR>
NewMap -n -no <leader><leader>.      :OpenFileCommandLineSameDir<CR>
NewMap -n -no <leader>.              :call CommandLineFiles(Folder_Up(0))<CR>
NewMap -n -no <leader><leader>.              :call CommandLineFiles(Folder_Up(1))<CR>
NewMap -n -no <leader><leader><leader>.              :call CommandLineFiles(Folder_Up(2))<CR>
NewMap -n -no <leader><leader><leader><leader>.              :call CommandLineFiles(Folder_Up(3))<CR>
NewMap -n -no <leader><leader><leader><leader><leader>.              :call CommandLineFiles(Folder_Up(4))<CR>

NewMap -c -no <C-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<CR>
NewMap -c -no <M-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<CR>
NewMap -c -no <S-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<CR>
NewMap -c -no <C-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<CR>
NewMap -c -no <M-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<CR>
NewMap -c -no <S-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<CR>

" cnoremap <C-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-2], '/')]<CR>

" function! DeleteBackToSlash()
"     let line = getcmdline()
"     let pos  = getcmdpos() - 2   " -1 for 0-based, -1 more because we want before cursor
"     if pos < 0
"         return ''
"     endif
"     let idx = strridx(line[:pos], '/')
"     if idx == -1
"         " no / found, delete everything before cursor
"         return ''
"     endif
"     return line[:idx]
" endfunction
" cnoremap <C-BS> <C-\>eDeleteBackToSlash()<CR>

" cnoremap <C-Del> <C-\>estrpart(getcmdline(), 0, getcmdpos()-1) . strpart(getcmdline(), stridx(getcmdline()[getcmdpos()-1:], '/') + getcmdpos())<CR>

" function! DeleteForwardToSlash()
"     let line = getcmdline()
"     let pos  = getcmdpos() - 1
"     let idx  = stridx(line[pos:], '/')
"     if idx == -1
"         " no / ahead → delete to end
"         return line[:pos-1]
"     endif
"     return line[:pos-1] . line[pos+idx:]
" endfunction
" cnoremap <C-Del> <C-\>eDeleteForwardToSlash()<CR>

" cnoremap <C-BS> <C-\>e substitute(getcmdline()[:getcmdpos()-2], '/[^/]*$', '/', '')<CR>

" cnoremap <C-Del> <C-\>e substitute(getcmdline(), '\(.\{' . (getcmdpos()-1) . '}\)[^/]*\(.*\)', '\1\2', '')<CR>

" Add functionality, to delete the last dir
NewMap -c -no <C-,> <Backspace>
NewMap -c -no <C-.> <Backspace>

" nnoremap <S-Tab> :call StepFile_popup(0, 0)<cr>
" nnoremap <Tab> :call StepFile_popup(0, 0)<cr>

NewMap -n -no <leader>cd :call MakeDirCurrentCWD()<cr>
" :MakeDirCurrentProject<cr>
" nnoremap <leader>.. :call CD('..')<cr>
" nnoremap <leader><leader> :call CD('..')<cr>
"" nnoremap .. :call CD(split(w:relative_path,'/')[0])<cr>
" unmap ..

NewMap -n -no <C-Left> :call CD(WFilePrev())<cr>
NewMap -n -no <C-Right> :call CD(WFileNext())<cr>

NewMap -n -no <C-,> :call CD(WFilePrev())<cr>
NewMap -n -no <C-.> :call CD(WFileNext())<cr>

" nnoremap <leader><leader>         :JumpProjectUp<cr>
" nnoremap <>>  :JumpProjectStepwise<cr>
" nnoremap <localleader><localleader>   :JumpProjectUp<cr>
" nnoremap <localleader><leader>        :JumpProjectR<cr>
" nnoremap <leader><localleader>        :JumpProjectR<cr>
" nnoremap <C-Up>                       :JumpProjectDump<cr>

NewMap -n -no <leader><Tab>      :JumpProjectIn<cr>
NewMap -n -no <localleader><Tab> :JumpProjectIn<cr>

NewMap -v -no <F14> :<C-u>call VS()<cr>
NewMap -n -no <F13> :call VS()<cr>
NewMap -i -no <F13> <C-o>:call VS()<cr>
NewMap -c -no <F13> :call VS('c')<cr>
NewMap -t -no <F13> <C-\><C-n>:call VS('t')<cr>

NewMap -n <M-v> :call FuncPaste("Normal")<CR>
NewMap -n <M-c> :call FuncCopy("Normal")<CR>
NewMap -n <M-x> :call FuncCut("Normal")<CR>
NewMap -no <leader><leader><leader>j :IntelligentJumping<cr>

" exec "nmap <leader>R :!bash ".g:lastRunCommand." -e ".$workdir."/.bashrc<cr>"
" exec "nmap <leader>r :!bash ".g:lastRunCommand." -e ".$workdir."/.bashrc<cr>"
menu Run.Show :call ToggleRun()
menu Projects.Show :call ToggleProjects()
NewMap -n <silent> <c-h> :wincmd h<cr>
NewMap -n <silent> <c-j> :wincmd j<cr>
NewMap -n <silent> <c-k> :wincmd k<cr>
NewMap -n <silent> <c-l> :wincmd l<cr>
" menu Actions.SED :call NvimStudioSubstitution()<cr>
" noremap <leader>v :normal viW"ay<cr>:echo <c-r>a<cr>
NewMap -v -no <silent> p "_dP
NewMap -v -no <silent> y y:call ClipboardYank()<CR>
NewMap -v -no <silent> d d:call ClipboardYank()<CR>
NewMap -n -no <silent> dd dd:call ClipboardYank()<CR>
NewMap -n -no <silent> p :call ClipboardPaste("n")<CR>p
NewMap -v -no p :<C-U>let vlcb = getpos("'<")[1:2] \| let vlce = getpos("'>")[1:2] \| call ClipboardPaste("v")<CR>p
NewMap -n <BS> :call backspaceN()<CR>
" was cmap
NewMap -c <A-'> ä
" was cmap
NewMap -c <A-"> Ä
" was cmap
NewMap -c <A-;> ö
" was cmap
NewMap -c <A-:> Ö
" was cmap
NewMap -c <A-[> ü
" was cmap
NewMap -c <A-{> Ü
" was cmap
NewMap -c <A--> ß
" was cmap
NewMap -n <leader>F :echo VS()<cr>

NewMap -n <leader>e :call AppendToEndNormal()<CR>
NewMap -n <leader>E :AppendAll<CR>

NewMap -n -no YY :call AppendToClipboard()<CR>
NewMap -v -no Y :<C-u>let @+ = @+ . join(getline("'<", "'>"), "\n") . "\n"<CR>
" noremap <expr> <leader><leader>s ShowMode()

" Move Lines
NewMap -n -no <silent> <A-k> :m-2<cr>
NewMap -n -no <silent> <A-j> :m+1<cr>
NewMap -v -no <silent> <A-k> :m '<-2<CR>gv=gv
NewMap -v -no <silent> <A-j> :m '>+1<CR>gv=gv

NewMap -no < <<
NewMap -no > >>
NewMap -v -no < <gv
NewMap -v -no > >gv

NewMap -map <leader>dt :diffthis<cr>
NewMap -map <leader>do :diffoff<cr>

NewMap -map <leader>0 :wincmd =<cr>

NewMap -i -no <C-Space> <C-x><C-f>
NewMap -no <leader>ga :!git add .<cr>
NewMap -no <leader>gs :!git status %<cr>

function! Ut(...)
  " strpart({src}, {start} [, {len} [, {chars}]])
  " strcharpart({src}, {start} [, {len} [, {skipcc}]])		*strcharpart()*
  " byteidx({expr}, {nr} [, {utf16}])			*byteidx()*
  " stridx(haystack, needle)
  let a=stridx(a:3, '(')
  let b=stridx(a:3, ')')
  let function_name=strpart(a:3, 0, a)
  " echo function_name
  let args=strpart(a:3, a+1, b-a-1)
  " echo args
  exec "vnoremap"a:1":<C-u>call"function_name."(".args.")<cr>"
  exec "nnoremap"a:1":call"function_name."(".args.")<cr>"
  exec "inoremap"a:1"<C-o>:call"function_name."(".args.")<cr>"
  let seperator=len(args)>0?', ':''
  exec "cnoremap"a:1":call"function_name."(".args.seperator."'c')<cr>"
  exec "tnoremap"a:1"<C-\><C-n>:call"function_name."(".args.seperator."'t')<cr>"
endfunction
command! -range -nargs=+ Ut call Ut(<f-args>)

" Ut <F12> :call QuickYank()<cr>
" nnoremap <F12> :call QuickYank()<cr>
" Ut <S-F12> :call QuickYank('paste')<cr>
" Ut <C-F12> :call QuickYank('init')<cr>
" map <F12> :call setreg('*', CWD()[0]..'/'..expand('%')..':'..line('.'))<cr>
" map <S-F12> i<c-r>*


" vnoremap <C-S-v> :<C-u><cr>
" Buggy
" NewMap -n -no <C-S-v> :norm "+p
" NewMap -n -no <C-V> :norm "+p
" unmap <C-S-v>
NewMap -i -no <C-S-v> <c-r>+
" nnoremap <C-v> :norm "+p
" inoremap <C-v> <c-r>+
" nnoremap <C-v>
" inoremap <C-v>
NewMap -map <leader>v :visualblock<cr>

NewMap -map <leader>v :Vim<cr>
" inoremap <C-S-v> <C-o>:<cr>
" cnoremap <C-S-v> :<cr>
" tnoremap <C-S-v> <C-\><C-n>:<cr>
" let seperator=len(args)>0?', ':''

" map <leader><F5> :call RegisterTerminal()<cr>
" map <leader><F6> :call RegisterTerminal()<cr>
" map <leader><F7> :call RegisterTerminal()<cr>
" map <leader><F8> :call RegisterTerminal()<cr>
NewMap -map <leader><F5> :call FixTargetTerm('F5')<cr>
NewMap -map <leader><F6> :call FixTargetTerm('F6')<cr>
NewMap -map <leader><F7> :call FixTargetTerm('F7')<cr>
NewMap -map <leader><F8> :call FixTargetTerm('F8')<cr>

" Ut <F2> :call ToggleShortenPath()<cr>
" command :call ToggleShortenPath()<cr>
command! -nargs=0 ShortenPath call ToggleShortenPath()

function! DBG()
  echo CWD()
  echo RELATIVE()
  echo ABSOLUTE()
endfunction

" NewMap -map <leader>a :y \| :let a=split(@", "\n")<cr>
" NewMap -map <leader>A =remove(a,0)<cr>
" qq
" f,f,a "
" <C-r>=remove(a,0)
" "
" <Esc>/<C-c>
" j0
" q

" NewMap -map <C-x> :call Assign()<cr>
" NewMap -map <leader><C-x> :call Deassign()<cr>

" NewMap -map ,p :call PutKey()<cr>

" exec 'map <80>k2 :echo "TEST"<cr>'

" map ,r :call EditRange()<cr>
" map ,a  :call AssignKey()<cr>
" map ,ec :call AssignKey()<cr>
" map ,ee :call EditExecution()<cr>


" map <F1> :call Execute("F1")<cr>
" map <F2> :call Execute("F2")<cr>
" map <F3> :call Execute("F3")<cr>
" map <F4> :call Execute("F4")<cr>
" map <F5> :call Execute("F5")<cr>
" map <F6> :call Execute("F6")<cr>
" map <F7> :call Execute("F7")<cr>
" map <F8> :call Execute("F8")<cr>

" map <S-F1> :call Execute("F1", 1)<cr>
" map <S-F2> :call Execute("F2", 1)<cr>
" map <S-F3> :call Execute("F3", 1)<cr>
" map <S-F4> :call Execute("F4", 1)<cr>
" map <S-F5> :call Execute("F5", 1)<cr>
" map <S-F6> :call Execute("F6", 1)<cr>
" map <S-F7> :call Execute("F7", 1)<cr>
" map <S-F8> :call Execute("F8", 1)<cr>

" map <C-F1> :call Execute("F1", 0, 1)<cr>
" map <C-F2> :call Execute("F2", 0, 1)<cr>
" map <C-F3> :call Execute("F3", 0, 1)<cr>
" map <C-F4> :call Execute("F4", 0, 1)<cr>
" map <C-F5> :call Execute("F5", 0, 1)<cr>
" map <C-F6> :call Execute("F6", 0, 1)<cr>
" map <C-F7> :call Execute("F7", 0, 1)<cr>
" map <C-F8> :call Execute("F8", 0, 1)<cr>

" map <S-C-F1> :call Execute("F1", 1, 1)<cr>
" map <S-C-F2> :call Execute("F2", 1, 1)<cr>
" map <S-C-F3> :call Execute("F3", 1, 1)<cr>
" map <S-C-F4> :call Execute("F4", 1, 1)<cr>
" map <S-C-F5> :call Execute("F5", 1, 1)<cr>
" map <S-C-F6> :call Execute("F6", 1, 1)<cr>
" map <S-C-F7> :call Execute("F7", 1, 1)<cr>
" map <S-C-F8> :call Execute("F8", 1, 1)<cr>

"" " map <F1> :echo DBG()<cr>
"" map <F9>  :silent Make<cr>
"" " \\| wincmd w \| redraw! \\| copen'<cr>
"" map <S-F9>  :AbortDispatch<cr>
"" map <F10> :!./%<<cr>
"" map <F11> :!./%<<cr>

" map <F11> :Implement<cr>
" map <F12> :Implement<cr>


NewMap -map <leader>rm :call DeleteFile()<cr>
NewMap -map <leader>n :call NewFile()<cr>

" map <leader>< :norm d\<C-w>lGopG\<C-w>h
" map <leader>< :execute 'normal! \<C-w>l'<cr>
" map <leader>< :execute 'normal! \<C-w>l'<cr>
" map <leader>< :execute 'normal! \<C-w>l'<cr>
NewMap -n <leader>< :norm yy<cr>
  \:norm dd<cr>
  \:wincmd l<cr>
  \:norm gp<cr>
  \:wincmd h<cr>

NewMap -v <leader>< :norm gvy<cr>
  \:norm gvd<cr>
  \:wincmd l<cr>
  \:norm gp<cr>
  \:wincmd h<cr>


  " \:norm gvd<cr>

" nnoremap . @@
" noremap . @:
" noremap . @a
" nnoremap . @:
" unmap .

NewMap -n -no <C-S-M-h> :echo JoinSplits("h")<cr>
NewMap -n -no <C-S-M-j> :echo JoinSplits("j")<cr>
NewMap -n -no <C-S-M-k> :echo JoinSplits("k")<cr>
NewMap -n -no <C-S-M-l> :echo JoinSplits("l")<cr>

NewMap -n -no <leader><C-S-M-h> :echo MoveOutOfSplit("h")<cr>
NewMap -n -no <leader><C-S-M-j> :echo MoveOutOfSplit("j")<cr>
NewMap -n -no <leader><C-S-M-k> :echo MoveOutOfSplit("k")<cr>
NewMap -n -no <leader><C-S-M-l> :echo MoveOutOfSplit("l")<cr>

" nnoremap <F1> :call Help()<cr>

NewMap -map <C-;> zh
NewMap -map <C-'> zl
NewMap -map <C-S-;> 20zh
NewMap -map <C-S-'> 20zl


" ---- quickfix navigation -------------------------------------------
NewMap -n -no <silent> <leader>f  :copen<CR>
NewMap -n -no <silent> <C-Down>   :cnext<CR>zz
NewMap -n -no <silent> <C-Up>     :cprev<CR>zz
NewMap -n -no <silent> <leader>N  :cfirst<CR>zz
NewMap -n -no <silent> <leader>P  :clast<CR>zz
NewMap -n -no <silent> <leader>c  :cclose<CR>

" " ---- location list navigation --------------------------------------
" nnoremap <silent> <leader>lq :lopen<CR>
" " nnoremap <silent> <C-Down>   :lnext<CR>zz
" " nnoremap <silent> <C-Up>     :lprev<CR>zz
" nnoremap <silent> <leader>lN :lfirst<CR>zz
" nnoremap <silent> <leader>lP :llast<CR>zz

NewMap -v <leader>s :source<cr>
NewMap -n <leader>S :Re \| :%source \| :ReEnd<cr>
"!! source even with comment # // " literals
NewMap -no <F6> :autocmd! BufAdd,BufCreate,BufDelete,BufWipeout,BufNew,BufEnter,BufLeave,WinEnter,BufWinEnter,BufUnload *<cr>
NewMap -no <F7> :autocmd! BufEnter * :call F.Buffer.Find(bufnr()).Print()<cr>
NewMap -no <F8> :call Display()<cr>

NewMap -no ,c :call ToggleComment()<cr>

NewMap -v -no <S-F11> :<C-u>call Move('l')<cr>
NewMap -n -no <S-F11> :call Move('l')<cr>
NewMap -i -no <S-F11> <C-o>:call Move('l')<cr>
NewMap -c -no <S-F11> :call Move('l', 'c')<cr>
NewMap -t -no <S-F11> <C-\><C-n>:call Move('l', 't')<cr>

NewMap -v <F1> J
NewMap -map <F2> :call GetKeys()<cr>
NewMap -map <F3> :call FindKeyPerform()<cr>
NewMap -map <F4> :echo AllKeys()<cr>

NewMap -t <C-v> <C-\><C-n>:call SendCommandToThisTerm([getreg('"')])<cr>i
" <C-S-v> works but be aware of copying the newline characters. they execute
" commands immedietly.


NewMap -v <leader><leader>s :<C-u>silent redir=>output \| silent '<,'>source \| redir END \| put=output<cr>

NewMap -map <F8> <C-w>p
NewMap -v -no <F8> :<C-u>call SendCommandToTerm("l")<cr>
NewMap -n -no <F8> :<C-u>call SendCommandToTerm("l")<cr>

NewMap -n -no <F5> :<C-u>call RedoCommandToTerm("l")<cr>

NewMap -map <leader>aa :RECP --reg *<cr>
NewMap -map <leader>an :RECP --reg "<cr>
NewMap -map <leader>ab :RECP<cr>

" NewMap -map <leader>m :call TabBuffers('merge')<cr>
" NewMap -map <F1> :call TabBuffers('next')<cr>
" NewMap -map <S-F1> :call TabBuffers('prev')<cr>

NewMap -map <C-Tab> :tabn<cr>
NewMap -map <C-S-Tab> :tabp<cr>

NewMap -no <leader>qd :Diff --all<cr>
NewMap -no <leader>qr :PushCWD  
NewMap -no <leader>qv :Pull
NewMap -no <leader>qs :Status<CR>
NewMap -no <leader>qu :StashPush<CR>
NewMap -no <leader>qo :StashPop<CR>

" Variants / Extending Command Line Experience
NewMap -no <expr> ,,vg1 :echo "vimgrep term **/*.ext" \| :call feedkeys(':vimgrep ')
NewMap -no ,,vg2 :call input("vimgrep term **/*.ext\n") \| call feedkeys(':')
NewMap -no ,,vg3 :echo "vimgrep term **/*.ext"<cr> \| :call feedkeys(':')<cr>
NewMap -no ,,vg4 <expr> <leader><leader>vg call echo("tset") \| call feedkeys(':')
NewMap -no ,,vg5 :execute input("hint\n:")<cr>
NewMap -no ,,,f :call feedkeys(':'..input("hint\n:").."\n")<cr>
NewMap -no ,,f :call feedkeys(':'..input("hint\n:").."\n")<cr>
NewMap -no ,f :call feedkeys(':'..input("hint\n:").."\n")<cr>
NewMap -no ,,,,f :C test abc def geh "OKAY DU?"<cr>


" NewMap reduces spaces in commands - opts.args_string
NewMap -map ,vg :copen<cr>:vimgrep  **/*[D[D[D[D[D
NewMap -map ,vo :copen<cr>

NewMap -map [1;5A :copen<cr>:vimgrep   **/*[D[D[D[D[D
NewMap -map [D :cclose<cr>
NewMap -map [C :copen<cr>
NewMap -map [A :cprev<cr>
NewMap -map [B :cnext<cr>

" Keymaps
" Dont NewMap this
nnoremap <C-i> <C-i>
NewMap -no <F1> :call NextBuffer()<CR>
NewMap -no <S-F1> :call PrevBuffer()<CR>
NewMap -t -no <F1> <C-\><C-o>:call NextBuffer()<CR>
NewMap -t -no <S-F1> <C-\><C-o>:call PrevBuffer()<CR>
NewMap -no <Tab> :call NextBuffer()<CR>
NewMap -no <S-Tab> :call PrevBuffer()<CR>

" map <F2> :echo t:buffers<cr>
" map <F3> :echo FullPaths(t:buffers)<cr>

function SelectFunctionBlock(...)
  call search(FunctionName(3), 'bcW')
endfunction
command! -range -nargs=* SelectFunctionBlock call SelectFunctionBlock(<f-args>)
NewMap -no ,,,,,<F1> :call SelectFunctionBlock()<CR>

function SelectFunctionBlock(...)
  call search(FunctionName(3), 'bcW')
endfunction
command! -range -nargs=* SelectFunctionBlock call SelectFunctionBlock(<f-args>)
NewMap -no <F1> :call SelectFunctionBlock()<CR>

NewMap -no <F1> :call GitInfo()<cr>

NewMap -no <F2> :call SelectRemote(1)<cr>
NewMap -no <S-F2> :call SelectRemote(-1)<cr>
NewMap -no <leader><F2> :call GitRenameRemote()<cr>
NewMap -no <leader><leader><F2> :call GitNewRemote()<cr>
NewMap -no <leader><leader><leader><F2> :call GitSetRemote()<cr>

NewMap -no <F3> :call SelectBranch(1)<cr>
NewMap -no <S-F3> :call SelectBranch(-1)<cr>
NewMap -no <leader><F3> :call GitRenameBranch()<cr>
NewMap -no <leader><leader><F3> :call GitNewBranch()<cr>

NewMap -no <F4> :call GitStashPush()<cr>
NewMap -no <S-F4> :call GitStashPop()<cr>
NewCommand command! -range -nargs=* RenameRemote call GitRenameRemote(<f-args>)
NewCommand command! -range -nargs=* SetRemote call GitSetRemote(<f-args>)
NewCommand command! -range -nargs=* RenameBranch call GitRenameBranch(<f-args>)
NewCommand command! -range -nargs=* NewRemote call GitNewRemote(<f-args>)
NewCommand command! -range -nargs=* NewBranch call GitNewBranch(<f-args>)

endif
