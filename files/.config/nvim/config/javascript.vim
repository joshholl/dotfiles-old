autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

