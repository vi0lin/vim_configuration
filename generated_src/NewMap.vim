nnoremap <silent> <C-S-o> :call JumpToNextFile(-1)<cr>
nnoremap <silent> <C-S-i> :call JumpToNextFile(1)<cr>
nnoremap <C-s> <Nop>
inoremap <C-s> <Nop>
vnoremap <C-s> <Nop>
map ,,f :call FavoriteFile()<cr>
map ,,f :call FavoriteFile()<cr>
map ,,p :call FavoritePath()<cr>
map <C-8> :call Favorite()<cr>
map <F9> :Equal<cr>
map <S-F9> :Bigger<cr>
nnoremap ,s :so %<cr>
map <C-Space> :call SelectCommand()<cr>
map ,t :Tidy<cr>
noremap <M-q> :q<cr>
tnoremap <M-q> <c-\><c-n>:q<cr>
vnoremap <F5> :<C-u>call SendCommandToTerm("h")<cr>
vnoremap <F6> :<C-u>call SendCommandToTerm("j")<cr>
vnoremap <F7> :<C-u>call SendCommandToTerm("k")<cr>
vnoremap <F8> :<C-u>call SendCommandToTerm("l")<cr>
inoremap <F5> <C-o>:call SendCommandToTerm("h")<cr>
inoremap <F6> <C-o>:call SendCommandToTerm("j")<cr>
inoremap <F7> <C-o>:call SendCommandToTerm("k")<cr>
inoremap <F8> <C-o>:call SendCommandToTerm("l")<cr>
nnoremap <F5> :call SendCommandToTerm("h")<cr>
cnoremap <F5> :call SendCommandToTerm("h")<cr>
nnoremap <F6> :call SendCommandToTerm("j")<cr>
cnoremap <F6> :call SendCommandToTerm("j")<cr>
nnoremap <F7> :call SendCommandToTerm("k")<cr>
cnoremap <F7> :call SendCommandToTerm("k")<cr>
nnoremap <F8> :call SendCommandToTerm("l")<cr>
cnoremap <F8> :call SendCommandToTerm("l")<cr>
tnoremap <F5> <C-\><C-n>:call SendCommandToTerm("h")<cr>
tnoremap <F6> <C-\><C-n>:call SendCommandToTerm("j")<cr>
tnoremap <F7> <C-\><C-n>:call SendCommandToTerm("k")<cr>
tnoremap <F8> <C-\><C-n>:call SendCommandToTerm("l")<cr>
vnoremap <C-F5> :<C-u>call RedoCommandToTermWithSigTerm("h")<cr>
vnoremap <C-F6> :<C-u>call RedoCommandToTermWithSigTerm("j")<cr>
vnoremap <C-F7> :<C-u>call RedoCommandToTermWithSigTerm("k")<cr>
vnoremap <C-F8> :<C-u>call RedoCommandToTermWithSigTerm("l")<cr>
inoremap <C-F5> <C-o>:call RedoCommandToTermWithSigTerm("h")<cr>
inoremap <C-F6> <C-o>:call RedoCommandToTermWithSigTerm("j")<cr>
inoremap <C-F7> <C-o>:call RedoCommandToTermWithSigTerm("k")<cr>
inoremap <C-F8> <C-o>:call RedoCommandToTermWithSigTerm("l")<cr>
nnoremap <C-F5> :call RedoCommandToTermWithSigTerm("h")<cr>
cnoremap <C-F5> :call RedoCommandToTermWithSigTerm("h")<cr>
nnoremap <C-F6> :call RedoCommandToTermWithSigTerm("j")<cr>
cnoremap <C-F6> :call RedoCommandToTermWithSigTerm("j")<cr>
nnoremap <C-F7> :call RedoCommandToTermWithSigTerm("k")<cr>
cnoremap <C-F7> :call RedoCommandToTermWithSigTerm("k")<cr>
nnoremap <C-F8> :call RedoCommandToTermWithSigTerm("l")<cr>
cnoremap <C-F8> :call RedoCommandToTermWithSigTerm("l")<cr>
tnoremap <C-F5> <C-\><C-n>:call RedoCommandToTermWithSigTerm("h")<cr>
tnoremap <C-F6> <C-\><C-n>:call RedoCommandToTermWithSigTerm("j")<cr>
tnoremap <C-F7> <C-\><C-n>:call RedoCommandToTermWithSigTerm("k")<cr>
tnoremap <C-F8> <C-\><C-n>:call RedoCommandToTermWithSigTerm("l")<cr>
vnoremap <S-F5> :<C-u>call RedoCommandToTerm("h")<cr>
vnoremap <S-F6> :<C-u>call RedoCommandToTerm("j")<cr>
vnoremap <S-F7> :<C-u>call RedoCommandToTerm("k")<cr>
vnoremap <S-F8> :<C-u>call RedoCommandToTerm("l")<cr>
inoremap <S-F5> <C-o>:call RedoCommandToTerm("h")<cr>
inoremap <S-F6> <C-o>:call RedoCommandToTerm("j")<cr>
inoremap <S-F7> <C-o>:call RedoCommandToTerm("k")<cr>
inoremap <S-F8> <C-o>:call RedoCommandToTerm("l")<cr>
nnoremap <S-F5> :call RedoCommandToTerm("h")<cr>
cnoremap <S-F5> :call RedoCommandToTerm("h")<cr>
nnoremap <S-F6> :call RedoCommandToTerm("j")<cr>
cnoremap <S-F6> :call RedoCommandToTerm("j")<cr>
nnoremap <S-F7> :call RedoCommandToTerm("k")<cr>
cnoremap <S-F7> :call RedoCommandToTerm("k")<cr>
nnoremap <S-F8> :call RedoCommandToTerm("l")<cr>
cnoremap <S-F8> :call RedoCommandToTerm("l")<cr>
tnoremap <S-F5> <C-\><C-n>:call RedoCommandToTerm("h")<cr>
tnoremap <S-F6> <C-\><C-n>:call RedoCommandToTerm("j")<cr>
tnoremap <S-F7> <C-\><C-n>:call RedoCommandToTerm("k")<cr>
tnoremap <S-F8> <C-\><C-n>:call RedoCommandToTerm("l")<cr>
vnoremap <C-S-F5> :<C-u>call SigTermToTerm("h")<cr>
vnoremap <C-S-F6> :<C-u>call SigTermToTerm("j")<cr>
vnoremap <C-S-F7> :<C-u>call SigTermToTerm("k")<cr>
vnoremap <C-S-F8> :<C-u>call SigTermToTerm("l")<cr>
inoremap <C-S-F5> <C-o>:call SigTermToTerm("h")<cr>
inoremap <C-S-F6> <C-o>:call SigTermToTerm("j")<cr>
inoremap <C-S-F7> <C-o>:call SigTermToTerm("k")<cr>
inoremap <C-S-F8> <C-o>:call SigTermToTerm("l")<cr>
nnoremap <C-S-F5> :call SigTermToTerm("h")<cr>
cnoremap <C-S-F5> :call SigTermToTerm("h")<cr>
nnoremap <C-S-F6> :call SigTermToTerm("j")<cr>
cnoremap <C-S-F6> :call SigTermToTerm("j")<cr>
nnoremap <C-S-F7> :call SigTermToTerm("k")<cr>
cnoremap <C-S-F7> :call SigTermToTerm("k")<cr>
nnoremap <C-S-F8> :call SigTermToTerm("l")<cr>
cnoremap <C-S-F8> :call SigTermToTerm("l")<cr>
tnoremap <C-S-F5> <C-\><C-n>:call SigTermToTerm("h")<cr>
tnoremap <C-S-F6> <C-\><C-n>:call SigTermToTerm("j")<cr>
tnoremap <C-S-F7> <C-\><C-n>:call SigTermToTerm("k")<cr>
tnoremap <C-S-F8> <C-\><C-n>:call SigTermToTerm("l")<cr>
vnoremap . :<Up><cr>
Amap ,h     :call Open("h", "buffer", "new")<cr>
Amap ,j     :call Open("j", "buffer", "new")<cr>
Amap ,k     :call Open("k", "buffer", "new")<cr>
Amap ,l     :call Open("l", "buffer", "new")<cr>
Amap ,H     :call Open("H", "buffer", "new")<cr>
Amap ,J     :call Open("J", "buffer", "new")<cr>
Amap ,K     :call Open("K", "buffer", "new")<cr>
Amap ,L     :call Open("L", "buffer", "new")<cr>
Amap ,,h     :call Open("h", "terminal", "new")<cr>
Amap ,,j     :call Open("j", "terminal", "new")<cr>
Amap ,,k     :call Open("k", "terminal", "new")<cr>
Amap ,,l     :call Open("l", "terminal", "new")<cr>
Amap ,,H     :call Open("H", "terminal", "new")<cr>
Amap ,,J     :call Open("J", "terminal", "new")<cr>
Amap ,,K     :call Open("K", "terminal", "new")<cr>
Amap ,,L     :call Open("L", "terminal", "new")<cr>
Amap <A-H>     :call Open("H", "buffer", "new")<cr>
Amap <A-J>     :call Open("J", "buffer", "new")<cr>
Amap <A-K>     :call Open("K", "buffer", "new")<cr>
Amap <A-L>     :call Open("L", "buffer", "new")<cr>
Amap <A-S-h>     :call Open("h", "terminal", "new")<cr>
Amap <A-S-j>     :call Open("j", "terminal", "new")<cr>
Amap <A-S-k>     :call Open("k", "terminal", "new")<cr>
Amap <A-S-l>     :call Open("l", "terminal", "new")<cr>
Amap <A-S-H>     :call Open("H", "terminal", "new")<cr>
Amap <A-S-J>     :call Open("J", "terminal", "new")<cr>
Amap <A-S-K>     :call Open("K", "terminal", "new")<cr>
Amap <A-S-L>     :call Open("L", "terminal", "new")<cr>
Amap <A-S-Left>     :call Open("h", "terminal", "new")<cr>
Amap <A-S-Down>     :call Open("j", "terminal", "new")<cr>
Amap <A-S-Up>       :call Open("k", "terminal", "new")<cr>
Amap <A-S-Right>    :call Open("l", "terminal", "new")<cr>
Amap <A-S-Left>     :call Open("H", "terminal", "new")<cr>
Amap <A-S-Down>     :call Open("J", "terminal", "new")<cr>
Amap <A-S-Up>       :call Open("K", "terminal", "new")<cr>
Amap <A-S-Right>    :call Open("L", "terminal", "new")<cr>
Amap <A-Left>       :call Open("h", "buffer", "new")<cr>
Amap <A-Down>       :call Open("j", "buffer", "new")<cr>
Amap <A-Up>         :call Open("k", "buffer", "new")<cr>
Amap <A-Right>      :call Open("l", "buffer", "new")<cr>
Amap <A-Left>       :call Open("H", "buffer", "new")<cr>
Amap <A-Down>       :call Open("J", "buffer", "new")<cr>
Amap <A-Up>         :call Open("K", "buffer", "new")<cr>
Amap <A-Right>      :call Open("L", "buffer", "new")<cr>
Amap <C-q> :hide<cr>
Amap <C-S-q> :bd!<cr>
Amap <C-S-q> :q!<cr>
Amap <C-A-q> :qa!<cr>
Amap <A-q> :call TabClose()<cr>
Amap ,,r :redraw!<cr>
Amap <S-F2> :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
Amap ,c call CountRegex()<cr>
nmap <C-S-A> :call IncRange()<cr>
nmap <C-S-X> :call DecRange()<cr>
vmap af :call Vaf()<cr>
vmap <C-S-A> :call IncRange()<cr>
vmap <C-S-X> :call DecRange()<cr>
tmap ,X :TIN tail -f $receiver<cr>
map <A-S-n> <C-w>+
map <A-S-m> <C-w>-
map <A-S-u> <C-w><
map <A-S-i> <C-w>>
map <A-n> 12<C-w>+
map <A-m> 12<C-w>-
map <A-u> 12<C-w><
map <A-i> 12<C-w>>
map <A-h> :call TabH()<cr>
map <A-l> :call TabL()<cr>
map <C-S-M-h> :wincmd H<cr>
map <C-S-M-j> :wincmd J<cr>
map <C-S-M-k> :wincmd K<cr>
map <C-S-M-l> :wincmd L<cr>
map <C-S-h> :call SwapWin("h")<cr>
map <C-S-j> :call SwapWin("j")<cr>
map <C-S-k> :call SwapWin("k")<cr>
map <C-S-l> :call SwapWin("l")<cr>
tnoremap <C-S-h> <c-\><c-n>:call SwapWin("h")<cr>
tnoremap <C-S-j> <c-\><c-n>:call SwapWin("j")<cr>
tnoremap <C-S-k> <c-\><c-n>:call SwapWin("k")<cr>
tnoremap <C-S-l> <c-\><c-n>:call SwapWin("l")<cr>
nnoremap ,fuc :call OpenFileUnderCursor()<cr>
nnoremap ,,fb :LayoutBash<cr>
nnoremap ,,fv :LayoutVim<cr>
map <m-;> :call ToggleOverviewRight()<cr>
map ,,<F4> :redraw \\| let c=input("Test: ")<cr>!source ".$workdir."/.bashrc; git_selector "TEST"
map <C-S-F9> :call PreviewBuffer()<cr>
map <C-F2> :call ToggleWrap()<cr>
map ,,,w :call ToggleWrap()<cr>
map ,in :call Intend()<cr>
map ,,,<space> :IntelligentSelecting<cr>
map ,. @q
vmap <C-l> <C-w>l
vmap <C-h> <C-w>h
vmap <C-k> <C-w>k
vmap <C-j> <C-w>j
nnoremap <silent> <C-h> :call SmartWincmd('h')<cr>
nnoremap <silent> <C-j> :call SmartWincmd('j')<cr>
nnoremap <silent> <C-k> :call SmartWincmd('k')<cr>
nnoremap <silent> <C-l> :call SmartWincmd('l')<cr>
vmap <BS> :call backspace()<cr>
vmap & :&<cr>
vmap ,F :echo VS()<cr>
vmap ,,g :call AppendToEndRange()<cr>
vmap ,G :AppendAll<cr>
vmap ,u :!uniq<cr>
vmap <M-v> :call VPaste("Visual")<cr>
vmap <M-c> :call VCopy("Visual")<cr>
vmap <M-x> :call VCut("Visual")<cr>
tmap <c-o> <c-\><c-n><c-o>
imap <C-l> <C-w>li
imap <C-h> <C-w>hi
imap <C-j> <C-w>ji
tmap <C-h> <C-\><C-n><C-h>h
tmap <C-j> <C-\><C-n><C-j>j
tmap <C-k> <C-\><C-n><C-k>k
tmap <C-l> <C-\><C-n><C-w>l
tmap <C-h> <C-h>h
tmap <C-j> <C-j>j
tmap <C-k> <C-k>k
tmap <C-l> <C-w>l
tnoremap <C-l> <C-\><C-n>:wincmd l<cr>
tnoremap <C-h> <C-\><C-n>:wincmd h<cr>
tnoremap <C-k> <C-\><C-n>:wincmd k<cr>
tnoremap <C-j> <C-\><C-n>:wincmd j<cr>
tnoremap <C-l> l<cr>
tnoremap <C-h> h<cr>
tnoremap <C-k> k<cr>
tnoremap <C-j> j<cr>
imap <c-w><c-w> <c-w><c-w>
tmap  :call ExitTerminal()<cr>
imap <A-'> ä
imap <A-"> Ä
imap <A-;> ö
imap <A-:> Ö
imap <A-[> ü
imap <A-{> Ü
imap <A--> ß
tmap <ScrollWheelUp> <C-\><C-n>
tmap <S-ScrollWheelUp> <C-\><C-n>
tmap <ScrollWheelDown> <C-\><C-n>
tmap <S-ScrollWheelDown> <C-\><C-n>
tmap <Esc> i
tmap <LeftMouse> <C-\><C-n>
map ,,,m :call Toggle_Set_Last_Git_Message()<cr>
map ,,,l :call ToggleLineState()<cr>
map ,,,L :call ToggleLineStateGlobal()<cr>
map ,,s :call Statusline_TogglePath()<cr>
map ,,d :echo g:debug_layout<cr>
map ,,B :call Boilerplate_Test()<cr>
map ,<Space> :call GetCCWD()<cr>
nmap <silent> <C-s> :SaveFile<cr>
vmap <silent> <C-s> :SaveFile<cr>
imap <silent> <C-s> :SaveFile<cr>l
nnoremap <localleader>f :InsertFunction<cr>
nnoremap <space>f :InsertFilename<cr>
map ,<Space> :call ToggleZoom()<cr>
map <silent> <S-F1> :SearchCword<cr>
map ,b :call BASH(VS())<cr>
map ,b :call Bash(VS())<cr>
map ,b :Buffers<cr>
map ,b :Buffers<cr>
map <localleader>iv :call VIM(input("vimscript: "), 'exec_input_vs')<cr>
map <localleader>ib :call BASH(input("bash: "), 'exec_input_vs')<cr>
map <localleader>ip :call PYTHON(input("python: "), 'exec_input_vs')<cr>
map <localleader>ir :call RUST(input("rust: "), 'exec_input_vs')<cr>
nnoremap <space>p :CopyFileNameToClipboard<cr>
nnoremap <space>P :CopyWholePathToClipboard<cr>
nnoremap <space>r :InsertReceiver<cr>
nnoremap ,dd :call Rewindworkdir()<cr>
map ,<Space>                                         :call Files(Folder_Up(v:count, 0))<cr>
map ,,<Space>                                 :call Files(Folder_Up(v:count, 1))<cr>
map ,,,<Space>                         :call Files(Folder_Up(v:count, 2))<cr>
map ,,,,<Space>                 :call Files(Folder_Up(v:count, 3))<cr>
map ,,,,,<Space>         :call Files(Folder_Up(v:count, 4))<cr>
map ,,,,,,<Space> :call Files(Folder_Up(v:count, 5))<cr>
map ,g                                         :call AgIn(Folder_Up(v:count, 0))<cr>
map ,,g                                 :call AgIn(Folder_Up(v:count, 1))<cr>
map ,,,g                         :call AgIn(Folder_Up(v:count, 2))<cr>
map ,,,,g                 :call AgIn(Folder_Up(v:count, 3))<cr>
map ,,,,,g         :call AgIn(Folder_Up(v:count, 4))<cr>
map ,,,,,,g :call AgIn(Folder_Up(v:count, 5))<cr>
map ,vcd :call CD(Vim_Advantages_Path())<cr>
map ,p                :call Projects()<cr>
map ,,p               :call Projects()<cr>
map ,,,p              :call Projects()<cr>
map ,,,,p             :call Projects()<cr>
map ,,,,,p            :call Projects()<cr>
map ,,,,,,p           :call Projects()<cr>
noremap <C-p>              :call Projects()<cr>
noremap <C-S-p>            :call Projects()<cr>
noremap <A-p>              :call Projects()<cr>
noremap <A-S-p>            :call Projects()<cr>
noremap <A-C-p>            :call Projects()<cr>
noremap <A-S-C-p>          :call Projects()<cr>
map <C-S-p>           :call BuildSystemsGitProjects()<cr>
map <C-S-m>           :Generate<cr>
noremap <C-Space>              :call Files(Folder_Project())<cr>
noremap <C-S-Space>            :call Files(Folder_Repo())<cr>
noremap <A-Space>              :call Files(Folder_Repo())<cr>
noremap <A-S-Space>            :call Files(Folder_Repo(1))<cr>
noremap <A-C-Space>            :call Files(Folder_Repo(1))<cr>
noremap <A-S-C-Space>          :call Files('/')<cr>
noremap <C-g>              :call AgIn(Folder_Project())<cr>
noremap <C-S-g>            :call AgIn(Folder_Repo())<cr>
noremap <A-g>              :call AgIn(Folder_Repo())<cr>
noremap <A-S-g>            :call AgIn(Folder_Repo(1))<cr>
noremap <A-C-g>            :call AgIn(Folder_Repo(1))<cr>
noremap <A-S-C-g>          :call AgIn('/')<cr>
noremap <C-m>              :call fzf#vim#gitfiles('', {'dir': Folder_Repo(v:count)})<cr>
nnoremap ,o              :OpenFileCommandLineSameDir<cr>
nnoremap ,.              :OpenFileCommandLineCWD<cr>
nnoremap ,,.      :OpenFileCommandLineSameDir<cr>
nnoremap ,.              :call CommandLineFiles(Folder_Up(v:count, 0))<cr>
nnoremap ,,.              :call CommandLineFiles(Folder_Up(v:count, 1))<cr>
nnoremap ,,,.              :call CommandLineFiles(Folder_Up(v:count, 2))<cr>
nnoremap ,,,,.              :call CommandLineFiles(Folder_Up(v:count, 3))<cr>
nnoremap ,,,,,.              :call CommandLineFiles(Folder_Up(v:count, 4))<cr>
cnoremap <C-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <M-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <S-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <C-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <M-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <S-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <C-,> <Backspace>
cnoremap <C-.> <Backspace>
nnoremap ,cd :call MakeDirCurrentCWD(bufnr())<cr>
nnoremap <C-Left> :call CD(WFilePrev())<cr>
nnoremap <C-Right> :call CD(WFileNext())<cr>
nnoremap <C-,> :call CD(WFilePrev())<cr>
nnoremap <C-.> :call CD(WFileNext())<cr>
nnoremap ,<Tab>      :JumpProjectIn<cr>
nnoremap <localleader><Tab> :JumpProjectIn<cr>
vnoremap <F14> :<C-u>call VS()<cr>
nnoremap <F13> :call VS()<cr>
inoremap <F13> <C-o>:call VS()<cr>
cnoremap <F13> :call VS('c')<cr>
tnoremap <F13> <C-\><C-n>:call VS('t')<cr>
nmap <M-v> :call FuncPaste("Normal")<cr>
nmap <M-c> :call FuncCopy("Normal")<cr>
nmap <M-x> :call FuncCut("Normal")<cr>
noremap ,,,j :IntelligentJumping<cr>
nmap <silent> <c-h> :wincmd h<cr>
nmap <silent> <c-j> :wincmd j<cr>
nmap <silent> <c-k> :wincmd k<cr>
nmap <silent> <c-l> :wincmd l<cr>
vnoremap <silent> p "_dP
vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> dd dd:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste("n")<cr>p
vnoremap p :<C-U>let vlcb = getpos("'<")[1:2] \| let vlce = getpos("'>")[1:2] \| call ClipboardPaste("v")<cr>p
nmap <BS> :call backspaceN()<cr>
cmap <A-'> ä
cmap <A-"> Ä
cmap <A-;> ö
cmap <A-:> Ö
cmap <A-[> ü
cmap <A-{> Ü
cmap <A--> ß
nmap ,F :echo VS()<cr>
nmap ,e :call AppendToEndNormal()<cr>
nmap ,E :AppendAll<cr>
nnoremap YY :call AppendToClipboard()<cr>
vnoremap Y :<C-u>let @+ = @+ . join(getline("'<", "'>"), "\n") . "\n"<cr>
nnoremap <silent> <A-k> :m-2<cr>
nnoremap <silent> <A-j> :m+1<cr>
vnoremap <silent> <A-k> :m '<-2<cr>gv=gv
vnoremap <silent> <A-j> :m '>+1<cr>gv=gv
noremap < <<
noremap > >>
vnoremap < <gv
vnoremap > >gv
map ,dt :diffthis<cr>
map ,do :diffoff<cr>
map ,0 :wincmd =<cr>
inoremap <C-Space> <C-x><C-f>
inoremap <C-S-v> <c-r>+
map ,<F5> :call FixTargetTerm('F5')<cr>
map ,<F6> :call FixTargetTerm('F6')<cr>
map ,<F7> :call FixTargetTerm('F7')<cr>
map ,<F8> :call FixTargetTerm('F8')<cr>
map ,rm :call DeleteFile()<cr>
map ,n :call NewFile()<cr>
nmap ,< :norm yy<cr>:norm dd<cr>:wincmd l<cr>:norm gp<cr>:wincmd h<cr>
vmap ,< :norm gvy<cr>:norm gvd<cr>:wincmd l<cr>:norm gp<cr>:wincmd h<cr>
nnoremap <C-S-M-h> :echo JoinSplits("h")<cr>
nnoremap <C-S-M-j> :echo JoinSplits("j")<cr>
nnoremap <C-S-M-k> :echo JoinSplits("k")<cr>
nnoremap <C-S-M-l> :echo JoinSplits("l")<cr>
nnoremap ,<C-S-M-h> :echo MoveOutOfSplit("h")<cr>
nnoremap ,<C-S-M-j> :echo MoveOutOfSplit("j")<cr>
nnoremap ,<C-S-M-k> :echo MoveOutOfSplit("k")<cr>
nnoremap ,<C-S-M-l> :echo MoveOutOfSplit("l")<cr>
map <C-;> zh
map <C-'> zl
map <C-S-;> 20zh
map <C-S-'> 20zl
nnoremap <silent> ,f  :copen<cr>
nnoremap <silent> <C-Down>   :cnext<cr>zz
nnoremap <silent> <C-Up>     :cprev<cr>zz
nnoremap <silent> ,N  :cfirst<cr>zz
nnoremap <silent> ,P  :clast<cr>zz
nnoremap <silent> ,c  :cclose<cr>
nmap ,<C-s> :call ExecFunction()<cr>
nmap ,s :call ExecVS()<cr>
vmap ,s :call ExecVS()<cr>
nmap ,S :Re \| :%source \| :ReEnd<cr>
map ,rd :call RedoLeaderS()<cr>
noremap <F7> :autocmd! BufEnter * :call F.Buffer.Find(bufnr()).Print()<cr>
noremap <F8> :call Display()<cr>
noremap ,c :call ToggleComment()<cr>
vmap <F1> J
map <F2> :call GetKeys()<cr>
map <F3> :call FindKeyPerform()<cr>
map <F4> :echo AllKeys()<cr>
tmap <C-v> <C-\><C-n>:call SendCommandToThisTerm([getreg('"')])<cr>i
vmap ,,s :<C-u>silent redir=>output \| silent '<,'>source \| redir END \| put=output<cr>
map <F8> <C-w>p
vnoremap <F8> :<C-u>call SendCommandToTerm("l")<cr>
nnoremap <F8> :<C-u>call SendCommandToTerm("l")<cr>
nnoremap <F5> :<C-u>call RedoCommandToTerm("l")<cr>
map ,aa :RECP --reg *<cr>
map ,an :RECP --reg "<cr>
map ,ab :RECP<cr>
noremap ,qd :Diff --all<cr>
noremap ,,qd :Diff --all --cached<cr>
noremap ,qr :PushCWD
noremap ,,qr :GithubPush<cr>
noremap ,qv :Pull<cr>
noremap ,ql :Log<cr>
noremap ,qs :Status<cr>
noremap ,qa :GitAdd<cr>
noremap ,qA :GitAddCWD<cr>
noremap ,,qa :GitAddCWD<cr>
noremap ,qcc :!git rebase --continue<cr>
noremap ,qcs :!git rebase --skip<cr>
noremap ,qca :!git rebase --abort<cr>
noremap ,qf :GitFetch<cr>
noremap ,qu :StashPush<cr>
noremap ,qo :StashPop<cr>
map ,m :call VimGrep(v:count)<cr>
map ,m :call VimGrep(v:count)<cr>
map [D :cclose<cr>
map [C :copen<cr>
map [A :cprev<cr>
map [B :cnext<cr>
Amap <F11> :call RefreshFileList()<cr>:call NextBuffer()<cr>
Amap <S-F11> :call RefreshFileList()<cr>:call PrevBuffer()<cr>
Amap <F10> :call RefreshFileListDir()<cr>:call NextBuffer()<cr>
Amap <S-F10> :call RefreshFileListDir()<cr>:call PrevBuffer()<cr>
noremap ,,,,,<F1> :call SelectFunctionBlock()<cr>
noremap <F1> :call GitInfo()<cr>
noremap <S-F1> :call GitInfo('--stash')<cr>
noremap <C-S-F1> :call GitStashDrop()<cr>
noremap ,,,,<F3> :call GitDeleteLastUnpushedCommit()<cr>
noremap ,,,<F1> :call GitCommitRepo()<cr>
noremap ,,<F1> :call GitCommitRepo(input("Commit Message: "))<cr>
noremap ,<F1> :call GitAddRepo()<cr>
noremap ,,,,,<F1> :call GitInitRepository()<cr>
noremap ,,,,,,<F1> :call GitInitRepositoryBare()<cr>
noremap <F2> :call SelectRemote(1)<cr>
noremap <S-F2> :call SelectRemote(-1)<cr>
noremap ,<F2> :call GitRenameRemote()<cr>
noremap ,,<F2> :call GitRemoteAdd()<cr>
noremap ,,,<F2> :call GitSetRemote()<cr>
noremap <F3> :call SelectBranch(1)<cr>
noremap <S-F3> :call SelectBranch(-1)<cr>
noremap ,<F3> :call GitRenameBranch()<cr>
noremap ,,<F3> :call GitNewBranch()<cr>
noremap <F4> :call GitStashPush()<cr>
noremap <S-F4> :call GitStashPop()<cr>
tnoremap <C-v> <C-\><C-n>
vnoremap i <C-c>i
vmap <silent> <C-c> <C-c>:call CommandInfo()<cr>
map <F12> :call ToggleFavorite(1)<cr>
map <S-F12> :call ToggleFavorite(-1)<cr>
map <C-F12> :call OpenFZF(g:favorites)<cr>
map ,<F12> :call SetUnsetFavorite()<cr>
map ,,<F12> :call ClearUnreachableFavorites()<cr>