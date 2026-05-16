nnoremap <silent> <C-S-o> :call JumpToNextFile(-1)<CR>
nnoremap <silent> <C-S-i> :call JumpToNextFile(1)<CR>
nnoremap <C-s> <Nop>
inoremap <C-s> <Nop>
vnoremap <C-s> <Nop>
map <leader><leader>f :call FavoriteFile()<CR>
map <leader><leader>f :call FavoriteFile()<CR>
map <leader><leader>p :call FavoritePath()<CR>
map <C-8> :call Favorite()<CR>
nnoremap ,s :so %<cr>
map <C-Space> :call SelectCommand()<cr>
map <leader>t :Tidy<cr>
noremap <M-q> :q<CR>
tnoremap <M-q> <c-\><c-n>:q<CR>
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
vnoremap . :<Up><CR>
Amap <leader>h     :call Open("h", "buffer", "new")<cr>
Amap <leader>j     :call Open("j", "buffer", "new")<cr>
Amap <leader>k     :call Open("k", "buffer", "new")<cr>
Amap <leader>l     :call Open("l", "buffer", "new")<cr>
Amap <leader>H     :call Open("H", "buffer", "new")<cr>
Amap <leader>J     :call Open("J", "buffer", "new")<cr>
Amap <leader>K     :call Open("K", "buffer", "new")<cr>
Amap <leader>L     :call Open("L", "buffer", "new")<cr>
Amap <leader><leader>h     :call Open("h", "terminal", "new")<cr>
Amap <leader><leader>j     :call Open("j", "terminal", "new")<cr>
Amap <leader><leader>k     :call Open("k", "terminal", "new")<cr>
Amap <leader><leader>l     :call Open("l", "terminal", "new")<cr>
Amap <leader><leader>H     :call Open("H", "terminal", "new")<cr>
Amap <leader><leader>J     :call Open("J", "terminal", "new")<cr>
Amap <leader><leader>K     :call Open("K", "terminal", "new")<cr>
Amap <leader><leader>L     :call Open("L", "terminal", "new")<cr>
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
Amap <C-q> :hide<CR>
Amap <C-S-q> :bd!<CR>
Amap <C-S-q> :q!<CR>
Amap <C-A-q> :qa!<CR>
Amap <A-q> :call TabClose()<cr>
Amap <leader><leader>r :redraw!<cr>
Amap <S-F2> :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
Amap <leader>c call CountRegex()<cr>
nmap <C-S-A> :call IncRange()<cr>
nmap <C-S-X> :call DecRange()<cr>
vmap af :call Vaf()<cr>
vmap <C-S-A> :call IncRange()<cr>
vmap <C-S-X> :call DecRange()<cr>
tmap <leader>X :TIN tail -f $receiver<cr>
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
nnoremap <leader>fuc :call OpenFileUnderCursor()<cr>
nnoremap <leader><leader>fb :LayoutBash<cr>
nnoremap <leader><leader>fv :LayoutVim<cr>
map <m-;> :call ToggleOverviewRight()<cr>
map <leader><leader><F4> :redraw \\| let c=input("Test: ")<cr>!source ".$workdir."/.bashrc; git_selector "TEST"
map <C-S-F9> :call PreviewBuffer()<CR>
map <C-F2> :call ToggleWrap()<CR>
map <leader><leader><leader>w :call ToggleWrap()<CR>
map <leader>in :call Intend()<cr>
map <leader><leader><leader><space> :IntelligentSelecting<cr>
map <leader>. @q
vmap <C-l> <C-w>l
vmap <C-h> <C-w>h
vmap <C-k> <C-w>k
vmap <C-j> <C-w>j
nnoremap <silent> <C-h> :call SmartWincmd('h')<CR>
nnoremap <silent> <C-j> :call SmartWincmd('j')<CR>
nnoremap <silent> <C-k> :call SmartWincmd('k')<CR>
nnoremap <silent> <C-l> :call SmartWincmd('l')<CR>
vmap <BS> :call backspace()<CR>
vmap & :&<CR>
vmap <leader>F :echo VS()<cr>
vmap <leader><leader>g :call AppendToEndRange()<CR>
vmap <leader>G :AppendAll<CR>
vmap <leader>u :!uniq<CR>
vmap <M-v> :call VPaste("Visual")<CR>
vmap <M-c> :call VCopy("Visual")<CR>
vmap <M-x> :call VCut("Visual")<CR>
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
tmap  :call ExitTerminal()<CR>
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
map <leader><leader><leader>m :call Toggle_Set_Last_Git_Message()<CR>
map <leader><leader><leader>l :call ToggleLineState()<CR>
map <leader><leader><leader>L :call ToggleLineStateGlobal()<CR>
map <leader><leader>s :call Statusline_TogglePath()<cr>
map <leader><leader>d :echo g:debug_layout<cr>
map <leader><leader>B :call Boilerplate_Test()<cr>
map <leader><Space> :call GetCCWD()<cr>
nmap <silent> <C-s> :SaveFile<cr>
vmap <silent> <C-s> :SaveFile<cr>
imap <silent> <C-s> :SaveFile<CR>l
nnoremap <localleader>f :InsertFunction<CR>
nnoremap <space>f :InsertFilename<CR>
map <leader><Space> :call ToggleZoom()<cr>
map <silent> <S-F1> :SearchCword<cr>
map <leader>b :call BASH(VS())<cr>
map <leader>b :call Bash(VS())<cr>
map ,b :Buffers<cr>
map <leader>b :Buffers<cr>
map <localleader>iv :call VIM(input("vimscript: "), 'exec_input_vs')<cr>
map <localleader>ib :call BASH(input("bash: "), 'exec_input_vs')<cr>
map <localleader>ip :call PYTHON(input("python: "), 'exec_input_vs')<cr>
map <localleader>ir :call RUST(input("rust: "), 'exec_input_vs')<cr>
nnoremap <space>p :CopyFileNameToClipboard<CR>
nnoremap <space>P :CopyWholePathToClipboard<CR>
nnoremap <space>r :InsertReceiver<CR>
nnoremap <leader>dd :call Rewindworkdir()<cr>
map <leader>p                                         :call Files(Folder_Up(v:count, 0))<cr>
map <leader><leader>p                                 :call Files(Folder_Up(v:count, 1))<cr>
map <leader><leader><leader>p                         :call Files(Folder_Up(v:count, 2))<cr>
map <leader><leader><leader><leader>p                 :call Files(Folder_Up(v:count, 3))<cr>
map <leader><leader><leader><leader><leader>p         :call Files(Folder_Up(v:count, 4))<cr>
map <leader><leader><leader><leader><leader><leader>p :call Files(Folder_Up(v:count, 5))<cr>
map <leader>g                                         :call AgIn(Folder_Up(v:count, 0))<cr>
map <leader><leader>g                                 :call AgIn(Folder_Up(v:count, 1))<cr>
map <leader><leader><leader>g                         :call AgIn(Folder_Up(v:count, 2))<cr>
map <leader><leader><leader><leader>g                 :call AgIn(Folder_Up(v:count, 3))<cr>
map <leader><leader><leader><leader><leader>g         :call AgIn(Folder_Up(v:count, 4))<cr>
map <leader><leader><leader><leader><leader><leader>g :call AgIn(Folder_Up(v:count, 5))<cr>
map ,vcd :call CD(Vim_Advantages_Path())<cr>
noremap <C-p>              :call Files(Folder_Project())<CR>
noremap <C-S-p>            :call Files(Folder_Repo())<CR>
noremap <A-p>              :call Files(Folder_Repo())<CR>
noremap <A-S-p>            :call Files(Folder_Repo(1))<CR>
noremap <A-C-p>            :call Files(Folder_Repo(1))<CR>
noremap <A-S-C-p>          :call Files('/')<CR>
noremap <C-g>              :call AgIn(Folder_Project())<CR>
noremap <C-S-g>            :call AgIn(Folder_Repo())<CR>
noremap <A-g>              :call AgIn(Folder_Repo())<CR>
noremap <A-S-g>            :call AgIn(Folder_Repo(1))<CR>
noremap <A-C-g>            :call AgIn(Folder_Repo(1))<CR>
noremap <A-S-C-g>          :call AgIn('/')<CR>
noremap <C-m>              :call fzf#vim#gitfiles('', {'dir': Folder_Repo(v:count)})<CR>
nnoremap <leader>o              :OpenFileCommandLineSameDir<CR>
nnoremap <leader>.              :OpenFileCommandLineCWD<CR>
nnoremap <leader><leader>.      :OpenFileCommandLineSameDir<CR>
nnoremap <leader>.              :call CommandLineFiles(Folder_Up(v:count, 0))<CR>
nnoremap <leader><leader>.              :call CommandLineFiles(Folder_Up(v:count, 1))<CR>
nnoremap <leader><leader><leader>.              :call CommandLineFiles(Folder_Up(v:count, 2))<CR>
nnoremap <leader><leader><leader><leader>.              :call CommandLineFiles(Folder_Up(v:count, 3))<CR>
nnoremap <leader><leader><leader><leader><leader>.              :call CommandLineFiles(Folder_Up(v:count, 4))<CR>
cnoremap <C-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<CR>
cnoremap <M-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<CR>
cnoremap <S-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<CR>
cnoremap <C-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<CR>
cnoremap <M-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<CR>
cnoremap <S-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<CR>
cnoremap <C-,> <Backspace>
cnoremap <C-.> <Backspace>
nnoremap <leader>cd :call MakeDirCurrentCWD(bufnr())<cr>
nnoremap <C-Left> :call CD(WFilePrev())<cr>
nnoremap <C-Right> :call CD(WFileNext())<cr>
nnoremap <C-,> :call CD(WFilePrev())<cr>
nnoremap <C-.> :call CD(WFileNext())<cr>
nnoremap <leader><Tab>      :JumpProjectIn<cr>
nnoremap <localleader><Tab> :JumpProjectIn<cr>
vnoremap <F14> :<C-u>call VS()<cr>
nnoremap <F13> :call VS()<cr>
inoremap <F13> <C-o>:call VS()<cr>
cnoremap <F13> :call VS('c')<cr>
tnoremap <F13> <C-\><C-n>:call VS('t')<cr>
nmap <M-v> :call FuncPaste("Normal")<CR>
nmap <M-c> :call FuncCopy("Normal")<CR>
nmap <M-x> :call FuncCut("Normal")<CR>
noremap <leader><leader><leader>j :IntelligentJumping<cr>
nmap <silent> <c-h> :wincmd h<cr>
nmap <silent> <c-j> :wincmd j<cr>
nmap <silent> <c-k> :wincmd k<cr>
nmap <silent> <c-l> :wincmd l<cr>
vnoremap <silent> p "_dP
vnoremap <silent> y y:call ClipboardYank()<CR>
vnoremap <silent> d d:call ClipboardYank()<CR>
nnoremap <silent> dd dd:call ClipboardYank()<CR>
nnoremap <silent> p :call ClipboardPaste("n")<CR>p
vnoremap p :<C-U>let vlcb = getpos("'<")[1:2] \| let vlce = getpos("'>")[1:2] \| call ClipboardPaste("v")<CR>p
nmap <BS> :call backspaceN()<CR>
cmap <A-'> ä
cmap <A-"> Ä
cmap <A-;> ö
cmap <A-:> Ö
cmap <A-[> ü
cmap <A-{> Ü
cmap <A--> ß
nmap <leader>F :echo VS()<cr>
nmap <leader>e :call AppendToEndNormal()<CR>
nmap <leader>E :AppendAll<CR>
nnoremap YY :call AppendToClipboard()<CR>
vnoremap Y :<C-u>let @+ = @+ . join(getline("'<", "'>"), "\n") . "\n"<CR>
nnoremap <silent> <A-k> :m-2<cr>
nnoremap <silent> <A-j> :m+1<cr>
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
noremap < <<
noremap > >>
vnoremap < <gv
vnoremap > >gv
map <leader>dt :diffthis<cr>
map <leader>do :diffoff<cr>
map <leader>0 :wincmd =<cr>
inoremap <C-Space> <C-x><C-f>
inoremap <C-S-v> <c-r>+
map <leader><F5> :call FixTargetTerm('F5')<cr>
map <leader><F6> :call FixTargetTerm('F6')<cr>
map <leader><F7> :call FixTargetTerm('F7')<cr>
map <leader><F8> :call FixTargetTerm('F8')<cr>
map <leader>rm :call DeleteFile()<cr>
map <leader>n :call NewFile()<cr>
nmap <leader>< :norm yy<cr>:norm dd<cr>:wincmd l<cr>:norm gp<cr>:wincmd h<cr>
vmap <leader>< :norm gvy<cr>:norm gvd<cr>:wincmd l<cr>:norm gp<cr>:wincmd h<cr>
nnoremap <C-S-M-h> :echo JoinSplits("h")<cr>
nnoremap <C-S-M-j> :echo JoinSplits("j")<cr>
nnoremap <C-S-M-k> :echo JoinSplits("k")<cr>
nnoremap <C-S-M-l> :echo JoinSplits("l")<cr>
nnoremap <leader><C-S-M-h> :echo MoveOutOfSplit("h")<cr>
nnoremap <leader><C-S-M-j> :echo MoveOutOfSplit("j")<cr>
nnoremap <leader><C-S-M-k> :echo MoveOutOfSplit("k")<cr>
nnoremap <leader><C-S-M-l> :echo MoveOutOfSplit("l")<cr>
map <C-;> zh
map <C-'> zl
map <C-S-;> 20zh
map <C-S-'> 20zl
nnoremap <silent> <leader>f  :copen<CR>
nnoremap <silent> <C-Down>   :cnext<CR>zz
nnoremap <silent> <C-Up>     :cprev<CR>zz
nnoremap <silent> <leader>N  :cfirst<CR>zz
nnoremap <silent> <leader>P  :clast<CR>zz
nnoremap <silent> <leader>c  :cclose<CR>
nmap ,<C-s> :call ExecFunction()<cr>
nmap <leader>s :call ExecVS()<cr>
vmap <leader>s :call ExecVS()<cr>
nmap <leader>S :Re \| :%source \| :ReEnd<cr>
map ,rd :call RedoLeaderS()<cr>
noremap <F7> :autocmd! BufEnter * :call F.Buffer.Find(bufnr()).Print()<cr>
noremap <F8> :call Display()<cr>
noremap ,c :call ToggleComment()<cr>
vmap <F1> J
map <F2> :call GetKeys()<cr>
map <F3> :call FindKeyPerform()<cr>
map <F4> :echo AllKeys()<cr>
tmap <C-v> <C-\><C-n>:call SendCommandToThisTerm([getreg('"')])<cr>i
vmap <leader><leader>s :<C-u>silent redir=>output \| silent '<,'>source \| redir END \| put=output<cr>
map <F8> <C-w>p
vnoremap <F8> :<C-u>call SendCommandToTerm("l")<cr>
nnoremap <F8> :<C-u>call SendCommandToTerm("l")<cr>
nnoremap <F5> :<C-u>call RedoCommandToTerm("l")<cr>
map <leader>aa :RECP --reg *<cr>
map <leader>an :RECP --reg "<cr>
map <leader>ab :RECP<cr>
noremap <leader>qd :Diff --all<cr>
noremap <leader><leader>qd :Diff --all --cached<cr>
noremap <leader>qr :PushCWD 
noremap <leader><leader>qr :GithubPush<cr>
noremap <leader>qv :Pull<cr>
noremap <leader>ql :Log<cr>
noremap <leader>qs :Status<CR>
noremap <leader>qa :GitAdd<CR>
noremap <leader>qA :GitAddCWD<CR>
noremap <leader>qcc :!git rebase --continue<CR>
noremap <leader>qcs :!git rebase --skip<CR>
noremap <leader>qca :!git rebase --abort<CR>
noremap <leader>qf :GitFetch<CR>
noremap <leader>qu :StashPush<CR>
noremap <leader>qo :StashPop<CR>
map ,m :call VimGrep(v:count)<cr>
map ,m :call VimGrep(v:count)<cr>
map [D :cclose<cr>
map [C :copen<cr>
map [A :cprev<cr>
map [B :cnext<cr>
Amap <F12> :call NextBuffer()<CR>
Amap <S-F12> :call PrevBuffer()<CR>
noremap ,,,,,<F1> :call SelectFunctionBlock()<CR>
noremap <F1> :call GitInfo()<cr>
noremap <S-F1> :call GitInfo('--stash')<cr>
noremap <C-S-F1> :call GitStashDrop()<cr>
noremap ,,,,<F1> :call GitDeleteLastUnpushedCommit()<cr>
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