""""""""""""""""""""""""""PLUGIN SETTINGS"""""""""""""""""""""""""""""""""
"auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"vim-plug plugins (Make sure you install them with :PlugInstall)
call plug#begin()

"To add a plugin, simply copy the end of the github url here
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'hiroakis/cyberspace.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'itchyny/lightline.vim'
Plug 'keith/swift.vim'

"Add plugins to &runtimepath
call plug#end()

"enable lightline
set laststatus=2
set noshowmode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Determine Operating System for use in other settings
if !exists("os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        "`Darwin` means osx
        "`Linux` means Linux
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif
let g:os = substitute(system('uname'), "\n", "", "")


"APPEARANCE
set background=dark
colorscheme elflord
"let g:lightline = { 'colorscheme': 'seoul256' }| colorscheme gruvbox
"let g:lightline = { 'colorscheme': 'powerline' }| colorscheme PaperColor
let g:lightline = { 'colorscheme': 'powerline' }| colorscheme cyberspace
syntax on           "syntax highlighting
set re=0            "use new regex engine (faster typescript syntax)
set number          "show line numbers
set ruler           "show column and stuff
set title           "show title with file name

"highlight trailing whitespace
match ErrorMsg '\s\+$'

"highlight brackets
set matchtime=1
highlight MatchParen cterm=none ctermbg=none ctermfg=DarkMagenta

"Change cursor between modes
"Windows/wsl is still todo
if g:os == "Darwin"
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


"BEHAVIOUR
"map home/end shortcuts
map  <home>
imap  <home>
cmap  <home>
map  <end>
imap  <end>
cmap  <end>

set ignorecase     " Do case insensitive matching
"set smartcase      " Case insensitive if search string is all lowercase
"set incsearch      " Incremental search
"set autowrite      " Automatically save before commands like :next and :make
"set hidden         " Hide buffers instead of closing when opening new buffer

"jump to last position when reopening file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

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


"INDENTATION
"auto-indenting
set autoindent
filetype indent on

"tab settings
"tabstop is width of \t, shiftwidth is indent width, softtabstop is width of
"tab/backspace keypress. expandtab turns tabs into spaces.
"If expandtab, keep all the numbers the same
"If noexpandtab, put softtabstop=0 and all other numbers the same
set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType * set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType perl set tabstop=3|set shiftwidth=3|set expandtab|set softtabstop=3
autocmd FileType json,html,xhtml,yaml,cmake set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2
autocmd FileType make set tabstop=8|set shiftwidth=8|set noexpandtab|set softtabstop=0
autocmd FileType go set tabstop=4|set shiftwidth=4|set noexpandtab|set softtabstop=0

"make normal mode cursor go to start (not end) of an initial tab character:
set list lcs=tab:\ \ 

"make backspacing work over indents, end of line, start of edited text:
set backspace=indent,eol,start

"auto-wrap git commits at 72 chars
autocmd FileType gitcommit setlocal tw=72

"CTAGS CSCOPE
"ctags: generate tags in project root with `ctags -R *` and vim will see them anywhere beneath that
set tags=./tags,tags;$HOME

"cscope: generate tags in project root with `cscope -Rb`
"Set $CSCOPE_DB to point to a cscope db, or else open vim in the db folder
"http://cscope.sourceforge.net/cscope_vim_tutorial.html
source ~/.vim/cscope_maps.vim

