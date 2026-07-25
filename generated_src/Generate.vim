nnoremap 0 :call SetMode("0", "Normal") \| :call JumpToNextFile(-1)<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call JumpToNextFile(1)<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :suspend<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :suspend<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :if winnr('$')<=1 \| suspend \| else \| hide \| endif<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :if winnr('$')<=1 \| suspend \| else \| hide \| endif<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :e .<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :e .<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SetUnset("projectPocket", w:cwd)<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call FavoritesPopup()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SetUnset("favorites", expand('%:p')) \| :call Refresh('favorites_folders', 'GetFavoritesFolders()')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call OpenUnreleased("favorites")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :so %<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :Tidy<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :q<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| <c-\><c-n>:q<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Command()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,0 :call SetMode(",0", "Normal") \| :call Command()<cr>
vnoremap ,0 :call SetMode(",0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,0 :call SetMode(",0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,0 :call SetMode(",,0", "Normal") \| :call Command()<cr>
vnoremap ,,0 :call SetMode(",,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,0 :call SetMode(",,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,0 :call SetMode(",,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,0 :call SetMode(",,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,0 :call SetMode(",,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,0 :call SetMode(",,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,0 :call SetMode(",,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,0 :call SetMode(",,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
nnoremap ,,,,,0 :call SetMode(",,,,,0", "Normal") \| :call Command()<cr>
vnoremap ,,,,,0 :call SetMode(",,,,,0", "Visual") \| '<,'>:call Command()<cr>
cnoremap ,,,,,0 :call SetMode(",,,,,0", "Command") \| :call Command()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:<Up><cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("h", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("h", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("h", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("j", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("j", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("j", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("k", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("k", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("k", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("l", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("l", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("l", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("H", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("H", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("H", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("J", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("J", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("J", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("K", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("K", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("K", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("L", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("L", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("L", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("h", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("h", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("h", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("j", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("j", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("j", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("k", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("k", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("k", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("l", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("l", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("l", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("H", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("H", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("H", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("J", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("J", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("J", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("K", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("K", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("K", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("L", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("L", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("L", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("H", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("H", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("H", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("J", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("J", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("J", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("K", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("K", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("K", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("L", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("L", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("L", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("h", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("h", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("h", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("j", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("j", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("j", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("k", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("k", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("k", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("l", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("l", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("l", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("H", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("H", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("H", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("J", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("J", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("J", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("K", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("K", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("K", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("L", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("L", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("L", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("h", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("h", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("h", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("j", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("j", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("j", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("k", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("k", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("k", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("l", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("l", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("l", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("H", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("H", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("H", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("J", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("J", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("J", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("K", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("K", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("K", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("L", "terminal", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("L", "terminal", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("L", "terminal", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("h", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("h", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("h", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("j", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("j", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("j", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("k", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("k", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("k", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("l", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("l", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("l", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("H", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("H", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("H", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("J", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("J", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("J", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("K", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("K", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("K", "buffer", "new")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Open("L", "buffer", "new")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Open("L", "buffer", "new")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Open("L", "buffer", "new")<cr>
nnoremap <silent> 0 :call SetMode("0", "Normal") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
vnoremap <silent> 0 :call SetMode("0", "Visual") \| '<,'>:if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
tnoremap <silent> 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :qa!<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:qa!<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :qa!<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabClose()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call TabClose()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabClose()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| ,,r :redraw!<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| call CountRegex()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>call CountRegex()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| call CountRegex()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call IncRange()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call DecRange()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Vaf()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call IncRange()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call DecRange()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :TIN tail -f $receiver<cr>
nnoremap 0 :call SetMode("0", "Normal") \| <C-w>+
nnoremap 0 :call SetMode("0", "Normal") \| <C-w>-
nnoremap 0 :call SetMode("0", "Normal") \| <C-w><
nnoremap 0 :call SetMode("0", "Normal") \| <C-w>>
nnoremap 0 :call SetMode("0", "Normal") \| 12<C-w>+
nnoremap 0 :call SetMode("0", "Normal") \| 12<C-w>-
nnoremap 0 :call SetMode("0", "Normal") \| 12<C-w><
nnoremap 0 :call SetMode("0", "Normal") \| 12<C-w>>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabHToggle()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabHToggle()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabHToggle()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabHToggle()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabHToggle()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabHToggle()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabLToggle()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabLToggle()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabLToggle()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabLToggle()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabLToggle()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabLToggle()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabHCreateNew()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabHCreateNew()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabHCreateNew()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabHCreateNew()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabHCreateNew()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabHCreateNew()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabLCreateNew()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabLCreateNew()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabLCreateNew()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabLCreateNew()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabLCreateNew()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabLCreateNew()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabHMove()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabHMove()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabHMove()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabHMove()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabHMove()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabHMove()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabLMove()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabLMove()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabLMove()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabLMove()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabLMove()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabLMove()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabH()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabH()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabH()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabH()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabH()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabH()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabL()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabL()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabL()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call TabL()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call TabL()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call TabL()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :wincmd H<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :wincmd J<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :wincmd K<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :wincmd L<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SwapWin("h")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SwapWin("j")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SwapWin("k")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SwapWin("l")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| <c-\><c-n>:call SwapWin("h")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| <c-\><c-n>:call SwapWin("j")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| <c-\><c-n>:call SwapWin("k")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| <c-\><c-n>:call SwapWin("l")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :LayoutBash<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :LayoutVim<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call ToggleOverviewRight()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :redraw \\| let c=input("Test: ")<cr>!source ".$workdir."/.bashrc; git_selector "TEST"
nnoremap 0 :call SetMode("0", "Normal") \| :call PreviewBuffer()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call ToggleWrap()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call ToggleWrap()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Intend()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :IntelligentSelecting<cr>
nnoremap 0 :call SetMode("0", "Normal") \| @q
nnoremap 0 :call SetMode("0", "Normal") \| :call SmartWincmd('h')<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call SmartWincmd('h')<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call SmartWincmd('h')<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call SmartWincmd('h')<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call SmartWincmd('h')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SmartWincmd('h')<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call SmartWincmd('h')<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call SmartWincmd('h')<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call SmartWincmd('h')<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call SmartWincmd('h')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SmartWincmd('j')<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call SmartWincmd('j')<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call SmartWincmd('j')<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call SmartWincmd('j')<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call SmartWincmd('j')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SmartWincmd('j')<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call SmartWincmd('j')<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call SmartWincmd('j')<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call SmartWincmd('j')<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call SmartWincmd('j')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SmartWincmd('k')<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call SmartWincmd('k')<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call SmartWincmd('k')<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call SmartWincmd('k')<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call SmartWincmd('k')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SmartWincmd('k')<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call SmartWincmd('k')<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call SmartWincmd('k')<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call SmartWincmd('k')<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call SmartWincmd('k')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SmartWincmd('l')<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call SmartWincmd('l')<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call SmartWincmd('l')<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call SmartWincmd('l')<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call SmartWincmd('l')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SmartWincmd('l')<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call SmartWincmd('l')<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call SmartWincmd('l')<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call SmartWincmd('l')<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call SmartWincmd('l')<cr>
tnoremap 0 l
tnoremap 0 h
tnoremap 0 k
tnoremap 0 j
inoremap 0 :call SetMode("0", "Insert") \| <C-w>li
inoremap 0 :call SetMode("0", "Insert") \| <C-w>hi
inoremap 0 :call SetMode("0", "Insert") \| <c-w><c-w>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call ExitTerminal()<cr>
inoremap 0 :call SetMode("0", "Insert") \| ä
inoremap 0 :call SetMode("0", "Insert") \| Ä
inoremap 0 :call SetMode("0", "Insert") \| ö
inoremap 0 :call SetMode("0", "Insert") \| Ö
inoremap 0 :call SetMode("0", "Insert") \| ü
inoremap 0 :call SetMode("0", "Insert") \| Ü
inoremap 0 :call SetMode("0", "Insert") \| ß
tnoremap 0 <C-\><C-n>
tnoremap 0 <C-\><C-n>
tnoremap 0 <C-\><C-n>
tnoremap 0 <C-\><C-n>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| i
tnoremap 0 <C-\><C-n>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call backspace()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:&<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:echo VS()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call AppendToEndRange()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:AppendAll<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:!uniq<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call VPaste("Visual")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call VCopy("Visual")<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call VCut("Visual")<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| <c-\><c-n><c-o>
nnoremap 0 :call SetMode("0", "Normal") \| :call Toggle_Set_Last_Git_Message()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call ToggleLineState()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call ToggleLineStateGlobal()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Statusline_TogglePath()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :echo g:debug_layout<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Boilerplate_Test()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GetCCWD()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SaveFile()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call SaveFile()<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call SaveFile()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :InsertFunction<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :InsertFilename<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call ToggleZoom()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :SearchCword<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call BASH(VS())<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Bash(VS())<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :Buffers<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :Buffers<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call VIM(input("vimscript: "), 'exec_input_vs')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call BASH(input("bash: "), 'exec_input_vs')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call PYTHON(input("python: "), 'exec_input_vs')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call RUST(input("rust: "), 'exec_input_vs')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call VIM('', 'exec_input_vs')<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call VIM('', 'exec_input_vs')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call BASH('', 'exec_input_vs')<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call BASH('', 'exec_input_vs')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call PYTHON('', 'exec_input_vs')<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call PYTHON('', 'exec_input_vs')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call RUST('', 'exec_input_vs')<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call RUST('', 'exec_input_vs')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :CopyFileNameToClipboard<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :CopyWholePathToClipboard<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :InsertReceiver<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Rewindworkdir()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Up(v:count, 0))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Up(v:count, 1))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Up(v:count, 2))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Up(v:count, 3))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Up(v:count, 4))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Up(v:count, 5))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 0))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 1))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 2))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 3))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 4))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 5))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 0))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 1))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 2))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 3))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 4))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 5))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 0))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 1))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 2))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 3))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 4))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 5))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call CD(VimConfiguration())<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 0))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 1))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 2))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 3))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 4))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 5))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Projects()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call FilesInProjects()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Projects()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call ToggleTroughOpenedProjects()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call ToggleTroughOpenedProjects(-1)<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Projects()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Projects()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SearchGitProjects()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SearchGitProjects()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :Generate<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Commands()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Commands()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Commands()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Commands()<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call Commands()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Commands()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Commands()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Commands()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Commands()<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call Commands()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Commands()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Commands()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Commands()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Commands()<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call Commands()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Commands()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Commands()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Commands()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Commands()<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call Commands()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Commands()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Commands()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Commands()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Commands()<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call Commands()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Commands()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Commands()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Commands()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Commands()<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call Commands()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Commands()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Commands()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Commands()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Commands()<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call Commands()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Commands()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Commands()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Commands()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Commands()<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call Commands()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Commands()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Commands()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Commands()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Commands()<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call Commands()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Commands()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Commands()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Commands()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Commands()<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call Commands()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Commands()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Commands()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Commands()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Commands()<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call Commands()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call Commands()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call Commands()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call Commands()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call Commands()<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call Commands()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Project())<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 0))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 0))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 1))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn(Folder_Repo(v:count, 1))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AgIn('/')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call fzf#vim#gitfiles('', {'dir': Folder_Repo(v:count, 0)})<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :OpenFileCommandLineSameDir<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :OpenFileCommandLineCWD<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :OpenFileCommandLineSameDir<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 0))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 1))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 2))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 3))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 4))<cr>
cnoremap 0 <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap 0 <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap 0 <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap 0 <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap 0 <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap 0 <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap 0 <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap 0 <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap 0 <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap 0 <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap 0 <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap 0 <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap 0 :call SetMode("0", "Command") \| <Backspace>
cnoremap 0 :call SetMode("0", "Command") \| <Backspace>
cnoremap 0 :call SetMode("0", "Command") \| <Backspace>
cnoremap 0 :call SetMode("0", "Command") \| <Backspace>
nnoremap 0 :call SetMode("0", "Normal") \| :call MakeDirCurrentCWD(bufnr())<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call CD(WFilePrev())<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call CD(WFileNext())<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call CD(WFilePrev())<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call CD(WFileNext())<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :JumpProjectIn<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :JumpProjectIn<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call VS()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call VS()<cr>
inoremap 0 :call SetMode("0", "Insert") \| :call VS()<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call VS('c')<cr>
cnoremap 0 :call SetMode("0", "Command") \| :call VS('c')<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call VS('t')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call FuncPaste("Normal")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call FuncCopy("Normal")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call FuncCut("Normal")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :IntelligentJumping<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :wincmd h<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :wincmd j<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :wincmd k<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :wincmd l<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:let vlcb = getpos("'<")[1:2] \| let vlce = getpos("'>")[1:2] \| call ClipboardPaste("v")<cr>p
nnoremap 0 :call SetMode("0", "Normal") \| :call backspaceN()<cr>
cnoremap 0 :call SetMode("0", "Command") \| ä
cnoremap 0 :call SetMode("0", "Command") \| ä
cnoremap 0 :call SetMode("0", "Command") \| Ä
cnoremap 0 :call SetMode("0", "Command") \| Ä
cnoremap 0 :call SetMode("0", "Command") \| ö
cnoremap 0 :call SetMode("0", "Command") \| ö
cnoremap 0 :call SetMode("0", "Command") \| Ö
cnoremap 0 :call SetMode("0", "Command") \| Ö
cnoremap 0 :call SetMode("0", "Command") \| ü
cnoremap 0 :call SetMode("0", "Command") \| ü
cnoremap 0 :call SetMode("0", "Command") \| Ü
cnoremap 0 :call SetMode("0", "Command") \| Ü
cnoremap 0 :call SetMode("0", "Command") \| ß
cnoremap 0 :call SetMode("0", "Command") \| ß
nnoremap 0 :call SetMode("0", "Normal") \| :echo VS()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AppendToEndNormal()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :AppendAll<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call AppendToClipboard()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:let @+ = @+ . join(getline("'<", "'>"), "\n") . "\n"<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :m-2<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :m+1<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:m '<-2<cr>gv=gv
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:m '>+1<cr>gv=gv
nnoremap 0 <<
nnoremap 0 >>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'><gv
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>>gv
nnoremap 0 :call SetMode("0", "Normal") \| :wincmd =<cr>
inoremap 0 :call SetMode("0", "Insert") \| <C-x><C-f>
inoremap 0 :call SetMode("0", "Insert") \| <c-r>+
nnoremap 0 :call SetMode("0", "Normal") \| :call DeleteFile()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call NewFile()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :prev<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:prev<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :next<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:next<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :norm yy<cr>:norm dd<cr>:wincmd l<cr>:norm gp<cr>:wincmd h<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:norm gvy<cr>:norm gvd<cr>:wincmd l<cr>:norm gp<cr>:wincmd h<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :echo JoinSplits("h")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :echo JoinSplits("j")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :echo JoinSplits("k")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :echo JoinSplits("l")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :echo MoveOutOfSplit("h")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :echo MoveOutOfSplit("j")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :echo MoveOutOfSplit("k")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :echo MoveOutOfSplit("l")<cr>
nnoremap 0 :call SetMode("0", "Normal") \| zh
nnoremap 0 :call SetMode("0", "Normal") \| zl
nnoremap 0 :call SetMode("0", "Normal") \| 20zh
nnoremap 0 :call SetMode("0", "Normal") \| 20zl
nnoremap 0 :call SetMode("0", "Normal") \| :call ExecFunction()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call ExecVS()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call ExecVS()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :Re \| :%source \| :ReEnd<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call RedoLeaderS()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call ToggleComment()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :CF 
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>J
nnoremap 0 :call SetMode("0", "Normal") \| :call GetKeys()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call FindKeyPerform()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :echo AllKeys()<cr>
tnoremap 0 <C-\><C-n>:call SetMode("0", "Terminal") \| :call SendCommandToThisTerm([getreg('"')])<cr>i
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:silent redir=>output \| silent '<,'>source \| redir END \| put=output<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :RECP --reg *<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :RECP --reg "<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :RECP<cr>
nnoremap 1 :call SetMode("1", "Normal") \| :call VimGrep(v:count)<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :Lines<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call VimGrep(v:count)<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :vimgrep "todo" $folderrepo/**/*<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :cclose<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call COpen()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :cprev<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :cnext<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :Pull<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :GitFetch<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :Status<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :Diff --all<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :Diff --all --cached<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :Log<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :GitAdd<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :GitAddCWD<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :PushCWD 
nnoremap 0 :call SetMode("0", "Normal") \| :!git rebase --continue<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :!git rebase --skip<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :!git rebase --abort<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :StashPush<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :StashPop<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SelectFunctionBlock()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitInfo()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitInfo('--stash')<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitStashDrop()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitDeleteLastUnpushedCommit()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitCommitRepo()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitCommitRepo(input("Commit Message: "))<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitAddRepo()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitInitRepository()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitInitRepositoryBare()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SelectRemote(1)<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SelectRemote(-1)<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitRenameRemote()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitRemoteAdd()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitSetRemote()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SelectBranch(1)<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call SelectBranch(-1)<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitRenameBranch()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitNewBranch()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitStashPush()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call GitStashPop()<cr>
tnoremap 0 <C-\><C-n>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'><C-c>i
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call CommandInfo()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :diffthis<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :diffoff<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :diffthis<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:diffthis<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :diffoff<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:diffoff<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call WinSwap_Prep() \| :windo diffthis \| :call WinSwap_Back()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call WinSwap_Prep() \| :windo diffthis \| :call WinSwap_Back()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call WinSwap_Prep() \| :windo diffoff \| :call WinSwap_Back()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call WinSwap_Prep() \| :windo diffoff \| :call WinSwap_Back()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call BufPrep() \| :call DiffOff() \| :call BufBack()<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:call BufPrep() \| :call DiffOff() \| :call BufBack()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :@:<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:@:<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :call ToggleBCommand()<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :F 
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:F<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :IF 
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:IF<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :CDo<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:CDo<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :CFDo<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:CFDo<cr>
nnoremap 0 :call SetMode("0", "Normal") \| :OR 1<CR>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:OR 1<CR>
nnoremap 0 :call SetMode("0", "Normal") \| :OR -1<CR>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:OR -1<CR>
nnoremap 0 :call SetMode("0", "Normal") \| :Rel<cr>
vnoremap 0 :call SetMode("0", "Visual") \| '<,'>:Rel<cr>