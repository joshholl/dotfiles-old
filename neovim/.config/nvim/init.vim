let g:python_host_prog='/usr/bin/python2'

if empty(glob('~/.config/nvim/autoload/plug.vim'))
		silent !curl -fLo "$HOME/.config/nvim/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" Solarized color scheme
Plug 'altercation/vim-colors-solarized'

Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'

" Airline status bar, and solarized theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flowtype/vim-flow'
call plug#end()

for file in split(globpath($HOME . '.config/nvim/config/', '*.vim'), '\n')
	execute 'source' fnameescape(file)
endfor
