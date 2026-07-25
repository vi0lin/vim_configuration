nnoremap < :call SetMode("\<", "Normal") \| :call JumpToNextFile(-1)<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call JumpToNextFile(1)<cr>
nnoremap < :call SetMode("\<", "Normal") \| :suspend<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :suspend<cr>
nnoremap < :call SetMode("\<", "Normal") \| :if winnr('$')<=1 \| suspend \| else \| hide \| endif<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :if winnr('$')<=1 \| suspend \| else \| hide \| endif<cr>
nnoremap < :call SetMode("\<", "Normal") \| :e .<cr>
nnoremap , :call SetMode(",", "Normal") \| :e .<cr>
nnoremap , :call SetMode(",", "Normal") \| :call SetUnset("projectPocket", w:cwd)<cr>
nnoremap , :call SetMode(",", "Normal") \| :call FavoritesPopup()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call SetUnset("favorites", expand('%:p')) \| :call Refresh('favorites_folders', 'GetFavoritesFolders()')<cr>
nnoremap , :call SetMode(",", "Normal") \| :call OpenUnreleased("favorites")<cr>
nnoremap , :call SetMode(",", "Normal") \| :so %<cr>
nnoremap , :call SetMode(",", "Normal") \| :Tidy<cr>
nnoremap < :call SetMode("\<", "Normal") \| :q<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| <c-\><c-n>:q<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Command()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Command()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Command()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Command()<cr>
cnoremap , :call SetMode(",", "Command") \| :call Command()<cr>
vnoremap . :call SetMode(".", "Visual") \| '<,'>:<Up><cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("h", "buffer", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("h", "buffer", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("h", "buffer", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("j", "buffer", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("j", "buffer", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("j", "buffer", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("k", "buffer", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("k", "buffer", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("k", "buffer", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("l", "buffer", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("l", "buffer", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("l", "buffer", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("H", "buffer", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("H", "buffer", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("H", "buffer", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("J", "buffer", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("J", "buffer", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("J", "buffer", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("K", "buffer", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("K", "buffer", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("K", "buffer", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("L", "buffer", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("L", "buffer", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("L", "buffer", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("h", "terminal", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("h", "terminal", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("h", "terminal", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("j", "terminal", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("j", "terminal", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("j", "terminal", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("k", "terminal", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("k", "terminal", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("k", "terminal", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("l", "terminal", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("l", "terminal", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("l", "terminal", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("H", "terminal", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("H", "terminal", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("H", "terminal", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("J", "terminal", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("J", "terminal", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("J", "terminal", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("K", "terminal", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("K", "terminal", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("K", "terminal", "new")<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Open("L", "terminal", "new")<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call Open("L", "terminal", "new")<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :call Open("L", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("H", "buffer", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("H", "buffer", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("H", "buffer", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("J", "buffer", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("J", "buffer", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("J", "buffer", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("K", "buffer", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("K", "buffer", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("K", "buffer", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("L", "buffer", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("L", "buffer", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("L", "buffer", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("h", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("h", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("h", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("j", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("j", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("j", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("k", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("k", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("k", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("l", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("l", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("l", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("H", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("H", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("H", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("J", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("J", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("J", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("K", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("K", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("K", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("L", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("L", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("L", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("h", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("h", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("h", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("j", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("j", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("j", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("k", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("k", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("k", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("l", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("l", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("l", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("H", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("H", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("H", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("J", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("J", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("J", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("K", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("K", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("K", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("L", "terminal", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("L", "terminal", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("L", "terminal", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("h", "buffer", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("h", "buffer", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("h", "buffer", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("j", "buffer", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("j", "buffer", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("j", "buffer", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("k", "buffer", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("k", "buffer", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("k", "buffer", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("l", "buffer", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("l", "buffer", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("l", "buffer", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("H", "buffer", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("H", "buffer", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("H", "buffer", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("J", "buffer", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("J", "buffer", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("J", "buffer", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("K", "buffer", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("K", "buffer", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("K", "buffer", "new")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Open("L", "buffer", "new")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Open("L", "buffer", "new")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Open("L", "buffer", "new")<cr>
nnoremap <silent> < :call SetMode("\<", "Normal") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
vnoremap <silent> < :call SetMode("\<", "Visual") \| '<,'>:if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
tnoremap <silent> < <C-\><C-n>:call SetMode("\<", "Terminal") \| :if BufLength()>1 \| :bd! \| else \| :q! \| endif<cr>
nnoremap < :call SetMode("\<", "Normal") \| :qa!<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:qa!<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :qa!<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabClose()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call TabClose()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabClose()<cr>
nnoremap - :call SetMode("-", "Normal") \| ,,r :redraw!<cr>
nnoremap < :call SetMode("\<", "Normal") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
nnoremap , :call SetMode(",", "Normal") \| call CountRegex()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>call CountRegex()<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| call CountRegex()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call IncRange()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call DecRange()<cr>
vnoremap a :call SetMode("a", "Visual") \| '<,'>:call Vaf()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call IncRange()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call DecRange()<cr>
tnoremap , <C-\><C-n>:call SetMode(",", "Terminal") \| :TIN tail -f $receiver<cr>
nnoremap < :call SetMode("\<", "Normal") \| <C-w>+
nnoremap < :call SetMode("\<", "Normal") \| <C-w>-
nnoremap < :call SetMode("\<", "Normal") \| <C-w><
nnoremap < :call SetMode("\<", "Normal") \| <C-w>>
nnoremap < :call SetMode("\<", "Normal") \| 12<C-w>+
nnoremap < :call SetMode("\<", "Normal") \| 12<C-w>-
nnoremap < :call SetMode("\<", "Normal") \| 12<C-w><
nnoremap < :call SetMode("\<", "Normal") \| 12<C-w>>
nnoremap < :call SetMode("\<", "Normal") \| :call TabHToggle()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabHToggle()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabHToggle()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabHToggle()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabHToggle()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabHToggle()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabLToggle()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabLToggle()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabLToggle()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabLToggle()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabLToggle()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabLToggle()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabHCreateNew()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabHCreateNew()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabHCreateNew()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabHCreateNew()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabHCreateNew()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabHCreateNew()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabLCreateNew()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabLCreateNew()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabLCreateNew()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabLCreateNew()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabLCreateNew()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabLCreateNew()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabHMove()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabHMove()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabHMove()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabHMove()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabHMove()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabHMove()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabLMove()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabLMove()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabLMove()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabLMove()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabLMove()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabLMove()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabH()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabH()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabH()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabH()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabH()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabH()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabL()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabL()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabL()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call TabL()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call TabL()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call TabL()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :wincmd H<cr>
nnoremap < :call SetMode("\<", "Normal") \| :wincmd J<cr>
nnoremap < :call SetMode("\<", "Normal") \| :wincmd K<cr>
nnoremap < :call SetMode("\<", "Normal") \| :wincmd L<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SwapWin("h")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SwapWin("j")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SwapWin("k")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SwapWin("l")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| <c-\><c-n>:call SwapWin("h")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| <c-\><c-n>:call SwapWin("j")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| <c-\><c-n>:call SwapWin("k")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| <c-\><c-n>:call SwapWin("l")<cr>
nnoremap , :call SetMode(",", "Normal") \| :LayoutBash<cr>
nnoremap , :call SetMode(",", "Normal") \| :LayoutVim<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call ToggleOverviewRight()<cr>
nnoremap , :call SetMode(",", "Normal") \| :redraw \\| let c=input("Test: ")<cr>!source ".$workdir."/.bashrc; git_selector "TEST"
nnoremap < :call SetMode("\<", "Normal") \| :call PreviewBuffer()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call ToggleWrap()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call ToggleWrap()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Intend()<cr>
nnoremap , :call SetMode(",", "Normal") \| :IntelligentSelecting<cr>
nnoremap , :call SetMode(",", "Normal") \| @q
nnoremap < :call SetMode("\<", "Normal") \| :call SmartWincmd('h')<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call SmartWincmd('h')<cr>
cnoremap < :call SetMode("\<", "Command") \| :call SmartWincmd('h')<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call SmartWincmd('h')<cr>
inoremap < :call SetMode("\<", "Insert") \| :call SmartWincmd('h')<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SmartWincmd('h')<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call SmartWincmd('h')<cr>
cnoremap < :call SetMode("\<", "Command") \| :call SmartWincmd('h')<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call SmartWincmd('h')<cr>
inoremap < :call SetMode("\<", "Insert") \| :call SmartWincmd('h')<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SmartWincmd('j')<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call SmartWincmd('j')<cr>
cnoremap < :call SetMode("\<", "Command") \| :call SmartWincmd('j')<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call SmartWincmd('j')<cr>
inoremap < :call SetMode("\<", "Insert") \| :call SmartWincmd('j')<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SmartWincmd('j')<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call SmartWincmd('j')<cr>
cnoremap < :call SetMode("\<", "Command") \| :call SmartWincmd('j')<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call SmartWincmd('j')<cr>
inoremap < :call SetMode("\<", "Insert") \| :call SmartWincmd('j')<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SmartWincmd('k')<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call SmartWincmd('k')<cr>
cnoremap < :call SetMode("\<", "Command") \| :call SmartWincmd('k')<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call SmartWincmd('k')<cr>
inoremap < :call SetMode("\<", "Insert") \| :call SmartWincmd('k')<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SmartWincmd('k')<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call SmartWincmd('k')<cr>
cnoremap < :call SetMode("\<", "Command") \| :call SmartWincmd('k')<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call SmartWincmd('k')<cr>
inoremap < :call SetMode("\<", "Insert") \| :call SmartWincmd('k')<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SmartWincmd('l')<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call SmartWincmd('l')<cr>
cnoremap < :call SetMode("\<", "Command") \| :call SmartWincmd('l')<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call SmartWincmd('l')<cr>
inoremap < :call SetMode("\<", "Insert") \| :call SmartWincmd('l')<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SmartWincmd('l')<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call SmartWincmd('l')<cr>
cnoremap < :call SetMode("\<", "Command") \| :call SmartWincmd('l')<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call SmartWincmd('l')<cr>
inoremap < :call SetMode("\<", "Insert") \| :call SmartWincmd('l')<cr>
tnoremap < l
tnoremap < h
tnoremap < k
tnoremap < j
inoremap < :call SetMode("\<", "Insert") \| <C-w>li
inoremap < :call SetMode("\<", "Insert") \| <C-w>hi
inoremap < :call SetMode("\<", "Insert") \| <c-w><c-w>
tnoremap  <C-\><C-n>:call SetMode("", "Terminal") \| :call ExitTerminal()<cr>
inoremap < :call SetMode("\<", "Insert") \| ä
inoremap < :call SetMode("\<", "Insert") \| Ä
inoremap < :call SetMode("\<", "Insert") \| ö
inoremap < :call SetMode("\<", "Insert") \| Ö
inoremap < :call SetMode("\<", "Insert") \| ü
inoremap < :call SetMode("\<", "Insert") \| Ü
inoremap < :call SetMode("\<", "Insert") \| ß
tnoremap < <C-\><C-n>
tnoremap < <C-\><C-n>
tnoremap < <C-\><C-n>
tnoremap < <C-\><C-n>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| i
tnoremap < <C-\><C-n>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call backspace()<cr>
vnoremap & :call SetMode("&", "Visual") \| '<,'>:&<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:echo VS()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call AppendToEndRange()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:AppendAll<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:!uniq<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call VPaste("Visual")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call VCopy("Visual")<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call VCut("Visual")<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| <c-\><c-n><c-o>
nnoremap , :call SetMode(",", "Normal") \| :call Toggle_Set_Last_Git_Message()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call ToggleLineState()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call ToggleLineStateGlobal()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Statusline_TogglePath()<cr>
nnoremap , :call SetMode(",", "Normal") \| :echo g:debug_layout<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Boilerplate_Test()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call GetCCWD()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SaveFile()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call SaveFile()<cr>
inoremap < :call SetMode("\<", "Insert") \| :call SaveFile()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :InsertFunction<cr>
nnoremap < :call SetMode("\<", "Normal") \| :InsertFilename<cr>
nnoremap , :call SetMode(",", "Normal") \| :call ToggleZoom()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :SearchCword<cr>
nnoremap , :call SetMode(",", "Normal") \| :call BASH(VS())<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Bash(VS())<cr>
nnoremap , :call SetMode(",", "Normal") \| :Buffers<cr>
nnoremap , :call SetMode(",", "Normal") \| :Buffers<cr>
nnoremap , :call SetMode(",", "Normal") \| :call VIM(input("vimscript: "), 'exec_input_vs')<cr>
nnoremap , :call SetMode(",", "Normal") \| :call BASH(input("bash: "), 'exec_input_vs')<cr>
nnoremap , :call SetMode(",", "Normal") \| :call PYTHON(input("python: "), 'exec_input_vs')<cr>
nnoremap , :call SetMode(",", "Normal") \| :call RUST(input("rust: "), 'exec_input_vs')<cr>
nnoremap , :call SetMode(",", "Normal") \| :call VIM('', 'exec_input_vs')<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call VIM('', 'exec_input_vs')<cr>
nnoremap , :call SetMode(",", "Normal") \| :call BASH('', 'exec_input_vs')<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call BASH('', 'exec_input_vs')<cr>
nnoremap , :call SetMode(",", "Normal") \| :call PYTHON('', 'exec_input_vs')<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call PYTHON('', 'exec_input_vs')<cr>
nnoremap , :call SetMode(",", "Normal") \| :call RUST('', 'exec_input_vs')<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call RUST('', 'exec_input_vs')<cr>
nnoremap < :call SetMode("\<", "Normal") \| :CopyFileNameToClipboard<cr>
nnoremap < :call SetMode("\<", "Normal") \| :CopyWholePathToClipboard<cr>
nnoremap < :call SetMode("\<", "Normal") \| :InsertReceiver<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Rewindworkdir()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Files(Folder_Up(v:count, 0))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Up(v:count, 1))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Up(v:count, 2))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Up(v:count, 3))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Up(v:count, 4))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Up(v:count, 5))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 0))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 1))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 2))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 3))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 4))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 5))<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call AgIn(Folder_Repo(v:count, 0))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call AgIn(Folder_Repo(v:count, 1))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call AgIn(Folder_Repo(v:count, 2))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call AgIn(Folder_Repo(v:count, 3))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call AgIn(Folder_Repo(v:count, 4))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call AgIn(Folder_Repo(v:count, 5))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call AgIn(Folder_Repo(v:count, 0))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call AgIn(Folder_Repo(v:count, 1))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call AgIn(Folder_Repo(v:count, 2))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call AgIn(Folder_Repo(v:count, 3))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call AgIn(Folder_Repo(v:count, 4))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call AgIn(Folder_Repo(v:count, 5))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call CD(VimConfiguration())<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 0))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 1))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 2))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 3))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 4))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Files(Folder_Repo_Or_Project(v:count, 5))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call Projects()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call FilesInProjects()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Projects()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call ToggleTroughOpenedProjects()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call ToggleTroughOpenedProjects(-1)<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Projects()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Projects()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call SearchGitProjects()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call SearchGitProjects()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :Generate<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Commands()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Commands()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Commands()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Commands()<cr>
inoremap < :call SetMode("\<", "Insert") \| :call Commands()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Commands()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Commands()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Commands()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Commands()<cr>
inoremap < :call SetMode("\<", "Insert") \| :call Commands()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Commands()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Commands()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Commands()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Commands()<cr>
inoremap < :call SetMode("\<", "Insert") \| :call Commands()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Commands()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Commands()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Commands()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Commands()<cr>
inoremap < :call SetMode("\<", "Insert") \| :call Commands()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Commands()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Commands()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Commands()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Commands()<cr>
inoremap < :call SetMode("\<", "Insert") \| :call Commands()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Commands()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Commands()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Commands()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Commands()<cr>
inoremap < :call SetMode("\<", "Insert") \| :call Commands()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Commands()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Commands()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Commands()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Commands()<cr>
inoremap < :call SetMode("\<", "Insert") \| :call Commands()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Commands()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Commands()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Commands()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Commands()<cr>
inoremap < :call SetMode("\<", "Insert") \| :call Commands()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Commands()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Commands()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Commands()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Commands()<cr>
inoremap < :call SetMode("\<", "Insert") \| :call Commands()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Commands()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Commands()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Commands()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Commands()<cr>
inoremap < :call SetMode("\<", "Insert") \| :call Commands()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Commands()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Commands()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Commands()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Commands()<cr>
inoremap < :call SetMode("\<", "Insert") \| :call Commands()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call Commands()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call Commands()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call Commands()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call Commands()<cr>
inoremap < :call SetMode("\<", "Insert") \| :call Commands()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call AgIn(Folder_Project())<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call AgIn(Folder_Repo(v:count, 0))<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call AgIn(Folder_Repo(v:count, 0))<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call AgIn(Folder_Repo(v:count, 1))<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call AgIn(Folder_Repo(v:count, 1))<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call AgIn('/')<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call fzf#vim#gitfiles('', {'dir': Folder_Repo(v:count, 0)})<cr>
nnoremap , :call SetMode(",", "Normal") \| :OpenFileCommandLineSameDir<cr>
nnoremap , :call SetMode(",", "Normal") \| :OpenFileCommandLineCWD<cr>
nnoremap , :call SetMode(",", "Normal") \| :OpenFileCommandLineSameDir<cr>
nnoremap , :call SetMode(",", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 0))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 1))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 2))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 3))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call CommandLineFiles(Folder_Up(v:count, 4))<cr>
cnoremap < <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap < <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap < <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap < <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap < <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap < <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap < <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap < <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap < <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap < <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap < <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap < <C-\>egetcmdline()[:strridx(getcmdline()[:getcmdpos()-3], '/')]<cr>
cnoremap < :call SetMode("\<", "Command") \| <Backspace>
cnoremap < :call SetMode("\<", "Command") \| <Backspace>
cnoremap < :call SetMode("\<", "Command") \| <Backspace>
cnoremap < :call SetMode("\<", "Command") \| <Backspace>
nnoremap , :call SetMode(",", "Normal") \| :call MakeDirCurrentCWD(bufnr())<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call CD(WFilePrev())<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call CD(WFileNext())<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call CD(WFilePrev())<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call CD(WFileNext())<cr>
nnoremap , :call SetMode(",", "Normal") \| :JumpProjectIn<cr>
nnoremap < :call SetMode("\<", "Normal") \| :JumpProjectIn<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call VS()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call VS()<cr>
inoremap < :call SetMode("\<", "Insert") \| :call VS()<cr>
cnoremap < :call SetMode("\<", "Command") \| :call VS('c')<cr>
cnoremap < :call SetMode("\<", "Command") \| :call VS('c')<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call VS('t')<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call FuncPaste("Normal")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call FuncCopy("Normal")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call FuncCut("Normal")<cr>
nnoremap , :call SetMode(",", "Normal") \| :IntelligentJumping<cr>
nnoremap < :call SetMode("\<", "Normal") \| :wincmd h<cr>
nnoremap < :call SetMode("\<", "Normal") \| :wincmd j<cr>
nnoremap < :call SetMode("\<", "Normal") \| :wincmd k<cr>
nnoremap < :call SetMode("\<", "Normal") \| :wincmd l<cr>
vnoremap p :call SetMode("p", "Visual") \| '<,'>:let vlcb = getpos("'<")[1:2] \| let vlce = getpos("'>")[1:2] \| call ClipboardPaste("v")<cr>p
nnoremap < :call SetMode("\<", "Normal") \| :call backspaceN()<cr>
cnoremap < :call SetMode("\<", "Command") \| ä
cnoremap < :call SetMode("\<", "Command") \| ä
cnoremap < :call SetMode("\<", "Command") \| Ä
cnoremap < :call SetMode("\<", "Command") \| Ä
cnoremap < :call SetMode("\<", "Command") \| ö
cnoremap < :call SetMode("\<", "Command") \| ö
cnoremap < :call SetMode("\<", "Command") \| Ö
cnoremap < :call SetMode("\<", "Command") \| Ö
cnoremap < :call SetMode("\<", "Command") \| ü
cnoremap < :call SetMode("\<", "Command") \| ü
cnoremap < :call SetMode("\<", "Command") \| Ü
cnoremap < :call SetMode("\<", "Command") \| Ü
cnoremap < :call SetMode("\<", "Command") \| ß
cnoremap < :call SetMode("\<", "Command") \| ß
nnoremap , :call SetMode(",", "Normal") \| :echo VS()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call AppendToEndNormal()<cr>
nnoremap , :call SetMode(",", "Normal") \| :AppendAll<cr>
nnoremap Y :call SetMode("Y", "Normal") \| :call AppendToClipboard()<cr>
vnoremap Y :call SetMode("Y", "Visual") \| '<,'>:let @+ = @+ . join(getline("'<", "'>"), "\n") . "\n"<cr>
nnoremap < :call SetMode("\<", "Normal") \| :m-2<cr>
nnoremap < :call SetMode("\<", "Normal") \| :m+1<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:m '<-2<cr>gv=gv
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:m '>+1<cr>gv=gv
nnoremap < <<
nnoremap > >>
vnoremap < :call SetMode("\<", "Visual") \| '<,'><gv
vnoremap > :call SetMode("\>", "Visual") \| '<,'>>gv
nnoremap , :call SetMode(",", "Normal") \| :wincmd =<cr>
inoremap < :call SetMode("\<", "Insert") \| <C-x><C-f>
inoremap < :call SetMode("\<", "Insert") \| <c-r>+
nnoremap , :call SetMode(",", "Normal") \| :call DeleteFile()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call NewFile()<cr>
nnoremap , :call SetMode(",", "Normal") \| :prev<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:prev<cr>
nnoremap , :call SetMode(",", "Normal") \| :next<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:next<cr>
nnoremap , :call SetMode(",", "Normal") \| :norm yy<cr>:norm dd<cr>:wincmd l<cr>:norm gp<cr>:wincmd h<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:norm gvy<cr>:norm gvd<cr>:wincmd l<cr>:norm gp<cr>:wincmd h<cr>
nnoremap < :call SetMode("\<", "Normal") \| :echo JoinSplits("h")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :echo JoinSplits("j")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :echo JoinSplits("k")<cr>
nnoremap < :call SetMode("\<", "Normal") \| :echo JoinSplits("l")<cr>
nnoremap , :call SetMode(",", "Normal") \| :echo MoveOutOfSplit("h")<cr>
nnoremap , :call SetMode(",", "Normal") \| :echo MoveOutOfSplit("j")<cr>
nnoremap , :call SetMode(",", "Normal") \| :echo MoveOutOfSplit("k")<cr>
nnoremap , :call SetMode(",", "Normal") \| :echo MoveOutOfSplit("l")<cr>
nnoremap < :call SetMode("\<", "Normal") \| zh
nnoremap < :call SetMode("\<", "Normal") \| zl
nnoremap < :call SetMode("\<", "Normal") \| 20zh
nnoremap < :call SetMode("\<", "Normal") \| 20zl
nnoremap , :call SetMode(",", "Normal") \| :call ExecFunction()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call ExecVS()<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:call ExecVS()<cr>
nnoremap , :call SetMode(",", "Normal") \| :Re \| :%source \| :ReEnd<cr>
nnoremap , :call SetMode(",", "Normal") \| :call RedoLeaderS()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call ToggleComment()<cr>
nnoremap , :call SetMode(",", "Normal") \| :CF 
vnoremap < :call SetMode("\<", "Visual") \| '<,'>J
nnoremap < :call SetMode("\<", "Normal") \| :call GetKeys()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call FindKeyPerform()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :echo AllKeys()<cr>
tnoremap < <C-\><C-n>:call SetMode("\<", "Terminal") \| :call SendCommandToThisTerm([getreg('"')])<cr>i
vnoremap , :call SetMode(",", "Visual") \| '<,'>:silent redir=>output \| silent '<,'>source \| redir END \| put=output<cr>
nnoremap , :call SetMode(",", "Normal") \| :RECP --reg *<cr>
nnoremap , :call SetMode(",", "Normal") \| :RECP --reg "<cr>
nnoremap , :call SetMode(",", "Normal") \| :RECP<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call VimGrep(v:count)<cr>
nnoremap < :call SetMode("\<", "Normal") \| :Lines<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call VimGrep(v:count)<cr>
nnoremap < :call SetMode("\<", "Normal") \| :vimgrep "todo" $folderrepo/**/*<cr>
nnoremap < :call SetMode("\<", "Normal") \| :cclose<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call COpen()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :cprev<cr>
nnoremap < :call SetMode("\<", "Normal") \| :cnext<cr>
nnoremap < :call SetMode("\<", "Normal") \| :Pull<cr>
nnoremap < :call SetMode("\<", "Normal") \| :GitFetch<cr>
nnoremap < :call SetMode("\<", "Normal") \| :Status<cr>
nnoremap < :call SetMode("\<", "Normal") \| :Diff --all<cr>
nnoremap < :call SetMode("\<", "Normal") \| :Diff --all --cached<cr>
nnoremap < :call SetMode("\<", "Normal") \| :Log<cr>
nnoremap < :call SetMode("\<", "Normal") \| :GitAdd<cr>
nnoremap < :call SetMode("\<", "Normal") \| :GitAddCWD<cr>
nnoremap < :call SetMode("\<", "Normal") \| :PushCWD 
nnoremap , :call SetMode(",", "Normal") \| :!git rebase --continue<cr>
nnoremap , :call SetMode(",", "Normal") \| :!git rebase --skip<cr>
nnoremap , :call SetMode(",", "Normal") \| :!git rebase --abort<cr>
nnoremap , :call SetMode(",", "Normal") \| :StashPush<cr>
nnoremap , :call SetMode(",", "Normal") \| :StashPop<cr>
nnoremap , :call SetMode(",", "Normal") \| :call SelectFunctionBlock()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call GitInfo()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call GitInfo('--stash')<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call GitStashDrop()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call GitDeleteLastUnpushedCommit()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call GitCommitRepo()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call GitCommitRepo(input("Commit Message: "))<cr>
nnoremap , :call SetMode(",", "Normal") \| :call GitAddRepo()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call GitInitRepository()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call GitInitRepositoryBare()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SelectRemote(1)<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SelectRemote(-1)<cr>
nnoremap , :call SetMode(",", "Normal") \| :call GitRenameRemote()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call GitRemoteAdd()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call GitSetRemote()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SelectBranch(1)<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call SelectBranch(-1)<cr>
nnoremap , :call SetMode(",", "Normal") \| :call GitRenameBranch()<cr>
nnoremap , :call SetMode(",", "Normal") \| :call GitNewBranch()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call GitStashPush()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call GitStashPop()<cr>
tnoremap < <C-\><C-n>
vnoremap i :call SetMode("i", "Visual") \| '<,'><C-c>i
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call CommandInfo()<cr>
nnoremap , :call SetMode(",", "Normal") \| :diffthis<cr>
nnoremap , :call SetMode(",", "Normal") \| :diffoff<cr>
nnoremap < :call SetMode("\<", "Normal") \| :diffthis<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:diffthis<cr>
nnoremap < :call SetMode("\<", "Normal") \| :diffoff<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:diffoff<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call WinSwap_Prep() \| :windo diffthis \| :call WinSwap_Back()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call WinSwap_Prep() \| :windo diffthis \| :call WinSwap_Back()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call WinSwap_Prep() \| :windo diffoff \| :call WinSwap_Back()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call WinSwap_Prep() \| :windo diffoff \| :call WinSwap_Back()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call BufPrep() \| :call DiffOff() \| :call BufBack()<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:call BufPrep() \| :call DiffOff() \| :call BufBack()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :@:<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:@:<cr>
nnoremap < :call SetMode("\<", "Normal") \| :call ToggleBCommand()<cr>
nnoremap < :call SetMode("\<", "Normal") \| :F 
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:F<cr>
nnoremap < :call SetMode("\<", "Normal") \| :IF 
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:IF<cr>
nnoremap < :call SetMode("\<", "Normal") \| :CDo<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:CDo<cr>
nnoremap < :call SetMode("\<", "Normal") \| :CFDo<cr>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:CFDo<cr>
nnoremap < :call SetMode("\<", "Normal") \| :OR 1<CR>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:OR 1<CR>
nnoremap < :call SetMode("\<", "Normal") \| :OR -1<CR>
vnoremap < :call SetMode("\<", "Visual") \| '<,'>:OR -1<CR>
nnoremap , :call SetMode(",", "Normal") \| :Rel<cr>
vnoremap , :call SetMode(",", "Visual") \| '<,'>:Rel<cr>