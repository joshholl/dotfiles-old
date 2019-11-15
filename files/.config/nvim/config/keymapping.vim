inoremap jj <Esc>`^


" execute current file in shell
nnoremap <F9> :!clear && %:p<Enter>

" clear exec buffer, and start to run command waiting for args
nnoremap <SHIFT-F9> :!clear && %:p
