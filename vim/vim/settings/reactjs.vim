" vi: ft=vim

" Plugin List
" {
    " ReactJS
    Plugin 'pangloss/vim-javascript'
    Plugin 'mxw/vim-jsx'
    Plugin 'mhartington/oceanic-next'
" }

" Settings
" {
"
    augroup jsx
      autocmd!

      " Show by default 4 spaces for a tab
      autocmd BufNewFile,BufRead *.jsx setlocal noexpandtab tabstop=4 shiftwidth=4
    
      autocmd FileType jsx nested :TagbarOpen
    
      autocmd FileType jsx nested :set termguicolors
      autocmd FileType jsx nested :let g:oceanic_next_terminal_bold = 1
      autocmd FileType jsx nested :let g:oceanic_next_terminal_italic = 1

      autocmd FileType jsx nested :colorscheme OceanicNext
    augroup END
" }
