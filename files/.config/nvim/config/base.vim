set number


" set the tab because im tired of configging per file
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces


" show trailing spaces highlighted in read
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/ 
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/ 
autocmd InsertLeave * match ExtraWhitespace /\s\+$/ 
autocmd BufWinLeave * call clearmatches()

