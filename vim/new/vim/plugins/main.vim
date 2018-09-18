filetype off
set rtp+=$HOME/.vim/plugins/download/Vundle.vim
set rtp+=$HOME/.vim/plugins/settings/

call vundle#begin('$HOME/.vim/plugins/download')

  "" let Vundle manage Vundle (required)
  Plugin 'VundleVim/Vundle.vim'

  runtime common
  runtime js
  " runtime golang
  " runtime rustlang
  " runtime python

call vundle#end()
filetype plugin indent on  
