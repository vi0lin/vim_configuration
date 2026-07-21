nnoremap <C-S-o> :call SetMode("\<C-S-o\>", "Normal") \| :call JumpToNextFile(-1)<cr>
nnoremap <C-S-i> :call SetMode("\<C-S-i\>", "Normal") \| :call JumpToNextFile(1)<cr>
nnoremap <C-S-z> :call SetMode("\<C-S-z\>", "Normal") \| :suspend<cr>
tnoremap <C-S-z> <C-\><C-n>:call SetMode("\<C-S-z\>", "Terminal") \| :suspend<cr>
nnoremap <C-z> :call SetMode("\<C-z\>", "Normal") \| :if winnr('$')<=1 \| suspend \| else \| hide \| endif<cr>
tnoremap <C-z> <C-\><C-n>:call SetMode("\<C-z\>", "Terminal") \| :if winnr('$')<=1 \| suspend \| else \| hide \| endif<cr>
nnoremap <C-/> :call SetMode("\<C-/\>", "Normal") \| :e .<cr>
nnoremap ,/ :call SetMode(",/", "Normal") \| :e .<cr>
nnoremap ,,,,f :call SetMode(",,,,f", "Normal") \| :call SetUnset("projectPocket", w:cwd)<cr>
nnoremap ,f :call SetMode(",f", "Normal") \| :call FavoritesPopup()<cr>
nnoremap ,,f :call SetMode(",,f", "Normal") \| :call SetUnset("favorites", expand('%:p')) \| :call Refresh('favorites_folders', 'GetFavoritesFolders()')<cr>
nnoremap ,,,f :call SetMode(",,,f", "Normal") \| :call OpenUnreleased("favorites")<cr>
nnoremap ,s :call SetMode(",s", "Normal") \| :so %<cr>
nnoremap ,t :call SetMode(",t", "Normal") \| :Tidy<cr>
nnoremap <M-q> :call SetMode("\<M-q\>", "Normal") \| :q<cr>
tnoremap <M-q> <C-\><C-n>:call SetMode("\<M-q\>", "Terminal") \| <c-\><c-n>:q<cr>
nnoremap <F5> :call SetMode("\<F5\>", "Normal") \| :call Command()<cr>
vnoremap <F5> :call SetMode("\<F5\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <F5> :call SetMode("\<F5\>", "Command") \| :call Command()<cr>
nnoremap <A-F5> :call SetMode("\<A-F5\>", "Normal") \| :call Command()<cr>
vnoremap <A-F5> :call SetMode("\<A-F5\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <A-F5> :call SetMode("\<A-F5\>", "Command") \| :call Command()<cr>
nnoremap <S-F5> :call SetMode("\<S-F5\>", "Normal") \| :call Command()<cr>
vnoremap <S-F5> :call SetMode("\<S-F5\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <S-F5> :call SetMode("\<S-F5\>", "Command") \| :call Command()<cr>
nnoremap <S-A-F5> :call SetMode("\<S-A-F5\>", "Normal") \| :call Command()<cr>
vnoremap <S-A-F5> :call SetMode("\<S-A-F5\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <S-A-F5> :call SetMode("\<S-A-F5\>", "Command") \| :call Command()<cr>
nnoremap <C-F5> :call SetMode("\<C-F5\>", "Normal") \| :call Command()<cr>
vnoremap <C-F5> :call SetMode("\<C-F5\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-F5> :call SetMode("\<C-F5\>", "Command") \| :call Command()<cr>
nnoremap <C-A-F5> :call SetMode("\<C-A-F5\>", "Normal") \| :call Command()<cr>
vnoremap <C-A-F5> :call SetMode("\<C-A-F5\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-A-F5> :call SetMode("\<C-A-F5\>", "Command") \| :call Command()<cr>
nnoremap <C-S-F5> :call SetMode("\<C-S-F5\>", "Normal") \| :call Command()<cr>
vnoremap <C-S-F5> :call SetMode("\<C-S-F5\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-S-F5> :call SetMode("\<C-S-F5\>", "Command") \| :call Command()<cr>
nnoremap <C-S-A-F5> :call SetMode("\<C-S-A-F5\>", "Normal") \| :call Command()<cr>
vnoremap <C-S-A-F5> :call SetMode("\<C-S-A-F5\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-S-A-F5> :call SetMode("\<C-S-A-F5\>", "Command") \| :call Command()<cr>
nnoremap <F6> :call SetMode("\<F6\>", "Normal") \| :call Command()<cr>
vnoremap <F6> :call SetMode("\<F6\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <F6> :call SetMode("\<F6\>", "Command") \| :call Command()<cr>
nnoremap <A-F6> :call SetMode("\<A-F6\>", "Normal") \| :call Command()<cr>
vnoremap <A-F6> :call SetMode("\<A-F6\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <A-F6> :call SetMode("\<A-F6\>", "Command") \| :call Command()<cr>
nnoremap <S-F6> :call SetMode("\<S-F6\>", "Normal") \| :call Command()<cr>
vnoremap <S-F6> :call SetMode("\<S-F6\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <S-F6> :call SetMode("\<S-F6\>", "Command") \| :call Command()<cr>
nnoremap <S-A-F6> :call SetMode("\<S-A-F6\>", "Normal") \| :call Command()<cr>
vnoremap <S-A-F6> :call SetMode("\<S-A-F6\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <S-A-F6> :call SetMode("\<S-A-F6\>", "Command") \| :call Command()<cr>
nnoremap <C-F6> :call SetMode("\<C-F6\>", "Normal") \| :call Command()<cr>
vnoremap <C-F6> :call SetMode("\<C-F6\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-F6> :call SetMode("\<C-F6\>", "Command") \| :call Command()<cr>
nnoremap <C-A-F6> :call SetMode("\<C-A-F6\>", "Normal") \| :call Command()<cr>
vnoremap <C-A-F6> :call SetMode("\<C-A-F6\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-A-F6> :call SetMode("\<C-A-F6\>", "Command") \| :call Command()<cr>
nnoremap <C-S-F6> :call SetMode("\<C-S-F6\>", "Normal") \| :call Command()<cr>
vnoremap <C-S-F6> :call SetMode("\<C-S-F6\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-S-F6> :call SetMode("\<C-S-F6\>", "Command") \| :call Command()<cr>
nnoremap <C-S-A-F6> :call SetMode("\<C-S-A-F6\>", "Normal") \| :call Command()<cr>
vnoremap <C-S-A-F6> :call SetMode("\<C-S-A-F6\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-S-A-F6> :call SetMode("\<C-S-A-F6\>", "Command") \| :call Command()<cr>
nnoremap <F7> :call SetMode("\<F7\>", "Normal") \| :call Command()<cr>
vnoremap <F7> :call SetMode("\<F7\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <F7> :call SetMode("\<F7\>", "Command") \| :call Command()<cr>
nnoremap <A-F7> :call SetMode("\<A-F7\>", "Normal") \| :call Command()<cr>
vnoremap <A-F7> :call SetMode("\<A-F7\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <A-F7> :call SetMode("\<A-F7\>", "Command") \| :call Command()<cr>
nnoremap <S-F7> :call SetMode("\<S-F7\>", "Normal") \| :call Command()<cr>
vnoremap <S-F7> :call SetMode("\<S-F7\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <S-F7> :call SetMode("\<S-F7\>", "Command") \| :call Command()<cr>
nnoremap <S-A-F7> :call SetMode("\<S-A-F7\>", "Normal") \| :call Command()<cr>
vnoremap <S-A-F7> :call SetMode("\<S-A-F7\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <S-A-F7> :call SetMode("\<S-A-F7\>", "Command") \| :call Command()<cr>
nnoremap <C-F7> :call SetMode("\<C-F7\>", "Normal") \| :call Command()<cr>
vnoremap <C-F7> :call SetMode("\<C-F7\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-F7> :call SetMode("\<C-F7\>", "Command") \| :call Command()<cr>
nnoremap <C-A-F7> :call SetMode("\<C-A-F7\>", "Normal") \| :call Command()<cr>
vnoremap <C-A-F7> :call SetMode("\<C-A-F7\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-A-F7> :call SetMode("\<C-A-F7\>", "Command") \| :call Command()<cr>
nnoremap <C-S-F7> :call SetMode("\<C-S-F7\>", "Normal") \| :call Command()<cr>
vnoremap <C-S-F7> :call SetMode("\<C-S-F7\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-S-F7> :call SetMode("\<C-S-F7\>", "Command") \| :call Command()<cr>
nnoremap <C-S-A-F7> :call SetMode("\<C-S-A-F7\>", "Normal") \| :call Command()<cr>
vnoremap <C-S-A-F7> :call SetMode("\<C-S-A-F7\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-S-A-F7> :call SetMode("\<C-S-A-F7\>", "Command") \| :call Command()<cr>
nnoremap <F8> :call SetMode("\<F8\>", "Normal") \| :call Command()<cr>
vnoremap <F8> :call SetMode("\<F8\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <F8> :call SetMode("\<F8\>", "Command") \| :call Command()<cr>
nnoremap <A-F8> :call SetMode("\<A-F8\>", "Normal") \| :call Command()<cr>
vnoremap <A-F8> :call SetMode("\<A-F8\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <A-F8> :call SetMode("\<A-F8\>", "Command") \| :call Command()<cr>
nnoremap <S-F8> :call SetMode("\<S-F8\>", "Normal") \| :call Command()<cr>
vnoremap <S-F8> :call SetMode("\<S-F8\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <S-F8> :call SetMode("\<S-F8\>", "Command") \| :call Command()<cr>
nnoremap <S-A-F8> :call SetMode("\<S-A-F8\>", "Normal") \| :call Command()<cr>
vnoremap <S-A-F8> :call SetMode("\<S-A-F8\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <S-A-F8> :call SetMode("\<S-A-F8\>", "Command") \| :call Command()<cr>
nnoremap <C-F8> :call SetMode("\<C-F8\>", "Normal") \| :call Command()<cr>
vnoremap <C-F8> :call SetMode("\<C-F8\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-F8> :call SetMode("\<C-F8\>", "Command") \| :call Command()<cr>
nnoremap <C-A-F8> :call SetMode("\<C-A-F8\>", "Normal") \| :call Command()<cr>
vnoremap <C-A-F8> :call SetMode("\<C-A-F8\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-A-F8> :call SetMode("\<C-A-F8\>", "Command") \| :call Command()<cr>
nnoremap <C-S-F8> :call SetMode("\<C-S-F8\>", "Normal") \| :call Command()<cr>
vnoremap <C-S-F8> :call SetMode("\<C-S-F8\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-S-F8> :call SetMode("\<C-S-F8\>", "Command") \| :call Command()<cr>
nnoremap <C-S-A-F8> :call SetMode("\<C-S-A-F8\>", "Normal") \| :call Command()<cr>
vnoremap <C-S-A-F8> :call SetMode("\<C-S-A-F8\>", "Visual") \| '<,'>:call Command()<cr>
cnoremap <C-S-A-F8> :call SetMode("\<C-S-A-F8\>", "Command") \| :call Command()<cr>
vnoremap . :call SetMode(".", "Visual") \| '<,'>:<Up><cr>
nnoremap ,h :call SetMode(",h", "Normal") \| :call Open("h", "buffer", "new")<cr>
vnoremap ,h :call SetMode(",h", "Visual") \| '<,'>:call Open("h", "buffer", "new")<cr>
tnoremap ,h <C-\><C-n>:call SetMode(",h", "Terminal") \| :call Open("h", "buffer", "new")<cr>
nnoremap ,j :call SetMode(",j", "Normal") \| :call Open("j", "buffer", "new")<cr>
vnoremap ,j :call SetMode(",j", "Visual") \| '<,'>:call Open("j", "buffer", "new")<cr>
tnoremap ,j <C-\><C-n>:call SetMode(",j", "Terminal") \| :call Open("j", "buffer", "new")<cr>
nnoremap ,k :call SetMode(",k", "Normal") \| :call Open("k", "buffer", "new")<cr>
vnoremap ,k :call SetMode(",k", "Visual") \| '<,'>:call Open("k", "buffer", "new")<cr>
tnoremap ,k <C-\><C-n>:call SetMode(",k", "Terminal") \| :call Open("k", "buffer", "new")<cr>
nnoremap ,l :call SetMode(",l", "Normal") \| :call Open("l", "buffer", "new")<cr>
vnoremap ,l :call SetMode(",l", "Visual") \| '<,'>:call Open("l", "buffer", "new")<cr>
tnoremap ,l <C-\><C-n>:call SetMode(",l", "Terminal") \| :call Open("l", "buffer", "new")<cr>
nnoremap ,H :call SetMode(",H", "Normal") \| :call Open("H", "buffer", "new")<cr>
vnoremap ,H :call SetMode(",H", "Visual") \| '<,'>:call Open("H", "buffer", "new")<cr>
tnoremap ,H <C-\><C-n>:call SetMode(",H", "Terminal") \| :call Open("H", "buffer", "new")<cr>
nnoremap ,J :call SetMode(",J", "Normal") \| :call Open("J", "buffer", "new")<cr>
vnoremap ,J :call SetMode(",J", "Visual") \| '<,'>:call Open("J", "buffer", "new")<cr>
tnoremap ,J <C-\><C-n>:call SetMode(",J", "Terminal") \| :call Open("J", "buffer", "new")<cr>
nnoremap ,K :call SetMode(",K", "Normal") \| :call Open("K", "buffer", "new")<cr>
vnoremap ,K :call SetMode(",K", "Visual") \| '<,'>:call Open("K", "buffer", "new")<cr>
tnoremap ,K <C-\><C-n>:call SetMode(",K", "Terminal") \| :call Open("K", "buffer", "new")<cr>
nnoremap ,L :call SetMode(",L", "Normal") \| :call Open("L", "buffer", "new")<cr>
vnoremap ,L :call SetMode(",L", "Visual") \| '<,'>:call Open("L", "buffer", "new")<cr>
tnoremap ,L <C-\><C-n>:call SetMode(",L", "Terminal") \| :call Open("L", "buffer", "new")<cr>
nnoremap ,,h :call SetMode(",,h", "Normal") \| :call Open("h", "terminal", "new")<cr>
vnoremap ,,h :call SetMode(",,h", "Visual") \| '<,'>:call Open("h", "terminal", "new")<cr>
tnoremap ,,h <C-\><C-n>:call SetMode(",,h", "Terminal") \| :call Open("h", "terminal", "new")<cr>
nnoremap ,,j :call SetMode(",,j", "Normal") \| :call Open("j", "terminal", "new")<cr>
vnoremap ,,j :call SetMode(",,j", "Visual") \| '<,'>:call Open("j", "terminal", "new")<cr>
tnoremap ,,j <C-\><C-n>:call SetMode(",,j", "Terminal") \| :call Open("j", "terminal", "new")<cr>
nnoremap ,,k :call SetMode(",,k", "Normal") \| :call Open("k", "terminal", "new")<cr>
vnoremap ,,k :call SetMode(",,k", "Visual") \| '<,'>:call Open("k", "terminal", "new")<cr>
tnoremap ,,k <C-\><C-n>:call SetMode(",,k", "Terminal") \| :call Open("k", "terminal", "new")<cr>
nnoremap ,,l :call SetMode(",,l", "Normal") \| :call Open("l", "terminal", "new")<cr>
vnoremap ,,l :call SetMode(",,l", "Visual") \| '<,'>:call Open("l", "terminal", "new")<cr>
tnoremap ,,l <C-\><C-n>:call SetMode(",,l", "Terminal") \| :call Open("l", "terminal", "new")<cr>
nnoremap ,,H :call SetMode(",,H", "Normal") \| :call Open("H", "terminal", "new")<cr>
vnoremap ,,H :call SetMode(",,H", "Visual") \| '<,'>:call Open("H", "terminal", "new")<cr>
tnoremap ,,H <C-\><C-n>:call SetMode(",,H", "Terminal") \| :call Open("H", "terminal", "new")<cr>
nnoremap ,,J :call SetMode(",,J", "Normal") \| :call Open("J", "terminal", "new")<cr>
vnoremap ,,J :call SetMode(",,J", "Visual") \| '<,'>:call Open("J", "terminal", "new")<cr>
tnoremap ,,J <C-\><C-n>:call SetMode(",,J", "Terminal") \| :call Open("J", "terminal", "new")<cr>
nnoremap ,,K :call SetMode(",,K", "Normal") \| :call Open("K", "terminal", "new")<cr>
vnoremap ,,K :call SetMode(",,K", "Visual") \| '<,'>:call Open("K", "terminal", "new")<cr>
tnoremap ,,K <C-\><C-n>:call SetMode(",,K", "Terminal") \| :call Open("K", "terminal", "new")<cr>
nnoremap ,,L :call SetMode(",,L", "Normal") \| :call Open("L", "terminal", "new")<cr>
vnoremap ,,L :call SetMode(",,L", "Visual") \| '<,'>:call Open("L", "terminal", "new")<cr>
tnoremap ,,L <C-\><C-n>:call SetMode(",,L", "Terminal") \| :call Open("L", "terminal", "new")<cr>
nnoremap <A-H> :call SetMode("\<A-H\>", "Normal") \| :call Open("H", "buffer", "new")<cr>
vnoremap <A-H> :call SetMode("\<A-H\>", "Visual") \| '<,'>:call Open("H", "buffer", "new")<cr>
tnoremap <A-H> <C-\><C-n>:call SetMode("\<A-H\>", "Terminal") \| :call Open("H", "buffer", "new")<cr>
nnoremap <A-J> :call SetMode("\<A-J\>", "Normal") \| :call Open("J", "buffer", "new")<cr>
vnoremap <A-J> :call SetMode("\<A-J\>", "Visual") \| '<,'>:call Open("J", "buffer", "new")<cr>
tnoremap <A-J> <C-\><C-n>:call SetMode("\<A-J\>", "Terminal") \| :call Open("J", "buffer", "new")<cr>
nnoremap <A-K> :call SetMode("\<A-K\>", "Normal") \| :call Open("K", "buffer", "new")<cr>
vnoremap <A-K> :call SetMode("\<A-K\>", "Visual") \| '<,'>:call Open("K", "buffer", "new")<cr>
tnoremap <A-K> <C-\><C-n>:call SetMode("\<A-K\>", "Terminal") \| :call Open("K", "buffer", "new")<cr>
nnoremap <A-L> :call SetMode("\<A-L\>", "Normal") \| :call Open("L", "buffer", "new")<cr>
vnoremap <A-L> :call SetMode("\<A-L\>", "Visual") \| '<,'>:call Open("L", "buffer", "new")<cr>
tnoremap <A-L> <C-\><C-n>:call SetMode("\<A-L\>", "Terminal") \| :call Open("L", "buffer", "new")<cr>
nnoremap <A-S-h> :call SetMode("\<A-S-h\>", "Normal") \| :call Open("h", "terminal", "new")<cr>
vnoremap <A-S-h> :call SetMode("\<A-S-h\>", "Visual") \| '<,'>:call Open("h", "terminal", "new")<cr>
tnoremap <A-S-h> <C-\><C-n>:call SetMode("\<A-S-h\>", "Terminal") \| :call Open("h", "terminal", "new")<cr>
nnoremap <A-S-j> :call SetMode("\<A-S-j\>", "Normal") \| :call Open("j", "terminal", "new")<cr>
vnoremap <A-S-j> :call SetMode("\<A-S-j\>", "Visual") \| '<,'>:call Open("j", "terminal", "new")<cr>
tnoremap <A-S-j> <C-\><C-n>:call SetMode("\<A-S-j\>", "Terminal") \| :call Open("j", "terminal", "new")<cr>
nnoremap <A-S-k> :call SetMode("\<A-S-k\>", "Normal") \| :call Open("k", "terminal", "new")<cr>
vnoremap <A-S-k> :call SetMode("\<A-S-k\>", "Visual") \| '<,'>:call Open("k", "terminal", "new")<cr>
tnoremap <A-S-k> <C-\><C-n>:call SetMode("\<A-S-k\>", "Terminal") \| :call Open("k", "terminal", "new")<cr>
nnoremap <A-S-l> :call SetMode("\<A-S-l\>", "Normal") \| :call Open("l", "terminal", "new")<cr>
vnoremap <A-S-l> :call SetMode("\<A-S-l\>", "Visual") \| '<,'>:call Open("l", "terminal", "new")<cr>
tnoremap <A-S-l> <C-\><C-n>:call SetMode("\<A-S-l\>", "Terminal") \| :call Open("l", "terminal", "new")<cr>
nnoremap <A-S-H> :call SetMode("\<A-S-H\>", "Normal") \| :call Open("H", "terminal", "new")<cr>
vnoremap <A-S-H> :call SetMode("\<A-S-H\>", "Visual") \| '<,'>:call Open("H", "terminal", "new")<cr>
tnoremap <A-S-H> <C-\><C-n>:call SetMode("\<A-S-H\>", "Terminal") \| :call Open("H", "terminal", "new")<cr>
nnoremap <A-S-J> :call SetMode("\<A-S-J\>", "Normal") \| :call Open("J", "terminal", "new")<cr>
vnoremap <A-S-J> :call SetMode("\<A-S-J\>", "Visual") \| '<,'>:call Open("J", "terminal", "new")<cr>
tnoremap <A-S-J> <C-\><C-n>:call SetMode("\<A-S-J\>", "Terminal") \| :call Open("J", "terminal", "new")<cr>
nnoremap <A-S-K> :call SetMode("\<A-S-K\>", "Normal") \| :call Open("K", "terminal", "new")<cr>
vnoremap <A-S-K> :call SetMode("\<A-S-K\>", "Visual") \| '<,'>:call Open("K", "terminal", "new")<cr>
tnoremap <A-S-K> <C-\><C-n>:call SetMode("\<A-S-K\>", "Terminal") \| :call Open("K", "terminal", "new")<cr>
nnoremap <A-S-L> :call SetMode("\<A-S-L\>", "Normal") \| :call Open("L", "terminal", "new")<cr>
vnoremap <A-S-L> :call SetMode("\<A-S-L\>", "Visual") \| '<,'>:call Open("L", "terminal", "new")<cr>
tnoremap <A-S-L> <C-\><C-n>:call SetMode("\<A-S-L\>", "Terminal") \| :call Open("L", "terminal", "new")<cr>
nnoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "Normal") \| :call Open("h", "terminal", "new")<cr>
vnoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "Visual") \| '<,'>:call Open("h", "terminal", "new")<cr>
tnoremap <A-S-Left> <C-\><C-n>:call SetMode("\<A-S-Left\>", "Terminal") \| :call Open("h", "terminal", "new")<cr>
nnoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "Normal") \| :call Open("j", "terminal", "new")<cr>
vnoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "Visual") \| '<,'>:call Open("j", "terminal", "new")<cr>
tnoremap <A-S-Down> <C-\><C-n>:call SetMode("\<A-S-Down\>", "Terminal") \| :call Open("j", "terminal", "new")<cr>
nnoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "Normal") \| :call Open("k", "terminal", "new")<cr>
vnoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "Visual") \| '<,'>:call Open("k", "terminal", "new")<cr>
tnoremap <A-S-Up> <C-\><C-n>:call SetMode("\<A-S-Up\>", "Terminal") \| :call Open("k", "terminal", "new")<cr>
nnoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "Normal") \| :call Open("l", "terminal", "new")<cr>
vnoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "Visual") \| '<,'>:call Open("l", "terminal", "new")<cr>
tnoremap <A-S-Right> <C-\><C-n>:call SetMode("\<A-S-Right\>", "Terminal") \| :call Open("l", "terminal", "new")<cr>
nnoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "Normal") \| :call Open("H", "terminal", "new")<cr>
vnoremap <A-S-Left> :call SetMode("\<A-S-Left\>", "Visual") \| '<,'>:call Open("H", "terminal", "new")<cr>
tnoremap <A-S-Left> <C-\><C-n>:call SetMode("\<A-S-Left\>", "Terminal") \| :call Open("H", "terminal", "new")<cr>
nnoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "Normal") \| :call Open("J", "terminal", "new")<cr>
vnoremap <A-S-Down> :call SetMode("\<A-S-Down\>", "Visual") \| '<,'>:call Open("J", "terminal", "new")<cr>
tnoremap <A-S-Down> <C-\><C-n>:call SetMode("\<A-S-Down\>", "Terminal") \| :call Open("J", "terminal", "new")<cr>
nnoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "Normal") \| :call Open("K", "terminal", "new")<cr>
vnoremap <A-S-Up> :call SetMode("\<A-S-Up\>", "Visual") \| '<,'>:call Open("K", "terminal", "new")<cr>
tnoremap <A-S-Up> <C-\><C-n>:call SetMode("\<A-S-Up\>", "Terminal") \| :call Open("K", "terminal", "new")<cr>
nnoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "Normal") \| :call Open("L", "terminal", "new")<cr>
vnoremap <A-S-Right> :call SetMode("\<A-S-Right\>", "Visual") \| '<,'>:call Open("L", "terminal", "new")<cr>
tnoremap <A-S-Right> <C-\><C-n>:call SetMode("\<A-S-Right\>", "Terminal") \| :call Open("L", "terminal", "new")<cr>
nnoremap <A-Left> :call SetMode("\<A-Left\>", "Normal") \| :call Open("h", "buffer", "new")<cr>
vnoremap <A-Left> :call SetMode("\<A-Left\>", "Visual") \| '<,'>:call Open("h", "buffer", "new")<cr>
tnoremap <A-Left> <C-\><C-n>:call SetMode("\<A-Left\>", "Terminal") \| :call Open("h", "buffer", "new")<cr>
nnoremap <A-Down> :call SetMode("\<A-Down\>", "Normal") \| :call Open("j", "buffer", "new")<cr>
vnoremap <A-Down> :call SetMode("\<A-Down\>", "Visual") \| '<,'>:call Open("j", "buffer", "new")<cr>
tnoremap <A-Down> <C-\><C-n>:call SetMode("\<A-Down\>", "Terminal") \| :call Open("j", "buffer", "new")<cr>
nnoremap <A-Up> :call SetMode("\<A-Up\>", "Normal") \| :call Open("k", "buffer", "new")<cr>
vnoremap <A-Up> :call SetMode("\<A-Up\>", "Visual") \| '<,'>:call Open("k", "buffer", "new")<cr>
tnoremap <A-Up> <C-\><C-n>:call SetMode("\<A-Up\>", "Terminal") \| :call Open("k", "buffer", "new")<cr>
nnoremap <A-Right> :call SetMode("\<A-Right\>", "Normal") \| :call Open("l", "buffer", "new")<cr>
vnoremap <A-Right> :call SetMode("\<A-Right\>", "Visual") \| '<,'>:call Open("l", "buffer", "new")<cr>
tnoremap <A-Right> <C-\><C-n>:call SetMode("\<A-Right\>", "Terminal") \| :call Open("l", "buffer", "new")<cr>
nnoremap <A-Left> :call SetMode("\<A-Left\>", "Normal") \| :call Open("H", "buffer", "new")<cr>
vnoremap <A-Left> :call SetMode("\<A-Left\>", "Visual") \| '<,'>:call Open("H", "buffer", "new")<cr>
tnoremap <A-Left> <C-\><C-n>:call SetMode("\<A-Left\>", "Terminal") \| :call Open("H", "buffer", "new")<cr>
nnoremap <A-Down> :call SetMode("\<A-Down\>", "Normal") \| :call Open("J", "buffer", "new")<cr>
vnoremap <A-Down> :call SetMode("\<A-Down\>", "Visual") \| '<,'>:call Open("J", "buffer", "new")<cr>
tnoremap <A-Down> <C-\><C-n>:call SetMode("\<A-Down\>", "Terminal") \| :call Open("J", "buffer", "new")<cr>
nnoremap <A-Up> :call SetMode("\<A-Up\>", "Normal") \| :call Open("K", "buffer", "new")<cr>
vnoremap <A-Up> :call SetMode("\<A-Up\>", "Visual") \| '<,'>:call Open("K", "buffer", "new")<cr>
tnoremap <A-Up> <C-\><C-n>:call SetMode("\<A-Up\>", "Terminal") \| :call Open("K", "buffer", "new")<cr>
nnoremap <A-Right> :call SetMode("\<A-Right\>", "Normal") \| :call Open("L", "buffer", "new")<cr>
vnoremap <A-Right> :call SetMode("\<A-Right\>", "Visual") \| '<,'>:call Open("L", "buffer", "new")<cr>
tnoremap <A-Right> <C-\><C-n>:call SetMode("\<A-Right\>", "Terminal") \| :call Open("L", "buffer", "new")<cr>
nnoremap <silent> <C-q> :call SetMode("\<C-q\>", "Normal") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
vnoremap <silent> <C-q> :call SetMode("\<C-q\>", "Visual") \| '<,'>:if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
tnoremap <silent> <C-q> <C-\><C-n>:call SetMode("\<C-q\>", "Terminal") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
nnoremap <C-S-q> :call SetMode("\<C-S-q\>", "Normal") \| :qa!<cr>
vnoremap <C-S-q> :call SetMode("\<C-S-q\>", "Visual") \| '<,'>:qa!<cr>
tnoremap <C-S-q> <C-\><C-n>:call SetMode("\<C-S-q\>", "Terminal") \| :qa!<cr>
nnoremap <A-q> :call SetMode("\<A-q\>", "Normal") \| :call TabClose()<cr>
vnoremap <A-q> :call SetMode("\<A-q\>", "Visual") \| '<,'>:call TabClose()<cr>
tnoremap <A-q> <C-\><C-n>:call SetMode("\<A-q\>", "Terminal") \| :call TabClose()<cr>
nnoremap -la :call SetMode("-la", "Normal") \| ,,r :redraw!<cr>
nnoremap <S-F2> :call SetMode("\<S-F2\>", "Normal") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
vnoremap <S-F2> :call SetMode("\<S-F2\>", "Visual") \| '<,'>:let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
tnoremap <S-F2> <C-\><C-n>:call SetMode("\<S-F2\>", "Terminal") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
nnoremap ,c :call SetMode(",c", "Normal") \| call CountRegex()<cr>
vnoremap ,c :call SetMode(",c", "Visual") \| '<,'>call CountRegex()<cr>
tnoremap ,c <C-\><C-n>:call SetMode(",c", "Terminal") \| call CountRegex()<cr>
nnoremap <C-S-A> :call SetMode("\<C-S-A\>", "Normal") \| :call IncRange()<cr>
nnoremap <C-S-X> :call SetMode("\<C-S-X\>", "Normal") \| :call DecRange()<cr>
vnoremap af :call SetMode("af", "Visual") \| '<,'>:call Vaf()<cr>
vnoremap <C-S-A> :call SetMode("\<C-S-A\>", "Visual") \| '<,'>:call IncRange()<cr>
vnoremap <C-S-X> :call SetMode("\<C-S-X\>", "Visual") \| '<,'>:call DecRange()<cr>
tnoremap ,X <C-\><C-n>:call SetMode(",X", "Terminal") \| :TIN tail -f $receiver<cr>
nnoremap <A-S-n> :call SetMode("\<A-S-n\>", "Normal") \| <C-w>+
nnoremap <A-S-m> :call SetMode("\<A-S-m\>", "Normal") \| <C-w>-
nnoremap <A-S-u> :call SetMode("\<A-S-u\>", "Normal") \| <C-w><
nnoremap <A-S-i> :call SetMode("\<A-S-i\>", "Normal") \| <C-w>>
nnoremap <A-n> :call SetMode("\<A-n\>", "Normal") \| 12<C-w>+
nnoremap <A-m> :call SetMode("\<A-m\>", "Normal") \| 12<C-w>-
nnoremap <A-u> :call SetMode("\<A-u\>", "Normal") \| 12<C-w><
nnoremap <A-i> :call SetMode("\<A-i\>", "Normal") \| 12<C-w>>
nnoremap <A-h> :call SetMode("\<A-h\>", "Normal") \| :call TabHToggle()<cr>
cnoremap <A-h> :call SetMode("\<A-h\>", "Command") \| :call TabHToggle()<cr>
tnoremap <A-h> <C-\><C-n>:call SetMode("\<A-h\>", "Terminal") \| :call TabHToggle()<cr>
nnoremap <A-h> :call SetMode("\<A-h\>", "Normal") \| :call TabHToggle()<cr>
cnoremap <A-h> :call SetMode("\<A-h\>", "Command") \| :call TabHToggle()<cr>
tnoremap <A-h> <C-\><C-n>:call SetMode("\<A-h\>", "Terminal") \| :call TabHToggle()<cr>
nnoremap <A-l> :call SetMode("\<A-l\>", "Normal") \| :call TabLToggle()<cr>
cnoremap <A-l> :call SetMode("\<A-l\>", "Command") \| :call TabLToggle()<cr>
tnoremap <A-l> <C-\><C-n>:call SetMode("\<A-l\>", "Terminal") \| :call TabLToggle()<cr>
nnoremap <A-l> :call SetMode("\<A-l\>", "Normal") \| :call TabLToggle()<cr>
cnoremap <A-l> :call SetMode("\<A-l\>", "Command") \| :call TabLToggle()<cr>
tnoremap <A-l> <C-\><C-n>:call SetMode("\<A-l\>", "Terminal") \| :call TabLToggle()<cr>
nnoremap <A-S-h> :call SetMode("\<A-S-h\>", "Normal") \| :call TabHCreateNew()<cr>
cnoremap <A-S-h> :call SetMode("\<A-S-h\>", "Command") \| :call TabHCreateNew()<cr>
tnoremap <A-S-h> <C-\><C-n>:call SetMode("\<A-S-h\>", "Terminal") \| :call TabHCreateNew()<cr>
nnoremap <A-S-h> :call SetMode("\<A-S-h\>", "Normal") \| :call TabHCreateNew()<cr>
cnoremap <A-S-h> :call SetMode("\<A-S-h\>", "Command") \| :call TabHCreateNew()<cr>
tnoremap <A-S-h> <C-\><C-n>:call SetMode("\<A-S-h\>", "Terminal") \| :call TabHCreateNew()<cr>
nnoremap <A-S-l> :call SetMode("\<A-S-l\>", "Normal") \| :call TabLCreateNew()<cr>
cnoremap <A-S-l> :call SetMode("\<A-S-l\>", "Command") \| :call TabLCreateNew()<cr>
tnoremap <A-S-l> <C-\><C-n>:call SetMode("\<A-S-l\>", "Terminal") \| :call TabLCreateNew()<cr>
nnoremap <A-S-l> :call SetMode("\<A-S-l\>", "Normal") \| :call TabLCreateNew()<cr>
cnoremap <A-S-l> :call SetMode("\<A-S-l\>", "Command") \| :call TabLCreateNew()<cr>
tnoremap <A-S-l> <C-\><C-n>:call SetMode("\<A-S-l\>", "Terminal") \| :call TabLCreateNew()<cr>
nnoremap <S-A-h> :call SetMode("\<S-A-h\>", "Normal") \| :call TabHMove()<cr>
cnoremap <S-A-h> :call SetMode("\<S-A-h\>", "Command") \| :call TabHMove()<cr>
tnoremap <S-A-h> <C-\><C-n>:call SetMode("\<S-A-h\>", "Terminal") \| :call TabHMove()<cr>
nnoremap <S-A-h> :call SetMode("\<S-A-h\>", "Normal") \| :call TabHMove()<cr>
cnoremap <S-A-h> :call SetMode("\<S-A-h\>", "Command") \| :call TabHMove()<cr>
tnoremap <S-A-h> <C-\><C-n>:call SetMode("\<S-A-h\>", "Terminal") \| :call TabHMove()<cr>
nnoremap <S-A-l> :call SetMode("\<S-A-l\>", "Normal") \| :call TabLMove()<cr>
cnoremap <S-A-l> :call SetMode("\<S-A-l\>", "Command") \| :call TabLMove()<cr>
tnoremap <S-A-l> <C-\><C-n>:call SetMode("\<S-A-l\>", "Terminal") \| :call TabLMove()<cr>
nnoremap <S-A-l> :call SetMode("\<S-A-l\>", "Normal") \| :call TabLMove()<cr>
cnoremap <S-A-l> :call SetMode("\<S-A-l\>", "Command") \| :call TabLMove()<cr>
tnoremap <S-A-l> <C-\><C-n>:call SetMode("\<S-A-l\>", "Terminal") \| :call TabLMove()<cr>
nnoremap <A-h> :call SetMode("\<A-h\>", "Normal") \| :call TabH()<cr>
cnoremap <A-h> :call SetMode("\<A-h\>", "Command") \| :call TabH()<cr>
tnoremap <A-h> <C-\><C-n>:call SetMode("\<A-h\>", "Terminal") \| :call TabH()<cr>
nnoremap <A-h> :call SetMode("\<A-h\>", "Normal") \| :call TabH()<cr>
cnoremap <A-h> :call SetMode("\<A-h\>", "Command") \| :call TabH()<cr>
tnoremap <A-h> <C-\><C-n>:call SetMode("\<A-h\>", "Terminal") \| :call TabH()<cr>
nnoremap <A-l> :call SetMode("\<A-l\>", "Normal") \| :call TabL()<cr>
cnoremap <A-l> :call SetMode("\<A-l\>", "Command") \| :call TabL()<cr>
tnoremap <A-l> <C-\><C-n>:call SetMode("\<A-l\>", "Terminal") \| :call TabL()<cr>
nnoremap <A-l> :call SetMode("\<A-l\>", "Normal") \| :call TabL()<cr>
cnoremap <A-l> :call SetMode("\<A-l\>", "Command") \| :call TabL()<cr>
tnoremap <A-l> <C-\><C-n>:call SetMode("\<A-l\>", "Terminal") \| :call TabL()<cr>
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
nnoremap <C-h> :call SetMode("\<C-h\>", "Normal") \| :call SmartWincmd('h')<cr>
vnoremap <C-h> :call SetMode("\<C-h\>", "Visual") \| '<,'>:call SmartWincmd('h')<cr>
cnoremap <C-h> :call SetMode("\<C-h\>", "Command") \| :call SmartWincmd('h')<cr>
tnoremap <C-h> <C-\><C-n>:call SetMode("\<C-h\>", "Terminal") \| :call SmartWincmd('h')<cr>
inoremap <C-h> :call SetMode("\<C-h\>", "Insert") \| :call SmartWincmd('h')<cr>
nnoremap <C-h> :call SetMode("\<C-h\>", "Normal") \| :call SmartWincmd('h')<cr>
vnoremap <C-h> :call SetMode("\<C-h\>", "Visual") \| '<,'>:call SmartWincmd('h')<cr>
cnoremap <C-h> :call SetMode("\<C-h\>", "Command") \| :call SmartWincmd('h')<cr>
tnoremap <C-h> <C-\><C-n>:call SetMode("\<C-h\>", "Terminal") \| :call SmartWincmd('h')<cr>
inoremap <C-h> :call SetMode("\<C-h\>", "Insert") \| :call SmartWincmd('h')<cr>
nnoremap <C-j> :call SetMode("\<C-j\>", "Normal") \| :call SmartWincmd('j')<cr>
vnoremap <C-j> :call SetMode("\<C-j\>", "Visual") \| '<,'>:call SmartWincmd('j')<cr>
cnoremap <C-j> :call SetMode("\<C-j\>", "Command") \| :call SmartWincmd('j')<cr>
tnoremap <C-j> <C-\><C-n>:call SetMode("\<C-j\>", "Terminal") \| :call SmartWincmd('j')<cr>
inoremap <C-j> :call SetMode("\<C-j\>", "Insert") \| :call SmartWincmd('j')<cr>
nnoremap <C-j> :call SetMode("\<C-j\>", "Normal") \| :call SmartWincmd('j')<cr>
vnoremap <C-j> :call SetMode("\<C-j\>", "Visual") \| '<,'>:call SmartWincmd('j')<cr>
cnoremap <C-j> :call SetMode("\<C-j\>", "Command") \| :call SmartWincmd('j')<cr>
tnoremap <C-j> <C-\><C-n>:call SetMode("\<C-j\>", "Terminal") \| :call SmartWincmd('j')<cr>
inoremap <C-j> :call SetMode("\<C-j\>", "Insert") \| :call SmartWincmd('j')<cr>
nnoremap <C-k> :call SetMode("\<C-k\>", "Normal") \| :call SmartWincmd('k')<cr>
vnoremap <C-k> :call SetMode("\<C-k\>", "Visual") \| '<,'>:call SmartWincmd('k')<cr>
cnoremap <C-k> :call SetMode("\<C-k\>", "Command") \| :call SmartWincmd('k')<cr>
tnoremap <C-k> <C-\><C-n>:call SetMode("\<C-k\>", "Terminal") \| :call SmartWincmd('k')<cr>
inoremap <C-k> :call SetMode("\<C-k\>", "Insert") \| :call SmartWincmd('k')<cr>
nnoremap <C-k> :call SetMode("\<C-k\>", "Normal") \| :call SmartWincmd('k')<cr>
vnoremap <C-k> :call SetMode("\<C-k\>", "Visual") \| '<,'>:call SmartWincmd('k')<cr>
cnoremap <C-k> :call SetMode("\<C-k\>", "Command") \| :call SmartWincmd('k')<cr>
tnoremap <C-k> <C-\><C-n>:call SetMode("\<C-k\>", "Terminal") \| :call SmartWincmd('k')<cr>
inoremap <C-k> :call SetMode("\<C-k\>", "Insert") \| :call SmartWincmd('k')<cr>
nnoremap <C-l> :call SetMode("\<C-l\>", "Normal") \| :call SmartWincmd('l')<cr>
vnoremap <C-l> :call SetMode("\<C-l\>", "Visual") \| '<,'>:call SmartWincmd('l')<cr>
cnoremap <C-l> :call SetMode("\<C-l\>", "Command") \| :call SmartWincmd('l')<cr>
tnoremap <C-l> <C-\><C-n>:call SetMode("\<C-l\>", "Terminal") \| :call SmartWincmd('l')<cr>
inoremap <C-l> :call SetMode("\<C-l\>", "Insert") \| :call SmartWincmd('l')<cr>
nnoremap <C-l> :call SetMode("\<C-l\>", "Normal") \| :call SmartWincmd('l')<cr>
vnoremap <C-l> :call SetMode("\<C-l\>", "Visual") \| '<,'>:call SmartWincmd('l')<cr>
cnoremap <C-l> :call SetMode("\<C-l\>", "Command") \| :call SmartWincmd('l')<cr>
tnoremap <C-l> <C-\><C-n>:call SetMode("\<C-l\>", "Terminal") \| :call SmartWincmd('l')<cr>
inoremap <C-l> :call SetMode("\<C-l\>", "Insert") \| :call SmartWincmd('l')<cr>
tnoremap <C-l> l
tnoremap <C-h> h
tnoremap <C-k> k
tnoremap <C-j> j
inoremap <C-l> :call SetMode("\<C-l\>", "Insert") \| <C-w>li
inoremap <C-h> :call SetMode("\<C-h\>", "Insert") \| <C-w>hi
inoremap <c-w><c-w> :call SetMode("\<c-w\>\<c-w\>", "Insert") \| <c-w><c-w>
tnoremap  <C-\><C-n>:call SetMode("", "Terminal") \| :call ExitTerminal()<cr>
inoremap <A-'> :call SetMode("\<A-'\>", "Insert") \| ä
inoremap <A-"> :call SetMode("\<A-"\>", "Insert") \| Ä
inoremap <A-;> :call SetMode("\<A-;\>", "Insert") \| ö
inoremap <A-:> :call SetMode("\<A-:\>", "Insert") \| Ö
inoremap <A-[> :call SetMode("\<A-[\>", "Insert") \| ü
inoremap <A-{> :call SetMode("\<A-{\>", "Insert") \| Ü
inoremap <A--> :call SetMode("\<A--\>", "Insert") \| ß
tnoremap <ScrollWheelUp> <C-\><C-n>
tnoremap <S-ScrollWheelUp> <C-\><C-n>
tnoremap <ScrollWheelDown> <C-\><C-n>
tnoremap <S-ScrollWheelDown> <C-\><C-n>
tnoremap <Esc> <C-\><C-n>:call SetMode("\<Esc\>", "Terminal") \| i
tnoremap <LeftMouse> <C-\><C-n>
vnoremap <BS> :call SetMode("\<BS\>", "Visual") \| '<,'>:call backspace()<cr>
vnoremap & :call SetMode("&", "Visual") \| '<,'>:&<cr>
vnoremap ,F :call SetMode(",F", "Visual") \| '<,'>:echo VS()<cr>
vnoremap ,,g :call SetMode(",,g", "Visual") \| '<,'>:call AppendToEndRange()<cr>
vnoremap ,G :call SetMode(",G", "Visual") \| '<,'>:AppendAll<cr>
vnoremap ,u :call SetMode(",u", "Visual") \| '<,'>:!uniq<cr>
vnoremap <M-v> :call SetMode("\<M-v\>", "Visual") \| '<,'>:call VPaste("Visual")<cr>
vnoremap <M-c> :call SetMode("\<M-c\>", "Visual") \| '<,'>:call VCopy("Visual")<cr>
vnoremap <M-x> :call SetMode("\<M-x\>", "Visual") \| '<,'>:call VCut("Visual")<cr>
tnoremap <c-o> <C-\><C-n>:call SetMode("\<c-o\>", "Terminal") \| <c-\><c-n><c-o>
nnoremap ,,,m :call SetMode(",,,m", "Normal") \| :call Toggle_Set_Last_Git_Message()<cr>
nnoremap ,,,l :call SetMode(",,,l", "Normal") \| :call ToggleLineState()<cr>
nnoremap ,,,L :call SetMode(",,,L", "Normal") \| :call ToggleLineStateGlobal()<cr>
nnoremap ,,s :call SetMode(",,s", "Normal") \| :call Statusline_TogglePath()<cr>
nnoremap ,,d :call SetMode(",,d", "Normal") \| :echo g:debug_layout<cr>
nnoremap ,,B :call SetMode(",,B", "Normal") \| :call Boilerplate_Test()<cr>
nnoremap ,<Space> :call SetMode(",\<Space\>", "Normal") \| :call GetCCWD()<cr>
nnoremap <C-s> :call SetMode("\<C-s\>", "Normal") \| :call SaveFile()<cr>
vnoremap <C-s> :call SetMode("\<C-s\>", "Visual") \| '<,'>:call SaveFile()<cr>
inoremap <C-s> :call SetMode("\<C-s\>", "Insert") \| :call SaveFile()<cr>
nnoremap <localleader>f :call SetMode("\<localleader\>f", "Normal") \| :InsertFunction<cr>
nnoremap <space>f :call SetMode("\<space\>f", "Normal") \| :InsertFilename<cr>
nnoremap ,<Space> :call SetMode(",\<Space\>", "Normal") \| :call ToggleZoom()<cr>
nnoremap <S-F1> :call SetMode("\<S-F1\>", "Normal") \| :SearchCword<cr>
nnoremap ,b :call SetMode(",b", "Normal") \| :call BASH(VS())<cr>
nnoremap ,b :call SetMode(",b", "Normal") \| :call Bash(VS())<cr>
nnoremap ,b :call SetMode(",b", "Normal") \| :Buffers<cr>
nnoremap ,b :call SetMode(",b", "Normal") \| :Buffers<cr>
nnoremap ,,iv :call SetMode(",,iv", "Normal") \| :call VIM(input("vimscript: "), 'exec_input_vs')<cr>
nnoremap ,,ib :call SetMode(",,ib", "Normal") \| :call BASH(input("bash: "), 'exec_input_vs')<cr>
nnoremap ,,ip :call SetMode(",,ip", "Normal") \| :call PYTHON(input("python: "), 'exec_input_vs')<cr>
nnoremap ,,ir :call SetMode(",,ir", "Normal") \| :call RUST(input("rust: "), 'exec_input_vs')<cr>
nnoremap ,iv :call SetMode(",iv", "Normal") \| :call VIM('', 'exec_input_vs')<cr>
vnoremap ,iv :call SetMode(",iv", "Visual") \| '<,'>:call VIM('', 'exec_input_vs')<cr>
nnoremap ,ib :call SetMode(",ib", "Normal") \| :call BASH('', 'exec_input_vs')<cr>
vnoremap ,ib :call SetMode(",ib", "Visual") \| '<,'>:call BASH('', 'exec_input_vs')<cr>
nnoremap ,ip :call SetMode(",ip", "Normal") \| :call PYTHON('', 'exec_input_vs')<cr>
vnoremap ,ip :call SetMode(",ip", "Visual") \| '<,'>:call PYTHON('', 'exec_input_vs')<cr>
nnoremap ,ir :call SetMode(",ir", "Normal") \| :call RUST('', 'exec_input_vs')<cr>
vnoremap ,ir :call SetMode(",ir", "Visual") \| '<,'>:call RUST('', 'exec_input_vs')<cr>
nnoremap <space>p :call SetMode("\<space\>p", "Normal") \| :CopyFileNameToClipboard<cr>
nnoremap <space>P :call SetMode("\<space\>P", "Normal") \| :CopyWholePathToClipboard<cr>
nnoremap <space>r :call SetMode("\<space\>r", "Normal") \| :InsertReceiver<cr>
nnoremap ,dd :call SetMode(",dd", "Normal") \| :call Rewindworkdir()<cr>
nnoremap <C-Space> :call SetMode("\<C-Space\>", "Normal") \| :call Files(Folder_Up(v:count, 0))<cr>
nnoremap ,<C-Space> :call SetMode(",\<C-Space\>", "Normal") \| :call Files(Folder_Up(v:count, 1))<cr>
nnoremap ,,<C-Space> :call SetMode(",,\<C-Space\>", "Normal") \| :call Files(Folder_Up(v:count, 2))<cr>
nnoremap ,,,<C-Space> :call SetMode(",,,\<C-Space\>", "Normal") \| :call Files(Folder_Up(v:count, 3))<cr>
nnoremap ,,,,<C-Space> :call SetMode(",,,,\<C-Space\>", "Normal") \| :call Files(Folder_Up(v:count, 4))<cr>
nnoremap ,,,,,<C-Space> :call SetMode(",,,,,\<C-Space\>", "Normal") \| :call Files(Folder_Up(v:count, 5))<cr>
nnoremap ,<Space> :call SetMode(",\<Space\>", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 0))<cr>
nnoremap ,,<Space> :call SetMode(",,\<Space\>", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 1))<cr>
nnoremap ,,,<Space> :call SetMode(",,,\<Space\>", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 2))<cr>
nnoremap ,,,,<Space> :call SetMode(",,,,\<Space\>", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 3))<cr>
nnoremap ,,,,,<Space> :call SetMode(",,,,,\<Space\>", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 4))<cr>
nnoremap ,,,,,,<Space> :call SetMode(",,,,,,\<Space\>", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 5))<cr>
nnoremap <C-g> :call SetMode("\<C-g\>", "Normal") \| :call AgIn(Folder_Repo(v:count, 0))<cr>
nnoremap ,<C-g> :call SetMode(",\<C-g\>", "Normal") \| :call AgIn(Folder_Repo(v:count, 1))<cr>
nnoremap ,,<C-g> :call SetMode(",,\<C-g\>", "Normal") \| :call AgIn(Folder_Repo(v:count, 2))<cr>
nnoremap ,,,<C-g> :call SetMode(",,,\<C-g\>", "Normal") \| :call AgIn(Folder_Repo(v:count, 3))<cr>
nnoremap ,,,,<C-g> :call SetMode(",,,,\<C-g\>", "Normal") \| :call AgIn(Folder_Repo(v:count, 4))<cr>
nnoremap ,,,,,<C-g> :call SetMode(",,,,,\<C-g\>", "Normal") \| :call AgIn(Folder_Repo(v:count, 5))<cr>
nnoremap ,g :call SetMode(",g", "Normal") \| :call AgIn(Folder_Repo(v:count, 0))<cr>
nnoremap ,,g :call SetMode(",,g", "Normal") \| :call AgIn(Folder_Repo(v:count, 1))<cr>
nnoremap ,,,g :call SetMode(",,,g", "Normal") \| :call AgIn(Folder_Repo(v:count, 2))<cr>
nnoremap ,,,,g :call SetMode(",,,,g", "Normal") \| :call AgIn(Folder_Repo(v:count, 3))<cr>
nnoremap ,,,,,g :call SetMode(",,,,,g", "Normal") \| :call AgIn(Folder_Repo(v:count, 4))<cr>
nnoremap ,,,,,,g :call SetMode(",,,,,,g", "Normal") \| :call AgIn(Folder_Repo(v:count, 5))<cr>
nnoremap ,vcd :call SetMode(",vcd", "Normal") \| :call CD(VimConfiguration())<cr>
nnoremap <C-p> :call SetMode("\<C-p\>", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 0))<cr>
nnoremap ,<C-p> :call SetMode(",\<C-p\>", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 1))<cr>
nnoremap ,,<C-p> :call SetMode(",,\<C-p\>", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 2))<cr>
nnoremap ,,,<C-p> :call SetMode(",,,\<C-p\>", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 3))<cr>
nnoremap ,,,,<C-p> :call SetMode(",,,,\<C-p\>", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 4))<cr>
nnoremap ,,,,,<C-p> :call SetMode(",,,,,\<C-p\>", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 5))<cr>
nnoremap ,p :call SetMode(",p", "Normal") \| :call Projects()<cr>
nnoremap ,,p :call SetMode(",,p", "Normal") \| :call FilesInProjects()<cr>
nnoremap <C-S-p> :call SetMode("\<C-S-p\>", "Normal") \| :call Projects()<cr>
nnoremap <A-p> :call SetMode("\<A-p\>", "Normal") \| :call ToggleTroughOpenedProjects()<cr>
nnoremap <A-S-p> :call SetMode("\<A-S-p\>", "Normal") \| :call ToggleTroughOpenedProjects(-1)<cr>
nnoremap <A-C-p> :call SetMode("\<A-C-p\>", "Normal") \| :call Projects()<cr>
nnoremap <A-S-C-p> :call SetMode("\<A-S-C-p\>", "Normal") \| :call Projects()<cr>
nnoremap ,<C-p> :call SetMode(",\<C-p\>", "Normal") \| :call SearchGitProjects()<cr>
nnoremap ,,<C-p> :call SetMode(",,\<C-p\>", "Normal") \| :call SearchGitProjects()<cr>
nnoremap <C-S-m> :call SetMode("\<C-S-m\>", "Normal") \| :Generate<cr>
nnoremap <C-F12> :call SetMode("\<C-F12\>", "Normal") \| :call Commands()<cr>
vnoremap <C-F12> :call SetMode("\<C-F12\>", "Visual") \| '<,'>:call Commands()<cr>
cnoremap <C-F12> :call SetMode("\<C-F12\>", "Command") \| :call Commands()<cr>
tnoremap <C-F12> <C-\><C-n>:call SetMode("\<C-F12\>", "Terminal") \| :call Commands()<cr>
inoremap <C-F12> :call SetMode("\<C-F12\>", "Insert") \| :call Commands()<cr>
nnoremap <C-F12> :call SetMode("\<C-F12\>", "Normal") \| :call Commands()<cr>
vnoremap <C-F12> :call SetMode("\<C-F12\>", "Visual") \| '<,'>:call Commands()<cr>
cnoremap <C-F12> :call SetMode("\<C-F12\>", "Command") \| :call Commands()<cr>
tnoremap <C-F12> <C-\><C-n>:call SetMode("\<C-F12\>", "Terminal") \| :call Commands()<cr>
inoremap <C-F12> :call SetMode("\<C-F12\>", "Insert") \| :call Commands()<cr>
nnoremap <C-S-F12> :call SetMode("\<C-S-F12\>", "Normal") \| :call Commands()<cr>
vnoremap <C-S-F12> :call SetMode("\<C-S-F12\>", "Visual") \| '<,'>:call Commands()<cr>
cnoremap <C-S-F12> :call SetMode("\<C-S-F12\>", "Command") \| :call Commands()<cr>
tnoremap <C-S-F12> <C-\><C-n>:call SetMode("\<C-S-F12\>", "Terminal") \| :call Commands()<cr>
inoremap <C-S-F12> :call SetMode("\<C-S-F12\>", "Insert") \| :call Commands()<cr>
nnoremap <C-S-F12> :call SetMode("\<C-S-F12\>", "Normal") \| :call Commands()<cr>
vnoremap <C-S-F12> :call SetMode("\<C-S-F12\>", "Visual") \| '<,'>:call Commands()<cr>
cnoremap <C-S-F12> :call SetMode("\<C-S-F12\>", "Command") \| :call Commands()<cr>
tnoremap <C-S-F12> <C-\><C-n>:call SetMode("\<C-S-F12\>", "Terminal") \| :call Commands()<cr>
inoremap <C-S-F12> :call SetMode("\<C-S-F12\>", "Insert") \| :call Commands()<cr>
nnoremap <A-F12> :call SetMode("\<A-F12\>", "Normal") \| :call Commands()<cr>
vnoremap <A-F12> :call SetMode("\<A-F12\>", "Visual") \| '<,'>:call Commands()<cr>
cnoremap <A-F12> :call SetMode("\<A-F12\>", "Command") \| :call Commands()<cr>
tnoremap <A-F12> <C-\><C-n>:call SetMode("\<A-F12\>", "Terminal") \| :call Commands()<cr>
inoremap <A-F12> :call SetMode("\<A-F12\>", "Insert") \| :call Commands()<cr>
nnoremap <A-F12> :call SetMode("\<A-F12\>", "Normal") \| :call Commands()<cr>
vnoremap <A-F12> :call SetMode("\<A-F12\>", "Visual") \| '<,'>:call Commands()<cr>
cnoremap <A-F12> :call SetMode("\<A-F12\>", "Command") \| :call Commands()<cr>
tnoremap <A-F12> <C-\><C-n>:call SetMode("\<A-F12\>", "Terminal") \| :call Commands()<cr>
inoremap <A-F12> :call SetMode("\<A-F12\>", "Insert") \| :call Commands()<cr>
nnoremap <A-S-F12> :call SetMode("\<A-S-F12\>", "Normal") \| :call Commands()<cr>
vnoremap <A-S-F12> :call SetMode("\<A-S-F12\>", "Visual") \| '<,'>:call Commands()<cr>
cnoremap <A-S-F12> :call SetMode("\<A-S-F12\>", "Command") \| :call Commands()<cr>
tnoremap <A-S-F12> <C-\><C-n>:call SetMode("\<A-S-F12\>", "Terminal") \| :call Commands()<cr>
inoremap <A-S-F12> :call SetMode("\<A-S-F12\>", "Insert") \| :call Commands()<cr>
nnoremap <A-S-F12> :call SetMode("\<A-S-F12\>", "Normal") \| :call Commands()<cr>
vnoremap <A-S-F12> :call SetMode("\<A-S-F12\>", "Visual") \| '<,'>:call Commands()<cr>
cnoremap <A-S-F12> :call SetMode("\<A-S-F12\>", "Command") \| :call Commands()<cr>
tnoremap <A-S-F12> <C-\><C-n>:call SetMode("\<A-S-F12\>", "Terminal") \| :call Commands()<cr>
inoremap <A-S-F12> :call SetMode("\<A-S-F12\>", "Insert") \| :call Commands()<cr>
nnoremap <A-C-F12> :call SetMode("\<A-C-F12\>", "Normal") \| :call Commands()<cr>
vnoremap <A-C-F12> :call SetMode("\<A-C-F12\>", "Visual") \| '<,'>:call Commands()<cr>
cnoremap <A-C-F12> :call SetMode("\<A-C-F12\>", "Command") \| :call Commands()<cr>
tnoremap <A-C-F12> <C-\><C-n>:call SetMode("\<A-C-F12\>", "Terminal") \| :call Commands()<cr>
inoremap <A-C-F12> :call SetMode("\<A-C-F12\>", "Insert") \| :call Commands()<cr>
nnoremap <A-C-F12> :call SetMode("\<A-C-F12\>", "Normal") \| :call Commands()<cr>
vnoremap <A-C-F12> :call SetMode("\<A-C-F12\>", "Visual") \| '<,'>:call Commands()<cr>
cnoremap <A-C-F12> :call SetMode("\<A-C-F12\>", "Command") \| :call Commands()<cr>
tnoremap <A-C-F12> <C-\><C-n>:call SetMode("\<A-C-F12\>", "Terminal") \| :call Commands()<cr>
inoremap <A-C-F12> :call SetMode("\<A-C-F12\>", "Insert") \| :call Commands()<cr>
nnoremap <A-S-C-F12> :call SetMode("\<A-S-C-F12\>", "Normal") \| :call Commands()<cr>
vnoremap <A-S-C-F12> :call SetMode("\<A-S-C-F12\>", "Visual") \| '<,'>:call Commands()<cr>
cnoremap <A-S-C-F12> :call SetMode("\<A-S-C-F12\>", "Command") \| :call Commands()<cr>
tnoremap <A-S-C-F12> <C-\><C-n>:call SetMode("\<A-S-C-F12\>", "Terminal") \| :call Commands()<cr>
inoremap <A-S-C-F12> :call SetMode("\<A-S-C-F12\>", "Insert") \| :call Commands()<cr>
nnoremap <A-S-C-F12> :call SetMode("\<A-S-C-F12\>", "Normal") \| :call Commands()<cr>
vnoremap <A-S-C-F12> :call SetMode("\<A-S-C-F12\>", "Visual") \| '<,'>:call Commands()<cr>
cnoremap <A-S-C-F12> :call SetMode("\<A-S-C-F12\>", "Command") \| :call Commands()<cr>
tnoremap <A-S-C-F12> <C-\><C-n>:call SetMode("\<A-S-C-F12\>", "Terminal") \| :call Commands()<cr>
inoremap <A-S-C-F12> :call SetMode("\<A-S-C-F12\>", "Insert") \| :call Commands()<cr>
nnoremap <C-g> :call SetMode("\<C-g\>", "Normal") \| :call AgIn(Folder_Project())<cr>
nnoremap <C-S-g> :call SetMode("\<C-S-g\>", "Normal") \| :call AgIn(Folder_Repo(v:count, 0))<cr>
nnoremap <A-g> :call SetMode("\<A-g\>", "Normal") \| :call AgIn(Folder_Repo(v:count, 0))<cr>
nnoremap <A-S-g> :call SetMode("\<A-S-g\>", "Normal") \| :call AgIn(Folder_Repo(v:count, 1))<cr>
nnoremap <A-C-g> :call SetMode("\<A-C-g\>", "Normal") \| :call AgIn(Folder_Repo(v:count, 1))<cr>
nnoremap <A-S-C-g> :call SetMode("\<A-S-C-g\>", "Normal") \| :call AgIn('/')<cr>
nnoremap <C-m> :call SetMode("\<C-m\>", "Normal") \| :call fzf#vim#gitfiles('', {'dir': Folder_Repo(v:count, 0)})<cr>
nnoremap ,o :call SetMode(",o", "Normal") \| :OpenFileCommandLineSameDir<cr>
nnoremap ,. :call SetMode(",.", "Normal") \| :OpenFileCommandLineCWD<cr>
nnoremap ,,. :call SetMode(",,.", "Normal") \| :OpenFileCommandLineSameDir<cr>
nnoremap ,. :call SetMode(",.", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 0))<cr>
nnoremap ,,. :call SetMode(",,.", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 1))<cr>
nnoremap ,,,. :call SetMode(",,,.", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 2))<cr>
nnoremap ,,,,. :call SetMode(",,,,.", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 3))<cr>
nnoremap ,,,,,. :call SetMode(",,,,,.", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 4))<cr>
cnoremap <C-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <C-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <M-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <M-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <S-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <S-,> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <C-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <C-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <M-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <M-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <S-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <S-BS> <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap <C-,> :call SetMode("\<C-,\>", "Command") \| <Backspace>
cnoremap <C-,> :call SetMode("\<C-,\>", "Command") \| <Backspace>
cnoremap <C-.> :call SetMode("\<C-.\>", "Command") \| <Backspace>
cnoremap <C-.> :call SetMode("\<C-.\>", "Command") \| <Backspace>
nnoremap ,cd :call SetMode(",cd", "Normal") \| :call MakeDirCurrentCWD(bufnr())<cr>
nnoremap <C-Left> :call SetMode("\<C-Left\>", "Normal") \| :call CD(WFilePrev())<cr>
nnoremap <C-Right> :call SetMode("\<C-Right\>", "Normal") \| :call CD(WFileNext())<cr>
nnoremap <C-,> :call SetMode("\<C-,\>", "Normal") \| :call CD(WFilePrev())<cr>
nnoremap <C-.> :call SetMode("\<C-.\>", "Normal") \| :call CD(WFileNext())<cr>
nnoremap ,<Tab> :call SetMode(",\<Tab\>", "Normal") \| :JumpProjectIn<cr>
nnoremap <localleader><Tab> :call SetMode("\<localleader\>\<Tab\>", "Normal") \| :JumpProjectIn<cr>
vnoremap <F14> :call SetMode("\<F14\>", "Visual") \| '<,'>:call VS()<cr>
nnoremap <F13> :call SetMode("\<F13\>", "Normal") \| :call VS()<cr>
inoremap <F13> :call SetMode("\<F13\>", "Insert") \| :call VS()<cr>
cnoremap <F13> :call SetMode("\<F13\>", "Command") \| :call VS('c')<cr>
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
vnoremap p :call SetMode("p", "Visual") \| '<,'>:let vlcb = getpos("'<")[1:2] \| let vlce = getpos("'>")[1:2] \| call ClipboardPaste("v")<cr>p
nnoremap <BS> :call SetMode("\<BS\>", "Normal") \| :call backspaceN()<cr>
cnoremap <A-'> :call SetMode("\<A-'\>", "Command") \| ä
cnoremap <A-'> :call SetMode("\<A-'\>", "Command") \| ä
cnoremap <A-"> :call SetMode("\<A-"\>", "Command") \| Ä
cnoremap <A-"> :call SetMode("\<A-"\>", "Command") \| Ä
cnoremap <A-;> :call SetMode("\<A-;\>", "Command") \| ö
cnoremap <A-;> :call SetMode("\<A-;\>", "Command") \| ö
cnoremap <A-:> :call SetMode("\<A-:\>", "Command") \| Ö
cnoremap <A-:> :call SetMode("\<A-:\>", "Command") \| Ö
cnoremap <A-[> :call SetMode("\<A-[\>", "Command") \| ü
cnoremap <A-[> :call SetMode("\<A-[\>", "Command") \| ü
cnoremap <A-{> :call SetMode("\<A-{\>", "Command") \| Ü
cnoremap <A-{> :call SetMode("\<A-{\>", "Command") \| Ü
cnoremap <A--> :call SetMode("\<A--\>", "Command") \| ß
cnoremap <A--> :call SetMode("\<A--\>", "Command") \| ß
nnoremap ,F :call SetMode(",F", "Normal") \| :echo VS()<cr>
nnoremap ,e :call SetMode(",e", "Normal") \| :call AppendToEndNormal()<cr>
nnoremap ,E :call SetMode(",E", "Normal") \| :AppendAll<cr>
nnoremap YY :call SetMode("YY", "Normal") \| :call AppendToClipboard()<cr>
vnoremap Y :call SetMode("Y", "Visual") \| '<,'>:let @+ = @+ . join(getline("'<", "'>"), "\n") . "\n"<cr>
nnoremap <A-k> :call SetMode("\<A-k\>", "Normal") \| :m-2<cr>
nnoremap <A-j> :call SetMode("\<A-j\>", "Normal") \| :m+1<cr>
vnoremap <A-k> :call SetMode("\<A-k\>", "Visual") \| '<,'>:m '<-2<cr>gv=gv
vnoremap <A-j> :call SetMode("\<A-j\>", "Visual") \| '<,'>:m '>+1<cr>gv=gv
nnoremap < <<
nnoremap > >>
vnoremap < :call SetMode("\<", "Visual") \| '<,'><gv
vnoremap > :call SetMode("\>", "Visual") \| '<,'>>gv
nnoremap ,0 :call SetMode(",0", "Normal") \| :wincmd =<cr>
inoremap <C-Space> :call SetMode("\<C-Space\>", "Insert") \| <C-x><C-f>
inoremap <C-S-v> :call SetMode("\<C-S-v\>", "Insert") \| <c-r>+
nnoremap ,rm :call SetMode(",rm", "Normal") \| :call DeleteFile()<cr>
nnoremap ,N :call SetMode(",N", "Normal") \| :call NewFile()<cr>
nnoremap ,- :call SetMode(",-", "Normal") \| :prev<cr>
vnoremap ,- :call SetMode(",-", "Visual") \| '<,'>:prev<cr>
nnoremap ,= :call SetMode(",=", "Normal") \| :next<cr>
vnoremap ,= :call SetMode(",=", "Visual") \| '<,'>:next<cr>
nnoremap ,< :call SetMode(",\<", "Normal") \| :norm yy<cr>:norm dd<cr>:wincmd l<cr>:norm gp<cr>:wincmd h<cr>
vnoremap ,< :call SetMode(",\<", "Visual") \| '<,'>:norm gvy<cr>:norm gvd<cr>:wincmd l<cr>:norm gp<cr>:wincmd h<cr>
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
nnoremap ,<C-s> :call SetMode(",\<C-s\>", "Normal") \| :call ExecFunction()<cr>
nnoremap ,s :call SetMode(",s", "Normal") \| :call ExecVS()<cr>
vnoremap ,s :call SetMode(",s", "Visual") \| '<,'>:call ExecVS()<cr>
nnoremap ,S :call SetMode(",S", "Normal") \| :Re \| :%source \| :ReEnd<cr>
nnoremap ,rd :call SetMode(",rd", "Normal") \| :call RedoLeaderS()<cr>
nnoremap <C-7> :call SetMode("\<C-7\>", "Normal") \| :call ToggleComment()<cr>
nnoremap ,cf :call SetMode(",cf", "Normal") \| :CF 
vnoremap <F1> :call SetMode("\<F1\>", "Visual") \| '<,'>J
nnoremap <F2> :call SetMode("\<F2\>", "Normal") \| :call GetKeys()<cr>
nnoremap <F3> :call SetMode("\<F3\>", "Normal") \| :call FindKeyPerform()<cr>
nnoremap <F4> :call SetMode("\<F4\>", "Normal") \| :echo AllKeys()<cr>
tnoremap <C-v> <C-\><C-n>:call SetMode("\<C-v\>", "Terminal") \| :call SendCommandToThisTerm([getreg('"')])<cr>i
vnoremap ,,s :call SetMode(",,s", "Visual") \| '<,'>:silent redir=>output \| silent '<,'>source \| redir END \| put=output<cr>
nnoremap ,aa :call SetMode(",aa", "Normal") \| :RECP --reg *<cr>
nnoremap ,an :call SetMode(",an", "Normal") \| :RECP --reg "<cr>
nnoremap ,ab :call SetMode(",ab", "Normal") \| :RECP<cr>
nnoremap <S-Up> :call SetMode("\<S-Up\>", "Normal") \| :call VimGrep(v:count)<cr>
nnoremap <M-a> :call SetMode("\<M-a\>", "Normal") \| :Lines<cr>
nnoremap <S-Down> :call SetMode("\<S-Down\>", "Normal") \| :call VimGrep(v:count)<cr>
nnoremap <C-S-Up> :call SetMode("\<C-S-Up\>", "Normal") \| :vimgrep "todo" $folderrepo/**/*<cr>
nnoremap <Left> :call SetMode("\<Left\>", "Normal") \| :cclose<cr>
nnoremap <Right> :call SetMode("\<Right\>", "Normal") \| :call COpen()<cr>
nnoremap <Up> :call SetMode("\<Up\>", "Normal") \| :cprev<cr>
nnoremap <Down> :call SetMode("\<Down\>", "Normal") \| :cnext<cr>
nnoremap <F9> :call SetMode("\<F9\>", "Normal") \| :Pull<cr>
nnoremap <C-F9> :call SetMode("\<C-F9\>", "Normal") \| :GitFetch<cr>
nnoremap <F10> :call SetMode("\<F10\>", "Normal") \| :Status<cr>
nnoremap <C-F10> :call SetMode("\<C-F10\>", "Normal") \| :Diff --all<cr>
nnoremap <C-S-F10> :call SetMode("\<C-S-F10\>", "Normal") \| :Diff --all --cached<cr>
nnoremap <S-F10> :call SetMode("\<S-F10\>", "Normal") \| :Log<cr>
nnoremap <C-F11> :call SetMode("\<C-F11\>", "Normal") \| :GitAdd<cr>
nnoremap <C-S-F11> :call SetMode("\<C-S-F11\>", "Normal") \| :GitAddCWD<cr>
nnoremap <F12> :call SetMode("\<F12\>", "Normal") \| :PushCWD 
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
nnoremap <S-F4> :call SetMode("\<S-F4\>", "Normal") \| :call GitStashPush()<cr>
nnoremap <C-F4> :call SetMode("\<C-F4\>", "Normal") \| :call GitStashPop()<cr>
tnoremap <C-v> <C-\><C-n>
vnoremap i :call SetMode("i", "Visual") \| '<,'><C-c>i
vnoremap <C-c> :call SetMode("\<C-c\>", "Visual") \| '<,'>:call CommandInfo()<cr>
nnoremap ,dt :call SetMode(",dt", "Normal") \| :diffthis<cr>
nnoremap ,do :call SetMode(",do", "Normal") \| :diffoff<cr>
nnoremap <F3> :call SetMode("\<F3\>", "Normal") \| :diffthis<cr>
vnoremap <F3> :call SetMode("\<F3\>", "Visual") \| '<,'>:diffthis<cr>
nnoremap <S-F3> :call SetMode("\<S-F3\>", "Normal") \| :diffoff<cr>
vnoremap <S-F3> :call SetMode("\<S-F3\>", "Visual") \| '<,'>:diffoff<cr>
nnoremap <S-F3> :call SetMode("\<S-F3\>", "Normal") \| :call WinSwap_Prep() \| :windo diffthis \| :call WinSwap_Back()<cr>
vnoremap <S-F3> :call SetMode("\<S-F3\>", "Visual") \| '<,'>:call WinSwap_Prep() \| :windo diffthis \| :call WinSwap_Back()<cr>
nnoremap <C-F3> :call SetMode("\<C-F3\>", "Normal") \| :call WinSwap_Prep() \| :windo diffoff \| :call WinSwap_Back()<cr>
vnoremap <C-F3> :call SetMode("\<C-F3\>", "Visual") \| '<,'>:call WinSwap_Prep() \| :windo diffoff \| :call WinSwap_Back()<cr>
nnoremap <C-S-F3> :call SetMode("\<C-S-F3\>", "Normal") \| :call BufPrep() \| :call DiffOff() \| :call BufBack()<cr>
vnoremap <C-S-F3> :call SetMode("\<C-S-F3\>", "Visual") \| '<,'>:call BufPrep() \| :call DiffOff() \| :call BufBack()<cr>
nnoremap <C-S-.> :call SetMode("\<C-S-.\>", "Normal") \| :@:<cr>
vnoremap <C-S-.> :call SetMode("\<C-S-.\>", "Visual") \| '<,'>:@:<cr>
nnoremap <F4> :call SetMode("\<F4\>", "Normal") \| :call ToggleBCommand()<cr>
nnoremap <F2> :call SetMode("\<F2\>", "Normal") \| :F 
vnoremap <F2> :call SetMode("\<F2\>", "Visual") \| '<,'>:F<cr>
nnoremap <C-F2> :call SetMode("\<C-F2\>", "Normal") \| :IF 
vnoremap <C-F2> :call SetMode("\<C-F2\>", "Visual") \| '<,'>:IF<cr>
nnoremap <C-S-F2> :call SetMode("\<C-S-F2\>", "Normal") \| :CDo<cr>
vnoremap <C-S-F2> :call SetMode("\<C-S-F2\>", "Visual") \| '<,'>:CDo<cr>
nnoremap <C-S-M-F2> :call SetMode("\<C-S-M-F2\>", "Normal") \| :CFDo<cr>
vnoremap <C-S-M-F2> :call SetMode("\<C-S-M-F2\>", "Visual") \| '<,'>:CFDo<cr>
nnoremap <C-]> :call SetMode("\<C-]\>", "Normal") \| :OR 1<CR>
vnoremap <C-]> :call SetMode("\<C-]\>", "Visual") \| '<,'>:OR 1<CR>
nnoremap <C-\> :call SetMode("\<C-\\>", "Normal") \| :OR -1<CR>
vnoremap <C-\> :call SetMode("\<C-\\>", "Visual") \| '<,'>:OR -1<CR>