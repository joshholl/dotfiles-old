set nocompatible              " be iMproved, required
filetype off                  " required
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshowmode

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.Vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()            " required

" airline configuration
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.space = "\ua0"

set laststatus=2

" solarized configuration
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
filetype plugin indent on    " required
