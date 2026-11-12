" AlienBlood: matches the AlienBlood kitty theme.
"
" cterm colours use ANSI indices 0-15, so in a terminal without termguicolors
" the terminal's own AlienBlood palette is used verbatim. GUI colours are the
" same palette in hex. Normal leaves cterm fg/bg unset to inherit the terminal.

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'alienblood'

" [gui, cterm]
let s:none  = ['NONE', 'NONE']
let s:bg    = ['#0f160f', 'NONE']
let s:fg    = ['#637d75', 'NONE']
let s:c0    = ['#112615', 0]
let s:c1    = ['#7f2b26', 1]
let s:c2    = ['#2f7e25', 2]
let s:c3    = ['#707f23', 3]
let s:c4    = ['#2f697f', 4]
let s:c5    = ['#47577e', 5]
let s:c6    = ['#317f76', 6]
let s:c7    = ['#647d75', 7]
let s:c8    = ['#3c4711', 8]
let s:c9    = ['#df8008', 9]
let s:c10   = ['#18e000', 10]
let s:c11   = ['#bde000', 11]
let s:c12   = ['#00a9df', 12]
let s:c13   = ['#0058df', 13]
let s:c14   = ['#00dfc3', 14]
let s:c15   = ['#73f990', 15]

" Shades outside the 16-colour palette; cterm falls back to fixed xterm-256 cells.
let s:inv     = ['#0f160f', 0]
let s:comment = ['#2b5535', 22]
let s:select  = ['#1d4025', 22]
let s:diffadd = ['#163319', 22]
let s:diffchg = ['#12303a', 23]
let s:difftxt = ['#1d4a5a', 24]
let s:diffdel = ['#3a1714', 52]

function! s:hi(group, fg, bg, ...) abort
  let l:attr = a:0 >= 1 ? a:1 : 'NONE'
  let l:sp   = a:0 >= 2 ? a:2[0] : 'NONE'
  execute 'hi' a:group
        \ 'guifg=' . a:fg[0] 'guibg=' . a:bg[0] 'gui=' . l:attr 'guisp=' . l:sp
        \ 'ctermfg=' . a:fg[1] 'ctermbg=' . a:bg[1] 'cterm=' . l:attr
endfunction

" Editor UI
call s:hi('Normal',       s:fg,   s:bg)
call s:hi('NormalFloat',  s:fg,   s:c0)
call s:hi('FloatBorder',  s:c6,   s:c0)
call s:hi('Cursor',       s:inv,  s:c15)
call s:hi('CursorLine',   s:none, s:c0)
call s:hi('CursorColumn', s:none, s:c0)
call s:hi('ColorColumn',  s:none, s:c0)
call s:hi('LineNr',       s:c8,   s:none)
call s:hi('CursorLineNr', s:c11,  s:none)
call s:hi('SignColumn',   s:fg,   s:none)
call s:hi('FoldColumn',   s:c8,   s:none)
call s:hi('Folded',       s:c7,   s:c0)
call s:hi('VertSplit',    s:c0,   s:none)
call s:hi('WinSeparator', s:c0,   s:none)
call s:hi('NonText',      s:c8,   s:none)
call s:hi('EndOfBuffer',  s:c8,   s:none)
call s:hi('SpecialKey',   s:c8,   s:none)
call s:hi('Whitespace',   s:c8,   s:none)
call s:hi('Conceal',      s:c5,   s:none)
call s:hi('Visual',       s:c15,  s:select)
call s:hi('VisualNOS',    s:none, s:select, 'underline')
call s:hi('Search',       s:inv,  s:c3)
call s:hi('IncSearch',    s:inv,  s:c11)
call s:hi('CurSearch',    s:inv,  s:c11)
call s:hi('MatchParen',   s:inv,  s:c14)
call s:hi('QuickFixLine', s:none, s:select, 'bold')
call s:hi('Directory',    s:c12,  s:none)
call s:hi('Title',        s:c11,  s:none, 'bold')
call s:hi('ModeMsg',      s:fg,   s:none, 'bold')
call s:hi('MoreMsg',      s:c10,  s:none)
call s:hi('Question',     s:c10,  s:none)
call s:hi('ErrorMsg',     s:c9,   s:none, 'bold')
call s:hi('WarningMsg',   s:c11,  s:none)
call s:hi('WildMenu',     s:inv,  s:c15)

call s:hi('StatusLine',       s:c15, s:select)
call s:hi('StatusLineNC',     s:fg,  s:c0)
call s:hi('StatusLineTerm',   s:c15, s:select)
call s:hi('StatusLineTermNC', s:fg,  s:c0)
call s:hi('TabLine',          s:fg,  s:c0)
call s:hi('TabLineFill',      s:fg,  s:c0)
call s:hi('TabLineSel',       s:c15, s:select, 'bold')

call s:hi('Pmenu',      s:fg,   s:c0)
call s:hi('PmenuSel',   s:c15,  s:select, 'bold')
call s:hi('PmenuSbar',  s:none, s:c0)
call s:hi('PmenuThumb', s:none, s:c6)

" Syntax
call s:hi('Comment',      s:comment, s:none, 'italic')
call s:hi('Constant',     s:c3,  s:none)
call s:hi('String',       s:c14, s:none)
call s:hi('Character',    s:c10, s:none)
call s:hi('Number',       s:c9,  s:none)
call s:hi('Float',        s:c9,  s:none)
call s:hi('Boolean',      s:c11, s:none)
call s:hi('Identifier',   s:c6,  s:none)
call s:hi('Function',     s:c15, s:none)
call s:hi('Statement',    s:c2,  s:none)
call s:hi('Conditional',  s:c10, s:none)
call s:hi('Repeat',       s:c10, s:none)
call s:hi('Label',        s:c2,  s:none)
call s:hi('Operator',     s:c11, s:none)
call s:hi('Keyword',      s:c2,  s:none)
call s:hi('Exception',    s:c9,  s:none)
call s:hi('PreProc',      s:c3,  s:none)
call s:hi('Include',      s:c4,  s:none)
call s:hi('Define',       s:c3,  s:none)
call s:hi('Macro',        s:c3,  s:none)
call s:hi('PreCondit',    s:c3,  s:none)
call s:hi('Type',         s:c12, s:none)
call s:hi('StorageClass', s:c4,  s:none)
call s:hi('Structure',    s:c12, s:none)
call s:hi('Typedef',      s:c13, s:none)
call s:hi('Special',      s:c6,  s:none)
call s:hi('SpecialChar',  s:c11, s:none)
call s:hi('Tag',          s:c12, s:none)
call s:hi('Delimiter',    s:fg,  s:none)
call s:hi('SpecialComment', s:c7, s:none, 'italic')
call s:hi('Debug',        s:c9,  s:none)
call s:hi('Underlined',   s:c12, s:none, 'underline')
call s:hi('Ignore',       s:c8,  s:none)
call s:hi('Error',        s:c15, s:c1)
call s:hi('Todo',         s:inv, s:c9, 'bold')

" Spelling
call s:hi('SpellBad',   s:none, s:none, 'undercurl', s:c9)
call s:hi('SpellCap',   s:none, s:none, 'undercurl', s:c12)
call s:hi('SpellLocal', s:none, s:none, 'undercurl', s:c14)
call s:hi('SpellRare',  s:none, s:none, 'undercurl', s:c11)

" Diff
call s:hi('DiffAdd',    s:none, s:diffadd)
call s:hi('DiffChange', s:none, s:diffchg)
call s:hi('DiffText',   s:c15,  s:difftxt, 'bold')
call s:hi('DiffDelete', s:c1,   s:diffdel)
call s:hi('diffAdded',   s:c10, s:none)
call s:hi('diffRemoved', s:c9,  s:none)
call s:hi('diffChanged', s:c12, s:none)
call s:hi('diffFile',    s:c11, s:none)
call s:hi('diffLine',    s:c5,  s:none)

" Diagnostics (Neovim LSP; harmless in Vim)
call s:hi('DiagnosticError', s:c9,  s:none)
call s:hi('DiagnosticWarn',  s:c11, s:none)
call s:hi('DiagnosticInfo',  s:c12, s:none)
call s:hi('DiagnosticHint',  s:c14, s:none)
call s:hi('DiagnosticOk',    s:c10, s:none)
call s:hi('DiagnosticUnderlineError', s:none, s:none, 'undercurl', s:c9)
call s:hi('DiagnosticUnderlineWarn',  s:none, s:none, 'undercurl', s:c11)
call s:hi('DiagnosticUnderlineInfo',  s:none, s:none, 'undercurl', s:c12)
call s:hi('DiagnosticUnderlineHint',  s:none, s:none, 'undercurl', s:c14)

" vim-fugitive / gitsigns
call s:hi('GitSignsAdd',    s:c10, s:none)
call s:hi('GitSignsChange', s:c12, s:none)
call s:hi('GitSignsDelete', s:c9,  s:none)

if has('terminal') || has('nvim')
  let g:terminal_ansi_colors = map([s:c0, s:c1, s:c2, s:c3, s:c4, s:c5, s:c6, s:c7,
        \ s:c8, s:c9, s:c10, s:c11, s:c12, s:c13, s:c14, s:c15], 'v:val[0]')
endif
if has('nvim')
  for s:i in range(16)
    let g:['terminal_color_' . s:i] = g:terminal_ansi_colors[s:i]
  endfor
endif
