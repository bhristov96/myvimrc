set nocompatible
syntax on
set autoindent
set smartindent
set expandtab
set number
set wrap
set scrolloff=10
set hlsearch
set incsearch
set smartcase
set ignorecase

"set foldmethod=marker
"set foldmarker={{{,}}}
set shiftround

set wildmenu
set wildmode=full
set undofile

set linebreak
set ruler

set cursorline
set background=light

set nrformats-=octal
set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set softtabstop=4


cnoreabbrev W w
cnoreabbrev Q q

autocmd BufRead,BufWritePre *.* normal gg=G``

augroup js
	autocmd!
	autocmd Filetype html nnoremap <buffer> <leader>c I<!--<esc>A--><esc>
augroup END

augroup cpp
	autocmd!
	autocmd Filetype cpp nnoremap <buffer> <leader>c I//<esc>
    autocmd Filetype cpp nnoremap <buffer> <leader>u ^df/
augroup END

augroup html
	autocmd!
	autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

augroup vimscript
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

augroup arrowkeys
	noremap <left> <nop>
	noremap <right> <nop>
	noremap <up> <nop>
	noremap <down> <nop>
	inoremap <left> <nop>
	inoremap <right> <nop>
	inoremap <up> <nop>
	inoremap <down> <nop>
	vnoremap <left> <nop>
	vnoremap <right> <nop>
	vnoremap <up> <nop>
	vnoremap <down> <nop>
	nnoremap <left> <nop>
	nnoremap <right> <nop>
	nnoremap <up> <nop>
	nnoremap <down> <nop>
augroup END

function! InsertTabWrapper()
	let ind = col(".")-1
	if !ind || getline(".")[ind - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-n>"
endfunction
	
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
