set nocompatible "use vim not vi
""""""""""""""""""""""""""PLUGIN SETTINGS"""""""""""""""""""""""""""""""""
"auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"auto-install fzf and rg
if !empty(glob("~/.fzf/bin/fzf"))
    if empty(glob("~/.fzf/bin/rg"))
        if system('uname')=~'Darwin'
            silent !curl -fLo /tmp/rg.tar.gz
                        \ https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-apple-darwin.tar.gz
            silent !tar xzvf /tmp/rg.tar.gz --directory /tmp
            silent !cp /tmp/ripgrep-0.10.0-x86_64-apple-darwin/rg ~/.fzf/bin/rg
        else
            silent !curl -fLo /tmp/rg.tar.gz
                        \ https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz
            silent !tar xzvf /tmp/rg.tar.gz --directory /tmp
            silent !cp /tmp/ripgrep-0.10.0-x86_64-unknown-linux-musl/rg ~/.fzf/bin/rg
        endif
    endif
endif

"vim-plug plugins (Make sure you install them with :PlugInstall)
call plug#begin()


"To add a plugin, simply copy the end of the github url here
Plug 'hiroakis/cyberspace.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'raimondi/delimitmate'
"Plug 'majutsushi/tagbar' "for ctags
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'preservim/vimux' " for tmux
Plug 'octol/vim-cpp-enhanced-highlight' "does what it says

"install and configure linting
"Plug 'dense-analysis/ale'
"ALEToggle # toggle ALE linting off

"Add plugins to &runtimepath
call plug#end()

"enable lightline
set laststatus=2
set noshowmode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"APPEARANCE
set background=dark
colorscheme elflord
let g:lightline = { 'colorscheme': 'powerline' }| colorscheme cyberspace
syntax on           "syntax highlighting
set re=0            "use new regex engine (faster typescript syntax)
set number          "show line numbers
set cursorline      "highlight current line
set ruler           "show column and stuff
set title           "show title with file name
set showcmd         "show partial command at bottom right of screen

"highlight trailing whitespace
match ErrorMsg '\s\+$'

"highlight brackets
set matchtime=1
highlight MatchParen cterm=none ctermbg=none ctermfg=lightgreen

"Change cursor between modes
if system('uname')=~'Darwin'
    "iTerm2
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
else
    "VTE-compatible terminals (including gnome 3.x and xterm)
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
endif


"COMMANDS AND SEARCH
let mapleader = ","     "remap leader from \ to ,

set ignorecase     " Do case insensitive matching
"set smartcase      " Case insensitive if search string is all lowercase
"set incsearch      " Incremental search
"set autowrite      " Automatically save before commands like :next and :make
"set hidden         " Hide buffers instead of closing when opening new buffer

"tab autocompletion for commands
set wildmode=longest,list,full
set wildmenu

"f2 toggles paste mode
set pastetoggle=<F2>

"f3 toggles search highlighting
set hlsearch
noremap <F3> :set hlsearch!<CR>

"f4 toggles line numbers
noremap <F4> :set number!<CR>

"enable mouse in all modes (off by default cos it's annoying)
"NOTE: to use ordinary mouse behaviour, hold shift (Linux) or alt/option (OSX)
"set mouse=a
"set ttymouse=xterm2

"yank to clipboard (requires clipboard support, which usually means gvim)
set clipboard=unnamed

" Easier file saving and closing
nnoremap <leader>ww :w<cr>
nnoremap <leader>wa :wa<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>qq :q<cr>
nnoremap <leader>qa :qa<cr>

" set the runtime path to include fzf
" the rtp path may need to be modified to suite the OS
" set rtp+=~/.fzf
"source /usr/share/doc/fzf/examples/fzf.vim
nnoremap <C-p> :Files<cr>
nnoremap <C-t> yiw:Tags <C-r>"<cr>
nnoremap <leader>mm yiw:Rg <C-r>"<cr>


"NAVIGATION
"map Ctrl+A to home
map <C-a> <home>
imap <C-a> <home>
cmap <C-a> <home>
"map Ctrl+E to end
map <C-e> <end>
imap <C-e> <end>
cmap <C-e> <end>

set scrolloff=5         "Start scrolling n lines away from margins

"jump to last position and center cursor when reopening file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"zz" | endif
endif


"SPLITS AND TABS
"open new splits where I expect them
set splitbelow
set splitright

" Easier split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Easier tab navigation
nnoremap <leader><tab> gt
nnoremap <leader>m<tab> gT
nnoremap <leader>tl :tablast<cr>
nnoremap <leader>tc :tabc<cr>
set tabpagemax=30 "increase max tabs above 10


"INDENTATION
"auto-indenting
set autoindent
filetype indent on

"tab settings
"If expandtab, keep all the numbers the same
"If noexpandtab, put softtabstop=0 and all other numbers the same
set expandtab           "expand tabs into spaces
set tabstop=4           "a tab is 4 spaces
set softtabstop=4       "backspace removes 4 spaces at a time
set shiftwidth=4        "auto-indent width is 4 spaces
set shiftround          "auto-indent to multiples of shiftwidth
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType perl set tabstop=3|set shiftwidth=3|set expandtab|set softtabstop=3
autocmd FileType json,html,xhtml,yaml,cmake,javascript set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2
autocmd FileType make set tabstop=8|set shiftwidth=8|set noexpandtab|set softtabstop=0
autocmd FileType go set tabstop=4|set shiftwidth=4|set noexpandtab|set softtabstop=0

"make normal mode cursor go to start (not end) of an initial tab character:
set list lcs=tab:\ \ 

"make backspacing work over indents, end of line, start of edited text:
set backspace=indent,eol,start

" Set folding
set foldmethod=indent                           "fold based on indents
set foldlevelstart=99                           "start with all folds open
au Filetype cpp setlocal foldmethod=syntax      "fold c++ based on syntax

"CTAGS CSCOPE
"ctags: generate tags in project root with `ctags -R *` and vim will see them anywhere beneath that
set tags=./tags,tags;$HOME

