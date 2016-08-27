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
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
" Plugin 'mattn/emmet-vim'

" Syntax Highlight
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Git
Plugin 'tpope/vim-fugitive' " to show branch name on airline

call vundle#end()          " required
filetype plugin indent on  " required
" see :h vundle for more details

" -----------------------------------------
" Settings
" -----------------------------------------

" Editing Environment
set autoread                    " Watch for file changes
set autowrite                   " Automatically :write before running commands
set noswapfile                  " Don't create/use swap file
set encoding=utf-8              " Sets default encoding
set fileencodings=utf-8,cp1251  " Lets open files in these encodings
set lazyredraw                  " Will buffer screen updates instead of updating all the time
set path=.,,**                  " List of directories which will be searched when using :find, gf, etc.
set wildmenu                    " Enables wildmenu (helpful for autocomplete in command mode)
set wildmode=full               " Tab will complete to first full match and open the wildmenu
set wildignore=.DS_Store
set hidden                      " Edit several files in the same time without having to save them
set wrap                        " Wrap long lines
set linebreak                   " Don't break words when wrapping
set history=1000                " Store lots of history entries: :cmdline and search patterns

" Backspacing settings
"  - start     allow backspacing over the start of insert;
"              CTRL-W and CTRL-U stop once at the start of insert.
"  - indent    allow backspacing over autoindent
"  - eol       allow backspacing over line breaks (join lines)
set backspace=indent,eol,start

set viminfo='10,\"100,:20,%,n~/.viminfo " Load previous session

" Set cursor to its last position
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Search
set incsearch                   " While typing a search command, show pattern matches as it is typed
set hlsearch                    " Highlights search results (type :noh to temporarily hide it)
set ignorecase                  " Ignore case in search patterns
set smartcase                   " Override the 'ignorecase' if the search pattern contains upper case characters

" Show ↪ at the beginning of wrapped lines
if has("linebreak")
    let &sbr = nr2char(8618).' '
endif

set list                        " Display invisible character

if version >= 700
    set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
else
    set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
endif

" Vim > 7.3 features
if v:version > 703
    set wildignorecase
endif

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

" Change cursor shape in different modes (only for OSX + iTerm (+ tmux)?)
" see: http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
if v:version > 703
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Enter key will simply select the highlighted menu item,
" just as <C-Y> does (that select item without inserting line break)
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Quicker window movement
" after C-l do default C-l to clear and redraw the screen
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l <C-l>

" Navigate with <Ctrl>-hjkl in Insert Mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" Clear the search highlight in Normal mode
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" Ctrl+Shift+K or J now is the same as Ctrl+K or J
" See: http://stackoverflow.com/questions/10340470/mapping-the-shift-key-in-vim
" See: https://groups.google.com/forum/#!topic/vim_dev/Ym6D-kWIsyo

" Move one line
" nnoremap <C-S-k> ddkP
" nnoremap <C-S-j> ddp

" Move selected lines
" See http://www.vim.org/scripts/script.php?script_id=1590
" vnoremap <C-S-k> xkP'[V']
" vnoremap <C-S-j> xp'[V']
