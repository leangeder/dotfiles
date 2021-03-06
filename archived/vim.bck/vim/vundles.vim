" ========================================
" " Vim plugin configuration
" " ========================================
" "
" " This file contains the list of plugin installed using vundle plugin manager.
" " Once you've updated the list of plugin, you can run vundle update by issuing
" " the command :BundleInstall from within vim or directly invoking it from the
" " command line with the following syntax:
" " vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on"
" +BundleClean! +BundleInstall +qall
" " Filetype off is required by vundle
filetype off

set rtp+=$HOME/.vim/plugins/Vundle.vim
set rtp+=$HOME/.vim/modules/ "Submodules

call vundle#begin('$HOME/.vim/plugins')
" YADR's vundles are split up by category into smaller files
" This reduces churn and makes it easier to fork. See
" ~/.vim/config/ to edit them:

"" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

""runtime ruby
runtime ansible
runtime appearance
runtime languages
runtime python
runtime snipperts
runtime static_syntax
runtime git
runtime other
runtime appearance
runtime textobjects
runtime search
runtime project
runtime vim-improvements
runtime themes

" The plugins listed in ~/.vim/.vundles.local will be added here to
" allow the user to add vim plugins to yadr without the need for a fork.
if filereadable(expand("~/.vim/.vundles.local"))
  source ~/.vim/.vundles.local
endif

"Filetype plugin indent on is required by vundle
call vundle#end()
filetype plugin indent on
