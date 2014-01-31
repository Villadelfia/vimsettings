" lhs comments
map ,# :s/^/# /<CR>:nohlsearch<CR>
map ,/ :s/^/\/\/ / <CR>:nohlsearch<CR>
map ," :s/^/\" /<CR>:nohlsearch<CR>
map ,; :s/^/; /<CR>:nohlsearch<CR>
map ,- :s/^/-- /<CR>:nohlsearch<CR>
map ,z :s/^\/\/ \?\\|^-- \?\\|^> \?\\|^[#"%!;] \?//<CR>:nohlsearch<CR>
