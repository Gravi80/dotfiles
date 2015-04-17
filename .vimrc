set nocompatible

let $VIMDIR = matchstr(&rtp, '^.\{-}\ze,')

filetype indent plugin on
syntax on

set hidden
set wildmenu
set showcmd
set hlsearch
" auto change working dir (could have problems with some plugins)
set autochdir

set ignorecase
set smartcase

set whichwrap+=<,>,[,]
set backspace=2
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

set cindent
set cino=(0,u0,U0


set cscopetag

set nostartofline
set ruler

set visualbell

set number

set cursorline

" move by screen lines, not by real lines
nnoremap j gj
nnoremap k gk
" also in visual mode
vnoremap j gj
vnoremap k gk

" Clear search pattern (\c lean)
map <silent> <Leader>c :let @/ = ""<CR>

" Highlight local variables
let g:TagHighlightSettings={'IncludeLocals':'True'}
function CustomTagHighlight()
	hi LocalVariable guifg=#ff00ff
	hi GlobalVariable guifg=#ff00ff
endfunction
au Syntax c,cpp call CustomTagHighlight()


" Delete word in insert mode (use C-W like C-BS and C-U like C-S-BS)
imap <C-Del> <C-O>dw
imap <C-S-Del> <C-O>d$

if has("gui_running")
	imap <C-Z> <C-O>u

	" Powerline settings
	set laststatus=2
	set encoding=utf-8
	let g:Powerline_symbols = 'fancy'

"	colorscheme inkpot
	colorscheme sift

"	set gfn=ProggyCleanTT\ 12
	set gfn=Monospace\ 8

	set lines=35 columns=110
	set guioptions-=T

	" Create new tab (ctrl+n)
	map <silent> <C-N> :tabnew<CR>
	" Save (ctrl+s)
	map <silent> <C-S> :if expand("%") == ""<CR>:browse confirm w<CR>:else<CR>:confirm w<CR>:endif<CR>
	imap <C-S> <C-O><C-S>
	" Open (ctrl+e)
	map <silent> <C-E> :browse confirm e<CR>
	" Open in new tab (ctrl+n+e)
	map <silent> <C-N><C-E> :browse tabnew<CR>
endif

" Add highlighting on functions and classes for C++
function! EnhanceCppSyntax()
	syn match    cCustomParen    "?=(" contains=cParen,cCppParen
	syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
	syn match    cCustomScope    "::"
	syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
	"hi def link cCustomFunc Function
	hi def link cCustomClass Function
endfunction
au Syntax cpp call EnhanceCppSyntax()

" OpenGL syntax highlighting
au FileType c,cpp exec ":source ".$VIMDIR."/syntax/opengl.vim"

" GLSL syntax highlighting
command SetGLSLFileType call SetGLSLFileType()
function SetGLSLFileType()
	for item in getline(1,10)
		if item =~ "#version 400"
			execute ':set filetype=glsl400'
			break
		elseif item =~ "#version 330"
			execute ':set filetype=glsl330'
			break
		else
			execute ':set filetype=glsl'
			break
		endif
	endfor
endfunction
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl SetGLSLFileType
