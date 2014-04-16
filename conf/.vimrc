sy on

set tabstop=4
set shiftwidth=4
set number
set smarttab
set smartindent
set wrap
set showmatch
set hlsearch
set incsearch
set ignorecase

set lz

syntax on
set nocp
filetype plugin on
au BufNewFile,BufRead Gruntfile set filetype=javascript

if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif

if (match(fnamemodify(expand("%"), ':e'), 'php'))
	set ff=unix
endif
"call pathogen#infect()
syntax enable
"set background=dark
" if has("mac")
"	let g:solarized_termcolors=256
" endif
" colorscheme solarized
nnoremap о j
nnoremap л k
nnoremap р h
nnoremap д l
let $XMLLINT_INDENT="	"
au FileType xml setlocal equalprg=xmllint\ --format\ --encode\ UTF-8\ --recover\ -\ 2>/dev/null
nnoremap ; :
inoremap jk <ESC>
cnoremap sudow w !sudo tee % >/dev/null
