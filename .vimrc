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
Plugin 'scrooloose/nerdtree'

" Tools
Plugin 'mileszs/ack.vim' " requires ack > 2.0

" Editing
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
" Plugin 'mattn/emmet-vim'

" Syntax Highlight
Plugin 'othree/yajs.vim'

" Git
Plugin 'tpope/vim-fugitive' " to show branch name on airline

call vundle#end()          " required
filetype plugin indent on  " required
" see :h vundle for more details

" -----------------------------------------
" Settings
" -----------------------------------------

" Editing behavior
set autoread                    " Watch for file changes
set autowrite                   " Automatically :write before running commands
set noswapfile                  " Don't create/use swap file
set encoding=utf-8              " Sets default encoding
set fileencodings=utf-8,cp1251  " Lets open files in these encodings
set hlsearch                    " Highlights search results (type :noh to temporarily hide it)

" Code style
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set autoindent

" Theme
syntax enable
" set number          " Shows line numbers
" set numberwidth=4   " Sets with of line numbers panel
set t_Co=256
set background=dark
colorscheme OceanicNext
highlight LineNr ctermfg=gray ctermbg=black

" Airline Plugin / Status line
set laststatus=2                              " Always display the status line 
set showcmd                                   " Display incomplete commands
let g:airline_powerline_fonts = 1             " Use porewline fonts to display icons in airline (requires: https://github.com/powerline/fonts)
let g:airline_theme = 'luna'                  " Change theme of airline (requires: vim-airline-themes)
let g:airline#extensions#tabline#enabled = 1  " Use arline for tabline
let g:airline#extensions#branch#enabled  = 1  " Shows current git branch name (requires: vim-fugitive)

" CtrlP Plugin
let g:ctrlp_cmd = 'CtrlPBuffer' " Enables buffer mode by default

" NERDTree Plugin
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1

nmap <Space> :NERDTreeToggle<CR>
nmap f<Space> :NERDTreeFind<CR>

" Unmap
map Q <Nop>

" Don't jump throught the line (if it too long and has word-wrap)
noremap j gj
noremap k gk

" Add hotkey jump to the normal mode
" see: http://vim.wikia.com/wiki/Avoid_the_escape_key
imap jk <Esc>
 
" Change cursor shape in different modes (iTerm only)
" see: http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Quicker window movement
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

