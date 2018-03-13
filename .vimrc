""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"vim-plug plugins (Make sure you install them with :PlugInstall)
call plug#begin()

"some colorschemes
Plug 'morhetz/gruvbox'
Plug 'nightsense/seabird'

"Add plugins to &runtimepath
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"APPEARANCE
"colorscheme
set background=dark
colorscheme gruvbox
syntax on       "syntax highlighting

set number          "show line numbers
set ruler           "show column and stuff

"highlight brackets
set matchtime=1
highlight MatchParen cterm=none ctermbg=none ctermfg=cyan

"Change cursor between modes
"iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"VTE-compatible terminals including gnome 3.x and xterm)
"" let &t_SI = "\<Esc>[6 q"
"" let &t_SR = "\<Esc>[4 q"
"" let &t_EI = "\<Esc>[2 q"

"INDENTATION
"auto-indenting
set smartindent
set autoindent
filetype indent on

"tab settings for most files
"tab length is 4, tabs are spaces, backspace kills 4-space-tabs
set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType * set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4

"tab settings for Python
"tab length is 4, tabs are spaces, backspace kills 4-space-tabs
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4

"tab settings for Perl
"tab length is 3, tabs are spaces, backspace kills 3-space-tabs
autocmd FileType perl set tabstop=3|set shiftwidth=3|set expandtab|set softtabstop=3

"tab settings for html
"tab length is 2, tabs are spaces, backspace kills 2-space-tabs
autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2

"tab settings for Makefiles
"tab length is 4, tabs are tabs, backspace kills 2-space-tabs
autocmd FileType make set tabstop=8|set shiftwidth=8|set noexpandtab|set softtabstop=0

"make normal mode cursor go to start (not end) of an initial tab character:
set list lcs=tab:\ \ 

"make backspacing work over indents, end of line, start of edited text:
set backspace=indent,eol,start

"COMMANDS
"tab autocompletion for commands
set wildmode=longest,list,full
set wildmenu

"display title with file name
set title

"f2 toggles paste mode
set pastetoggle=<F2>

"f3 toggles search highlighting
set hlsearch
noremap <F3> :set hlsearch!<CR>

"f4 toggles line numbers
noremap <F4> :set number!<CR>

"highlight trailing whitespace
match ErrorMsg '\s\+$'

"ctags: generate tags in project root with `ctags -R *` and vim will see them anywhere beneath that
set tags=./tags,tags;$HOME

"cscope: generate tags in project root with `cscope -Rb`
source ~/.vim/cscope_maps.vim

"enable mouse in all modes
"NOTE: to use ordinary mouse behaviour, hold shift (Linux) or alt/option (OSX)
set mouse=a
set ttymouse=xterm2

"make the buffer work with clipboard
set clipboard=unnamed
