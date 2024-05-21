" " Default Settings
" " {
  set foldmethod=indent   " fold based on indent
  " set foldmethod=syntax
  set foldnestmax=9


  set nocompatible
  set redrawtime=10000
  set background=dark
  set laststatus=2
  set noerrorbells
  set tabstop=2 softtabstop=2
  set shiftwidth=2
  set expandtab
  set smartindent
  set nu
  set nowrap
  set nobackup
  set undodir=~/.vim/undordir
  set undofile
  set incsearch
  set relativenumber
  set cursorline

	" Column set to column 100
	set colorcolumn=160
	" highlight ColorColumn ctermbg=1
	highlight ColorColumn ctermbg=3

	" Set internal encoding
  set encoding=utf-8
  set guifont=DroidSansMono\ Nerd\ Font\ 11

	" TextEdit might fail if hidden is not set.
	set hidden

	" Some servers have issues with backup files, see #649.
	set nobackup
	set nowritebackup
	
	" Give more space for displaying messages.
	set cmdheight=2


	" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
	" delays and poor user experience.
	set updatetime=300
	
	" Don't pass messages to |ins-completion-menu|.
	set shortmess+=c
	
	" Always show the signcolumn, otherwise it would shift the text each time
	" diagnostics appear/become resolved.
	if has("nvim-0.5.0") || has("patch-8.1.1564")
	  " Recently vim can merge signcolumn and number column into one
	  set signcolumn=number
	else
	  set signcolumn=yes
	endif
" " }
"

" Settings : coc
" {
    if filereadable(expand(".vim/settings/coc.vim"))
      source .vim/settings/coc.vim
    endif
" }
 
" Settings : prettier
    if filereadable(expand(".vim/settings/prettier.vim"))
      source .vim/settings/prettier.vim
    endif
" }
