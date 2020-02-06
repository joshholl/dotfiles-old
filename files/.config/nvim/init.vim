let g:python_host_prog=expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog=expand('~/.pyenv/versions/neovim3/bin/python')
let g:ruby_host_prog=expand('~/.rbenv/versions/2.6.5/bin/ruby')

set termguicolors


if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" Look and feel
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Editing niceties
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

"javascript 
Plug 'flowtype/vim-flow', { 'for': 'javascript' }
Plug 'ryanoasis/vim-devicons'

" REQUIRED: Add a syntax file. YATS is the best
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

for file in split(globpath('~/.config/nvim/config/', '*.vim'), '\n')
	execute 'source' fnameescape(file)
endfor


