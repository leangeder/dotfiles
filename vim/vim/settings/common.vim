"
" Plugin List
" {
    " Real-time completion (Neovim and Vim 8):
    if has('nvim')
      Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plugin 'Shougo/deoplete.nvim'
      Plugin 'roxma/nvim-yarp'
      Plugin 'roxma/vim-hug-neovim-rpc'
    endif
    let g:deoplete#enable_at_startup = 1
    
    " Display source code navigation in a sidebar:
    Plugin 'majutsushi/tagbar'
    
    " Snippets
    Plugin 'Shougo/neosnippet.vim'
    Plugin 'Shougo/neosnippet-snippets'







    " Plugin key-mappings.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)
    
    " SuperTab like snippets behavior.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    "imap <expr><TAB>
    " \ pumvisible() ? "\<C-n>" :
    " \ neosnippet#expandable_or_jumpable() ?
    " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    
    " For conceal markers.
    if has('conceal')
      set conceallevel=2 concealcursor=niv
    endif







    
    " Interactive |:GoDecls| and |:GoDeclsDir|
    Plugin 'ctrlpvim/ctrlp.vim'
    
    " Color
    " Plugin 'tomasr/molokai'
    Plugin 'tyrannicaltoucan/vim-quantum'
" }

" General
" {
    set nocompatible                " Enables us Vim specific features
    filetype off                    " Reset filetype detection first ...
    filetype plugin indent on       " ... and enable filetype detection
    set ttyfast                     " Indicate fast terminal conn for faster redraw
    set ttymouse=xterm2             " Indicate terminal type for mouse codes
    set ttyscroll=3                 " Speedup scrolling
    set laststatus=2                " Show status line always
    set encoding=utf-8              " Set default encoding to UTF-8
    set autoread                    " Automatically read changed files
    set autoindent                  " Enabile Autoindent
    set backspace=indent,eol,start  " Makes backspace key more powerful.
    set incsearch                   " Shows the match while typing
    set hlsearch                    " Highlight found searches
    " set noerrorbells                " No beeps
    set noerrorbells visualbell t_vb=
    set number                      " Show line numbers
    set showcmd                     " Show me what I'm typing
    set noswapfile                  " Don't use swapfile
    set nobackup                    " Don't create annoying backup files
    set splitright                  " Vertical windows should be split to right
    set splitbelow                  " Horizontal windows should split to bottom
    set autowrite                   " Automatically save before :next, :make etc.
    set hidden                      " Buffer should still exist if window is closed
    set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
    set noshowmatch                 " Do not show matching brackets by flickering
    set noshowmode                  " We show the mode with airline or lightline
    set ignorecase                  " Search case insensitive...
    set smartcase                   " ... but not it begins with upper case
    set completeopt=menu,menuone    " Show popup menu, even if there is one entry
    set pumheight=10                " Completion window max size
    set nocursorcolumn              " Do not highlight column (speeds up highlighting)
    set nocursorline                " Do not highlight cursor (speeds up highlighting)
    set lazyredraw                  " Wait to redraw

    " Enable to copy to clipboard for operations like yank, delete, change and put
    " http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
    if has('unnamedplus')
      set clipboard^=unnamed
      set clipboard^=unnamedplus
    endif
    
    " This enables us to undo files even if you exit Vim.
    if has('persistent_undo')
      set undofile
      set undodir=~/.vim/.undo
    endif
    
    " Colorscheme
    syntax enable
    " set t_Co=256
    " let g:rehash256 = 1
    " let g:molokai_original = 1
    " colorscheme molokai

" }

" " Mappings
" " {
"     " Set leader shortcut to a comma ','. By default it's the backslash
"     let mapleader = ","
"     
"     " Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
"     " quickfix window with <leader>a
"     map <C-n> :cnext<CR>
"     map <C-m> :cprevious<CR>
"     nnoremap <leader>a :cclose<CR>
"     
"     " Visual linewise up and down by default (and use gj gk to go quicker)
"     noremap <Up> gk
"     noremap <Down> gj
"     noremap j gj
"     noremap k gk
"     
"     " Search mappings: These will make it so that going to the next one in a
"     " search will center on the line it's found in.
"     nnoremap n nzzzv
"     nnoremap N Nzzzv
"     
"     " Act like D and C
"     nnoremap Y y$
"     
"     " Enter automatically into the files directory
"     autocmd BufEnter * silent! lcd %:p:h
" " }
