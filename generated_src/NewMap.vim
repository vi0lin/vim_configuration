Nnoremap <silent> <C-S-o> :call JumpToNextFile(-1)<cr>
Nnoremap <silent> <C-S-i> :call JumpToNextFile(1)<cr>
Nnoremap ,,f :call FavoriteFile()<cr>
Nnoremap ,,f :call FavoriteFile()<cr>
Nnoremap ,,p :call FavoritePath()<cr>
Nnoremap <C-8> :call Favorite()<cr>
Nnoremap <F9> :Equal<cr>
Nnoremap <S-F9> :Bigger<cr>
Nnoremap ,s :so %<cr>
Nnoremap ,t :Tidy<cr>
Nnoremap <M-q> :q<cr>
Tnoremap <M-q> <c-\><c-n>:q<cr>
Vnoremap <F5> :<C-u>call SavedCommandToTerm("h")<cr>
Vnoremap <F6> :<C-u>call SavedCommandToTerm("j")<cr>
Vnoremap <F7> :<C-u>call SavedCommandToTerm("k")<cr>
Vnoremap <F8> :<C-u>call SavedCommandToTerm("l")<cr>
Inoremap <F5> <C-o>:call SavedCommandToTerm("h")<cr>
Inoremap <F6> <C-o>:call SavedCommandToTerm("j")<cr>
Inoremap <F7> <C-o>:call SavedCommandToTerm("k")<cr>
Inoremap <F8> <C-o>:call SavedCommandToTerm("l")<cr>
Nnoremap <F5> :call SavedCommandToTerm("h")<cr>
Cnoremap <F5> :call SavedCommandToTerm("h")<cr>
Nnoremap <F6> :call SavedCommandToTerm("j")<cr>
Cnoremap <F6> :call SavedCommandToTerm("j")<cr>
Nnoremap <F7> :call SavedCommandToTerm("k")<cr>
Cnoremap <F7> :call SavedCommandToTerm("k")<cr>
Nnoremap <F8> :call SavedCommandToTerm("l")<cr>
Cnoremap <F8> :call SavedCommandToTerm("l")<cr>
Tnoremap <F5> <C-\><C-n>:call SavedCommandToTerm("h")<cr>
Tnoremap <F6> <C-\><C-n>:call SavedCommandToTerm("j")<cr>
Tnoremap <F7> <C-\><C-n>:call SavedCommandToTerm("k")<cr>
Tnoremap <F8> <C-\><C-n>:call SavedCommandToTerm("l")<cr>
Anoremap ,<F5> :call MapCommand("h")<cr>
Anoremap ,<F6> :call MapCommand("j")<cr>
Anoremap ,<F7> :call MapCommand("k")<cr>
Anoremap ,<F8> :call MapCommand("l")<cr>
TnoremapInsertmode <C-l> l<cr>
TnoremapInsertmode <C-h> h<cr>
TnoremapInsertmode <C-k> k<cr>
TnoremapInsertmode <C-j> j<cr>
Anoremap ,,<F5> :call DirectionMapSmart('h')<cr>
Anoremap ,,<F6> :call DirectionMapSmart('j')<cr>
Anoremap ,,<F7> :call DirectionMapSmart('k')<cr>
Anoremap ,,<F8> :call DirectionMapSmart('l')<cr>
Anoremap ,,,<F5> :call MapCommand("x")<cr>
Anoremap ,,,<F6> :call MapCommand("x")<cr>
Anoremap ,,,<F7> :call MapCommand("x")<cr>
Anoremap ,,,<F8> :call MapCommand("x")<cr>
Nnoremap ,,,<F5> :call FixTargetTerm('F5')<cr>
Nnoremap ,,,<F6> :call FixTargetTerm('F6')<cr>
Nnoremap ,,,<F7> :call FixTargetTerm('F7')<cr>
Nnoremap ,,,<F8> :call FixTargetTerm('F8')<cr>
Vnoremap <C-F5> :<C-u>call RedoCommandToTermWithSigTerm("h")<cr>
Vnoremap <C-F6> :<C-u>call RedoCommandToTermWithSigTerm("j")<cr>
Vnoremap <C-F7> :<C-u>call RedoCommandToTermWithSigTerm("k")<cr>
Vnoremap <C-F8> :<C-u>call RedoCommandToTermWithSigTerm("l")<cr>
Inoremap <C-F5> <C-o>:call RedoCommandToTermWithSigTerm("h")<cr>
Inoremap <C-F6> <C-o>:call RedoCommandToTermWithSigTerm("j")<cr>
Inoremap <C-F7> <C-o>:call RedoCommandToTermWithSigTerm("k")<cr>
Inoremap <C-F8> <C-o>:call RedoCommandToTermWithSigTerm("l")<cr>
Nnoremap <C-F5> :call RedoCommandToTermWithSigTerm("h")<cr>
Cnoremap <C-F5> :call RedoCommandToTermWithSigTerm("h")<cr>
Nnoremap <C-F6> :call RedoCommandToTermWithSigTerm("j")<cr>
Cnoremap <C-F6> :call RedoCommandToTermWithSigTerm("j")<cr>
Nnoremap <C-F7> :call RedoCommandToTermWithSigTerm("k")<cr>
Cnoremap <C-F7> :call RedoCommandToTermWithSigTerm("k")<cr>
Nnoremap <C-F8> :call RedoCommandToTermWithSigTerm("l")<cr>
Cnoremap <C-F8> :call RedoCommandToTermWithSigTerm("l")<cr>
Tnoremap <C-F5> <C-\><C-n>:call RedoCommandToTermWithSigTerm("h")<cr>
Tnoremap <C-F6> <C-\><C-n>:call RedoCommandToTermWithSigTerm("j")<cr>
Tnoremap <C-F7> <C-\><C-n>:call RedoCommandToTermWithSigTerm("k")<cr>
Tnoremap <C-F8> <C-\><C-n>:call RedoCommandToTermWithSigTerm("l")<cr>
Vnoremap <S-F5> :<C-u>call RedoCommandToTerm("h")<cr>
Vnoremap <S-F6> :<C-u>call RedoCommandToTerm("j")<cr>
Vnoremap <S-F7> :<C-u>call RedoCommandToTerm("k")<cr>
Vnoremap <S-F8> :<C-u>call RedoCommandToTerm("l")<cr>
Inoremap <S-F5> <C-o>:call RedoCommandToTerm("h")<cr>
Inoremap <S-F6> <C-o>:call RedoCommandToTerm("j")<cr>
Inoremap <S-F7> <C-o>:call RedoCommandToTerm("k")<cr>
Inoremap <S-F8> <C-o>:call RedoCommandToTerm("l")<cr>
Nnoremap <S-F5> :call RedoCommandToTerm("h")<cr>
Cnoremap <S-F5> :call RedoCommandToTerm("h")<cr>
Nnoremap <S-F6> :call RedoCommandToTerm("j")<cr>
Cnoremap <S-F6> :call RedoCommandToTerm("j")<cr>
Nnoremap <S-F7> :call RedoCommandToTerm("k")<cr>
Cnoremap <S-F7> :call RedoCommandToTerm("k")<cr>
Nnoremap <S-F8> :call RedoCommandToTerm("l")<cr>
Cnoremap <S-F8> :call RedoCommandToTerm("l")<cr>
Tnoremap <S-F5> <C-\><C-n>:call RedoCommandToTerm("h")<cr>
Tnoremap <S-F6> <C-\><C-n>:call RedoCommandToTerm("j")<cr>
Tnoremap <S-F7> <C-\><C-n>:call RedoCommandToTerm("k")<cr>
Tnoremap <S-F8> <C-\><C-n>:call RedoCommandToTerm("l")<cr>
Vnoremap <C-S-F5> :<C-u>call SigTermToTerm("h")<cr>
Vnoremap <C-S-F6> :<C-u>call SigTermToTerm("j")<cr>
Vnoremap <C-S-F7> :<C-u>call SigTermToTerm("k")<cr>
Vnoremap <C-S-F8> :<C-u>call SigTermToTerm("l")<cr>
Inoremap <C-S-F5> <C-o>:call SigTermToTerm("h")<cr>
Inoremap <C-S-F6> <C-o>:call SigTermToTerm("j")<cr>
Inoremap <C-S-F7> <C-o>:call SigTermToTerm("k")<cr>
Inoremap <C-S-F8> <C-o>:call SigTermToTerm("l")<cr>
Nnoremap <C-S-F5> :call SigTermToTerm("h")<cr>
Cnoremap <C-S-F5> :call SigTermToTerm("h")<cr>
Nnoremap <C-S-F6> :call SigTermToTerm("j")<cr>
Cnoremap <C-S-F6> :call SigTermToTerm("j")<cr>
Nnoremap <C-S-F7> :call SigTermToTerm("k")<cr>
Cnoremap <C-S-F7> :call SigTermToTerm("k")<cr>
Nnoremap <C-S-F8> :call SigTermToTerm("l")<cr>
Cnoremap <C-S-F8> :call SigTermToTerm("l")<cr>
Tnoremap <C-S-F5> <C-\><C-n>:call SigTermToTerm("h")<cr>
Tnoremap <C-S-F6> <C-\><C-n>:call SigTermToTerm("j")<cr>
Tnoremap <C-S-F7> <C-\><C-n>:call SigTermToTerm("k")<cr>
Tnoremap <C-S-F8> <C-\><C-n>:call SigTermToTerm("l")<cr>
Vnoremap . :<Up><cr>
Anoremap ,h     :call Open("h", "buffer", "new")<cr>
Anoremap ,j     :call Open("j", "buffer", "new")<cr>
Anoremap ,k     :call Open("k", "buffer", "new")<cr>
Anoremap ,l     :call Open("l", "buffer", "new")<cr>
Anoremap ,H     :call Open("H", "buffer", "new")<cr>
Anoremap ,J     :call Open("J", "buffer", "new")<cr>
Anoremap ,K     :call Open("K", "buffer", "new")<cr>
Anoremap ,L     :call Open("L", "buffer", "new")<cr>
Anoremap ,,h     :call Open("h", "terminal", "new")<cr>
Anoremap ,,j     :call Open("j", "terminal", "new")<cr>
Anoremap ,,k     :call Open("k", "terminal", "new")<cr>
Anoremap ,,l     :call Open("l", "terminal", "new")<cr>
Anoremap ,,H     :call Open("H", "terminal", "new")<cr>
Anoremap ,,J     :call Open("J", "terminal", "new")<cr>
Anoremap ,,K     :call Open("K", "terminal", "new")<cr>
Anoremap ,,L     :call Open("L", "terminal", "new")<cr>
Anoremap <A-H>     :call Open("H", "buffer", "new")<cr>
Anoremap <A-J>     :call Open("J", "buffer", "new")<cr>
Anoremap <A-K>     :call Open("K", "buffer", "new")<cr>
Anoremap <A-L>     :call Open("L", "buffer", "new")<cr>
Anoremap <A-S-h>     :call Open("h", "terminal", "new")<cr>
Anoremap <A-S-j>     :call Open("j", "terminal", "new")<cr>
Anoremap <A-S-k>     :call Open("k", "terminal", "new")<cr>
Anoremap <A-S-l>     :call Open("l", "terminal", "new")<cr>
Anoremap <A-S-H>     :call Open("H", "terminal", "new")<cr>
Anoremap <A-S-J>     :call Open("J", "terminal", "new")<cr>
Anoremap <A-S-K>     :call Open("K", "terminal", "new")<cr>
Anoremap <A-S-L>     :call Open("L", "terminal", "new")<cr>
Anoremap <A-S-Left>     :call Open("h", "terminal", "new")<cr>
Anoremap <A-S-Down>     :call Open("j", "terminal", "new")<cr>
Anoremap <A-S-Up>       :call Open("k", "terminal", "new")<cr>
Anoremap <A-S-Right>    :call Open("l", "terminal", "new")<cr>
Anoremap <A-S-Left>     :call Open("H", "terminal", "new")<cr>
Anoremap <A-S-Down>     :call Open("J", "terminal", "new")<cr>
Anoremap <A-S-Up>       :call Open("K", "terminal", "new")<cr>
Anoremap <A-S-Right>    :call Open("L", "terminal", "new")<cr>
Anoremap <A-Left>       :call Open("h", "buffer", "new")<cr>
Anoremap <A-Down>       :call Open("j", "buffer", "new")<cr>
Anoremap <A-Up>         :call Open("k", "buffer", "new")<cr>
Anoremap <A-Right>      :call Open("l", "buffer", "new")<cr>
Anoremap <A-Left>       :call Open("H", "buffer", "new")<cr>
Anoremap <A-Down>       :call Open("J", "buffer", "new")<cr>
Anoremap <A-Up>         :call Open("K", "buffer", "new")<cr>
Anoremap <A-Right>      :call Open("L", "buffer", "new")<cr>
Anoremap <C-q> :hide<cr>
Anoremap <C-S-q> :bd!<cr>
Anoremap <C-S-q> :q!<cr>
Anoremap <C-A-q> :qa!<cr>
Anoremap <A-q> :call TabClose()<cr>
Anoremap ,,r :redraw!<cr>
Anoremap <S-F2> :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
Anoremap ,c call CountRegex()<cr>
Nnoremap <C-S-A> :call IncRange()<cr>
Nnoremap <C-S-X> :call DecRange()<cr>
Vnoremap af :call Vaf()<cr>
Vnoremap <C-S-A> :call IncRange()<cr>
Vnoremap <C-S-X> :call DecRange()<cr>
Tnoremap ,X :TIN tail -f $receiver<cr>
Nnoremap <A-S-n> <C-w>+
Nnoremap <A-S-m> <C-w>-
Nnoremap <A-S-u> <C-w><
Nnoremap <A-S-i> <C-w>>
Nnoremap <A-n> 12<C-w>+
Nnoremap <A-m> 12<C-w>-
Nnoremap <A-u> 12<C-w><
Nnoremap <A-i> 12<C-w>>
Nnoremap <A-h> :call TabH()<cr>
Nnoremap <A-l> :call TabL()<cr>
Nnoremap <C-S-M-h> :wincmd H<cr>
Nnoremap <C-S-M-j> :wincmd J<cr>
Nnoremap <C-S-M-k> :wincmd K<cr>
Nnoremap <C-S-M-l> :wincmd L<cr>
Nnoremap <C-S-h> :call SwapWin("h")<cr>
Nnoremap <C-S-j> :call SwapWin("j")<cr>
Nnoremap <C-S-k> :call SwapWin("k")<cr>
Nnoremap <C-S-l> :call SwapWin("l")<cr>
Tnoremap <C-S-h> <c-\><c-n>:call SwapWin("h")<cr>
Tnoremap <C-S-j> <c-\><c-n>:call SwapWin("j")<cr>
Tnoremap <C-S-k> <c-\><c-n>:call SwapWin("k")<cr>
Tnoremap <C-S-l> <c-\><c-n>:call SwapWin("l")<cr>
Nnoremap ,fuc :call OpenFileUnderCursor()<cr>
Nnoremap ,,fb :LayoutBash<cr>
Nnoremap ,,fv :LayoutVim<cr>
Nnoremap <m-;> :call ToggleOverviewRight()<cr>
Nnoremap ,,<F4> :redraw \\| let c=input("Test: ")<cr>!source ".$workdir."/.bashrc; git_selector "TEST"
Nnoremap <C-S-F9> :call PreviewBuffer()<cr>
Nnoremap <C-F2> :call ToggleWrap()<cr>
Nnoremap ,,,w :call ToggleWrap()<cr>
Nnoremap ,in :call Intend()<cr>
Nnoremap ,,,<space> :IntelligentSelecting<cr>
Nnoremap ,. @q
Nnoremap <C-h> :call SmartWincmd('h')<cr>
Vnoremap <C-h> :call SmartWincmd('h')<cr>
Inoremap <C-h> :call SmartWincmd('h')<cr>
Nnoremap <C-j> :call SmartWincmd('j')<cr>
Vnoremap <C-j> :call SmartWincmd('j')<cr>
Inoremap <C-j> :call SmartWincmd('j')<cr>
Nnoremap <C-k> :call SmartWincmd('k')<cr>
Vnoremap <C-k> :call SmartWincmd('k')<cr>
Inoremap <C-k> :call SmartWincmd('k')<cr>
Nnoremap <C-l> :call SmartWincmd('l')<cr>
Vnoremap <C-l> :call SmartWincmd('l')<cr>
Inoremap <C-l> :call SmartWincmd('l')<cr>
TmapInsertmode <C-l> <C-w>l
TmapInsertmode <C-h> <C-w>h
TmapInsertmode <C-k> <C-w>k
TmapInsertmode <C-j> <C-w>j
Vnoremap <BS> :call backspace()<cr>
Vnoremap & :&<cr>
Vnoremap ,F :echo VS()<cr>
Vnoremap ,,g :call AppendToEndRange()<cr>
Vnoremap ,G :AppendAll<cr>
Vnoremap ,u :!uniq<cr>
Vnoremap <M-v> :call VPaste("Visual")<cr>
Vnoremap <M-c> :call VCopy("Visual")<cr>
Vnoremap <M-x> :call VCut("Visual")<cr>
Tnoremap <c-o> <c-\><c-n><c-o>
Inoremap <C-l> <C-w>li
Inoremap <C-h> <C-w>hi
Inoremap <c-w><c-w> <c-w><c-w>
Tnoremap  :call ExitTerminal()<cr>
Inoremap <A-'> ä
Inoremap <A-"> Ä
Inoremap <A-;> ö
Inoremap <A-:> Ö
Inoremap <A-[> ü
Inoremap <A-{> Ü
Inoremap <A--> ß
Tnoremap <ScrollWheelUp> <C-\><C-n>
Tnoremap <S-ScrollWheelUp> <C-\><C-n>
Tnoremap <ScrollWheelDown> <C-\><C-n>
Tnoremap <S-ScrollWheelDown> <C-\><C-n>
Tnoremap <Esc> i
Tnoremap <LeftMouse> <C-\><C-n>
Nnoremap ,,,m :call Toggle_Set_Last_Git_Message()<cr>
Nnoremap ,,,l :call ToggleLineState()<cr>
Nnoremap ,,,L :call ToggleLineStateGlobal()<cr>
Nnoremap ,,s :call Statusline_TogglePath()<cr>
Nnoremap ,,d :echo g:debug_layout<cr>
Nnoremap ,,B :call Boilerplate_Test()<cr>
Nnoremap ,<Space> :call GetCCWD()<cr>
Nnoremap <C-s> :SaveFile<cr>
Vnoremap <C-s> :SaveFile<cr>
Inoremap <silent> <C-s> :SaveFile<cr>l
Nnoremap <localleader>f :InsertFunction<cr>
Nnoremap <space>f :InsertFilename<cr>
Nnoremap ,<Space> :call ToggleZoom()<cr>
Nnoremap <silent> <S-F1> :SearchCword<cr>
Nnoremap ,b :call BASH(VS())<cr>
Nnoremap ,b :call Bash(VS())<cr>
Nnoremap ,b :Buffers<cr>
Nnoremap ,b :Buffers<cr>
Nnoremap <localleader>iv :call VIM(input("vimscript: "), 'exec_input_vs')<cr>
Nnoremap <localleader>ib :call BASH(input("bash: "), 'exec_input_vs')<cr>
Nnoremap <localleader>ip :call PYTHON(input("python: "), 'exec_input_vs')<cr>
Nnoremap <localleader>ir :call RUST(input("rust: "), 'exec_input_vs')<cr>
Nnoremap <space>p :CopyFileNameToClipboard<cr>
Nnoremap <space>P :CopyWholePathToClipboard<cr>
Nnoremap <space>r :InsertReceiver<cr>
Nnoremap ,dd :call Rewindworkdir()<cr>
Nnoremap ,<Space>                                         :call Files(Folder_Up(v:count, 0))<cr>
Nnoremap ,,<Space>                                 :call Files(Folder_Up(v:count, 1))<cr>
Nnoremap ,,,<Space>                         :call Files(Folder_Up(v:count, 2))<cr>
Nnoremap ,,,,<Space>                 :call Files(Folder_Up(v:count, 3))<cr>
Nnoremap ,,,,,<Space>         :call Files(Folder_Up(v:count, 4))<cr>
Nnoremap ,,,,,,<Space> :call Files(Folder_Up(v:count, 5))<cr>
Nnoremap ,g                                         :call AgIn(Folder_Up(v:count, 0))<cr>
Nnoremap ,,g                                 :call AgIn(Folder_Up(v:count, 1))<cr>
Nnoremap ,,,g                         :call AgIn(Folder_Up(v:count, 2))<cr>
Nnoremap ,,,,g                 :call AgIn(Folder_Up(v:count, 3))<cr>
Nnoremap ,,,,,g         :call AgIn(Folder_Up(v:count, 4))<cr>
Nnoremap ,,,,,,g :call AgIn(Folder_Up(v:count, 5))<cr>
Nnoremap ,vcd :call CD(Vim_Advantages_Path())<cr>
Nnoremap ,p                :call Projects()<cr>
Nnoremap ,,p               :call Projects()<cr>
Nnoremap ,,,p              :call Projects()<cr>
Nnoremap ,,,,p             :call Projects()<cr>
Nnoremap ,,,,,p            :call Projects()<cr>
Nnoremap ,,,,,,p           :call Projects()<cr>
Nnoremap <C-p>              :call Projects()<cr>
Nnoremap <C-S-p>            :call Projects()<cr>
Nnoremap <A-p>              :call Projects()<cr>
Nnoremap <A-S-p>            :call Projects()<cr>
Nnoremap <A-C-p>            :call Projects()<cr>
Nnoremap <A-S-C-p>          :call Projects()<cr>
Nnoremap <C-S-p>           :call BuildSystemsGitProjects()<cr>
Nnoremap <C-S-m>           :Generate<cr>
Nnoremap <C-Space>              :call Files(Folder_Project())<cr>
Nnoremap <C-S-Space>            :call Files(Folder_Repo())<cr>
Nnoremap <A-Space>              :call Files(Folder_Repo())<cr>
Nnoremap <A-S-Space>            :call Files(Folder_Repo(1))<cr>
Nnoremap <A-C-Space>            :call Files(Folder_Repo(1))<cr>
Nnoremap <A-S-C-Space>          :call Files('/')<cr>
Nnoremap <C-g>              :call AgIn(Folder_Project())<cr>
Nnoremap <C-S-g>            :call AgIn(Folder_Repo())<cr>
Nnoremap <A-g>              :call AgIn(Folder_Repo())<cr>
Nnoremap <A-S-g>            :call AgIn(Folder_Repo(1))<cr>
Nnoremap <A-C-g>            :call AgIn(Folder_Repo(1))<cr>
Nnoremap <A-S-C-g>          :call AgIn('/')<cr>
Nnoremap <C-m>              :call fzf#vim#gitfiles('', {'dir': Folder_Repo(v:count)})<cr>
Nnoremap ,o              :OpenFileCommandLineSameDir<cr>
Nnoremap ,.              :OpenFileCommandLineCWD<cr>
Nnoremap ,,.      :OpenFileCommandLineSameDir<cr>
Nnoremap ,.              :call CommandLineFiles(Folder_Up(v:count, 0))<cr>
Nnoremap ,,.              :call CommandLineFiles(Folder_Up(v:count, 1))<cr>
Nnoremap ,,,.              :call CommandLineFiles(Folder_Up(v:count, 2))<cr>
Nnoremap ,,,,.              :call CommandLineFiles(Folder_Up(v:count, 3))<cr>
Nnoremap ,,,,,.              :call CommandLineFiles(Folder_Up(v:count, 4))<cr>
Cnoremap <C-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
Cnoremap <M-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
Cnoremap <S-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
Cnoremap <C-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
Cnoremap <M-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
Cnoremap <S-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
Cnoremap <C-,> <Backspace>
Cnoremap <C-.> <Backspace>
Nnoremap ,cd :call MakeDirCurrentCWD(bufnr())<cr>
Nnoremap <C-Left> :call CD(WFilePrev())<cr>
Nnoremap <C-Right> :call CD(WFileNext())<cr>
Nnoremap <C-,> :call CD(WFilePrev())<cr>
Nnoremap <C-.> :call CD(WFileNext())<cr>
Nnoremap ,<Tab>      :JumpProjectIn<cr>
Nnoremap <localleader><Tab> :JumpProjectIn<cr>
Vnoremap <F14> :<C-u>call VS()<cr>
Nnoremap <F13> :call VS()<cr>
Inoremap <F13> <C-o>:call VS()<cr>
Cnoremap <F13> :call VS('c')<cr>
Tnoremap <F13> <C-\><C-n>:call VS('t')<cr>
Nnoremap <M-v> :call FuncPaste("Normal")<cr>
Nnoremap <M-c> :call FuncCopy("Normal")<cr>
Nnoremap <M-x> :call FuncCut("Normal")<cr>
Nnoremap ,,,j :IntelligentJumping<cr>
Nnoremap <silent> <c-h> :wincmd h<cr>
Nnoremap <silent> <c-j> :wincmd j<cr>
Nnoremap <silent> <c-k> :wincmd k<cr>
Nnoremap <silent> <c-l> :wincmd l<cr>
Vnoremap <silent> p "_dP
Vnoremap <silent> y y:call ClipboardYank()<cr>
Vnoremap <silent> d d:call ClipboardYank()<cr>
Nnoremap <silent> dd dd:call ClipboardYank()<cr>
Nnoremap <silent> p :call ClipboardPaste("n")<cr>p
Vnoremap p :<C-U>let vlcb = getpos("'<")[1:2] \| let vlce = getpos("'>")[1:2] \| call ClipboardPaste("v")<cr>p
Nnoremap <BS> :call backspaceN()<cr>
Cnoremap <A-'> ä
Cnoremap <A-"> Ä
Cnoremap <A-;> ö
Cnoremap <A-:> Ö
Cnoremap <A-[> ü
Cnoremap <A-{> Ü
Cnoremap <A--> ß
Nnoremap ,F :echo VS()<cr>
Nnoremap ,e :call AppendToEndNormal()<cr>
Nnoremap ,E :AppendAll<cr>
Nnoremap YY :call AppendToClipboard()<cr>
Vnoremap Y :<C-u>let @+ = @+ . join(getline("'<", "'>"), "\n") . "\n"<cr>
Nnoremap <silent> <A-k> :m-2<cr>
Nnoremap <silent> <A-j> :m+1<cr>
Vnoremap <silent> <A-k> :m '<-2<cr>gv=gv
Vnoremap <silent> <A-j> :m '>+1<cr>gv=gv
Nnoremap < <<
Nnoremap > >>
Vnoremap < <gv
Vnoremap > >gv
Nnoremap ,dt :diffthis<cr>
Nnoremap ,do :diffoff<cr>
Nnoremap ,0 :wincmd =<cr>
Inoremap <C-Space> <C-x><C-f>
Inoremap <C-S-v> <c-r>+
Nnoremap ,rm :call DeleteFile()<cr>
Nnoremap ,n :call NewFile()<cr>
Nnoremap ,< :norm yy<cr>:norm dd<cr>:wincmd l<cr>:norm gp<cr>:wincmd h<cr>
Vnoremap ,< :norm gvy<cr>:norm gvd<cr>:wincmd l<cr>:norm gp<cr>:wincmd h<cr>
Nnoremap <C-S-M-h> :echo JoinSplits("h")<cr>
Nnoremap <C-S-M-j> :echo JoinSplits("j")<cr>
Nnoremap <C-S-M-k> :echo JoinSplits("k")<cr>
Nnoremap <C-S-M-l> :echo JoinSplits("l")<cr>
Nnoremap ,<C-S-M-h> :echo MoveOutOfSplit("h")<cr>
Nnoremap ,<C-S-M-j> :echo MoveOutOfSplit("j")<cr>
Nnoremap ,<C-S-M-k> :echo MoveOutOfSplit("k")<cr>
Nnoremap ,<C-S-M-l> :echo MoveOutOfSplit("l")<cr>
Nnoremap <C-;> zh
Nnoremap <C-'> zl
Nnoremap <C-S-;> 20zh
Nnoremap <C-S-'> 20zl
Nnoremap <silent> ,f  :copen<cr>
Nnoremap <silent> <C-Down>   :cnext<cr>zz
Nnoremap <silent> <C-Up>     :cprev<cr>zz
Nnoremap <silent> ,N  :cfirst<cr>zz
Nnoremap <silent> ,P  :clast<cr>zz
Nnoremap <silent> ,c  :cclose<cr>
Nnoremap ,<C-s> :call ExecFunction()<cr>
Nnoremap ,s :call ExecVS()<cr>
Vnoremap ,s :call ExecVS()<cr>
Nnoremap ,S :Re \| :%source \| :ReEnd<cr>
Nnoremap ,rd :call RedoLeaderS()<cr>
Nnoremap ,c :call ToggleComment()<cr>
Vnoremap <F1> J
Nnoremap <F2> :call GetKeys()<cr>
Nnoremap <F3> :call FindKeyPerform()<cr>
Nnoremap <F4> :echo AllKeys()<cr>
Tnoremap <C-v> <C-\><C-n>:call SendCommandToThisTerm([getreg('"')])<cr>i
Vnoremap ,,s :<C-u>silent redir=>output \| silent '<,'>source \| redir END \| put=output<cr>
Nnoremap ,aa :RECP --reg *<cr>
Nnoremap ,an :RECP --reg "<cr>
Nnoremap ,ab :RECP<cr>
Nnoremap ,qd :Diff --all<cr>
Nnoremap ,,qd :Diff --all --cached<cr>
Nnoremap ,qr :PushCWD
Nnoremap ,,qr :GithubPush<cr>
Nnoremap ,qv :Pull<cr>
Nnoremap ,ql :Log<cr>
Nnoremap ,qs :Status<cr>
Nnoremap ,qa :GitAdd<cr>
Nnoremap ,qA :GitAddCWD<cr>
Nnoremap ,,qa :GitAddCWD<cr>
Nnoremap ,qcc :!git rebase --continue<cr>
Nnoremap ,qcs :!git rebase --skip<cr>
Nnoremap ,qca :!git rebase --abort<cr>
Nnoremap ,qf :GitFetch<cr>
Nnoremap ,qu :StashPush<cr>
Nnoremap ,qo :StashPop<cr>
Nnoremap ,m :call VimGrep(v:count)<cr>
Nnoremap ,m :call VimGrep(v:count)<cr>
Nnoremap <M-a> :Lines<cr>
Nnoremap <C-S-a> :call VimGrep(v:count)<cr>
Nnoremap [D :cclose<cr>
Nnoremap [C :copen<cr>
Nnoremap [A :cprev<cr>
Nnoremap [B :cnext<cr>
Anoremap <F11> :call RefreshFileList()<cr>:call NextBuffer()<cr>
Anoremap <S-F11> :call RefreshFileList()<cr>:call PrevBuffer()<cr>
Anoremap <F10> :call RefreshFileListDir()<cr>:call NextBuffer()<cr>
Anoremap <S-F10> :call RefreshFileListDir()<cr>:call PrevBuffer()<cr>
Nnoremap ,,,,,<F1> :call SelectFunctionBlock()<cr>
Nnoremap <F1> :call GitInfo()<cr>
Nnoremap <S-F1> :call GitInfo('--stash')<cr>
Nnoremap <C-S-F1> :call GitStashDrop()<cr>
Nnoremap ,,,,<F3> :call GitDeleteLastUnpushedCommit()<cr>
Nnoremap ,,,<F1> :call GitCommitRepo()<cr>
Nnoremap ,,<F1> :call GitCommitRepo(input("Commit Message: "))<cr>
Nnoremap ,<F1> :call GitAddRepo()<cr>
Nnoremap ,,,,,<F1> :call GitInitRepository()<cr>
Nnoremap ,,,,,,<F1> :call GitInitRepositoryBare()<cr>
Nnoremap <F2> :call SelectRemote(1)<cr>
Nnoremap <S-F2> :call SelectRemote(-1)<cr>
Nnoremap ,<F2> :call GitRenameRemote()<cr>
Nnoremap ,,<F2> :call GitRemoteAdd()<cr>
Nnoremap ,,,<F2> :call GitSetRemote()<cr>
Nnoremap <F3> :call SelectBranch(1)<cr>
Nnoremap <S-F3> :call SelectBranch(-1)<cr>
Nnoremap ,<F3> :call GitRenameBranch()<cr>
Nnoremap ,,<F3> :call GitNewBranch()<cr>
Nnoremap <F4> :call GitStashPush()<cr>
Nnoremap <S-F4> :call GitStashPop()<cr>
Tnoremap <C-v> <C-\><C-n>
Vnoremap i <C-c>i
Vnoremap <C-c> :call CommandInfo()<cr>
Nnoremap <F12> :call ToggleFavorite(1)<cr>
Nnoremap <S-F12> :call ToggleFavorite(-1)<cr>
Nnoremap <C-F12> :call OpenFZF(g:favorites)<cr>
Nnoremap ,<F12> :call SetUnsetFavorite()<cr>
Nnoremap ,,<F12> :call ClearUnreachableFavorites()<cr>