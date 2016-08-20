set nocompatible           " be iMproved, required
filetype off               " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Required
Plugin 'VundleVim/Vundle.vim'

" Interface
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'

" Syntax Highlight
Plugin 'othree/yajs.vim'

" Git
Plugin 'tpope/vim-fugitive'

call vundle#end()          " required
filetype plugin indent on  " required
" see :h vundle for more details

" -----------------------------------------
" Settings
" -----------------------------------------

" Editing behavior
set autoread " watch for file changes

" Code style
set tabstop=4
set shiftwidth=4
set expandtab

" Theme
syntax enable
set number " displays line numbers
set t_Co=256
set background=dark
colorscheme oceanicnext
highlight LineNr ctermfg=gray ctermbg=black

" Airline 
set laststatus=2  " enables vim-airline 
let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna' " requires vim-airline-themes
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1 " requires vim-fugitive
