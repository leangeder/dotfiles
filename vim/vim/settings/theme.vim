" Syntax highlighting
syntax on

" Material Nord color schemes
" {
    colorscheme nord
    let g:nord_cursor_line_number_background = 1
    let g:nord_uniform_status_lines = 0
    let g:nord_bold_vertical_split_line = 1
    let g:nord_uniform_diff_background = 0
    let g:nord_bold = 1
    let g:nord_italic = 1
    let g:nord_italic_comments = 1
    let g:nord_underline = 1
    let g:nord_lightline_support = 1
    let g:lightline = {'colorscheme': 'nord'}
    augroup nord-overrides
      autocmd!
      autocmd ColorScheme nord highlight Comment ctermfg=red
      " autocmd ColorScheme nord highlight Visual ctermfg=red
      " autocmd ColorScheme nord highlight CursorLine ctermfg=red
    augroup END
    " let s:p.normal.left = [[ s:nord4, s:nord3, 'bold' ], [ s:nord4, s:nord1 ]]
    " let s:p.normal.middle = [[ s:nord4, s:nord1 ]]
    " let s:p.normal.right = [[ s:nord4, s:nord3 ]]
" }

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
