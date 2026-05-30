nnoremap <C-S-o> :call SetMode("\<C-S-o\>", "Normal") \| :call JumpToNextFile(-1)<cr>
nnoremap <C-S-i> :call SetMode("\<C-S-i\>", "Normal") \| :call JumpToNextFile(1)<cr>
nnoremap <C-S-z> :call SetMode("\<C-S-z\>", "Normal") \| :suspend<cr>
tnoremap <C-S-z> <C-\><C-n>:call SetMode("\<C-S-z\>", "Terminal") \| :suspend<cr>
nnoremap <C-z> :call SetMode("\<C-z\>", "Normal") \| :if winnr('$')<=1 \| suspend \| else \| hide \| endif<cr>
tnoremap <C-z> <C-\><C-n>:call SetMode("\<C-z\>", "Terminal") \| :if winnr('$')<=1 \| suspend \| else \| hide \| endif<cr>
nnoremap ,,f :call SetMode(",,f", "Normal") \| :call FavoriteFile()<cr>
nnoremap ,,f :call SetMode(",,f", "Normal") \| :call FavoriteFile()<cr>
nnoremap ,,p :call SetMode(",,p", "Normal") \| :call FavoritePath()<cr>
nnoremap <C-8> :call SetMode("\<C-8\>", "Normal") \| :call Favorite()<cr>
nnoremap ,s :call SetMode(",s", "Normal") \| :so %<cr>
nnoremap ,t :call SetMode(",t", "Normal") \| :Tidy<cr>
nnoremap <M-q> :call SetMode("\<M-q\>", "Normal") \| :q<cr>
tnoremap <M-q> <C-\><C-n>:call SetMode("\<M-q\>", "Terminal") \| <c-\><c-n>:q<cr>
vnoremap <F5> <C-u>:call SetMode("\<F5\>", "Visual") \| :call VSRewriteCommand("h")<cr>
vnoremap <F6> <C-u>:call SetMode("\<F6\>", "Visual") \| :call VSRewriteCommand("j")<cr>
vnoremap <F7> <C-u>:call SetMode("\<F7\>", "Visual") \| :call VSRewriteCommand("k")<cr>
vnoremap <F8> <C-u>:call SetMode("\<F8\>", "Visual") \| :call VSRewriteCommand("l")<cr>
inoremap <F5> <C-o>:call SetMode("\<F5\>", "Insert") \| :call SavedCommandToTerm("h")<cr>
inoremap <F6> <C-o>:call SetMode("\<F6\>", "Insert") \| :call SavedCommandToTerm("j")<cr>
inoremap <F7> <C-o>:call SetMode("\<F7\>", "Insert") \| :call SavedCommandToTerm("k")<cr>
inoremap <F8> <C-o>:call SetMode("\<F8\>", "Insert") \| :call SavedCommandToTerm("l")<cr>
nnoremap <F5> :call SetMode("\<F5\>", "Normal") \| :call SavedCommandToTerm("h")<cr>
cnoremap <F5> :call SetMode("\<F5\>", "Command") \| :call SavedCommandToTerm("h")<cr>
nnoremap <F6> :call SetMode("\<F6\>", "Normal") \| :call SavedCommandToTerm("j")<cr>
cnoremap <F6> :call SetMode("\<F6\>", "Command") \| :call SavedCommandToTerm("j")<cr>
nnoremap <F7> :call SetMode("\<F7\>", "Normal") \| :call SavedCommandToTerm("k")<cr>
cnoremap <F7> :call SetMode("\<F7\>", "Command") \| :call SavedCommandToTerm("k")<cr>
nnoremap <F8> :call SetMode("\<F8\>", "Normal") \| :call SavedCommandToTerm("l")<cr>
cnoremap <F8> :call SetMode("\<F8\>", "Command") \| :call SavedCommandToTerm("l")<cr>
tnoremap <F5> <C-\><C-n>:call SetMode("\<F5\>", "Terminal") \| :call SavedCommandToTerm("h")<cr>
tnoremap <F6> <C-\><C-n>:call SetMode("\<F6\>", "Terminal") \| :call SavedCommandToTerm("j")<cr>
tnoremap <F7> <C-\><C-n>:call SetMode("\<F7\>", "Terminal") \| :call SavedCommandToTerm("k")<cr>
tnoremap <F8> <C-\><C-n>:call SetMode("\<F8\>", "Terminal") \| :call SavedCommandToTerm("l")<cr>
nmap ,<F5> :call SetMode(",\<F5\>", "Normal") \| :call MapCommand("h")<cr>
nmap ,<F6> :call SetMode(",\<F6\>", "Normal") \| :call MapCommand("j")<cr>
nmap ,<F7> :call SetMode(",\<F7\>", "Normal") \| :call MapCommand("k")<cr>
nmap ,<F8> :call SetMode(",\<F8\>", "Normal") \| :call MapCommand("l")<cr>
nmap ,,<F5> :call SetMode(",,\<F5\>", "Normal") \| :call DirectionMapSmart('h')<cr>
nmap ,,<F6> :call SetMode(",,\<F6\>", "Normal") \| :call DirectionMapSmart('j')<cr>
nmap ,,<F7> :call SetMode(",,\<F7\>", "Normal") \| :call DirectionMapSmart('k')<cr>
nmap ,,<F8> :call SetMode(",,\<F8\>", "Normal") \| :call DirectionMapSmart('l')<cr>
nmap ,,,<F5> :call SetMode(",,,\<F5\>", "Normal") \| :call MapCommand("x")<cr>
nmap ,,,<F6> :call SetMode(",,,\<F6\>", "Normal") \| :call MapCommand("x")<cr>
nmap ,,,<F7> :call SetMode(",,,\<F7\>", "Normal") \| :call MapCommand("x")<cr>
nmap ,,,<F8> :call SetMode(",,,\<F8\>", "Normal") \| :call MapCommand("x")<cr>
nnoremap ,,,<F5> :call SetMode(",,,\<F5\>", "Normal") \| :call FixTargetTerm('F5')<cr>
nnoremap ,,,<F6> :call SetMode(",,,\<F6\>", "Normal") \| :call FixTargetTerm('F6')<cr>
nnoremap ,,,<F7> :call SetMode(",,,\<F7\>", "Normal") \| :call FixTargetTerm('F7')<cr>
nnoremap ,,,<F8> :call SetMode(",,,\<F8\>", "Normal") \| :call FixTargetTerm('F8')<cr>
vnoremap <C-F5> <C-u>:call SetMode("\<C-F5\>", "Visual") \| :call RedoCommandToTermWithSigTerm("h")<cr>
vnoremap <C-F6> <C-u>:call SetMode("\<C-F6\>", "Visual") \| :call RedoCommandToTermWithSigTerm("j")<cr>
vnoremap <C-F7> <C-u>:call SetMode("\<C-F7\>", "Visual") \| :call RedoCommandToTermWithSigTerm("k")<cr>
vnoremap <C-F8> <C-u>:call SetMode("\<C-F8\>", "Visual") \| :call RedoCommandToTermWithSigTerm("l")<cr>
inoremap <C-F5> <C-o>:call SetMode("\<C-F5\>", "Insert") \| :call RedoCommandToTermWithSigTerm("h")<cr>
inoremap <C-F6> <C-o>:call SetMode("\<C-F6\>", "Insert") \| :call RedoCommandToTermWithSigTerm("j")<cr>
inoremap <C-F7> <C-o>:call SetMode("\<C-F7\>", "Insert") \| :call RedoCommandToTermWithSigTerm("k")<cr>
inoremap <C-F8> <C-o>:call SetMode("\<C-F8\>", "Insert") \| :call RedoCommandToTermWithSigTerm("l")<cr>
nnoremap <C-F5> :call SetMode("\<C-F5\>", "Normal") \| :call RedoCommandToTermWithSigTerm("h")<cr>
cnoremap <C-F5> :call SetMode("\<C-F5\>", "Command") \| :call RedoCommandToTermWithSigTerm("h")<cr>
nnoremap <C-F6> :call SetMode("\<C-F6\>", "Normal") \| :call RedoCommandToTermWithSigTerm("j")<cr>
cnoremap <C-F6> :call SetMode("\<C-F6\>", "Command") \| :call RedoCommandToTermWithSigTerm("j")<cr>
nnoremap <C-F7> :call SetMode("\<C-F7\>", "Normal") \| :call RedoCommandToTermWithSigTerm("k")<cr>
cnoremap <C-F7> :call SetMode("\<C-F7\>", "Command") \| :call RedoCommandToTermWithSigTerm("k")<cr>
nnoremap <C-F8> :call SetMode("\<C-F8\>", "Normal") \| :call RedoCommandToTermWithSigTerm("l")<cr>
cnoremap <C-F8> :call SetMode("\<C-F8\>", "Command") \| :call RedoCommandToTermWithSigTerm("l")<cr>
tnoremap <C-F5> <C-\><C-n>:call SetMode("\<C-F5\>", "Terminal") \| :call RedoCommandToTermWithSigTerm("h")<cr>
tnoremap <C-F6> <C-\><C-n>:call SetMode("\<C-F6\>", "Terminal") \| :call RedoCommandToTermWithSigTerm("j")<cr>
tnoremap <C-F7> <C-\><C-n>:call SetMode("\<C-F7\>", "Terminal") \| :call RedoCommandToTermWithSigTerm("k")<cr>
tnoremap <C-F8> <C-\><C-n>:call SetMode("\<C-F8\>", "Terminal") \| :call RedoCommandToTermWithSigTerm("l")<cr>
vnoremap <S-F5> <C-u>:call SetMode("\<S-F5\>", "Visual") \| :call RedoCommandToTerm("h")<cr>
vnoremap <S-F6> <C-u>:call SetMode("\<S-F6\>", "Visual") \| :call RedoCommandToTerm("j")<cr>
vnoremap <S-F7> <C-u>:call SetMode("\<S-F7\>", "Visual") \| :call RedoCommandToTerm("k")<cr>
vnoremap <S-F8> <C-u>:call SetMode("\<S-F8\>", "Visual") \| :call RedoCommandToTerm("l")<cr>
inoremap <S-F5> <C-o>:call SetMode("\<S-F5\>", "Insert") \| :call RedoCommandToTerm("h")<cr>
inoremap <S-F6> <C-o>:call SetMode("\<S-F6\>", "Insert") \| :call RedoCommandToTerm("j")<cr>
inoremap <S-F7> <C-o>:call SetMode("\<S-F7\>", "Insert") \| :call RedoCommandToTerm("k")<cr>
inoremap <S-F8> <C-o>:call SetMode("\<S-F8\>", "Insert") \| :call RedoCommandToTerm("l")<cr>
nnoremap <S-F5> :call SetMode("\<S-F5\>", "Normal") \| :call RedoCommandToTerm("h")<cr>
cnoremap <S-F5> :call SetMode("\<S-F5\>", "Command") \| :call RedoCommandToTerm("h")<cr>
nnoremap <S-F6> :call SetMode("\<S-F6\>", "Normal") \| :call RedoCommandToTerm("j")<cr>
cnoremap <S-F6> :call SetMode("\<S-F6\>", "Command") \| :call RedoCommandToTerm("j")<cr>
nnoremap <S-F7> :call SetMode("\<S-F7\>", "Normal") \| :call RedoCommandToTerm("k")<cr>
cnoremap <S-F7> :call SetMode("\<S-F7\>", "Command") \| :call RedoCommandToTerm("k")<cr>
nnoremap <S-F8> :call SetMode("\<S-F8\>", "Normal") \| :call RedoCommandToTerm("l")<cr>
cnoremap <S-F8> :call SetMode("\<S-F8\>", "Command") \| :call RedoCommandToTerm("l")<cr>
tnoremap <S-F5> <C-\><C-n>:call SetMode("\<S-F5\>", "Terminal") \| :call RedoCommandToTerm("h")<cr>
tnoremap <S-F6> <C-\><C-n>:call SetMode("\<S-F6\>", "Terminal") \| :call RedoCommandToTerm("j")<cr>
tnoremap <S-F7> <C-\><C-n>:call SetMode("\<S-F7\>", "Terminal") \| :call RedoCommandToTerm("k")<cr>
tnoremap <S-F8> <C-\><C-n>:call SetMode("\<S-F8\>", "Terminal") \| :call RedoCommandToTerm("l")<cr>
vnoremap <C-S-F5> <C-u>:call SetMode("\<C-S-F5\>", "Visual") \| :call SigTermToTerm("h")<cr>
vnoremap <C-S-F6> <C-u>:call SetMode("\<C-S-F6\>", "Visual") \| :call SigTermToTerm("j")<cr>
vnoremap <C-S-F7> <C-u>:call SetMode("\<C-S-F7\>", "Visual") \| :call SigTermToTerm("k")<cr>
vnoremap <C-S-F8> <C-u>:call SetMode("\<C-S-F8\>", "Visual") \| :call SigTermToTerm("l")<cr>
inoremap <C-S-F5> <C-o>:call SetMode("\<C-S-F5\>", "Insert") \| :call SigTermToTerm("h")<cr>
inoremap <C-S-F6> <C-o>:call SetMode("\<C-S-F6\>", "Insert") \| :call SigTermToTerm("j")<cr>
inoremap <C-S-F7> <C-o>:call SetMode("\<C-S-F7\>", "Insert") \| :call SigTermToTerm("k")<cr>
inoremap <C-S-F8> <C-o>:call SetMode("\<C-S-F8\>", "Insert") \| :call SigTermToTerm("l")<cr>
nnoremap <C-S-F5> :call SetMode("\<C-S-F5\>", "Normal") \| :call SigTermToTerm("h")<cr>
cnoremap <C-S-F5> :call SetMode("\<C-S-F5\>", "Command") \| :call SigTermToTerm("h")<cr>
nnoremap <C-S-F6> :call SetMode("\<C-S-F6\>", "Normal") \| :call SigTermToTerm("j")<cr>
cnoremap <C-S-F6> :call SetMode("\<C-S-F6\>", "Command") \| :call SigTermToTerm("j")<cr>
nnoremap <C-S-F7> :call SetMode("\<C-S-F7\>", "Normal") \| :call SigTermToTerm("k")<cr>
cnoremap <C-S-F7> :call SetMode("\<C-S-F7\>", "Command") \| :call SigTermToTerm("k")<cr>
nnoremap <C-S-F8> :call SetMode("\<C-S-F8\>", "Normal") \| :call SigTermToTerm("l")<cr>
cnoremap <C-S-F8> :call SetMode("\<C-S-F8\>", "Command") \| :call SigTermToTerm("l")<cr>
tnoremap <C-S-F5> <C-\><C-n>:call SetMode("\<C-S-F5\>", "Terminal") \| :call SigTermToTerm("h")<cr>
tnoremap <C-S-F6> <C-\><C-n>:call SetMode("\<C-S-F6\>", "Terminal") \| :call SigTermToTerm("j")<cr>
tnoremap <C-S-F7> <C-\><C-n>:call SetMode("\<C-S-F7\>", "Terminal") \| :call SigTermToTerm("k")<cr>
tnoremap <C-S-F8> <C-\><C-n>:call SetMode("\<C-S-F8\>", "Terminal") \| :call SigTermToTerm("l")<cr>
vnoremap . <C-u>:call SetMode(".", "Visual") \| :<Up><cr>
nnoremap ,h :call SetMode(",h", "Normal") \|     :call Open("h", "buffer", "new")<cr>
vnoremap ,h <C-u>:call SetMode(",h", "Visual") \|     :call Open("h", "buffer", "new")<cr>
tnoremap ,h <C-\><C-n>:call SetMode(",h", "Terminal") \|     :call Open("h", "buffer", "new")<cr>
inoremap ,h <C-o>:call SetMode(",h", "Insert") \|     :call Open("h", "buffer", "new")<cr>
nnoremap ,j :call SetMode(",j", "Normal") \|     :call Open("j", "buffer", "new")<cr>
vnoremap ,j <C-u>:call SetMode(",j", "Visual") \|     :call Open("j", "buffer", "new")<cr>
tnoremap ,j <C-\><C-n>:call SetMode(",j", "Terminal") \|     :call Open("j", "buffer", "new")<cr>
inoremap ,j <C-o>:call SetMode(",j", "Insert") \|     :call Open("j", "buffer", "new")<cr>
nnoremap ,k :call SetMode(",k", "Normal") \|     :call Open("k", "buffer", "new")<cr>
vnoremap ,k <C-u>:call SetMode(",k", "Visual") \|     :call Open("k", "buffer", "new")<cr>
tnoremap ,k <C-\><C-n>:call SetMode(",k", "Terminal") \|     :call Open("k", "buffer", "new")<cr>
inoremap ,k <C-o>:call SetMode(",k", "Insert") \|     :call Open("k", "buffer", "new")<cr>
nnoremap ,l :call SetMode(",l", "Normal") \|     :call Open("l", "buffer", "new")<cr>
vnoremap ,l <C-u>:call SetMode(",l", "Visual") \|     :call Open("l", "buffer", "new")<cr>
tnoremap ,l <C-\><C-n>:call SetMode(",l", "Terminal") \|     :call Open("l", "buffer", "new")<cr>
inoremap ,l <C-o>:call SetMode(",l", "Insert") \|     :call Open("l", "buffer", "new")<cr>
nnoremap ,H :call SetMode(",H", "Normal") \|     :call Open("H", "buffer", "new")<cr>
vnoremap ,H <C-u>:call SetMode(",H", "Visual") \|     :call Open("H", "buffer", "new")<cr>
tnoremap ,H <C-\><C-n>:call SetMode(",H", "Terminal") \|     :call Open("H", "buffer", "new")<cr>
inoremap ,H <C-o>:call SetMode(",H", "Insert") \|     :call Open("H", "buffer", "new")<cr>
nnoremap ,J :call SetMode(",J", "Normal") \|     :call Open("J", "buffer", "new")<cr>
vnoremap ,J <C-u>:call SetMode(",J", "Visual") \|     :call Open("J", "buffer", "new")<cr>
tnoremap ,J <C-\><C-n>:call SetMode(",J", "Terminal") \|     :call Open("J", "buffer", "new")<cr>
inoremap ,J <C-o>:call SetMode(",J", "Insert") \|     :call Open("J", "buffer", "new")<cr>
nnoremap ,K :call SetMode(",K", "Normal") \|     :call Open("K", "buffer", "new")<cr>
vnoremap ,K <C-u>:call SetMode(",K", "Visual") \|     :call Open("K", "buffer", "new")<cr>
tnoremap ,K <C-\><C-n>:call SetMode(",K", "Terminal") \|     :call Open("K", "buffer", "new")<cr>
inoremap ,K <C-o>:call SetMode(",K", "Insert") \|     :call Open("K", "buffer", "new")<cr>
nnoremap ,L :call SetMode(",L", "Normal") \|     :call Open("L", "buffer", "new")<cr>
vnoremap ,L <C-u>:call SetMode(",L", "Visual") \|     :call Open("L", "buffer", "new")<cr>
tnoremap ,L <C-\><C-n>:call SetMode(",L", "Terminal") \|     :call Open("L", "buffer", "new")<cr>
inoremap ,L <C-o>:call SetMode(",L", "Insert") \|     :call Open("L", "buffer", "new")<cr>
nnoremap ,,h :call SetMode(",,h", "Normal") \|     :call Open("h", "terminal", "new")<cr>
vnoremap ,,h <C-u>:call SetMode(",,h", "Visual") \|     :call Open("h", "terminal", "new")<cr>
tnoremap ,,h <C-\><C-n>:call SetMode(",,h", "Terminal") \|     :call Open("h", "terminal", "new")<cr>
inoremap ,,h <C-o>:call SetMode(",,h", "Insert") \|     :call Open("h", "terminal", "new")<cr>
nnoremap ,,j :call SetMode(",,j", "Normal") \|     :call Open("j", "terminal", "new")<cr>
vnoremap ,,j <C-u>:call SetMode(",,j", "Visual") \|     :call Open("j", "terminal", "new")<cr>
tnoremap ,,j <C-\><C-n>:call SetMode(",,j", "Terminal") \|     :call Open("j", "terminal", "new")<cr>
inoremap ,,j <C-o>:call SetMode(",,j", "Insert") \|     :call Open("j", "terminal", "new")<cr>
nnoremap ,,k :call SetMode(",,k", "Normal") \|     :call Open("k", "terminal", "new")<cr>
vnoremap ,,k <C-u>:call SetMode(",,k", "Visual") \|     :call Open("k", "terminal", "new")<cr>
tnoremap ,,k <C-\><C-n>:call SetMode(",,k", "Terminal") \|     :call Open("k", "terminal", "new")<cr>
inoremap ,,k <C-o>:call SetMode(",,k", "Insert") \|     :call Open("k", "terminal", "new")<cr>
nnoremap ,,l :call SetMode(",,l", "Normal") \|     :call Open("l", "terminal", "new")<cr>
vnoremap ,,l <C-u>:call SetMode(",,l", "Visual") \|     :call Open("l", "terminal", "new")<cr>
tnoremap ,,l <C-\><C-n>:call SetMode(",,l", "Terminal") \|     :call Open("l", "terminal", "new")<cr>
inoremap ,,l <C-o>:call SetMode(",,l", "Insert") \|     :call Open("l", "terminal", "new")<cr>
nnoremap ,,H :call SetMode(",,H", "Normal") \|     :call Open("H", "terminal", "new")<cr>
vnoremap ,,H <C-u>:call SetMode(",,H", "Visual") \|     :call Open("H", "terminal", "new")<cr>
tnoremap ,,H <C-\><C-n>:call SetMode(",,H", "Terminal") \|     :call Open("H", "terminal", "new")<cr>
inoremap ,,H <C-o>:call SetMode(",,H", "Insert") \|     :call Open("H", "terminal", "new")<cr>
nnoremap ,,J :call SetMode(",,J", "Normal") \|     :call Open("J", "terminal", "new")<cr>
vnoremap ,,J <C-u>:call SetMode(",,J", "Visual") \|     :call Open("J", "terminal", "new")<cr>
tnoremap ,,J <C-\><C-n>:call SetMode(",,J", "Terminal") \|     :call Open("J", "terminal", "new")<cr>
inoremap ,,J <C-o>:call SetMode(",,J", "Insert") \|     :call Open("J", "terminal", "new")<cr>
nnoremap ,,K :call SetMode(",,K", "Normal") \|     :call Open("K", "terminal", "new")<cr>
vnoremap ,,K <C-u>:call SetMode(",,K", "Visual") \|     :call Open("K", "terminal", "new")<cr>
tnoremap ,,K <C-\><C-n>:call SetMode(",,K", "Terminal") \|     :call Open("K", "terminal", "new")<cr>
inoremap ,,K <C-o>:call SetMode(",,K", "Insert") \|     :call Open("K", "terminal", "new")<cr>
nnoremap ,,L :call SetMode(",,L", "Normal") \|     :call Open("L", "terminal", "new")<cr>
vnoremap ,,L <C-u>:call SetMode(",,L", "Visual") \|     :call Open("L", "terminal", "new")<cr>
tnoremap ,,L <C-\><C-n>:call SetMode(",,L", "Terminal") \|     :call Open("L", "terminal", "new")<cr>
inoremap ,,L <C-o>:call SetMode(",,L", "Insert") \|     :call Open("L", "terminal", "new")<cr>
nnoremap <A-H> :call SetMode("\<A-H\>", "Normal") \|     :call Open("H", "buffer", "new")<cr>
vnoremap <A-H> <C-u>:call SetMode("\<A-H\>", "Visual") \|     :call Open("H", "buffer", "new")<cr>
cnoremap <A-H> :call SetMode("\<A-H\>", "Command") \|     :call Open("H", "buffer", "new")<cr>
tnoremap <A-H> <C-\><C-n>:call SetMode("\<A-H\>", "Terminal") \|     :call Open("H", "buffer", "new")<cr>
inoremap <A-H> <C-o>:call SetMode("\<A-H\>", "Insert") \|     :call Open("H", "buffer", "new")<cr>
xnoremap <A-H> :call SetMode("\<A-H\>", "X") \|     :call Open("H", "buffer", "new")<cr>
snoremap <A-H> :call SetMode("\<A-H\>", "S") \|     :call Open("H", "buffer", "new")<cr>
onoremap <A-H> :call SetMode("\<A-H\>", "O") \|     :call Open("H", "buffer", "new")<cr>
lnoremap <A-H> :call SetMode("\<A-H\>", "L") \|     :call Open("H", "buffer", "new")<cr>
nnoremap <A-J> :call SetMode("\<A-J\>", "Normal") \|     :call Open("J", "buffer", "new")<cr>
vnoremap <A-J> <C-u>:call SetMode("\<A-J\>", "Visual") \|     :call Open("J", "buffer", "new")<cr>
cnoremap <A-J> :call SetMode("\<A-J\>", "Command") \|     :call Open("J", "buffer", "new")<cr>
tnoremap <A-J> <C-\><C-n>:call SetMode("\<A-J\>", "Terminal") \|     :call Open("J", "buffer", "new")<cr>
inoremap <A-J> <C-o>:call SetMode("\<A-J\>", "Insert") \|     :call Open("J", "buffer", "new")<cr>
xnoremap <A-J> :call SetMode("\<A-J\>", "X") \|     :call Open("J", "buffer", "new")<cr>
snoremap <A-J> :call SetMode("\<A-J\>", "S") \|     :call Open("J", "buffer", "new")<cr>
onoremap <A-J> :call SetMode("\<A-J\>", "O") \|     :call Open("J", "buffer", "new")<cr>
lnoremap <A-J> :call SetMode("\<A-J\>", "L") \|     :call Open("J", "buffer", "new")<cr>
nnoremap <A-K> :call SetMode("\<A-K\>", "Normal") \|     :call Open("K", "buffer", "new")<cr>
vnoremap <A-K> <C-u>:call SetMode("\<A-K\>", "Visual") \|     :call Open("K", "buffer", "new")<cr>
cnoremap <A-K> :call SetMode("\<A-K\>", "Command") \|     :call Open("K", "buffer", "new")<cr>
tnoremap <A-K> <C-\><C-n>:call SetMode("\<A-K\>", "Terminal") \|     :call Open("K", "buffer", "new")<cr>
inoremap <A-K> <C-o>:call SetMode("\<A-K\>", "Insert") \|     :call Open("K", "buffer", "new")<cr>
xnoremap <A-K> :call SetMode("\<A-K\>", "X") \|     :call Open("K", "buffer", "new")<cr>
snoremap <A-K> :call SetMode("\<A-K\>", "S") \|     :call Open("K", "buffer", "new")<cr>
onoremap <A-K> :call SetMode("\<A-K\>", "O") \|     :call Open("K", "buffer", "new")<cr>
lnoremap <A-K> :call SetMode("\<A-K\>", "L") \|     :call Open("K", "buffer", "new")<cr>
nnoremap <A-L> :call SetMode("\<A-L\>", "Normal") \|     :call Open("L", "buffer", "new")<cr>
vnoremap <A-L> <C-u>:call SetMode("\<A-L\>", "Visual") \|     :call Open("L", "buffer", "new")<cr>
cnoremap <A-L> :call SetMode("\<A-L\>", "Command") \|     :call Open("L", "buffer", "new")<cr>
tnoremap <A-L> <C-\><C-n>:call SetMode("\<A-L\>", "Terminal") \|     :call Open("L", "buffer", "new")<cr>
inoremap <A-L> <C-o>:call SetMode("\<A-L\>", "Insert") \|     :call Open("L", "buffer", "new")<cr>
xnoremap <A-L> :call SetMode("\<A-L\>", "X") \|     :call Open("L", "buffer", "new")<cr>
snoremap <A-L> :call SetMode("\<A-L\>", "S") \|     :call Open("L", "buffer", "new")<cr>
onoremap <A-L> :call SetMode("\<A-L\>", "O") \|     :call Open("L", "buffer", "new")<cr>
lnoremap <A-L> :call SetMode("\<A-L\>", "L") \|     :call Open("L", "buffer", "new")<cr>
nnoremap <A-S-h> :call SetMode("\<A-S-h\>", "Normal") \|     :call Open("h", "terminal", "new")<cr>
vnoremap <A-S-h> <C-u>:call SetMode("\<A-S-h\>", "Visual") \|     :call Open("h", "terminal", "new")<cr>
cnoremap <A-S-h> :call SetMode("\<A-S-h\>", "Command") \|     :call Open("h", "terminal", "new")<cr>
tnoremap <A-S-h> <C-\><C-n>:call SetMode("\<A-S-h\>", "Terminal") \|     :call Open("h", "terminal", "new")<cr>
inoremap <A-S-h> <C-o>:call SetMode("\<A-S-h\>", "Insert") \|     :call Open("h", "terminal", "new")<cr>
xnoremap <A-S-h> :call SetMode("\<A-S-h\>", "X") \|     :call Open("h", "terminal", "new")<cr>
snoremap <A-S-h> :call SetMode("\<A-S-h\>", "S") \|     :call Open("h", "terminal", "new")<cr>
onoremap <A-S-h> :call SetMode("\<A-S-h\>", "O") \|     :call Open("h", "terminal", "new")<cr>
lnoremap <A-S-h> :call SetMode("\<A-S-h\>", "L") \|     :call Open("h", "terminal", "new")<cr>
nnoremap <A-S-j> :call SetMode("\<A-S-j\>", "Normal") \|     :call Open("j", "terminal", "new")<cr>
vnoremap <A-S-j> <C-u>:call SetMode("\<A-S-j\>", "Visual") \|     :call Open("j", "terminal", "new")<cr>
cnoremap <A-S-j> :call SetMode("\<A-S-j\>", "Command") \|     :call Open("j", "terminal", "new")<cr>
tnoremap <A-S-j> <C-\><C-n>:call SetMode("\<A-S-j\>", "Terminal") \|     :call Open("j", "terminal", "new")<cr>
inoremap <A-S-j> <C-o>:call SetMode("\<A-S-j\>", "Insert") \|     :call Open("j", "terminal", "new")<cr>
xnoremap <A-S-j> :call SetMode("\<A-S-j\>", "X") \|     :call Open("j", "terminal", "new")<cr>
snoremap <A-S-j> :call SetMode("\<A-S-j\>", "S") \|     :call Open("j", "terminal", "new")<cr>
onoremap <A-S-j> :call SetMode("\<A-S-j\>", "O") \|     :call Open("j", "terminal", "new")<cr>
lnoremap <A-S-j> :call SetMode("\<A-S-j\>", "L") \|     :call Open("j", "terminal", "new")<cr>
nnoremap <A-S-k> :call SetMode("\<A-S-k\>", "Normal") \|     :call Open("k", "terminal", "new")<cr>
vnoremap <A-S-k> <C-u>:call SetMode("\<A-S-k\>", "Visual") \|     :call Open("k", "terminal", "new")<cr>
cnoremap <A-S-k> :call SetMode("\<A-S-k\>", "Command") \|     :call Open("k", "terminal", "new")<cr>
tnoremap <A-S-k> <C-\><C-n>:call SetMode("\<A-S-k\>", "Terminal") \|     :call Open("k", "terminal", "new")<cr>
inoremap <A-S-k> <C-o>:call SetMode("\<A-S-k\>", "Insert") \|     :call Open("k", "terminal", "new")<cr>
xnoremap <A-S-k> :call SetMode("\<A-S-k\>", "X") \|     :call Open("k", "terminal", "new")<cr>
snoremap <A-S-k> :call SetMode("\<A-S-k\>", "S") \|     :call Open("k", "terminal", "new")<cr>
onoremap <A-S-k> :call SetMode("\<A-S-k\>", "O") \|     :call Open("k", "terminal", "new")<cr>
lnoremap <A-S-k> :call SetMode("\<A-S-k\>", "L") \|     :call Open("k", "terminal", "new")<cr>
nnoremap <A-S-l> :call SetMode("\<A-S-l\>", "Normal") \|     :call Open("l", "terminal", "new")<cr>
vnoremap <A-S-l> <C-u>:call SetMode("\<A-S-l\>", "Visual") \|     :call Open("l", "terminal", "new")<cr>
cnoremap <A-S-l> :call SetMode("\<A-S-l\>", "Command") \|     :call Open("l", "terminal", "new")<cr>
tnoremap <A-S-l> <C-\><C-n>:call SetMode("\<A-S-l\>", "Terminal") \|     :call Open("l", "terminal", "new")<cr>
inoremap <A-S-l> <C-o>:call SetMode("\<A-S-l\>", "Insert") \|     :call Open("l", "terminal", "new")<cr>
xnoremap <A-S-l> :call SetMode("\<A-S-l\>", "X") \|     :call Open("l", "terminal", "new")<cr>
snoremap <A-S-l> :call SetMode("\<A-S-l\>", "S") \|     :call Open("l", "terminal", "new")<cr>
onoremap <A-S-l> :call SetMode("\<A-S-l\>", "O") \|     :call Open("l", "terminal", "new")<cr>
lnoremap <A-S-l> :call SetMode("\<A-S-l\>", "L") \|     :call Open("l", "terminal", "new")<cr>
nnoremap <A-S-H> :call SetMode("\<A-S-H\>", "Normal") \|     :call Open("H", "terminal", "new")<cr>
vnoremap <A-S-H> <C-u>:call SetMode("\<A-S-H\>", "Visual") \|     :call Open("H", "terminal", "new")<cr>
cnoremap <A-S-H> :call SetMode("\<A-S-H\>", "Command") \|     :call Open("H", "terminal", "new")<cr>
tnoremap <A-S-H> <C-\><C-n>:call SetMode("\<A-S-H\>", "Terminal") \|     :call Open("H", "terminal", "new")<cr>
inoremap <A-S-H> <C-o>:call SetMode("\<A-S-H\>", "Insert") \|     :call Open("H", "terminal", "new")<cr>
xnoremap <A-S-H> :call SetMode("\<A-S-H\>", "X") \|     :call Open("H", "terminal", "new")<cr>
snoremap <A-S-H> :call SetMode("\<A-S-H\>", "S") \|     :call Open("H", "terminal", "new")<cr>
onoremap <A-S-H> :call SetMode("\<A-S-H\>", "O") \|     :call Open("H", "terminal", "new")<cr>
lnoremap <A-S-H> :call SetMode("\<A-S-H\>", "L") \|     :call Open("H", "terminal", "new")<cr>
nnoremap <A-S-J> :call SetMode("\<A-S-J\>", "Normal") \|     :call Open("J", "terminal", "new")<cr>
vnoremap <A-S-J> <C-u>:call SetMode("\<A-S-J\>", "Visual") \|     :call Open("J", "terminal", "new")<cr>
cnoremap <A-S-J> :call SetMode("\<A-S-J\>", "Command") \|     :call Open("J", "terminal", "new")<cr>
tnoremap <A-S-J> <C-\><C-n>:call SetMode("\<A-S-J\>", "Terminal") \|     :call Open("J", "terminal", "new")<cr>
inoremap <A-S-J> <C-o>:call SetMode("\<A-S-J\>", "Insert") \|     :call Open("J", "terminal", "new")<cr>
xnoremap <A-S-J> :call SetMode("\<A-S-J\>", "X") \|     :call Open("J", "terminal", "new")<cr>
snoremap <A-S-J> :call SetMode("\<A-S-J\>", "S") \|     :call Open("J", "terminal", "new")<cr>
onoremap <A-S-J> :call SetMode("\<A-S-J\>", "O") \|     :call Open("J", "terminal", "new")<cr>
lnoremap <A-S-J> :call SetMode("\<A-S-J\>", "L") \|     :call Open("J", "terminal", "new")<cr>
nnoremap <A-S-K> :call SetMode("\<A-S-K\>", "Normal") \|     :call Open("K", "terminal", "new")<cr>
vnoremap <A-S-K> <C-u>:call SetMode("\<A-S-K\>", "Visual") \|     :call Open("K", "terminal", "new")<cr>
cnoremap <A-S-K> :call SetMode("\<A-S-K\>", "Command") \|     :call Open("K", "terminal", "new")<cr>
tnoremap <A-S-K> <C-\><C-n>:call SetMode("\<A-S-K\>", "Terminal") \|     :call Open("K", "terminal", "new")<cr>
inoremap <A-S-K> <C-o>:call SetMode("\<A-S-K\>", "Insert") \|     :call Open("K", "terminal", "new")<cr>
xnoremap <A-S-K> :call SetMode("\<A-S-K\>", "X") \|     :call Open("K", "terminal", "new")<cr>
snoremap <A-S-K> :call SetMode("\<A-S-K\>", "S") \|     :call Open("K", "terminal", "new")<cr>
onoremap <A-S-K> :call SetMode("\<A-S-K\>", "O") \|     :call Open("K", "terminal", "new")<cr>
lnoremap <A-S-K> :call SetMode("\<A-S-K\>", "L") \|     :call Open("K", "terminal", "new")<cr>
nnoremap <A-S-L> :call SetMode("\<A-S-L\>", "Normal") \|     :call Open("L", "terminal", "new")<cr>
vnoremap <A-S-L> <C-u>:call SetMode("\<A-S-L\>", "Visual") \|     :call Open("L", "terminal", "new")<cr>
cnoremap <A-S-L> :call SetMode("\<A-S-L\>", "Command") \|     :call Open("L", "terminal", "new")<cr>
tnoremap <A-S-L> <C-\><C-n>:call SetMode("\<A-S-L\>", "Terminal") \|     :call Open("L", "terminal", "new")<cr>
inoremap <A-S-L> <C-o>:call SetMode("\<A-S-L\>", "Insert") \|     :call Open("L", "terminal", "new")<cr>
xnoremap <A-S-L> :call SetMode("\<A-S-L\>", "X") \|     :call Open("L", "terminal", "new")<cr>
snoremap <A-S-L> :call SetMode("\<A-S-L\>", "S") \|     :call Open("L", "terminal", "new")<cr>
onoremap <A-S-L> :call SetMode("\<A-S-L\>", "O") \|     :call Open("L", "terminal", "new")<cr>
lnoremap <A-S-L> :call SetMode("\<A-S-L\>", "L") \|     :call Open("L", "terminal", "new")<cr>
nnoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "Normal") \|     :call Open("h", "terminal", "new")<cr>
vnoremap <A-S-Left> <C-u>:call SetMode("\<A-S-Left\>", "Visual") \|     :call Open("h", "terminal", "new")<cr>
cnoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "Command") \|     :call Open("h", "terminal", "new")<cr>
tnoremap <A-S-Left> <C-\><C-n>:call SetMode("\<A-S-Left\>", "Terminal") \|     :call Open("h", "terminal", "new")<cr>
inoremap <A-S-Left> <C-o>:call SetMode("\<A-S-Left\>", "Insert") \|     :call Open("h", "terminal", "new")<cr>
xnoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "X") \|     :call Open("h", "terminal", "new")<cr>
snoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "S") \|     :call Open("h", "terminal", "new")<cr>
onoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "O") \|     :call Open("h", "terminal", "new")<cr>
lnoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "L") \|     :call Open("h", "terminal", "new")<cr>
nnoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "Normal") \|     :call Open("j", "terminal", "new")<cr>
vnoremap <A-S-Down> <C-u>:call SetMode("\<A-S-Down\>", "Visual") \|     :call Open("j", "terminal", "new")<cr>
cnoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "Command") \|     :call Open("j", "terminal", "new")<cr>
tnoremap <A-S-Down> <C-\><C-n>:call SetMode("\<A-S-Down\>", "Terminal") \|     :call Open("j", "terminal", "new")<cr>
inoremap <A-S-Down> <C-o>:call SetMode("\<A-S-Down\>", "Insert") \|     :call Open("j", "terminal", "new")<cr>
xnoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "X") \|     :call Open("j", "terminal", "new")<cr>
snoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "S") \|     :call Open("j", "terminal", "new")<cr>
onoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "O") \|     :call Open("j", "terminal", "new")<cr>
lnoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "L") \|     :call Open("j", "terminal", "new")<cr>
nnoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "Normal") \|       :call Open("k", "terminal", "new")<cr>
vnoremap <A-S-Up> <C-u>:call SetMode("\<A-S-Up\>", "Visual") \|       :call Open("k", "terminal", "new")<cr>
cnoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "Command") \|       :call Open("k", "terminal", "new")<cr>
tnoremap <A-S-Up> <C-\><C-n>:call SetMode("\<A-S-Up\>", "Terminal") \|       :call Open("k", "terminal", "new")<cr>
inoremap <A-S-Up> <C-o>:call SetMode("\<A-S-Up\>", "Insert") \|       :call Open("k", "terminal", "new")<cr>
xnoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "X") \|       :call Open("k", "terminal", "new")<cr>
snoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "S") \|       :call Open("k", "terminal", "new")<cr>
onoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "O") \|       :call Open("k", "terminal", "new")<cr>
lnoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "L") \|       :call Open("k", "terminal", "new")<cr>
nnoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "Normal") \|    :call Open("l", "terminal", "new")<cr>
vnoremap <A-S-Right> <C-u>:call SetMode("\<A-S-Right\>", "Visual") \|    :call Open("l", "terminal", "new")<cr>
cnoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "Command") \|    :call Open("l", "terminal", "new")<cr>
tnoremap <A-S-Right> <C-\><C-n>:call SetMode("\<A-S-Right\>", "Terminal") \|    :call Open("l", "terminal", "new")<cr>
inoremap <A-S-Right> <C-o>:call SetMode("\<A-S-Right\>", "Insert") \|    :call Open("l", "terminal", "new")<cr>
xnoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "X") \|    :call Open("l", "terminal", "new")<cr>
snoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "S") \|    :call Open("l", "terminal", "new")<cr>
onoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "O") \|    :call Open("l", "terminal", "new")<cr>
lnoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "L") \|    :call Open("l", "terminal", "new")<cr>
nnoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "Normal") \|     :call Open("H", "terminal", "new")<cr>
vnoremap <A-S-Left> <C-u>:call SetMode("\<A-S-Left\>", "Visual") \|     :call Open("H", "terminal", "new")<cr>
cnoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "Command") \|     :call Open("H", "terminal", "new")<cr>
tnoremap <A-S-Left> <C-\><C-n>:call SetMode("\<A-S-Left\>", "Terminal") \|     :call Open("H", "terminal", "new")<cr>
inoremap <A-S-Left> <C-o>:call SetMode("\<A-S-Left\>", "Insert") \|     :call Open("H", "terminal", "new")<cr>
xnoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "X") \|     :call Open("H", "terminal", "new")<cr>
snoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "S") \|     :call Open("H", "terminal", "new")<cr>
onoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "O") \|     :call Open("H", "terminal", "new")<cr>
lnoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "L") \|     :call Open("H", "terminal", "new")<cr>
nnoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "Normal") \|     :call Open("J", "terminal", "new")<cr>
vnoremap <A-S-Down> <C-u>:call SetMode("\<A-S-Down\>", "Visual") \|     :call Open("J", "terminal", "new")<cr>
cnoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "Command") \|     :call Open("J", "terminal", "new")<cr>
tnoremap <A-S-Down> <C-\><C-n>:call SetMode("\<A-S-Down\>", "Terminal") \|     :call Open("J", "terminal", "new")<cr>
inoremap <A-S-Down> <C-o>:call SetMode("\<A-S-Down\>", "Insert") \|     :call Open("J", "terminal", "new")<cr>
xnoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "X") \|     :call Open("J", "terminal", "new")<cr>
snoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "S") \|     :call Open("J", "terminal", "new")<cr>
onoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "O") \|     :call Open("J", "terminal", "new")<cr>
lnoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "L") \|     :call Open("J", "terminal", "new")<cr>
nnoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "Normal") \|       :call Open("K", "terminal", "new")<cr>
vnoremap <A-S-Up> <C-u>:call SetMode("\<A-S-Up\>", "Visual") \|       :call Open("K", "terminal", "new")<cr>
cnoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "Command") \|       :call Open("K", "terminal", "new")<cr>
tnoremap <A-S-Up> <C-\><C-n>:call SetMode("\<A-S-Up\>", "Terminal") \|       :call Open("K", "terminal", "new")<cr>
inoremap <A-S-Up> <C-o>:call SetMode("\<A-S-Up\>", "Insert") \|       :call Open("K", "terminal", "new")<cr>
xnoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "X") \|       :call Open("K", "terminal", "new")<cr>
snoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "S") \|       :call Open("K", "terminal", "new")<cr>
onoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "O") \|       :call Open("K", "terminal", "new")<cr>
lnoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "L") \|       :call Open("K", "terminal", "new")<cr>
nnoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "Normal") \|    :call Open("L", "terminal", "new")<cr>
vnoremap <A-S-Right> <C-u>:call SetMode("\<A-S-Right\>", "Visual") \|    :call Open("L", "terminal", "new")<cr>
cnoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "Command") \|    :call Open("L", "terminal", "new")<cr>
tnoremap <A-S-Right> <C-\><C-n>:call SetMode("\<A-S-Right\>", "Terminal") \|    :call Open("L", "terminal", "new")<cr>
inoremap <A-S-Right> <C-o>:call SetMode("\<A-S-Right\>", "Insert") \|    :call Open("L", "terminal", "new")<cr>
xnoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "X") \|    :call Open("L", "terminal", "new")<cr>
snoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "S") \|    :call Open("L", "terminal", "new")<cr>
onoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "O") \|    :call Open("L", "terminal", "new")<cr>
lnoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "L") \|    :call Open("L", "terminal", "new")<cr>
nnoremap <A-Left> :call SetMode("\<A-Left\>", "Normal") \|       :call Open("h", "buffer", "new")<cr>
vnoremap <A-Left> <C-u>:call SetMode("\<A-Left\>", "Visual") \|       :call Open("h", "buffer", "new")<cr>
cnoremap <A-Left> :call SetMode("\<A-Left\>", "Command") \|       :call Open("h", "buffer", "new")<cr>
tnoremap <A-Left> <C-\><C-n>:call SetMode("\<A-Left\>", "Terminal") \|       :call Open("h", "buffer", "new")<cr>
inoremap <A-Left> <C-o>:call SetMode("\<A-Left\>", "Insert") \|       :call Open("h", "buffer", "new")<cr>
xnoremap <A-Left> :call SetMode("\<A-Left\>", "X") \|       :call Open("h", "buffer", "new")<cr>
snoremap <A-Left> :call SetMode("\<A-Left\>", "S") \|       :call Open("h", "buffer", "new")<cr>
onoremap <A-Left> :call SetMode("\<A-Left\>", "O") \|       :call Open("h", "buffer", "new")<cr>
lnoremap <A-Left> :call SetMode("\<A-Left\>", "L") \|       :call Open("h", "buffer", "new")<cr>
nnoremap <A-Down> :call SetMode("\<A-Down\>", "Normal") \|       :call Open("j", "buffer", "new")<cr>
vnoremap <A-Down> <C-u>:call SetMode("\<A-Down\>", "Visual") \|       :call Open("j", "buffer", "new")<cr>
cnoremap <A-Down> :call SetMode("\<A-Down\>", "Command") \|       :call Open("j", "buffer", "new")<cr>
tnoremap <A-Down> <C-\><C-n>:call SetMode("\<A-Down\>", "Terminal") \|       :call Open("j", "buffer", "new")<cr>
inoremap <A-Down> <C-o>:call SetMode("\<A-Down\>", "Insert") \|       :call Open("j", "buffer", "new")<cr>
xnoremap <A-Down> :call SetMode("\<A-Down\>", "X") \|       :call Open("j", "buffer", "new")<cr>
snoremap <A-Down> :call SetMode("\<A-Down\>", "S") \|       :call Open("j", "buffer", "new")<cr>
onoremap <A-Down> :call SetMode("\<A-Down\>", "O") \|       :call Open("j", "buffer", "new")<cr>
lnoremap <A-Down> :call SetMode("\<A-Down\>", "L") \|       :call Open("j", "buffer", "new")<cr>
nnoremap <A-Up> :call SetMode("\<A-Up\>", "Normal") \|         :call Open("k", "buffer", "new")<cr>
vnoremap <A-Up> <C-u>:call SetMode("\<A-Up\>", "Visual") \|         :call Open("k", "buffer", "new")<cr>
cnoremap <A-Up> :call SetMode("\<A-Up\>", "Command") \|         :call Open("k", "buffer", "new")<cr>
tnoremap <A-Up> <C-\><C-n>:call SetMode("\<A-Up\>", "Terminal") \|         :call Open("k", "buffer", "new")<cr>
inoremap <A-Up> <C-o>:call SetMode("\<A-Up\>", "Insert") \|         :call Open("k", "buffer", "new")<cr>
xnoremap <A-Up> :call SetMode("\<A-Up\>", "X") \|         :call Open("k", "buffer", "new")<cr>
snoremap <A-Up> :call SetMode("\<A-Up\>", "S") \|         :call Open("k", "buffer", "new")<cr>
onoremap <A-Up> :call SetMode("\<A-Up\>", "O") \|         :call Open("k", "buffer", "new")<cr>
lnoremap <A-Up> :call SetMode("\<A-Up\>", "L") \|         :call Open("k", "buffer", "new")<cr>
nnoremap <A-Right> :call SetMode("\<A-Right\>", "Normal") \|      :call Open("l", "buffer", "new")<cr>
vnoremap <A-Right> <C-u>:call SetMode("\<A-Right\>", "Visual") \|      :call Open("l", "buffer", "new")<cr>
cnoremap <A-Right> :call SetMode("\<A-Right\>", "Command") \|      :call Open("l", "buffer", "new")<cr>
tnoremap <A-Right> <C-\><C-n>:call SetMode("\<A-Right\>", "Terminal") \|      :call Open("l", "buffer", "new")<cr>
inoremap <A-Right> <C-o>:call SetMode("\<A-Right\>", "Insert") \|      :call Open("l", "buffer", "new")<cr>
xnoremap <A-Right> :call SetMode("\<A-Right\>", "X") \|      :call Open("l", "buffer", "new")<cr>
snoremap <A-Right> :call SetMode("\<A-Right\>", "S") \|      :call Open("l", "buffer", "new")<cr>
onoremap <A-Right> :call SetMode("\<A-Right\>", "O") \|      :call Open("l", "buffer", "new")<cr>
lnoremap <A-Right> :call SetMode("\<A-Right\>", "L") \|      :call Open("l", "buffer", "new")<cr>
nnoremap <A-Left> :call SetMode("\<A-Left\>", "Normal") \|       :call Open("H", "buffer", "new")<cr>
vnoremap <A-Left> <C-u>:call SetMode("\<A-Left\>", "Visual") \|       :call Open("H", "buffer", "new")<cr>
cnoremap <A-Left> :call SetMode("\<A-Left\>", "Command") \|       :call Open("H", "buffer", "new")<cr>
tnoremap <A-Left> <C-\><C-n>:call SetMode("\<A-Left\>", "Terminal") \|       :call Open("H", "buffer", "new")<cr>
inoremap <A-Left> <C-o>:call SetMode("\<A-Left\>", "Insert") \|       :call Open("H", "buffer", "new")<cr>
xnoremap <A-Left> :call SetMode("\<A-Left\>", "X") \|       :call Open("H", "buffer", "new")<cr>
snoremap <A-Left> :call SetMode("\<A-Left\>", "S") \|       :call Open("H", "buffer", "new")<cr>
onoremap <A-Left> :call SetMode("\<A-Left\>", "O") \|       :call Open("H", "buffer", "new")<cr>
lnoremap <A-Left> :call SetMode("\<A-Left\>", "L") \|       :call Open("H", "buffer", "new")<cr>
nnoremap <A-Down> :call SetMode("\<A-Down\>", "Normal") \|       :call Open("J", "buffer", "new")<cr>
vnoremap <A-Down> <C-u>:call SetMode("\<A-Down\>", "Visual") \|       :call Open("J", "buffer", "new")<cr>
cnoremap <A-Down> :call SetMode("\<A-Down\>", "Command") \|       :call Open("J", "buffer", "new")<cr>
tnoremap <A-Down> <C-\><C-n>:call SetMode("\<A-Down\>", "Terminal") \|       :call Open("J", "buffer", "new")<cr>
inoremap <A-Down> <C-o>:call SetMode("\<A-Down\>", "Insert") \|       :call Open("J", "buffer", "new")<cr>
xnoremap <A-Down> :call SetMode("\<A-Down\>", "X") \|       :call Open("J", "buffer", "new")<cr>
snoremap <A-Down> :call SetMode("\<A-Down\>", "S") \|       :call Open("J", "buffer", "new")<cr>
onoremap <A-Down> :call SetMode("\<A-Down\>", "O") \|       :call Open("J", "buffer", "new")<cr>
lnoremap <A-Down> :call SetMode("\<A-Down\>", "L") \|       :call Open("J", "buffer", "new")<cr>
nnoremap <A-Up> :call SetMode("\<A-Up\>", "Normal") \|         :call Open("K", "buffer", "new")<cr>
vnoremap <A-Up> <C-u>:call SetMode("\<A-Up\>", "Visual") \|         :call Open("K", "buffer", "new")<cr>
cnoremap <A-Up> :call SetMode("\<A-Up\>", "Command") \|         :call Open("K", "buffer", "new")<cr>
tnoremap <A-Up> <C-\><C-n>:call SetMode("\<A-Up\>", "Terminal") \|         :call Open("K", "buffer", "new")<cr>
inoremap <A-Up> <C-o>:call SetMode("\<A-Up\>", "Insert") \|         :call Open("K", "buffer", "new")<cr>
xnoremap <A-Up> :call SetMode("\<A-Up\>", "X") \|         :call Open("K", "buffer", "new")<cr>
snoremap <A-Up> :call SetMode("\<A-Up\>", "S") \|         :call Open("K", "buffer", "new")<cr>
onoremap <A-Up> :call SetMode("\<A-Up\>", "O") \|         :call Open("K", "buffer", "new")<cr>
lnoremap <A-Up> :call SetMode("\<A-Up\>", "L") \|         :call Open("K", "buffer", "new")<cr>
nnoremap <A-Right> :call SetMode("\<A-Right\>", "Normal") \|      :call Open("L", "buffer", "new")<cr>
vnoremap <A-Right> <C-u>:call SetMode("\<A-Right\>", "Visual") \|      :call Open("L", "buffer", "new")<cr>
cnoremap <A-Right> :call SetMode("\<A-Right\>", "Command") \|      :call Open("L", "buffer", "new")<cr>
tnoremap <A-Right> <C-\><C-n>:call SetMode("\<A-Right\>", "Terminal") \|      :call Open("L", "buffer", "new")<cr>
inoremap <A-Right> <C-o>:call SetMode("\<A-Right\>", "Insert") \|      :call Open("L", "buffer", "new")<cr>
xnoremap <A-Right> :call SetMode("\<A-Right\>", "X") \|      :call Open("L", "buffer", "new")<cr>
snoremap <A-Right> :call SetMode("\<A-Right\>", "S") \|      :call Open("L", "buffer", "new")<cr>
onoremap <A-Right> :call SetMode("\<A-Right\>", "O") \|      :call Open("L", "buffer", "new")<cr>
lnoremap <A-Right> :call SetMode("\<A-Right\>", "L") \|      :call Open("L", "buffer", "new")<cr>
nnoremap <C-q> :call SetMode("\<C-q\>", "Normal") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
vnoremap <C-q> <C-u>:call SetMode("\<C-q\>", "Visual") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
cnoremap <C-q> :call SetMode("\<C-q\>", "Command") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
tnoremap <C-q> <C-\><C-n>:call SetMode("\<C-q\>", "Terminal") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
inoremap <C-q> <C-o>:call SetMode("\<C-q\>", "Insert") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
xnoremap <C-q> :call SetMode("\<C-q\>", "X") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
snoremap <C-q> :call SetMode("\<C-q\>", "S") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
onoremap <C-q> :call SetMode("\<C-q\>", "O") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
lnoremap <C-q> :call SetMode("\<C-q\>", "L") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
nnoremap <C-S-q> :call SetMode("\<C-S-q\>", "Normal") \| :qa!<cr>
vnoremap <C-S-q> <C-u>:call SetMode("\<C-S-q\>", "Visual") \| :qa!<cr>
cnoremap <C-S-q> :call SetMode("\<C-S-q\>", "Command") \| :qa!<cr>
tnoremap <C-S-q> <C-\><C-n>:call SetMode("\<C-S-q\>", "Terminal") \| :qa!<cr>
inoremap <C-S-q> <C-o>:call SetMode("\<C-S-q\>", "Insert") \| :qa!<cr>
xnoremap <C-S-q> :call SetMode("\<C-S-q\>", "X") \| :qa!<cr>
snoremap <C-S-q> :call SetMode("\<C-S-q\>", "S") \| :qa!<cr>
onoremap <C-S-q> :call SetMode("\<C-S-q\>", "O") \| :qa!<cr>
lnoremap <C-S-q> :call SetMode("\<C-S-q\>", "L") \| :qa!<cr>
nnoremap <A-q> :call SetMode("\<A-q\>", "Normal") \| :call TabClose()<cr>
vnoremap <A-q> <C-u>:call SetMode("\<A-q\>", "Visual") \| :call TabClose()<cr>
cnoremap <A-q> :call SetMode("\<A-q\>", "Command") \| :call TabClose()<cr>
tnoremap <A-q> <C-\><C-n>:call SetMode("\<A-q\>", "Terminal") \| :call TabClose()<cr>
inoremap <A-q> <C-o>:call SetMode("\<A-q\>", "Insert") \| :call TabClose()<cr>
xnoremap <A-q> :call SetMode("\<A-q\>", "X") \| :call TabClose()<cr>
snoremap <A-q> :call SetMode("\<A-q\>", "S") \| :call TabClose()<cr>
onoremap <A-q> :call SetMode("\<A-q\>", "O") \| :call TabClose()<cr>
lnoremap <A-q> :call SetMode("\<A-q\>", "L") \| :call TabClose()<cr>
nnoremap -la :call SetMode("-la", "Normal") \| ,,r :redraw!<cr>
nnoremap <S-F2> :call SetMode("\<S-F2\>", "Normal") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
vnoremap <S-F2> <C-u>:call SetMode("\<S-F2\>", "Visual") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
cnoremap <S-F2> :call SetMode("\<S-F2\>", "Command") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
tnoremap <S-F2> <C-\><C-n>:call SetMode("\<S-F2\>", "Terminal") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
inoremap <S-F2> <C-o>:call SetMode("\<S-F2\>", "Insert") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
xnoremap <S-F2> :call SetMode("\<S-F2\>", "X") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
snoremap <S-F2> :call SetMode("\<S-F2\>", "S") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
onoremap <S-F2> :call SetMode("\<S-F2\>", "O") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
lnoremap <S-F2> :call SetMode("\<S-F2\>", "L") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
nnoremap ,c :call SetMode(",c", "Normal") \| call CountRegex()<cr>
vnoremap ,c <C-u>:call SetMode(",c", "Visual") \| call CountRegex()<cr>
cnoremap ,c :call SetMode(",c", "Command") \| call CountRegex()<cr>
tnoremap ,c <C-\><C-n>:call SetMode(",c", "Terminal") \| call CountRegex()<cr>
inoremap ,c <C-o>:call SetMode(",c", "Insert") \| call CountRegex()<cr>
xnoremap ,c :call SetMode(",c", "X") \| call CountRegex()<cr>
snoremap ,c :call SetMode(",c", "S") \| call CountRegex()<cr>
onoremap ,c :call SetMode(",c", "O") \| call CountRegex()<cr>
lnoremap ,c :call SetMode(",c", "L") \| call CountRegex()<cr>
nnoremap <C-S-A> :call SetMode("\<C-S-A\>", "Normal") \| :call IncRange()<cr>
nnoremap <C-S-X> :call SetMode("\<C-S-X\>", "Normal") \| :call DecRange()<cr>
vnoremap af <C-u>:call SetMode("af", "Visual") \| :call Vaf()<cr>
vnoremap <C-S-A> <C-u>:call SetMode("\<C-S-A\>", "Visual") \| :call IncRange()<cr>
vnoremap <C-S-X> <C-u>:call SetMode("\<C-S-X\>", "Visual") \| :call DecRange()<cr>
tnoremap ,X <C-\><C-n>:call SetMode(",X", "Terminal") \| :TIN tail -f $receiver<cr>
nnoremap <A-S-n> :call SetMode("\<A-S-n\>", "Normal") \| <C-w>+
nnoremap <A-S-m> :call SetMode("\<A-S-m\>", "Normal") \| <C-w>-
nnoremap <A-S-u> :call SetMode("\<A-S-u\>", "Normal") \| <C-w><
nnoremap <A-S-i> :call SetMode("\<A-S-i\>", "Normal") \| <C-w>>
nnoremap <A-n> :call SetMode("\<A-n\>", "Normal") \| 12<C-w>+
nnoremap <A-m> :call SetMode("\<A-m\>", "Normal") \| 12<C-w>-
nnoremap <A-u> :call SetMode("\<A-u\>", "Normal") \| 12<C-w><
nnoremap <A-i> :call SetMode("\<A-i\>", "Normal") \| 12<C-w>>
nnoremap <A-h> :call SetMode("\<A-h\>", "Normal") \| :call TabH()<cr>
nnoremap <A-l> :call SetMode("\<A-l\>", "Normal") \| :call TabL()<cr>
nnoremap <C-S-M-h> :call SetMode("\<C-S-M-h\>", "Normal") \| :wincmd H<cr>
nnoremap <C-S-M-j> :call SetMode("\<C-S-M-j\>", "Normal") \| :wincmd J<cr>
nnoremap <C-S-M-k> :call SetMode("\<C-S-M-k\>", "Normal") \| :wincmd K<cr>
nnoremap <C-S-M-l> :call SetMode("\<C-S-M-l\>", "Normal") \| :wincmd L<cr>
nnoremap <C-S-h> :call SetMode("\<C-S-h\>", "Normal") \| :call SwapWin("h")<cr>
nnoremap <C-S-j> :call SetMode("\<C-S-j\>", "Normal") \| :call SwapWin("j")<cr>
nnoremap <C-S-k> :call SetMode("\<C-S-k\>", "Normal") \| :call SwapWin("k")<cr>
nnoremap <C-S-l> :call SetMode("\<C-S-l\>", "Normal") \| :call SwapWin("l")<cr>
tnoremap <C-S-h> <C-\><C-n>:call SetMode("\<C-S-h\>", "Terminal") \| <c-\><c-n>:call SwapWin("h")<cr>
tnoremap <C-S-j> <C-\><C-n>:call SetMode("\<C-S-j\>", "Terminal") \| <c-\><c-n>:call SwapWin("j")<cr>
tnoremap <C-S-k> <C-\><C-n>:call SetMode("\<C-S-k\>", "Terminal") \| <c-\><c-n>:call SwapWin("k")<cr>
tnoremap <C-S-l> <C-\><C-n>:call SetMode("\<C-S-l\>", "Terminal") \| <c-\><c-n>:call SwapWin("l")<cr>
nnoremap ,fuc :call SetMode(",fuc", "Normal") \| :call OpenFileUnderCursor()<cr>
nnoremap ,,fb :call SetMode(",,fb", "Normal") \| :LayoutBash<cr>
nnoremap ,,fv :call SetMode(",,fv", "Normal") \| :LayoutVim<cr>
nnoremap <m-;> :call SetMode("\<m-;\>", "Normal") \| :call ToggleOverviewRight()<cr>
nnoremap ,,<F4> :call SetMode(",,\<F4\>", "Normal") \| :redraw \\| let c=input("Test: ")<cr>!source ".$workdir."/.bashrc; git_selector "TEST"
nnoremap <C-S-F9> :call SetMode("\<C-S-F9\>", "Normal") \| :call PreviewBuffer()<cr>
nnoremap <C-F2> :call SetMode("\<C-F2\>", "Normal") \| :call ToggleWrap()<cr>
nnoremap ,,,w :call SetMode(",,,w", "Normal") \| :call ToggleWrap()<cr>
nnoremap ,in :call SetMode(",in", "Normal") \| :call Intend()<cr>
nnoremap ,,,<space> :call SetMode(",,,\<space\>", "Normal") \| :IntelligentSelecting<cr>
nnoremap ,. :call SetMode(",.", "Normal") \| @q
nnoremap <C-h> :call SmartWincmd('h')<cr>
vnoremap <C-h> :call SmartWincmd('h')<cr>
cnoremap <C-h> :call SmartWincmd('h')<cr>
tnoremap <C-h> :call SmartWincmd('h')<cr>
inoremap <C-h> :call SmartWincmd('h')<cr>
xnoremap <C-h> :call SmartWincmd('h')<cr>
snoremap <C-h> :call SmartWincmd('h')<cr>
onoremap <C-h> :call SmartWincmd('h')<cr>
lnoremap <C-h> :call SmartWincmd('h')<cr>
nnoremap <C-j> :call SmartWincmd('j')<cr>
vnoremap <C-j> :call SmartWincmd('j')<cr>
cnoremap <C-j> :call SmartWincmd('j')<cr>
tnoremap <C-j> :call SmartWincmd('j')<cr>
inoremap <C-j> :call SmartWincmd('j')<cr>
xnoremap <C-j> :call SmartWincmd('j')<cr>
snoremap <C-j> :call SmartWincmd('j')<cr>
onoremap <C-j> :call SmartWincmd('j')<cr>
lnoremap <C-j> :call SmartWincmd('j')<cr>
nnoremap <C-k> :call SmartWincmd('k')<cr>
vnoremap <C-k> :call SmartWincmd('k')<cr>
cnoremap <C-k> :call SmartWincmd('k')<cr>
tnoremap <C-k> :call SmartWincmd('k')<cr>
inoremap <C-k> :call SmartWincmd('k')<cr>
xnoremap <C-k> :call SmartWincmd('k')<cr>
snoremap <C-k> :call SmartWincmd('k')<cr>
onoremap <C-k> :call SmartWincmd('k')<cr>
lnoremap <C-k> :call SmartWincmd('k')<cr>
nnoremap <C-l> :call SmartWincmd('l')<cr>
vnoremap <C-l> :call SmartWincmd('l')<cr>
cnoremap <C-l> :call SmartWincmd('l')<cr>
tnoremap <C-l> :call SmartWincmd('l')<cr>
inoremap <C-l> :call SmartWincmd('l')<cr>
xnoremap <C-l> :call SmartWincmd('l')<cr>
snoremap <C-l> :call SmartWincmd('l')<cr>
onoremap <C-l> :call SmartWincmd('l')<cr>
lnoremap <C-l> :call SmartWincmd('l')<cr>
tnoremap <C-l> l
tnoremap <C-h> h
tnoremap <C-k> k
tnoremap <C-j> j
vnoremap <BS> <C-u>:call SetMode("\<BS\>", "Visual") \| :call backspace()<cr>
vnoremap & <C-u>:call SetMode("&", "Visual") \| :&<cr>
vnoremap ,F <C-u>:call SetMode(",F", "Visual") \| :echo VS()<cr>
vnoremap ,,g <C-u>:call SetMode(",,g", "Visual") \| :call AppendToEndRange()<cr>
vnoremap ,G <C-u>:call SetMode(",G", "Visual") \| :AppendAll<cr>
vnoremap ,u <C-u>:call SetMode(",u", "Visual") \| :!uniq<cr>
vnoremap <M-v> <C-u>:call SetMode("\<M-v\>", "Visual") \| :call VPaste("Visual")<cr>
vnoremap <M-c> <C-u>:call SetMode("\<M-c\>", "Visual") \| :call VCopy("Visual")<cr>
vnoremap <M-x> <C-u>:call SetMode("\<M-x\>", "Visual") \| :call VCut("Visual")<cr>
tnoremap <c-o> <C-\><C-n>:call SetMode("\<c-o\>", "Terminal") \| <c-\><c-n><c-o>
inoremap <C-l> <C-o>:call SetMode("\<C-l\>", "Insert") \| <C-w>li
inoremap <C-h> <C-o>:call SetMode("\<C-h\>", "Insert") \| <C-w>hi
inoremap <c-w><c-w> <C-o>:call SetMode("\<c-w\>\<c-w\>", "Insert") \| <c-w><c-w>
tnoremap  <C-\><C-n>:call SetMode("", "Terminal") \| :call ExitTerminal()<cr>
inoremap <A-'> <C-o>:call SetMode("\<A-'\>", "Insert") \| ä
inoremap <A-"> <C-o>:call SetMode("\<A-"\>", "Insert") \| Ä
inoremap <A-;> <C-o>:call SetMode("\<A-;\>", "Insert") \| ö
inoremap <A-:> <C-o>:call SetMode("\<A-:\>", "Insert") \| Ö
inoremap <A-[> <C-o>:call SetMode("\<A-[\>", "Insert") \| ü
inoremap <A-{> <C-o>:call SetMode("\<A-{\>", "Insert") \| Ü
inoremap <A--> <C-o>:call SetMode("\<A--\>", "Insert") \| ß
tnoremap <ScrollWheelUp> <C-\><C-n>
tnoremap <S-ScrollWheelUp> <C-\><C-n>
tnoremap <ScrollWheelDown> <C-\><C-n>
tnoremap <S-ScrollWheelDown> <C-\><C-n>
tnoremap <Esc> <C-\><C-n>:call SetMode("\<Esc\>", "Terminal") \| i
tnoremap <LeftMouse> <C-\><C-n>
nnoremap ,,,m :call SetMode(",,,m", "Normal") \| :call Toggle_Set_Last_Git_Message()<cr>
nnoremap ,,,l :call SetMode(",,,l", "Normal") \| :call ToggleLineState()<cr>
nnoremap ,,,L :call SetMode(",,,L", "Normal") \| :call ToggleLineStateGlobal()<cr>
nnoremap ,,s :call SetMode(",,s", "Normal") \| :call Statusline_TogglePath()<cr>
nnoremap ,,d :call SetMode(",,d", "Normal") \| :echo g:debug_layout<cr>
nnoremap ,,B :call SetMode(",,B", "Normal") \| :call Boilerplate_Test()<cr>
nnoremap ,<Space> :call SetMode(",\<Space\>", "Normal") \| :call GetCCWD()<cr>
nnoremap <C-s> :call SetMode("\<C-s\>", "Normal") \| :SaveFile<cr>
vnoremap <C-s> <C-u>:call SetMode("\<C-s\>", "Visual") \| :SaveFile<cr>
inoremap <C-s> <C-o>:call SetMode("\<C-s\>", "Insert") \| :SaveFile<cr>l
nnoremap <localleader>f :call SetMode("\<localleader\>f", "Normal") \| :InsertFunction<cr>
nnoremap <space>f :call SetMode("\<space\>f", "Normal") \| :InsertFilename<cr>
nnoremap ,<Space> :call SetMode(",\<Space\>", "Normal") \| :call ToggleZoom()<cr>
nnoremap <S-F1> :call SetMode("\<S-F1\>", "Normal") \| :SearchCword<cr>
nnoremap ,b :call SetMode(",b", "Normal") \| :call BASH(VS())<cr>
nnoremap ,b :call SetMode(",b", "Normal") \| :call Bash(VS())<cr>
nnoremap ,b :call SetMode(",b", "Normal") \| :Buffers<cr>
nnoremap ,b :call SetMode(",b", "Normal") \| :Buffers<cr>
nnoremap <localleader>iv :call SetMode("\<localleader\>iv", "Normal") \| :call VIM(input("vimscript: "), 'exec_input_vs')<cr>
nnoremap <localleader>ib :call SetMode("\<localleader\>ib", "Normal") \| :call BASH(input("bash: "), 'exec_input_vs')<cr>
nnoremap <localleader>ip :call SetMode("\<localleader\>ip", "Normal") \| :call PYTHON(input("python: "), 'exec_input_vs')<cr>
nnoremap <localleader>ir :call SetMode("\<localleader\>ir", "Normal") \| :call RUST(input("rust: "), 'exec_input_vs')<cr>
nnoremap <space>p :call SetMode("\<space\>p", "Normal") \| :CopyFileNameToClipboard<cr>
nnoremap <space>P :call SetMode("\<space\>P", "Normal") \| :CopyWholePathToClipboard<cr>
nnoremap <space>r :call SetMode("\<space\>r", "Normal") \| :InsertReceiver<cr>
nnoremap ,dd :call SetMode(",dd", "Normal") \| :call Rewindworkdir()<cr>
nnoremap ,<Space> :call SetMode(",\<Space\>", "Normal") \|                                         :call Files(Folder_Up(v:count, 0))<cr>
nnoremap ,,<Space> :call SetMode(",,\<Space\>", "Normal") \|                                 :call Files(Folder_Up(v:count, 1))<cr>
nnoremap ,,,<Space> :call SetMode(",,,\<Space\>", "Normal") \|                         :call Files(Folder_Up(v:count, 2))<cr>
nnoremap ,,,,<Space> :call SetMode(",,,,\<Space\>", "Normal") \|                 :call Files(Folder_Up(v:count, 3))<cr>
nnoremap ,,,,,<Space> :call SetMode(",,,,,\<Space\>", "Normal") \|         :call Files(Folder_Up(v:count, 4))<cr>
nnoremap ,,,,,,<Space> :call SetMode(",,,,,,\<Space\>", "Normal") \| :call Files(Folder_Up(v:count, 5))<cr>
nnoremap ,g :call SetMode(",g", "Normal") \|                                         :call AgIn(Folder_Up(v:count, 0))<cr>
nnoremap ,,g :call SetMode(",,g", "Normal") \|                                 :call AgIn(Folder_Up(v:count, 1))<cr>
nnoremap ,,,g :call SetMode(",,,g", "Normal") \|                         :call AgIn(Folder_Up(v:count, 2))<cr>
nnoremap ,,,,g :call SetMode(",,,,g", "Normal") \|                 :call AgIn(Folder_Up(v:count, 3))<cr>
nnoremap ,,,,,g :call SetMode(",,,,,g", "Normal") \|         :call AgIn(Folder_Up(v:count, 4))<cr>
nnoremap ,,,,,,g :call SetMode(",,,,,,g", "Normal") \| :call AgIn(Folder_Up(v:count, 5))<cr>
nnoremap ,vcd :call SetMode(",vcd", "Normal") \| :call CD(Vim_Advantages_Path())<cr>
nnoremap ,p :call SetMode(",p", "Normal") \|                :call Projects()<cr>
nnoremap ,,p :call SetMode(",,p", "Normal") \|               :call Projects()<cr>
nnoremap ,,,p :call SetMode(",,,p", "Normal") \|              :call Projects()<cr>
nnoremap ,,,,p :call SetMode(",,,,p", "Normal") \|             :call Projects()<cr>
nnoremap ,,,,,p :call SetMode(",,,,,p", "Normal") \|            :call Projects()<cr>
nnoremap ,,,,,,p :call SetMode(",,,,,,p", "Normal") \|           :call Projects()<cr>
nnoremap <C-p> :call SetMode("\<C-p\>", "Normal") \|              :call Projects()<cr>
nnoremap <C-S-p> :call SetMode("\<C-S-p\>", "Normal") \|            :call Projects()<cr>
nnoremap <A-p> :call SetMode("\<A-p\>", "Normal") \|              :call Projects()<cr>
nnoremap <A-S-p> :call SetMode("\<A-S-p\>", "Normal") \|            :call Projects()<cr>
nnoremap <A-C-p> :call SetMode("\<A-C-p\>", "Normal") \|            :call Projects()<cr>
nnoremap <A-S-C-p> :call SetMode("\<A-S-C-p\>", "Normal") \|          :call Projects()<cr>
nnoremap ,<C-p> :call SetMode(",\<C-p\>", "Normal") \|           :call BuildSystemsGitProjects()<cr>
nnoremap <C-S-m> :call SetMode("\<C-S-m\>", "Normal") \|           :Generate<cr>
nnoremap <C-Space> :call SetMode("\<C-Space\>", "Normal") \|              :call Files(Folder_Project())<cr>
nnoremap <C-S-Space> :call SetMode("\<C-S-Space\>", "Normal") \|            :call Files(Folder_Repo())<cr>
nnoremap <A-Space> :call SetMode("\<A-Space\>", "Normal") \|              :call Files(Folder_Repo())<cr>
nnoremap <A-S-Space> :call SetMode("\<A-S-Space\>", "Normal") \|            :call Files(Folder_Repo(1))<cr>
nnoremap <A-C-Space> :call SetMode("\<A-C-Space\>", "Normal") \|            :call Files(Folder_Repo(1))<cr>
nnoremap <A-S-C-Space> :call SetMode("\<A-S-C-Space\>", "Normal") \|          :call Files('/')<cr>
nnoremap <C-g> :call SetMode("\<C-g\>", "Normal") \|              :call AgIn(Folder_Project())<cr>
nnoremap <C-S-g> :call SetMode("\<C-S-g\>", "Normal") \|            :call AgIn(Folder_Repo())<cr>
nnoremap <A-g> :call SetMode("\<A-g\>", "Normal") \|              :call AgIn(Folder_Repo())<cr>
nnoremap <A-S-g> :call SetMode("\<A-S-g\>", "Normal") \|            :call AgIn(Folder_Repo(1))<cr>
nnoremap <A-C-g> :call SetMode("\<A-C-g\>", "Normal") \|            :call AgIn(Folder_Repo(1))<cr>
nnoremap <A-S-C-g> :call SetMode("\<A-S-C-g\>", "Normal") \|          :call AgIn('/')<cr>
nnoremap <C-m> :call SetMode("\<C-m\>", "Normal") \|              :call fzf#vim#gitfiles('', {'dir': Folder_Repo(v:count)})<cr>
nnoremap ,o :call SetMode(",o", "Normal") \|              :OpenFileCommandLineSameDir<cr>
nnoremap ,. :call SetMode(",.", "Normal") \|              :OpenFileCommandLineCWD<cr>
nnoremap ,,. :call SetMode(",,.", "Normal") \|      :OpenFileCommandLineSameDir<cr>
nnoremap ,. :call SetMode(",.", "Normal") \|              :call CommandLineFiles(Folder_Up(v:count, 0))<cr>
nnoremap ,,. :call SetMode(",,.", "Normal") \|              :call CommandLineFiles(Folder_Up(v:count, 1))<cr>
nnoremap ,,,. :call SetMode(",,,.", "Normal") \|              :call CommandLineFiles(Folder_Up(v:count, 2))<cr>
nnoremap ,,,,. :call SetMode(",,,,.", "Normal") \|              :call CommandLineFiles(Folder_Up(v:count, 3))<cr>
nnoremap ,,,,,. :call SetMode(",,,,,.", "Normal") \|              :call CommandLineFiles(Folder_Up(v:count, 4))<cr>
cnoremap <C-,> :call SetMode("\<C-,\>", "Command") \| <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <M-,> :call SetMode("\<M-,\>", "Command") \| <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <S-,> :call SetMode("\<S-,\>", "Command") \| <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <C-BS> :call SetMode("\<C-BS\>", "Command") \| <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <M-BS> :call SetMode("\<M-BS\>", "Command") \| <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <S-BS> :call SetMode("\<S-BS\>", "Command") \| <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <C-,> :call SetMode("\<C-,\>", "Command") \| <Backspace>
cnoremap <C-.> :call SetMode("\<C-.\>", "Command") \| <Backspace>
nnoremap ,cd :call SetMode(",cd", "Normal") \| :call MakeDirCurrentCWD(bufnr())<cr>
nnoremap <C-Left> :call SetMode("\<C-Left\>", "Normal") \| :call CD(WFilePrev())<cr>
nnoremap <C-Right> :call SetMode("\<C-Right\>", "Normal") \| :call CD(WFileNext())<cr>
nnoremap <C-,> :call SetMode("\<C-,\>", "Normal") \| :call CD(WFilePrev())<cr>
nnoremap <C-.> :call SetMode("\<C-.\>", "Normal") \| :call CD(WFileNext())<cr>
nnoremap ,<Tab> :call SetMode(",\<Tab\>", "Normal") \|      :JumpProjectIn<cr>
nnoremap <localleader><Tab> :call SetMode("\<localleader\>\<Tab\>", "Normal") \| :JumpProjectIn<cr>
vnoremap <F14> <C-u>:call SetMode("\<F14\>", "Visual") \| :call VS()<cr>
nnoremap <F13> :call SetMode("\<F13\>", "Normal") \| :call VS()<cr>
inoremap <F13> <C-o>:call SetMode("\<F13\>", "Insert") \| :call VS()<cr>
cnoremap <F13> :call SetMode("\<F13\>", "Command") \| :call VS('c')<cr>
tnoremap <F13> <C-\><C-n>:call SetMode("\<F13\>", "Terminal") \| :call VS('t')<cr>
nnoremap <M-v> :call SetMode("\<M-v\>", "Normal") \| :call FuncPaste("Normal")<cr>
nnoremap <M-c> :call SetMode("\<M-c\>", "Normal") \| :call FuncCopy("Normal")<cr>
nnoremap <M-x> :call SetMode("\<M-x\>", "Normal") \| :call FuncCut("Normal")<cr>
nnoremap ,,,j :call SetMode(",,,j", "Normal") \| :IntelligentJumping<cr>
nnoremap <c-h> :call SetMode("\<c-h\>", "Normal") \| :wincmd h<cr>
nnoremap <c-j> :call SetMode("\<c-j\>", "Normal") \| :wincmd j<cr>
nnoremap <c-k> :call SetMode("\<c-k\>", "Normal") \| :wincmd k<cr>
nnoremap <c-l> :call SetMode("\<c-l\>", "Normal") \| :wincmd l<cr>
vnoremap p <C-u>:call SetMode("p", "Visual") \| :<C-U>let vlcb = getpos("'<")[1:2] \| let vlce = getpos("'>")[1:2] \| call ClipboardPaste("v")<cr>p
nnoremap <BS> :call SetMode("\<BS\>", "Normal") \| :call backspaceN()<cr>
cnoremap <A-'> :call SetMode("\<A-'\>", "Command") \| ä
cnoremap <A-"> :call SetMode("\<A-"\>", "Command") \| Ä
cnoremap <A-;> :call SetMode("\<A-;\>", "Command") \| ö
cnoremap <A-:> :call SetMode("\<A-:\>", "Command") \| Ö
cnoremap <A-[> :call SetMode("\<A-[\>", "Command") \| ü
cnoremap <A-{> :call SetMode("\<A-{\>", "Command") \| Ü
cnoremap <A--> :call SetMode("\<A--\>", "Command") \| ß
nnoremap ,F :call SetMode(",F", "Normal") \| :echo VS()<cr>
nnoremap ,e :call SetMode(",e", "Normal") \| :call AppendToEndNormal()<cr>
nnoremap ,E :call SetMode(",E", "Normal") \| :AppendAll<cr>
nnoremap YY :call SetMode("YY", "Normal") \| :call AppendToClipboard()<cr>
vnoremap Y <C-u>:call SetMode("Y", "Visual") \| :let @+ = @+ . join(getline("'<", "'>"), "\n") . "\n"<cr>
nnoremap <A-k> :call SetMode("\<A-k\>", "Normal") \| :m-2<cr>
nnoremap <A-j> :call SetMode("\<A-j\>", "Normal") \| :m+1<cr>
vnoremap <A-k> <C-u>:call SetMode("\<A-k\>", "Visual") \| :m '<-2<cr>gv=gv
vnoremap <A-j> <C-u>:call SetMode("\<A-j\>", "Visual") \| :m '>+1<cr>gv=gv
nnoremap < <<
nnoremap > >>
vnoremap < <C-u>:call SetMode("\<", "Visual") \| <gv
vnoremap > <C-u>:call SetMode("\>", "Visual") \| >gv
nnoremap ,dt :call SetMode(",dt", "Normal") \| :diffthis<cr>
nnoremap ,do :call SetMode(",do", "Normal") \| :diffoff<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :wincmd =<cr>
inoremap <C-Space> <C-o>:call SetMode("\<C-Space\>", "Insert") \| <C-x><C-f>
inoremap <C-S-v> <C-o>:call SetMode("\<C-S-v\>", "Insert") \| <c-r>+
nnoremap ,rm :call SetMode(",rm", "Normal") \| :call DeleteFile()<cr>
nnoremap ,n :call SetMode(",n", "Normal") \| :call NewFile()<cr>
nnoremap ,< :call SetMode(",\<", "Normal") \| :norm yy<cr>:norm dd<cr>:wincmd l<cr>:norm gp<cr>:wincmd h<cr>
vnoremap ,< <C-u>:call SetMode(",\<", "Visual") \| :norm gvy<cr>:norm gvd<cr>:wincmd l<cr>:norm gp<cr>:wincmd h<cr>
nnoremap <C-S-M-h> :call SetMode("\<C-S-M-h\>", "Normal") \| :echo JoinSplits("h")<cr>
nnoremap <C-S-M-j> :call SetMode("\<C-S-M-j\>", "Normal") \| :echo JoinSplits("j")<cr>
nnoremap <C-S-M-k> :call SetMode("\<C-S-M-k\>", "Normal") \| :echo JoinSplits("k")<cr>
nnoremap <C-S-M-l> :call SetMode("\<C-S-M-l\>", "Normal") \| :echo JoinSplits("l")<cr>
nnoremap ,<C-S-M-h> :call SetMode(",\<C-S-M-h\>", "Normal") \| :echo MoveOutOfSplit("h")<cr>
nnoremap ,<C-S-M-j> :call SetMode(",\<C-S-M-j\>", "Normal") \| :echo MoveOutOfSplit("j")<cr>
nnoremap ,<C-S-M-k> :call SetMode(",\<C-S-M-k\>", "Normal") \| :echo MoveOutOfSplit("k")<cr>
nnoremap ,<C-S-M-l> :call SetMode(",\<C-S-M-l\>", "Normal") \| :echo MoveOutOfSplit("l")<cr>
nnoremap <C-;> :call SetMode("\<C-;\>", "Normal") \| zh
nnoremap <C-'> :call SetMode("\<C-'\>", "Normal") \| zl
nnoremap <C-S-;> :call SetMode("\<C-S-;\>", "Normal") \| 20zh
nnoremap <C-S-'> :call SetMode("\<C-S-'\>", "Normal") \| 20zl
nnoremap ,f :call SetMode(",f", "Normal") \|  :copen<cr>
nnoremap <C-Down> :call SetMode("\<C-Down\>", "Normal") \|   :cnext<cr>zz
nnoremap <C-Up> :call SetMode("\<C-Up\>", "Normal") \|     :cprev<cr>zz
nnoremap ,N :call SetMode(",N", "Normal") \|  :cfirst<cr>zz
nnoremap ,P :call SetMode(",P", "Normal") \|  :clast<cr>zz
nnoremap ,c :call SetMode(",c", "Normal") \|  :cclose<cr>
nnoremap ,<C-s> :call SetMode(",\<C-s\>", "Normal") \| :call ExecFunction()<cr>
nnoremap ,s :call SetMode(",s", "Normal") \| :call ExecVS()<cr>
vnoremap ,s <C-u>:call SetMode(",s", "Visual") \| :call ExecVS()<cr>
nnoremap ,S :call SetMode(",S", "Normal") \| :Re \| :%source \| :ReEnd<cr>
nnoremap ,rd :call SetMode(",rd", "Normal") \| :call RedoLeaderS()<cr>
nnoremap ,c :call SetMode(",c", "Normal") \| :call ToggleComment()<cr>
vnoremap <F1> <C-u>:call SetMode("\<F1\>", "Visual") \| J
nnoremap <F2> :call SetMode("\<F2\>", "Normal") \| :call GetKeys()<cr>
nnoremap <F3> :call SetMode("\<F3\>", "Normal") \| :call FindKeyPerform()<cr>
nnoremap <F4> :call SetMode("\<F4\>", "Normal") \| :echo AllKeys()<cr>
tnoremap <C-v> <C-\><C-n>:call SetMode("\<C-v\>", "Terminal") \| :call SendCommandToThisTerm([getreg('"')])<cr>i
vnoremap ,,s <C-u>:call SetMode(",,s", "Visual") \| :silent redir=>output \| silent '<,'>source \| redir END \| put=output<cr>
nnoremap ,aa :call SetMode(",aa", "Normal") \| :RECP --reg *<cr>
nnoremap ,an :call SetMode(",an", "Normal") \| :RECP --reg "<cr>
nnoremap ,ab :call SetMode(",ab", "Normal") \| :RECP<cr>
nnoremap ,m :call SetMode(",m", "Normal") \| :call VimGrep(v:count)<cr>
nnoremap ,m :call SetMode(",m", "Normal") \| :call VimGrep(v:count)<cr>
nnoremap <M-a> :call SetMode("\<M-a\>", "Normal") \| :Lines<cr>
nnoremap <C-S-a> :call SetMode("\<C-S-a\>", "Normal") \| :call VimGrep(v:count)<cr>
nnoremap <C-S-a> :call SetMode("\<C-S-a\>", "Normal") \| :vimgrep "todo" $folderrepo/**/*<cr>
nnoremap [D :call SetMode("[D", "Normal") \| :cclose<cr>
nnoremap [C :call SetMode("[C", "Normal") \| :copen<cr>
nnoremap [A :call SetMode("[A", "Normal") \| :cprev<cr>
nnoremap [B :call SetMode("[B", "Normal") \| :cnext<cr>
nnoremap <F10> :call SetMode("\<F10\>", "Normal") \| :Diff --all<cr>
nnoremap <S-F10> :call SetMode("\<S-F10\>", "Normal") \| :Diff --all --cached<cr>
nnoremap <S-C-F10> :call SetMode("\<S-C-F10\>", "Normal") \| :Status<cr>
nnoremap ,<S-C-F10> :call SetMode(",\<S-C-F10\>", "Normal") \| :Log<cr>
nnoremap <F11> :call SetMode("\<F11\>", "Normal") \| :GitAdd<cr>
nnoremap <S-F11> :call SetMode("\<S-F11\>", "Normal") \| :GitAddCWD<cr>
nnoremap <F12> :call SetMode("\<F12\>", "Normal") \| :Pull<cr>
nnoremap <S-F12> :call SetMode("\<S-F12\>", "Normal") \| :GitFetch<cr>
nnoremap <S-C-F12> :call SetMode("\<S-C-F12\>", "Normal") \| :PushCWD
nnoremap ,<S-C-F12> :call SetMode(",\<S-C-F12\>", "Normal") \| :DecidePush<cr>
nnoremap ,qcc :call SetMode(",qcc", "Normal") \| :!git rebase --continue<cr>
nnoremap ,qcs :call SetMode(",qcs", "Normal") \| :!git rebase --skip<cr>
nnoremap ,qca :call SetMode(",qca", "Normal") \| :!git rebase --abort<cr>
nnoremap ,<F12> :call SetMode(",\<F12\>", "Normal") \| :StashPush<cr>
nnoremap ,,<F12> :call SetMode(",,\<F12\>", "Normal") \| :StashPop<cr>
nnoremap ,,,,,<F1> :call SetMode(",,,,,\<F1\>", "Normal") \| :call SelectFunctionBlock()<cr>
nnoremap <F1> :call SetMode("\<F1\>", "Normal") \| :call GitInfo()<cr>
nnoremap <S-F1> :call SetMode("\<S-F1\>", "Normal") \| :call GitInfo('--stash')<cr>
nnoremap <C-S-F1> :call SetMode("\<C-S-F1\>", "Normal") \| :call GitStashDrop()<cr>
nnoremap ,,,,<F3> :call SetMode(",,,,\<F3\>", "Normal") \| :call GitDeleteLastUnpushedCommit()<cr>
nnoremap ,,,<F1> :call SetMode(",,,\<F1\>", "Normal") \| :call GitCommitRepo()<cr>
nnoremap ,,<F1> :call SetMode(",,\<F1\>", "Normal") \| :call GitCommitRepo(input("Commit Message: "))<cr>
nnoremap ,<F1> :call SetMode(",\<F1\>", "Normal") \| :call GitAddRepo()<cr>
nnoremap ,,,,,<F1> :call SetMode(",,,,,\<F1\>", "Normal") \| :call GitInitRepository()<cr>
nnoremap ,,,,,,<F1> :call SetMode(",,,,,,\<F1\>", "Normal") \| :call GitInitRepositoryBare()<cr>
nnoremap <F2> :call SetMode("\<F2\>", "Normal") \| :call SelectRemote(1)<cr>
nnoremap <S-F2> :call SetMode("\<S-F2\>", "Normal") \| :call SelectRemote(-1)<cr>
nnoremap ,<F2> :call SetMode(",\<F2\>", "Normal") \| :call GitRenameRemote()<cr>
nnoremap ,,<F2> :call SetMode(",,\<F2\>", "Normal") \| :call GitRemoteAdd()<cr>
nnoremap ,,,<F2> :call SetMode(",,,\<F2\>", "Normal") \| :call GitSetRemote()<cr>
nnoremap <F3> :call SetMode("\<F3\>", "Normal") \| :call SelectBranch(1)<cr>
nnoremap <S-F3> :call SetMode("\<S-F3\>", "Normal") \| :call SelectBranch(-1)<cr>
nnoremap ,<F3> :call SetMode(",\<F3\>", "Normal") \| :call GitRenameBranch()<cr>
nnoremap ,,<F3> :call SetMode(",,\<F3\>", "Normal") \| :call GitNewBranch()<cr>
nnoremap <F4> :call SetMode("\<F4\>", "Normal") \| :call GitStashPush()<cr>
nnoremap <S-F4> :call SetMode("\<S-F4\>", "Normal") \| :call GitStashPop()<cr>
nnoremap ,qd :call SetMode(",qd", "Normal") \| :Diff --all<cr>
nnoremap ,,qd :call SetMode(",,qd", "Normal") \| :Diff --all --cached<cr>
nnoremap ,qr :call SetMode(",qr", "Normal") \| :PushCWD
nnoremap ,,qr :call SetMode(",,qr", "Normal") \| :GithubPush<cr>
nnoremap ,qv :call SetMode(",qv", "Normal") \| :Pull<cr>
nnoremap ,ql :call SetMode(",ql", "Normal") \| :Log<cr>
nnoremap ,qs :call SetMode(",qs", "Normal") \| :Status<cr>
nnoremap ,qa :call SetMode(",qa", "Normal") \| :GitAdd<cr>
nnoremap ,qA :call SetMode(",qA", "Normal") \| :GitAddCWD<cr>
nnoremap ,,qa :call SetMode(",,qa", "Normal") \| :GitAddCWD<cr>
nnoremap ,qcc :call SetMode(",qcc", "Normal") \| :!git rebase --continue<cr>
nnoremap ,qcs :call SetMode(",qcs", "Normal") \| :!git rebase --skip<cr>
nnoremap ,qca :call SetMode(",qca", "Normal") \| :!git rebase --abort<cr>
nnoremap ,qf :call SetMode(",qf", "Normal") \| :GitFetch<cr>
nnoremap ,qu :call SetMode(",qu", "Normal") \| :StashPush<cr>
nnoremap ,qo :call SetMode(",qo", "Normal") \| :StashPop<cr>
tnoremap <C-v> <C-\><C-n>
vnoremap i <C-u>:call SetMode("i", "Visual") \| <C-c>i
vnoremap <C-c> <C-u>:call SetMode("\<C-c\>", "Visual") \| :call CommandInfo()<cr>