" Todo -no NewMap Checker
if !exists("g:vim_advantages_got_sourced")

let g:FlagReceived=0
"  \ [ 'args', 'args|Args', '*'],

NewCommand command! -range -nargs=+ Debug call Debug(<f-args>)
" set <F8>=ük8
" NewMap -no -n ük8 :echo "KEYMAPPING"<cr>
" NewMap -no -n <F8> :echo "KEYMAPPING"<cr>
" NewMap -no -n <C-F8> :echo "TEST"<cr>
" NewMap -no -n :echo "test"
" NewMap -no -n :echo "TEST"

" NewMap -no -n <C-S-i> :echo "Implement Bufferjump"<cr>
" NewMap -no -n <C-S-o> :echo "Implement Bufferjump"<cr>
" Jump to previous or next file
" nnoremap <silent> ,<C-O> :call JumpToNextFile(-1)<cr>
" nnoremap <silent> ,<C-I> :call JumpToNextFile(1)<cr>

" todo add silent
NewMap -n -no <C-S-o> :call JumpToNextFile(-1)<cr>
NewMap -n -no <C-S-i> :call JumpToNextFile(1)<cr>

" nmap <C-S-z> 
" tmap <C-S-z> <C-\><C-n>
NewMap -t -n -no <C-S-z> :suspend<cr>
NewMap -t -n -no <C-z> :if winnr('$')<=1 \| suspend \| else \| hide \| endif<cr>
" unmape | :hide | endif<silent> ,<C-O>
" unmap <silent> ,<C-I>

" Map.vim
" Todo for what was that fix?
" NewMap -n -no <C-s> <Nop>
" NewMap -i -no <C-s> <Nop>
" NewMap -v -no <C-s> <Nop>
" unmap <C-s>

NewMap -no -n ,,f :call FavoriteFile()<cr>
NewMap -no -n ,,f :call FavoriteFile()<cr>
NewMap -no -n ,,p :call FavoritePath()<cr>
NewMap -no -n <C-8> :call Favorite()<cr>

NewMap -n -no ,s :so %<cr>
" NewMap -no -n <C-Space> :call SelectCommand()<cr>

NewMap -no -n ,t :Tidy<cr>

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

" NewMap -no ,q :q<cr>
NewMap -no <M-q> :q<cr>
NewMap -t -no <M-q> <c-\><c-n>:q<cr>

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

" Todo
" When A Visual Selection Is Set
" Either Use As Input
" Or Use As Redefine And Fire Command
NewMap -v -no <F5> :call VSRewriteCommand("h")<cr>
NewMap -v -no <F6> :call VSRewriteCommand("j")<cr>
NewMap -v -no <F7> :call VSRewriteCommand("k")<cr>
NewMap -v -no <F8> :call VSRewriteCommand("l")<cr>
NewMap -i -no <F5> :call SavedCommandToTerm("h")<cr>
NewMap -i -no <F6> :call SavedCommandToTerm("j")<cr>
NewMap -i -no <F7> :call SavedCommandToTerm("k")<cr>
NewMap -i -no <F8> :call SavedCommandToTerm("l")<cr>
NewMap -c -n -no <F5> :call SavedCommandToTerm("h")<cr>
NewMap -c -n -no <F6> :call SavedCommandToTerm("j")<cr>
NewMap -c -n -no <F7> :call SavedCommandToTerm("k")<cr>
NewMap -c -n -no <F8> :call SavedCommandToTerm("l")<cr>
" C - \ C - n
NewMap -t -no <F5> :call SavedCommandToTerm("h")<cr>
NewMap -t -no <F6> :call SavedCommandToTerm("j")<cr>
NewMap -t -no <F7> :call SavedCommandToTerm("k")<cr>
NewMap -t -no <F8> :call SavedCommandToTerm("l")<cr>

NewMap -all -no ,<F5> :call MapCommand("h")<cr>
NewMap -all -no ,<F6> :call MapCommand("j")<cr>
NewMap -all -no ,<F7> :call MapCommand("k")<cr>
NewMap -all -no ,<F8> :call MapCommand("l")<cr>

" NewMap -all -no ,,<F5> :call DirectionMapCommand("h")<cr>
" NewMap -all -no ,,<F6> :call DirectionMapCommand("j")<cr>
" NewMap -all -no ,,<F7> :call DirectionMapCommand("k")<cr>
" NewMap -all -no ,,<F8> :call DirectionMapCommand("l")<cr>
" NewMap -all -no ,,<F5> :call DirectionAllMapCommand("h")<cr>
" NewMap -all -no ,,<F6> :call DirectionAllMapCommand("j")<cr>
" NewMap -all -no ,,<F7> :call DirectionAllMapCommand("k")<cr>
" NewMap -all -no ,,<F8> :call DirectionAllMapCommand("l")<cr>

NewMap -all -no ,,<F5> :call DirectionMapSmart('h')<cr>
NewMap -all -no ,,<F6> :call DirectionMapSmart('j')<cr>
NewMap -all -no ,,<F7> :call DirectionMapSmart('k')<cr>
NewMap -all -no ,,<F8> :call DirectionMapSmart('l')<cr>

NewMap -all -no ,,,<F5> :call MapCommand("x")<cr>
NewMap -all -no ,,,<F6> :call MapCommand("x")<cr>
NewMap -all -no ,,,<F7> :call MapCommand("x")<cr>
NewMap -all -no ,,,<F8> :call MapCommand("x")<cr>

" map ,<F5> :call RegisterTerminal()<cr>
" map ,<F6> :call RegisterTerminal()<cr>
" map ,<F7> :call RegisterTerminal()<cr>
" map ,<F8> :call RegisterTerminal()<cr>

NewMap -no -n ,,,<F5> :call FixTargetTerm('F5')<cr>
NewMap -no -n ,,,<F6> :call FixTargetTerm('F6')<cr>
NewMap -no -n ,,,<F7> :call FixTargetTerm('F7')<cr>
NewMap -no -n ,,,<F8> :call FixTargetTerm('F8')<cr>

" C - u
NewMap -v -no <C-F5> :call RedoCommandToTermWithSigTerm("h")<cr>
NewMap -v -no <C-F6> :call RedoCommandToTermWithSigTerm("j")<cr>
NewMap -v -no <C-F7> :call RedoCommandToTermWithSigTerm("k")<cr>
NewMap -v -no <C-F8> :call RedoCommandToTermWithSigTerm("l")<cr>
" C - o
NewMap -i -no <C-F5> :call RedoCommandToTermWithSigTerm("h")<cr>
NewMap -i -no <C-F6> :call RedoCommandToTermWithSigTerm("j")<cr>
NewMap -i -no <C-F7> :call RedoCommandToTermWithSigTerm("k")<cr>
NewMap -i -no <C-F8> :call RedoCommandToTermWithSigTerm("l")<cr>
NewMap -c -n -no <C-F5> :call RedoCommandToTermWithSigTerm("h")<cr>
NewMap -c -n -no <C-F6> :call RedoCommandToTermWithSigTerm("j")<cr>
NewMap -c -n -no <C-F7> :call RedoCommandToTermWithSigTerm("k")<cr>
NewMap -c -n -no <C-F8> :call RedoCommandToTermWithSigTerm("l")<cr>
" C - \ C - n
NewMap -t -no <C-F5> :call RedoCommandToTermWithSigTerm("h")<cr>
NewMap -t -no <C-F6> :call RedoCommandToTermWithSigTerm("j")<cr>
NewMap -t -no <C-F7> :call RedoCommandToTermWithSigTerm("k")<cr>
NewMap -t -no <C-F8> :call RedoCommandToTermWithSigTerm("l")<cr>

" C - u
NewMap -v -no <S-F5> :call RedoCommandToTerm("h")<cr>
NewMap -v -no <S-F6> :call RedoCommandToTerm("j")<cr>
NewMap -v -no <S-F7> :call RedoCommandToTerm("k")<cr>
NewMap -v -no <S-F8> :call RedoCommandToTerm("l")<cr>
" C - o
NewMap -i -no <S-F5> :call RedoCommandToTerm("h")<cr>
NewMap -i -no <S-F6> :call RedoCommandToTerm("j")<cr>
NewMap -i -no <S-F7> :call RedoCommandToTerm("k")<cr>
NewMap -i -no <S-F8> :call RedoCommandToTerm("l")<cr>
NewMap -c -n -no <S-F5> :call RedoCommandToTerm("h")<cr>
NewMap -c -n -no <S-F6> :call RedoCommandToTerm("j")<cr>
NewMap -c -n -no <S-F7> :call RedoCommandToTerm("k")<cr>
NewMap -c -n -no <S-F8> :call RedoCommandToTerm("l")<cr>
" C - \ C - n
NewMap -t -no <S-F5> :call RedoCommandToTerm("h")<cr>
NewMap -t -no <S-F6> :call RedoCommandToTerm("j")<cr>
NewMap -t -no <S-F7> :call RedoCommandToTerm("k")<cr>
NewMap -t -no <S-F8> :call RedoCommandToTerm("l")<cr>

" C - u
NewMap -v -no <C-S-F5> :call SigTermToTerm("h")<cr>
NewMap -v -no <C-S-F6> :call SigTermToTerm("j")<cr>
NewMap -v -no <C-S-F7> :call SigTermToTerm("k")<cr>
NewMap -v -no <C-S-F8> :call SigTermToTerm("l")<cr>
" C - o
NewMap -i -no <C-S-F5> :call SigTermToTerm("h")<cr>
NewMap -i -no <C-S-F6> :call SigTermToTerm("j")<cr>
NewMap -i -no <C-S-F7> :call SigTermToTerm("k")<cr>
NewMap -i -no <C-S-F8> :call SigTermToTerm("l")<cr>
NewMap -c -n -no <C-S-F5> :call SigTermToTerm("h")<cr>
NewMap -c -n -no <C-S-F6> :call SigTermToTerm("j")<cr>
NewMap -c -n -no <C-S-F7> :call SigTermToTerm("k")<cr>
NewMap -c -n -no <C-S-F8> :call SigTermToTerm("l")<cr>
" C - \ C - n
NewMap -t -no <C-S-F5> :call SigTermToTerm("h")<cr>
NewMap -t -no <C-S-F6> :call SigTermToTerm("j")<cr>
NewMap -t -no <C-S-F7> :call SigTermToTerm("k")<cr>
NewMap -t -no <C-S-F8> :call SigTermToTerm("l")<cr>

" todo With Leader / Register As Target To A Specified Key

" NewMap -v -no . :<Up>
NewMap -v -no . :<Up><cr>
" map <F5> :call RedoCommandToTerm("h")<cr>
" map <F6> :call RedoCommandToTerm("j")<cr>
" map <F7> :call RedoCommandToTerm("k")<cr>
" NewMap -no -n <F8> :w!<cr>:call RedoCommandToTerm("l")<cr>

" NewMap -no -n <C-F5> :call SigTermToTerm("h")<cr>
" NewMap -no -n <C-F6> :call SigTermToTerm("j")<cr>
" NewMap -no -n <C-F7> :call SigTermToTerm("k")<cr>
" NewMap -no -n <C-F8> :call SigTermToTerm("l")<cr>

" NewMap -no -n <C-S-F5> :call RedoCommandToTermWithSigTerm("h")<cr>
" NewMap -no -n <C-S-F6> :call RedoCommandToTermWithSigTerm("j")<cr>
" NewMap -no -n <C-S-F7> :call RedoCommandToTermWithSigTerm("k")<cr>
" NewMap -no -n <C-S-F8> :w!<cr>:call RedoCommandToTermWithSigTerm("l")<cr>

" C - u
" NewMap -v -no <F11> :call Move('h')<cr>
" NewMap -n -no <F11> :call Move('h')<cr>
" C - o
" NewMap -i -no <F11> :call Move('h')<cr>
" NewMap -c -no <F11> :call Move('h')<cr>
" C - \ C - n
" NewMap -t -no <F11> :call Move('h')<cr>
" C - u
" NewMap -v -no <F12> :call Move('l')<cr>
" NewMap -n -no <F12> :call Move('l')<cr>
" C - o
" NewMap -i -no <F12> :call Move('l')<cr>
" NewMap -c -no <F12> :call Move('l', 'c')<cr>
" C - \ C - n
" NewMap -t -no <F12> :call Move('l', 't')<cr>

" C - u
" NewMap -v -no <S-F11> :call Move('l')<cr>
" NewMap -n -no <S-F11> :call Move('l')<cr>
" C - o
" NewMap -i -no <S-F11> :call Move('l')<cr>
" NewMap -c -no <S-F11> :call Move('l', 'c')<cr>
" C - \ C - n
" NewMap -t -no <S-F11> :call Move('l', 't')<cr>
" C - u
" NewMap -v -no <S-F12> :call Move('l')<cr>
" NewMap -n -no <S-F12> :call Move('l')<cr>
" C - o
" NewMap -i -no <S-F12> :call Move('l')<cr>
" NewMap -c -no <S-F12> :call Move('l', 'c')<cr>
" C - \ C - n
" NewMap -t -no <S-F12> :call Move('l', 't')<cr>

" noremap <F12> :call BulkMove("cword")<cr>
" vnoremap <F12> :call BulkMove("visual")<cr>

" nmap <F1>m :%    g/^\s*"/GlobalMove<cr>
" xmap <F1>m :g/^\s*"/GlobalMove<cr>

" Amap <F2> :NERDTreeFind<cr>

NewMap -no -v -n -i -t ,h     :call Open("h", "buffer", "new")<cr>
NewMap -no -v -n -i -t ,j     :call Open("j", "buffer", "new")<cr>
NewMap -no -v -n -i -t ,k     :call Open("k", "buffer", "new")<cr>
NewMap -no -v -n -i -t ,l     :call Open("l", "buffer", "new")<cr>
NewMap -no -v -n -i -t ,H     :call Open("H", "buffer", "new")<cr>
NewMap -no -v -n -i -t ,J     :call Open("J", "buffer", "new")<cr>
NewMap -no -v -n -i -t ,K     :call Open("K", "buffer", "new")<cr>
NewMap -no -v -n -i -t ,L     :call Open("L", "buffer", "new")<cr>
NewMap -no -v -n -i -t ,,h     :call Open("h", "terminal", "new")<cr>
NewMap -no -v -n -i -t ,,j     :call Open("j", "terminal", "new")<cr>
NewMap -no -v -n -i -t ,,k     :call Open("k", "terminal", "new")<cr>
NewMap -no -v -n -i -t ,,l     :call Open("l", "terminal", "new")<cr>
NewMap -no -v -n -i -t ,,H     :call Open("H", "terminal", "new")<cr>
NewMap -no -v -n -i -t ,,J     :call Open("J", "terminal", "new")<cr>
NewMap -no -v -n -i -t ,,K     :call Open("K", "terminal", "new")<cr>
NewMap -no -v -n -i -t ,,L     :call Open("L", "terminal", "new")<cr>
"
" Amap <A-h>     :call Open("h", "buffer", "new")<cr>
" Amap <A-j>     :call Open("j", "buffer", "new")<cr>
" Amap <A-k>     :call Open("k", "buffer", "new")<cr>
" Amap <A-l>     :call Open("l", "buffer", "new")<cr>
NewMap -no -a <A-H>     :call Open("H", "buffer", "new")<cr>
NewMap -no -a <A-J>     :call Open("J", "buffer", "new")<cr>
NewMap -no -a <A-K>     :call Open("K", "buffer", "new")<cr>
NewMap -no -a <A-L>     :call Open("L", "buffer", "new")<cr>
NewMap -no -a <A-S-h>     :call Open("h", "terminal", "new")<cr>
NewMap -no -a <A-S-j>     :call Open("j", "terminal", "new")<cr>
NewMap -no -a <A-S-k>     :call Open("k", "terminal", "new")<cr>
NewMap -no -a <A-S-l>     :call Open("l", "terminal", "new")<cr>
NewMap -no -a <A-S-H>     :call Open("H", "terminal", "new")<cr>
NewMap -no -a <A-S-J>     :call Open("J", "terminal", "new")<cr>
NewMap -no -a <A-S-K>     :call Open("K", "terminal", "new")<cr>
NewMap -no -a <A-S-L>     :call Open("L", "terminal", "new")<cr>
" Amap ,<C-h> :call Open("h", "buffer", "copy")<cr>
" Amap ,<C-j> :call Open("j", "buffer", "copy")<cr>
" Amap ,<C-k> :call Open("k", "buffer", "copy")<cr>
" Amap ,<C-l> :call Open("l", "buffer", "copy")<cr>
" Amap ,<C-S-h> :call Open("H", "buffer", "copy")<cr>
" Amap ,<C-S-j> :call Open("J", "buffer", "copy")<cr>
" Amap ,<C-S-k> :call Open("K", "buffer", "copy")<cr>
" Amap ,<C-S-l> :call Open("L", "buffer", "copy")<cr>

NewMap -no -a <A-S-Left>     :call Open("h", "terminal", "new")<cr>
NewMap -no -a <A-S-Down>     :call Open("j", "terminal", "new")<cr>
NewMap -no -a <A-S-Up>       :call Open("k", "terminal", "new")<cr>
NewMap -no -a <A-S-Right>    :call Open("l", "terminal", "new")<cr>
NewMap -no -a <A-S-Left>     :call Open("H", "terminal", "new")<cr>
NewMap -no -a <A-S-Down>     :call Open("J", "terminal", "new")<cr>
NewMap -no -a <A-S-Up>       :call Open("K", "terminal", "new")<cr>
NewMap -no -a <A-S-Right>    :call Open("L", "terminal", "new")<cr>
NewMap -no -a <A-Left>       :call Open("h", "buffer", "new")<cr>
NewMap -no -a <A-Down>       :call Open("j", "buffer", "new")<cr>
NewMap -no -a <A-Up>         :call Open("k", "buffer", "new")<cr>
NewMap -no -a <A-Right>      :call Open("l", "buffer", "new")<cr>
NewMap -no -a <A-Left>       :call Open("H", "buffer", "new")<cr>
NewMap -no -a <A-Down>       :call Open("J", "buffer", "new")<cr>
NewMap -no -a <A-Up>         :call Open("K", "buffer", "new")<cr>
NewMap -no -a <A-Right>      :call Open("L", "buffer", "new")<cr>
" Amap <A-<C-h>> :call Open("h", "buffer", "copy")<cr>
" Amap <A-<C-j>> :call Open("j", "buffer", "copy")<cr>
" Amap <A-<C-k>> :call Open("k", "buffer", "copy")<cr>
" Amap <A-<C-l>> :call Open("l", "buffer", "copy")<cr>
" Amap <A-<C-S-h>> :call Open("H", "buffer", "copy")<cr>
" Amap <A-<C-S-j>> :call Open("J", "buffer", "copy")<cr>
" Amap <A-<C-S-k>> :call Open("K", "buffer", "copy")<cr>
" Amap <A-<C-S-l>> :call Open("L", "buffer", "copy")<cr>

" NewMap -no -a ,q :q!<cr>
" NewMap -no -a <C-q> :hide<cr>
NewMap -no -a <C-q> :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
" NewMap -no -a <C-S-q> :bd!<cr>
" NewMap -no -a <C-S-q> :q!<cr>
NewMap -no -a <C-S-q> :qa!<cr>
NewMap -no -a <A-q> :call TabClose()<cr>
NewMap -no -la ,,r :redraw!<cr>
" Amap ,ser  :call ServiceMenu()<cr>
NewMap -no -a <S-F2> :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
NewMap -no -a ,c call CountRegex()<cr>
" Amap ,c :call COP('P')<cr>
" Amap ,x :call CUT('P')<cr>
" NewMap -no -a ,z :call CreateMarker('P')<cr>
" Amap ,m :call LeaderDot("'<,'>")<cr>
" Amap ,,m :call LeaderDot("%")<cr>
" Nmap ,m :call LeaderDot("")<cr>
" Was Nmap
NewMap -no -n <C-S-A> :call IncRange()<cr>
" Was Nmap
NewMap -no -n <C-S-X> :call DecRange()<cr>
NewMap -no -v af :call Vaf()<cr>
" NewMap -no -v if :call Vif()<cr>
NewMap -no -v <C-S-A> :call IncRange()<cr>
NewMap -no -v <C-S-X> :call DecRange()<cr>
NewMap -no -t ,X :TIN tail -f $receiver<cr>

NewMap -no -n <A-S-n> <C-w>+
NewMap -no -n <A-S-m> <C-w>-
NewMap -no -n <A-S-u> <C-w><
NewMap -no -n <A-S-i> <C-w>>

NewMap -no -n <A-n> 12<C-w>+
NewMap -no -n <A-m> 12<C-w>-
NewMap -no -n <A-u> 12<C-w><
NewMap -no -n <A-i> 12<C-w>>

" map ,h :call TabH()<cr>
" map ,t :call TabL()<cr>
" map ,g :call TabH()<cr>
" map ,h :call TabL()<cr>
NewMap -no -n <A-h> :call TabH()<cr>
NewMap -no -n <A-l> :call TabL()<cr>
" NewMap -no -n <C-Tab> :tabn<cr>
" NewMap -no -n <C-S-Tab> :tabp<cr>
NewMap -no -n <C-S-M-h> :wincmd H<cr>
NewMap -no -n <C-S-M-j> :wincmd J<cr>
NewMap -no -n <C-S-M-k> :wincmd K<cr>
NewMap -no -n <C-S-M-l> :wincmd L<cr>

" NewMap -no -n ,,a :call VSP()<cr>
NewMap -no -n <C-S-h> :call SwapWin("h")<cr>
NewMap -no -n <C-S-j> :call SwapWin("j")<cr>
NewMap -no -n <C-S-k> :call SwapWin("k")<cr>
NewMap -no -n <C-S-l> :call SwapWin("l")<cr>
NewMap -t -no <C-S-h> <c-\><c-n>:call SwapWin("h")<cr>
NewMap -t -no <C-S-j> <c-\><c-n>:call SwapWin("j")<cr>
NewMap -t -no <C-S-k> <c-\><c-n>:call SwapWin("k")<cr>
NewMap -t -no <C-S-l> <c-\><c-n>:call SwapWin("l")<cr>
" NewMap -no -n <A-h> :call IntegrateIn('h')<cr>
" NewMap -no -n <A-j> :call IntegrateIn('j')<cr>
" NewMap -no -n <A-k> :call IntegrateIn('k')<cr>
" NewMap -no -n <A-l> :call IntegrateIn('l')<cr>

NewMap -n -no ,fuc :call OpenFileUnderCursor()<cr>
NewMap -n -no ,,fb :LayoutBash<cr>
NewMap -n -no ,,fv :LayoutVim<cr>

NewMap -no -n <m-;> :call ToggleOverviewRight()<cr>
NewMap -no -n ,,<F4> :redraw \\| let c=input("Test: ")<cr>!source ".$workdir."/.bashrc; git_selector "TEST"
NewMap -no -n <C-S-F9> :call PreviewBuffer()<cr>
" map <M-F12> :call Info()<cr>
NewMap -no -n <C-F2> :call ToggleWrap()<cr>
NewMap -no -n ,,,w :call ToggleWrap()<cr>
NewMap -no -n ,in :call Intend()<cr>
NewMap -no -n ,,,<space> :IntelligentSelecting<cr>
NewMap -no -n ,. @q
" map ,s :call NvimStudioSubstitution("selection")<cr>
" map ,S :call NvimStudioSubstitution("file")<cr>
NewMap -aa -no <C-h> :call SmartWincmd('h')<cr>
NewMap -aa -no <C-j> :call SmartWincmd('j')<cr>
NewMap -aa -no <C-k> :call SmartWincmd('k')<cr>
NewMap -aa -no <C-l> :call SmartWincmd('l')<cr>
NewMap -t -un -no <C-l> l
NewMap -t -un -no <C-h> h
NewMap -t -un -no <C-k> k
NewMap -t -un -no <C-j> j

" Unnessecary
" NewMap -t -un <C-l> <C-w>l
" NewMap -t -un <C-h> <C-w>h
" NewMap -t -un <C-k> <C-w>k
" NewMap -t -un <C-j> <C-w>j
"" works NewMap -t -un -no <C-l> l<cr>
"" works NewMap -t -un -no <C-h> h<cr>
"" works NewMap -t -un -no <C-k> k<cr>
"" works NewMap -t -un -no <C-j> j<cr>

NewMap -no -v <BS> :call backspace()<cr>
NewMap -no -v & :&<cr>
NewMap -no -v ,F :echo VS()<cr>
NewMap -no -v ,,g :call AppendToEndRange()<cr>
NewMap -no -v ,G :AppendAll<cr>
NewMap -no -v ,u :!uniq<cr>
NewMap -no -v <M-v> :call VPaste("Visual")<cr>
NewMap -no -v <M-c> :call VCopy("Visual")<cr>
NewMap -no -v <M-x> :call VCut("Visual")<cr>
" NewMap -no -v <c-c> "*y
NewMap -no -t <c-o> <c-\><c-n><c-o>
" was imap
NewMap -no -i <C-l> <C-w>li
" was imap
NewMap -no -i <C-h> <C-w>hi
" bring back in? umlaute auf c-k
" imap <C-k> <C-w>ki
" was imap
"
" IMPORTANT
""" NewMap -no -i <C-j> <C-w>ji
" C - \ C - n
""" NewMap -no -t <C-h> <C-h>h
" C - \ C - n
""" NewMap -no -t <C-j> <C-j>j
" C - \ C - n
""" NewMap -no -t <C-k> <C-k>k
" C - \ C - n
""" NewMap -no -t <C-l> <C-w>l
""" NewMap -no -t <C-h> <C-h>h
""" NewMap -no -t <C-j> <C-j>j
""" NewMap -no -t <C-k> <C-k>k
""" NewMap -no -t <C-l> <C-w>l
" C - \ C - n
""" NewMap -t -no <C-l> :wincmd l<cr>
" C - \ C - n
""" NewMap -t -no <C-h> :wincmd h<cr>
" C - \ C - n
""" NewMap -t -no <C-k> :wincmd k<cr>
" C - \ C - n
""" NewMap -t -no <C-j> :wincmd j<cr>

" was imap
NewMap -no -i <c-w><c-w> <c-w><c-w>
NewMap -no -t  :call ExitTerminal()<cr>
" was imap
NewMap -no -i <A-'> ä
" was imap
NewMap -no -i <A-"> Ä
" was imap
NewMap -no -i <A-;> ö
" was imap
NewMap -no -i <A-:> Ö
" was imap
NewMap -no -i <A-[> ü
" was imap
NewMap -no -i <A-{> Ü
" was imap
NewMap -no -i <A--> ß
NewMap -no -t -un <ScrollWheelUp> <C-\><C-n>
NewMap -no -t -un <S-ScrollWheelUp> <C-\><C-n>
NewMap -no -t -un <ScrollWheelDown> <C-\><C-n>
NewMap -no -t -un <S-ScrollWheelDown> <C-\><C-n>
NewMap -no -t <Esc> i
NewMap -no -t -un <LeftMouse> <C-\><C-n>

NewMap -no -n ,,,m :call Toggle_Set_Last_Git_Message()<cr>
NewMap -no -n ,,,l :call ToggleLineState()<cr>
NewMap -no -n ,,,L :call ToggleLineStateGlobal()<cr>
NewMap -no -n ,,s :call Statusline_TogglePath()<cr>

NewMap -no -n ,,d :echo g:debug_layout<cr>
NewMap -no -n ,,B :call Boilerplate_Test()<cr>
" vmap <C-Space> :call LineUp()<cr>
NewMap -no -n ,<Space> :call GetCCWD()<cr>

" map <F9>  :BuildProject<cr>
" map <F10> :RunProject<cr>
" map <F11> :MakeProject<cr>
" map <F12> :CTagsProject<cr>

""" map ,<F9>   :ToggleVertical<cr>
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

" NewMap -no -n ,a :AddFunctionUserInput<cr>
" NewMap -no -v ,a :AddFunctionVisualSplit<cr>

" nmap <silent> <C-s> :w!<cr>
" vmap <silent> <C-s> :w!<cr>
" imap <silent> <C-s> :w!<cr>l

NewMap -no -n <C-s> :SaveFile<cr>
NewMap -no -v <C-s> :SaveFile<cr>
" was imap
" todo add silent
" NewMap -no -i <C-s> :SaveFile<cr>
NewMap -no -i <C-s> :SaveFile<cr>

NewMap -n -no <localleader>f :InsertFunction<cr>
NewMap -n -no <space>f :InsertFilename<cr>

" map ,c :call CTags()<cr>

NewMap -no -n ,<Space> :call ToggleZoom()<cr>

"todo add silent
NewMap -no -n <S-F1> :SearchCword<cr>

" map ,v :call VIM(VS())<cr>
NewMap -no -n ,b :call BASH(VS())<cr>
NewMap -no -n ,b :call Bash(VS())<cr>
" map ,p :call PYTHON(VS())<cr>
" map ,r :call RUST(VS())<cr>

NewMap -no -n ,b :Buffers<cr>
NewMap -no -n ,b :Buffers<cr>

NewMap -no -n <localleader>iv :call VIM(input("vimscript: "), 'exec_input_vs')<cr>
NewMap -no -n <localleader>ib :call BASH(input("bash: "), 'exec_input_vs')<cr>
NewMap -no -n <localleader>ip :call PYTHON(input("python: "), 'exec_input_vs')<cr>
NewMap -no -n <localleader>ir :call RUST(input("rust: "), 'exec_input_vs')<cr>

NewMap -n -no <space>p :CopyFileNameToClipboard<cr>
NewMap -n -no <space>P :CopyWholePathToClipboard<cr>
NewMap -n -no <space>r :InsertReceiver<cr>
NewMap -n -no ,dd :call Rewindworkdir()<cr>

"" nnoremap <C-p>              :OpenFileFZFProject<cr>
"" nnoremap <A-p>              :OpenFileFZFRepo<cr>
"" nnoremap <A-S-p>            :call OpenFileFZFRepo(1)<cr>
"" nnoremap <A-S-C-p>          :call OpenFileFZFRepo(2)<cr>
"" nnoremap <C-A-p>            :OpenFileFZFSystem<cr>
"" " nnoremap <C-S-p>            :OpenFileFZFRepo<cr>
"" nnoremap <C-->              :FindInFileFZFProject<cr>
"" nnoremap <A-->              :FindInFileFZFRepo<cr>
"" nnoremap <A-S-->            :call FindInFileFZFRepo(1)<cr>
"" nnoremap <A-S-C-->          :call FindInFileFZFRepo(2)<cr>
"" nnoremap <C-A-->            :FindInFileFZFSystem<cr>
"" " nnoremap <C-S-p>            :FindInFileFZFRepo<cr>

NewMap -no -n ,<Space>                                         :call Files(Folder_Up(v:count, 0))<cr>
NewMap -no -n ,,<Space>                                 :call Files(Folder_Up(v:count, 1))<cr>
NewMap -no -n ,,,<Space>                         :call Files(Folder_Up(v:count, 2))<cr>
NewMap -no -n ,,,,<Space>                 :call Files(Folder_Up(v:count, 3))<cr>
NewMap -no -n ,,,,,<Space>         :call Files(Folder_Up(v:count, 4))<cr>
NewMap -no -n ,,,,,,<Space> :call Files(Folder_Up(v:count, 5))<cr>

NewMap -no -n ,g                                         :call AgIn(Folder_Up(v:count, 0))<cr>
NewMap -no -n ,,g                                 :call AgIn(Folder_Up(v:count, 1))<cr>
NewMap -no -n ,,,g                         :call AgIn(Folder_Up(v:count, 2))<cr>
NewMap -no -n ,,,,g                 :call AgIn(Folder_Up(v:count, 3))<cr>
NewMap -no -n ,,,,,g         :call AgIn(Folder_Up(v:count, 4))<cr>
NewMap -no -n ,,,,,,g :call AgIn(Folder_Up(v:count, 5))<cr>

NewMap -no -n ,vcd :call CD(Vim_Advantages_Path())<cr>

NewMap -no -n ,p                :call Projects()<cr>
NewMap -no -n ,,p               :call Projects()<cr>
NewMap -no -n ,,,p              :call Projects()<cr>
NewMap -no -n ,,,,p             :call Projects()<cr>
NewMap -no -n ,,,,,p            :call Projects()<cr>
NewMap -no -n ,,,,,,p           :call Projects()<cr>
NewMap -no <C-p>              :call Projects()<cr>
NewMap -no <C-S-p>            :call Projects()<cr>
NewMap -no <A-p>              :call Projects()<cr>
NewMap -no <A-S-p>            :call Projects()<cr>
NewMap -no <A-C-p>            :call Projects()<cr>
NewMap -no <A-S-C-p>          :call Projects()<cr>
NewMap -no -n ,<C-p>           :call BuildSystemsGitProjects()<cr>

NewMap -no -n <C-S-m>           :Generate<cr>

" Useful?
" NewMap -no <C-Space>              :call Files(Folder_Project())<cr>
" NewMap -no <C-S-Space>            :call Files(Folder_Repo())<cr>
" NewMap -no <A-Space>              :call Files(Folder_Repo())<cr>
" NewMap -no <A-S-Space>            :call Files(Folder_Repo(1))<cr>
" NewMap -no <A-C-Space>            :call Files(Folder_Repo(1))<cr>
" NewMap -no <A-S-C-Space>          :call Files('/')<cr>

NewMap -no -aa <C-Space>              :call Commands()<cr>
NewMap -no -aa <C-S-Space>            :call Commands()<cr>
NewMap -no -aa <A-Space>              :call Commands()<cr>
NewMap -no -aa <A-S-Space>            :call Commands()<cr>
NewMap -no -aa <A-C-Space>            :call Commands()<cr>
NewMap -no -aa <A-S-C-Space>          :call Commands()<cr>
" noremap <A-S-C-Space>            :call Files(Folder_System())<cr>
" nnoremap <C-S-Space>          :OpenFileFZFRepo<cr>
"
NewMap -no <C-g>              :call AgIn(Folder_Project())<cr>
NewMap -no <C-S-g>            :call AgIn(Folder_Repo())<cr>
NewMap -no <A-g>              :call AgIn(Folder_Repo())<cr>
NewMap -no <A-S-g>            :call AgIn(Folder_Repo(1))<cr>
NewMap -no <A-C-g>            :call AgIn(Folder_Repo(1))<cr>
NewMap -no <A-S-C-g>          :call AgIn('/')<cr>

"todo GitRepoUp
" NewMap -no <C-m>              :GitFiles<cr>
" NewMap -no <C-m>              :call GitFiles(Folder_Repo(v:count))<cr>
NewMap -no <C-m>              :call fzf#vim#gitfiles('', {'dir': Folder_Repo(v:count)})<cr>
" noremap <A-S-C-g>            :call AgIn(Folder_System())<cr>
"  nnoremap <C-S-p>          :OpenFileFZFRepo<cr>

" map <F3> :call Files(expand($main_repo))<cr>
" map <S-F3>  :exec "cd "..GetProject().." | Ag"<cr>

" nnoremap <C-g>              :OpenFileCommandLineProject<cr>
" nnoremap <C-S-g>            :OpenFileCommandLineRepo<cr>
" nnoremap <C-A-g>            :OpenFileCommandLineSystem<cr>

NewMap -n -no ,o              :OpenFileCommandLineSameDir<cr>
NewMap -n -no ,.              :OpenFileCommandLineCWD<cr>
NewMap -n -no ,,.      :OpenFileCommandLineSameDir<cr>
NewMap -n -no ,.              :call CommandLineFiles(Folder_Up(v:count, 0))<cr>
NewMap -n -no ,,.              :call CommandLineFiles(Folder_Up(v:count, 1))<cr>
NewMap -n -no ,,,.              :call CommandLineFiles(Folder_Up(v:count, 2))<cr>
NewMap -n -no ,,,,.              :call CommandLineFiles(Folder_Up(v:count, 3))<cr>
NewMap -n -no ,,,,,.              :call CommandLineFiles(Folder_Up(v:count, 4))<cr>
" C - \e
NewMap -c -no -un <C-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
" C - \e
NewMap -c -no -un <M-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
" C - \e
NewMap -c -no -un <S-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
" C - \e
NewMap -c -no -un <C-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
" C - \e
NewMap -c -no -un <M-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
" C - \e
NewMap -c -no -un <S-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>

" C - \ C - n
" cnoremap <C-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-2], '/')]<cr>

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
" C - \e
" cnoremap <C-BS> <C-\>eDeleteBackToSlash()<cr>

" C - \e
" cnoremap <C-Del> <C-\>estrpart(getcmdline(), 0, getcmdpos()-1) . strpart(getcmdline(), stridx(getcmdline()[getcmdpos()-1:], '/') + getcmdpos())<cr>

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
"
" C - \e
" cnoremap <C-Del> <C-\>eDeleteForwardToSlash()<cr>

" C - \e
" cnoremap <C-BS> <C-\>e substitute(getcmdline()[:getcmdpos()-2], '/[^/]*$', '/', '')<cr>

" C - \e
" cnoremap <C-Del> <C-\>e substitute(getcmdline(), '\(.\{' . (getcmdpos()-1) . '}\)[^/]*\(.*\)', '\1\2', '')<cr>

" Add functionality, to delete the last dir
NewMap -c -no <C-,> <Backspace>
NewMap -c -no <C-.> <Backspace>

" nnoremap <S-Tab> :call StepFile_popup(0, 0)<cr>
" nnoremap <Tab> :call StepFile_popup(0, 0)<cr>

NewMap -n -no ,cd :call MakeDirCurrentCWD(bufnr())<cr>
" :MakeDirCurrentProject<cr>
" nnoremap ,.. :call CD('..')<cr>
" nnoremap ,, :call CD('..')<cr>
"" nnoremap .. :call CD(split(w:relative_path,'/')[0])<cr>
" unmap ..

NewMap -n -no <C-Left> :call CD(WFilePrev())<cr>
NewMap -n -no <C-Right> :call CD(WFileNext())<cr>

NewMap -n -no <C-,> :call CD(WFilePrev())<cr>
NewMap -n -no <C-.> :call CD(WFileNext())<cr>

" nnoremap ,,         :JumpProjectUp<cr>
" nnoremap <>>  :JumpProjectStepwise<cr>
" nnoremap <localleader><localleader>   :JumpProjectUp<cr>
" nnoremap <localleader>,        :JumpProjectR<cr>
" nnoremap ,<localleader>        :JumpProjectR<cr>
" nnoremap <C-Up>                       :JumpProjectDump<cr>

NewMap -n -no ,<Tab>      :JumpProjectIn<cr>
NewMap -n -no <localleader><Tab> :JumpProjectIn<cr>

" C - u
NewMap -v -no <F14> :call VS()<cr>
NewMap -n -no <F13> :call VS()<cr>
" C - o
NewMap -i -no <F13> :call VS()<cr>
NewMap -c -no <F13> :call VS('c')<cr>
" C - \ C - n
NewMap -t -no <F13> :call VS('t')<cr>

NewMap -no -n <M-v> :call FuncPaste("Normal")<cr>
NewMap -no -n <M-c> :call FuncCopy("Normal")<cr>
NewMap -no -n <M-x> :call FuncCut("Normal")<cr>
NewMap -no ,,,j :IntelligentJumping<cr>

" exec "nmap ,R :!bash ".g:lastRunCommand." -e ".$workdir."/.bashrc<cr>"
" exec "nmap ,r :!bash ".g:lastRunCommand." -e ".$workdir."/.bashrc<cr>"
menu Run.Show :call ToggleRun()
menu Projects.Show :call ToggleProjects()
" todo add silent
NewMap -no -n <c-h> :wincmd h<cr>
NewMap -no -n <c-j> :wincmd j<cr>
NewMap -no -n <c-k> :wincmd k<cr>
NewMap -no -n <c-l> :wincmd l<cr>
" menu Actions.SED :call NvimStudioSubstitution()<cr>
" noremap ,v :normal viW"ay<cr>:echo <c-r>a<cr>

" todo add silent
" NewMap -v -no p "_dP
" NewMap -v -no y y:call ClipboardYank()<cr>
" NewMap -v -no d d:call ClipboardYank()<cr>
" NewMap -n -no dd dd:call ClipboardYank()<cr>
" NewMap -n -no p :call ClipboardPaste("n")<cr>p

" C - U
NewMap -v -no p :let vlcb = getpos("'<")[1:2] \| let vlce = getpos("'>")[1:2] \| call ClipboardPaste("v")<cr>p
NewMap -no -n <BS> :call backspaceN()<cr>
" was cmap
NewMap -no -c <A-'> ä
" was cmap
NewMap -no -c <A-"> Ä
" was cmap
NewMap -no -c <A-;> ö
" was cmap
NewMap -no -c <A-:> Ö
" was cmap
NewMap -no -c <A-[> ü
" was cmap
NewMap -no -c <A-{> Ü
" was cmap
NewMap -no -c <A--> ß
" was cmap
NewMap -no -n ,F :echo VS()<cr>

NewMap -no -n ,e :call AppendToEndNormal()<cr>
NewMap -no -n ,E :AppendAll<cr>

NewMap -n -no YY :call AppendToClipboard()<cr>
" :C - u
NewMap -v -no Y :let @+ = @+ . join(getline("'<", "'>"), "\n") . "\n"<cr>
" noremap <expr> ,,s ShowMode()

" Move Lines
" todo add silent
NewMap -n -no <A-k> :m-2<cr>
NewMap -n -no <A-j> :m+1<cr>
NewMap -v -no <A-k> :m '<-2<cr>gv=gv
NewMap -v -no <A-j> :m '>+1<cr>gv=gv

NewMap -un -no < <<
NewMap -un -no > >>
NewMap -v -no < <gv
NewMap -v -no > >gv

NewMap -no -n ,dt :diffthis<cr>
NewMap -no -n ,do :diffoff<cr>

NewMap -no -n ,0 :wincmd =<cr>

NewMap -i -no <C-Space> <C-x><C-f>
" NewMap -no ,ga :!git add .<cr>
" NewMap -no ,gs :!git status %<cr>

" Ut <F12> :call QuickYank()<cr>
" nnoremap <F12> :call QuickYank()<cr>
" Ut <S-F12> :call QuickYank('paste')<cr>
" Ut <C-F12> :call QuickYank('init')<cr>
" map <F12> :call setreg('*', CWD()[0]..'/'..expand('%')..':'..line('.'))<cr>
" map <S-F12> i<c-r>*


" C - u
" vnoremap <C-S-v> :<cr>
" Buggy
" NewMap -n -no <C-S-v> :norm "+p
" NewMap -n -no <C-V> :norm "+p
" unmap <C-S-v>
NewMap -i -no <C-S-v> <c-r>+
" nnoremap <C-v> :norm "+p
" inoremap <C-v> <c-r>+
" nnoremap <C-v>
" inoremap <C-v>
" NewMap -no -n ,v :visualblock<cr>

" NewMap -no -n ,v :Vim<cr>
" unmap ,v
" NewMap -no -unmap ,v
" " C - o
" inoremap <C-S-v> :<cr>
" cnoremap <C-S-v> :<cr>
" C - \ C - n
" tnoremap <C-S-v> :<cr>
" let seperator=len(args)>0?', ':''

" Ut <F2> :call ToggleShortenPath()<cr>
" command :call ToggleShortenPath()<cr>
command! -nargs=0 ShortenPath call ToggleShortenPath()

function! DBG()
  echo CWD()
  echo RELATIVE()
  echo ABSOLUTE()
endfunction

" NewMap -no -n ,a :y \| :let a=split(@", "\n")<cr>
" NewMap -no -n ,A =remove(a,0)<cr>
" qq
" f,f,a "
" <C-r>=remove(a,0)
" "
" <Esc>/<C-c>
" j0
" q

" NewMap -no -n <C-x> :call Assign()<cr>
" NewMap -no -n ,<C-x> :call Deassign()<cr>

" NewMap -no -n ,p :call PutKey()<cr>

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


NewMap -no -n ,rm :call DeleteFile()<cr>
NewMap -no -n ,n :call NewFile()<cr>

" map ,< :norm d\<C-w>lGopG\<C-w>h
" map ,< :execute 'normal! \<C-w>l'<cr>
" map ,< :execute 'normal! \<C-w>l'<cr>
" map ,< :execute 'normal! \<C-w>l'<cr>
NewMap -no -n ,< :norm yy<cr>
  \:norm dd<cr>
  \:wincmd l<cr>
  \:norm gp<cr>
  \:wincmd h<cr>

NewMap -no -v ,< :norm gvy<cr>
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

NewMap -n -no ,<C-S-M-h> :echo MoveOutOfSplit("h")<cr>
NewMap -n -no ,<C-S-M-j> :echo MoveOutOfSplit("j")<cr>
NewMap -n -no ,<C-S-M-k> :echo MoveOutOfSplit("k")<cr>
NewMap -n -no ,<C-S-M-l> :echo MoveOutOfSplit("l")<cr>

" nnoremap <F1> :call Help()<cr>

NewMap -no -n <C-;> zh
NewMap -no -n <C-'> zl
NewMap -no -n <C-S-;> 20zh
NewMap -no -n <C-S-'> 20zl


" ---- quickfix navigation -------------------------------------------
" todo add silent
NewMap -n -no ,f  :copen<cr>
NewMap -n -no <C-Down>   :cnext<cr>zz
NewMap -n -no <C-Up>     :cprev<cr>zz
NewMap -n -no ,N  :cfirst<cr>zz
NewMap -n -no ,P  :clast<cr>zz
NewMap -n -no ,c  :cclose<cr>

" " ---- location list navigation --------------------------------------
" nnoremap <silent> ,lq :lopen<cr>
" " nnoremap <silent> <C-Down>   :lnext<cr>zz
" " nnoremap <silent> <C-Up>     :lprev<cr>zz
" nnoremap <silent> ,lN :lfirst<cr>zz
" nnoremap <silent> ,lP :llast<cr>zz

NewMap -no -n -key ,<C-s> :call ExecFunction()<cr>
NewMap -no -v -n ,s :call ExecVS()<cr>
NewMap -no -n -key ,S :Re \| :%source \| :ReEnd<cr>
NewMap -no -n -key ,rd :call RedoLeaderS()<cr>

"!! source even with comment # // " literals
" NewMap -no <F6> :autocmd! BufAdd,BufCreate,BufDelete,BufWipeout,BufNew,BufEnter,BufLeave,WinEnter,BufWinEnter,BufUnload *<cr>
" NewMap -no <F7> :autocmd! BufEnter * :call F.Buffer.Find(bufnr()).Print()<cr>
" NewMap -no <F8> :call Display()<cr>

NewMap -no ,c :call ToggleComment()<cr>

NewMap -no -v <F1> J
NewMap -no -n <F2> :call GetKeys()<cr>
NewMap -no -n <F3> :call FindKeyPerform()<cr>
NewMap -no -n <F4> :echo AllKeys()<cr>

" C - \ C - n
NewMap -no -t <C-v> :call SendCommandToThisTerm([getreg('"')])<cr>i
" <C-S-v> works but be aware of copying the newline characters. they execute
" commands immedietly.

" C - u
NewMap -no -v ,,s :silent redir=>output \| silent '<,'>source \| redir END \| put=output<cr>

" NewMap -no -n <F8> <C-w>p
" C - u
" NewMap -v -no <F8> :call SavedCommandToTerm("l")<cr>
" C - u
" NewMap -n -no <F8> :call SavedCommandToTerm("l")<cr>

" C - u
" NewMap -n -no <F5> :call RedoCommandToTerm("l")<cr>

NewMap -no -n ,aa :RECP --reg *<cr>
NewMap -no -n ,an :RECP --reg "<cr>
NewMap -no -n ,ab :RECP<cr>

" NewMap -no -n ,m :call TabBuffers('merge')<cr>
" NewMap -no -n <F1> :call TabBuffers('next')<cr>
" NewMap -no -n <S-F1> :call TabBuffers('prev')<cr>

" Variants / Extending Command Line Experience
" NewMap -no <expr> ,,nomap0 :echo "vimgrep term **/*.ext" \| :call feedkeys(':vimgrep ')
" NewMap -no ,,nomap2 :call input("vimgrep term **/*.ext\n") \| call feedkeys(':')
" NewMap -no ,,nomap3 :echo "vimgrep term **/*.ext"<cr> \| :call feedkeys(':')<cr>
" NewMap -no ,,nomap4 <expr> ,,vg call echo("tset") \| call feedkeys(':')
" NewMap -no ,,nomap5 :execute input("hint\n:")<cr>
" NewMap -no ,,,f :call feedkeys(':'..input("hint\n:").."\n")<cr>
" NewMap -no ,,f :call feedkeys(':'..input("hint\n:").."\n")<cr>
" NewMap -no ,f :call feedkeys(':'..input("hint\n:").."\n")<cr>
" NewMap -no ,,,,f :C test abc def geh "OKAY DU?"<cr>

" NewMap -no reduces spaces in commands - opts.args_string
" NewMap -no -n ,vo :copen<cr>

" NewMap -no -n -leaders 0:10 -key {leaders}vg :call VimGrep(v:count)<cr>

NewMap -no -n -key <S-Up> :call VimGrep(v:count)<cr>
" Further Investigation :Lines
" Integrate VimGrep
" Todo - ArrowKeys Set State Command Line VimGrep C-h Moves Folder Up in ../**/*
NewMap -no -n <M-a> :Lines<cr>
NewMap -no -n <S-Down> :call VimGrep(v:count)<cr>
NewMap -no -n <C-S-Up> :vimgrep "todo" $folderrepo/**/*<cr>

function VimGrep(count) abort
  " :copen<cr>:vimgrep "" **/*[D[D[D[D[D
  let x=""
  let i=0
  for i in range(a:count)
    let x.="../"
    let i =+ 1
  endfor
  let command=input(':', "vimgrep \"\" "..x.."**/*\<Home>\<Right>\<Right>\<Right>\<Right>\<Right>\<Right>\<Right>\<Right>\<Right>")
  exec command
  copen
endfunction

" NewMap -no -n [1;5A :call VimGrep(v:count)<cr>
" NewMap -no -n [D :cclose<cr>
" NewMap -no -n [C :copen<cr>
" NewMap -no -n [A :cprev<cr>
" NewMap -no -n [B :cnext<cr>
NewMap -no -n <Left> :cclose<cr>
NewMap -no -n <Right> :copen<cr>
NewMap -no -n <Up> :cprev<cr>
NewMap -no -n <Down> :cnext<cr>

" Keymaps
" Dont -no NewMap this (Its A Fix For Ctrl+i triggering Tab)
nnoremap <C-i> <C-i>
" NewMap -no <F1> :call NextBuffer()<cr>
" NewMap -no <S-F1> :call PrevBuffer()<cr>
" C - \ C - o
" NewMap -t -no <F1> <C-\>:call NextBuffer()<cr>
" C - \ C - o
" NewMap -t -no <S-F1> <C-\>:call PrevBuffer()<cr>
" NewMap -no <Tab> :call NextBuffer()<cr>
" NewMap -no <S-Tab> :call PrevBuffer()<cr>
"

" NewMap -no -n ,e :Equal<cr>
" NewMap -no -n <F9>   :call Width(20)<cr>
" NewMap -no -n <S-F9> :call Width(20)<cr>
" NewMap -no -n <F10>   :call Height(20)<cr>
" NewMap -no -n <S-F10> :call Height(20)<cr>
""" NewMap -no -n <F9> :Equal<cr>
""" NewMap -no -n <S-F9> :Bigger<cr>
""" NewMap -no -all <F10> :call RefreshFileListDir()<cr>:call NextBuffer()<cr>
""" NewMap -no -all <S-F10> :call RefreshFileListDir()<cr>:call PrevBuffer()<cr>
""" NewMap -no -all <F11> :call RefreshFileList()<cr>:call NextBuffer()<cr>
""" NewMap -no -all <S-F11> :call RefreshFileList()<cr>:call PrevBuffer()<cr>
""" " todo same with git-projects/projects systemwide
""" NewMap -no -n <F12> :call ToggleFavorite(1)<cr>
""" NewMap -no -n <S-F12> :call ToggleFavorite(-1)<cr>
""" NewMap -no -n <C-F12> :call OpenFZF(g:favorites)<cr>
""" NewMap -no -n ,<F12> :call SetUnsetFavorite()<cr>
""" NewMap -no -n ,,<F12> :call ClearUnreachableFavorites()<cr>
" :call MakeDirCurrentCWD(bufnr())<cr>
"
NewMap -no -n <F9> :Pull<cr>
NewMap -no -n <C-F9> :GitFetch<cr>

NewMap -no -n <F10> :Status<cr>
NewMap -no -n <C-F10> :Diff --all<cr>
NewMap -no -n <C-S-F10> :Diff --all --cached<cr>
NewMap -no -n <S-F10> :Log<cr>

NewMap -no -n <C-F11> :GitAdd<cr>
NewMap -no -n <C-S-F11> :GitAddCWD<cr>

NewMap -no -n <F12> :PushCWD  
NewMap -no -n <C-F12> :DecidePush<cr>
NewMap -no -n ,qcc :!git rebase --continue<cr>
NewMap -no -n ,qcs :!git rebase --skip<cr>
NewMap -no -n ,qca :!git rebase --abort<cr>
NewMap -no -n ,<F12> :StashPush<cr>
NewMap -no -n ,,<F12> :StashPop<cr>


" map <F2> :echo t:buffers<cr>
" map <F3> :echo FullPaths(t:buffers)<cr>

function! SelectFunctionBlock(...)
  call search(FunctionName(3), 'bcW')
endfunction
command! -range -nargs=* SelectFunctionBlock call SelectFunctionBlock(<f-args>)
NewMap -no ,,,,,<F1> :call SelectFunctionBlock()<cr>

NewMap -no <F1> :call GitInfo()<cr>
NewMap -no <S-F1> :call GitInfo('--stash')<cr>
NewMap -no <C-S-F1> :call GitStashDrop()<cr>
NewMap -no ,,,,<F3> :call GitDeleteLastUnpushedCommit()<cr>
NewMap -no ,,,<F1> :call GitCommitRepo()<cr>
NewMap -no ,,<F1> :call GitCommitRepo(input("Commit Message: "))<cr>
NewMap -no ,<F1> :call GitAddRepo()<cr>
NewMap -no ,,,,,<F1> :call GitInitRepository()<cr>
NewMap -no ,,,,,,<F1> :call GitInitRepositoryBare()<cr>

NewMap -no <F2> :call SelectRemote(1)<cr>
NewMap -no <S-F2> :call SelectRemote(-1)<cr>
NewMap -no ,<F2> :call GitRenameRemote()<cr>
NewMap -no ,,<F2> :call GitRemoteAdd()<cr>
NewMap -no ,,,<F2> :call GitSetRemote()<cr>

NewMap -no <F3> :call SelectBranch(1)<cr>
NewMap -no <S-F3> :call SelectBranch(-1)<cr>
NewMap -no ,<F3> :call GitRenameBranch()<cr>
NewMap -no ,,<F3> :call GitNewBranch()<cr>

NewMap -no <F4> :call GitStashPush()<cr>
NewMap -no <S-F4> :call GitStashPop()<cr>
NewCommand command! -range -nargs=* RenameRemote call GitRenameRemote(<f-args>)
NewCommand command! -range -nargs=* SetRemote call GitSetRemote(<f-args>)
NewCommand command! -range -nargs=* RenameBranch call GitRenameBranch(<f-args>)
NewCommand command! -range -nargs=* RemoteAdd call GitRemoteAdd(<f-args>)
NewCommand command! -range -nargs=* NewBranch call GitNewBranch(<f-args>)

NewMap -t -no -un <C-v> <C-\><C-n>
"  C - c
NewMap -v -no i <C-c>i
"  C - c
NewMap -no -v <C-c> :call CommandInfo()<cr>

endif
