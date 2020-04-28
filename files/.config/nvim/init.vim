set encoding=UTF-8
let g:python_host_prog=expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog=expand('~/.pyenv/versions/neovim3/bin/python')
let g:ruby_host_prog=expand('~/.rbenv/versions/2.6.5/bin/ruby')


if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" Look and feel
Plug 'sainnhe/sonokai'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
"Syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components'



Plug 'neoclide/coc.nvim', {'branch': 'release' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'




Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

" some look and feel stuff
set termguicolors
let g:sonokai_style = 'andromeda'
colorscheme sonokai
let g:lightline = {'colorscheme': 'sonokai'}
syntax enable
set number

"for the love of all that holy tab = 2 spaces
filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2


"basic maps
"
"insert mode 
inoremap jj <Esc>

"normal mode
nnoremap H ^
nnoremap J 10<down>
nnoremap K 10<up>
nnoremap L $

"split panes for proffets
nnoremap <C-h> <C-W><C-H>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
set splitbelow
set splitright


"NERD Tree Configuration
map <c-n> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"FZF Setup
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\}
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
"coc the things
let g:coc_global_extension = [
	\ 'coc-snippits',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-json'
	\]

set noshowmode
set laststatus=2
set statusline=
set statusline+=%#TabLineSel#
set statusline+=%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%{(mode()=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#StatusLine#
set statusline+=%r\ 
set statusline+=%f
set statusline+=%m\ 
set statusline+=%#Normal#
set statusline+=%=
set statusline+=%#StatusLine#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c\ 
set statusline+=%#TabLineSel#
if exists('g:loaded_fugitive')
	set statusline+=%{FugitiveStatusline()}
endif

