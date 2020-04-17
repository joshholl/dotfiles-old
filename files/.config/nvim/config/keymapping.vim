inoremap jj <Esc>`^


" execute current file in shell
nnoremap <F9> :!clear && %:p<Enter>

" clear exec buffer, and start to run command waiting for args
nnoremap <SHIFT-F9> :!clear && %:p


" switch active pane
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
