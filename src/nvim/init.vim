" ============================
"  Auto install vim-plug
" ============================

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
    autocmd VimEnter * qall
endif

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
    autocmd VimEnter * qall
endif

" ============================
"  Plugins
" ============================

call plug#begin('~/.local/share/nvim/plugged')

" Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" should init after nedrtree, (install before https://github.com/ryanoasis/nerd-fonts)
Plug 'ryanoasis/vim-devicons', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on':  'NERDTreeToggle' }
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'edkolev/tmuxline.vim'

" Asynchronous completion framework
if has('nvim')
  Plug 'Shougo/deoplete.nvim' ", { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Editing
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
" Plug 'mattn/emmet-vim' " <C-y>, to expand
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/ReplaceWithSameIndentRegister'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
Plug 'dense-analysis/ale' " Asynchronous Lint Engine
" Plug 'Yggdroot/indentLine'
" Plug 'easymotion/vim-easymotion'

" Syntax Highlight
Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['js', 'jsx'] }
" Plug 'othree/yajs.vim', { 'for': ['js', 'jsx'] }
Plug 'evidens/vim-twig'

" Typescript Highlight
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['ts', 'tsx'] }
Plug 'mhartington/nvim-typescript', { 'for': ['ts', 'tsx'], 'do': './install.sh' } " don't forget to run :UpdateRemotePlugins after installation

" Git
Plug 'tpope/vim-fugitive'

call plug#end() " Add plugins to &runtimepath

" ============================
"  Environment
" ============================

filetype plugin indent on

set autoread                    " Watch for file changes
set autowrite                   " Automatically :write before running commands
set noswapfile                  " Don't create/use swap file
set nobackup                    " Don't keep a backup file
set encoding=utf-8              " Sets default encoding
set fileformats=unix,dos        " Determines line endings (dos, unix or mac)
set fileencodings=utf-8,cp1251  " Lets open files in these encodings
set lazyredraw                  " Will buffer screen updates instead of updating all the time
set path=.,,**                  " List of directories which will be searched when using :find, gf, etc.
set wildmenu                    " Enables wildmenu (helpful for autocomplete in command mode)
set wildmode=list:longest,full  " Tab will complete to first full match and open the wildmenu
set wildignore+=.DS_Store
set hidden                      " Edit several files in the same time without having to save them
set wrap                        " Wrap long lines
set linebreak                   " Don't break words when wrapping
set history=500                 " Store lots of history entries: :cmdline and search patterns
set shiftround                  " When at 3 spaces and I hit >>, go to 4, not 5
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set scrolloff=7                 " Min number of lines that you would like above and below the cursor
" set number          " Shows line numbers
" set numberwidth=4   " Sets with of line numbers panel
set relativenumber

" You can exit Vim, reboot your computer and still undo changes you made.
" Vim inself doesn't create directory by given path (so, you need to create it before usage)
set undodir=~/.vim/undo-dir
set undofile

set timeoutlen=1000
set ttimeoutlen=0               " Eliminating delays on <Esc>

set viminfo+=!                  " Use ~/.viminfo to memorize previous sessions (plug vim-startify require it)

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

if (empty($TMUX))
    if (has("termguicolors"))
        set termguicolors
    endif
endif

" Base16-shell (https://github.com/chriskempson/base16-shell)
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
else
    if !empty(glob('~/.local/share/nvim/plugged/base16-vim/colors/base16-default-dark.vim'))
        colorscheme base16-default-dark
        echo ' '
        echo 'You should install base16-shell to get best UX of colorscheme (base16-tomorrow)'
        echo 'See https://github.com/chriskempson/base16-shell'
        echo ' '
    endif
endif

set fillchars+=vert:│

" ==== Themes customization =================================================================

" ---- For dark themes (like base16_default-dark) -------------------------------------------

" @see help http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
highlight LineNr cterm=NONE ctermbg=black ctermfg=240 guibg=NONE guifg=grey
highlight CursorLineNr cterm=NONE ctermbg=black ctermfg=240 guibg=NONE guifg=grey

highlight VertSplit ctermbg=NONE guibg=NONE ctermfg=black

" ---- For light themes (like base16_github) ------------------------------------------------

" @see help http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
" highlight LineNr cterm=NONE ctermbg=black ctermfg=444 guibg=NONE guifg=grey
" highlight CursorLineNr cterm=NONE ctermbg=black ctermfg=444 guibg=NONE guifg=grey
"
" highlight VertSplit ctermbg=NONE guibg=NONE ctermfg=444
" highlight Search ctermbg=3 ctermfg=black guibg=3 guifg=black
" highlight Visual ctermbg=20 ctermfg=NONE guibg=#795da3
" highlight NonText ctermfg=444

" ==== /Themes customization ================================================================

" vim-fugitive (opens :Gdiff as vertical splits instead of horizontal)
set diffopt+=vertical

" the amount of space to use after the glyph character (default '  ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" whether or not to show the nerdtree brackets around flags (1 to disable)
let g:webdevicons_conceal_nerdtree_brackets = 1

" Airline Plugin / Status line
set laststatus=2                              " Always display the status line
set showcmd                                   " Display incomplete commands
let g:airline_powerline_fonts = 1             " Use porewline fonts to display icons in airline (requires: https://github.com/powerline/fonts)
let g:airline_theme = 'base16'                " Change theme of airline (requires: vim-airline-themes)
let g:airline#extensions#branch#enabled  = 1  " Shows current git branch name (requires: vim-fugitive)
let g:airline#extensions#tabline#enabled = 1  " Use arline for tabline
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_section_z = '%l/%L:%3c'
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" NERDTree Plugin
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['.DS_Store']

"" Deoplete Autocomplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

call deoplete#custom#option('auto_refresh_delay', 1000) " ms
call deoplete#custom#option('auto_complete_delay', 200) " ms

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" delimitMate
let delimitMate_expand_cr = 1

" ale
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" Change cursor shape in difrent modes (only for OSX + iTerm (+ tmux)?)
" see: http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
if v:version > 703 && has('patch687')
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Emmet-vim Plugin (use <C-y>, to expand)
let g:user_emmet_mode='a'                     " Enable all function in all mode

" Tmuxline Plugin
autocmd VimEnter * silent! Tmuxline vim_statusline_1
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_powerline_separators = 0

" ============================
" Keymaps
" ============================
"
" <TAB>: completion (to select top element of suggest in deoplete)
" @see: https://github.com/Shougo/deoplete.nvim/issues/302
" inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <Space> :NERDTreeToggle<CR>
nmap f<Space> :NERDTreeFind<CR>

" Don't use Ex mode
map Q <Nop>

" Don't jump throught the line (if it too long and has word-wrap)
noremap j gj
noremap k gk

" Add hotkey jump to the normal mode
" see: http://vim.wikia.com/wiki/Avoid_the_escape_key
imap jk <Esc>

" Enter key will simply select the highlighted menu item,
" just as <C-Y> does (that select item without inserting line break)
"
" see issue: https://github.com/Raimondi/delimitMate/issues/125
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" Quicker window movement
" after C-l do default C-l to clear and redraw the screen
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l <C-l>

" Navigate with <Ctrl>-hjkl in Insert Mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" Emacs-like beginning and end of line (Insert/Command mode)
inoremap <c-e> <c-o>$
inoremap <c-a> <c-o>^
cnoremap <c-e> <end>
cnoremap <c-a> <home>

" Resize vertical split
nmap = <C-w>5>
nmap - <C-w>5<

" Resize horizontal split
nmap + <C-W>+
nmap _ <C-W>-

let mapleader = ","

nnoremap <Leader>td :TSDef<cr>

" ,bl - Show buffers
" nnoremap <Leader>bl :<C-u>ls<cr>:b
nnoremap <Leader>bl :Buffers<cr>

" ,bp - Go to prev buffer
nnoremap <Leader>bp :<C-u>bp<cr>

" ,bn - Go to next buffer
nnoremap <Leader>bn :<C-u>bn<cr>

" ,bd - Close current buffer
nnoremap <Leader>bd :<C-u>bd!<cr>

" ,w - Jump to next split
nnoremap <Leader>w <C-w>w

" ,p - Like <p>, but adjust the indent to the current line and use the system clipboard
"map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
nnoremap <Leader>p :set invpaste paste?<cr>

" ,h - Clear the search highlight in Normal mode
map <Leader>h :nohlsearch<cr>

" C-t - Fuzzy seacrh
nnoremap <C-t> :Files<cr>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

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

" ============================
"  Autocmd
" ============================

" Only do this part when compiled with support for autocommands
if has("autocmd")
    " Put these in an autocmd group, so that we can delete them easily
    augroup vimrcEx
        au!

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

    augroup END
endif
