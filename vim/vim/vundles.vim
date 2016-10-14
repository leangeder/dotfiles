" ========================================
" " Vim plugin configuration
" " ========================================
" "
" " This file contains the list of plugin installed using vundle plugin
" manager.
" " Once you've updated the list of plugin, you can run vundle update by
" issuing
" " the command :BundleInstall from within vim or directly invoking it from
" the
" " command line with the following syntax:
" " vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on"
" +BundleClean! +BundleInstall +qall
" " Filetype off is required by vundle
filetype off

set rtp+=~/.vim/vundles/Vundle.vim
set rtp+=~/.vim/vundles/ "Submodules
call vundle#begin('~/.vim/plugins')

" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

" YADR's vundles are split up by category into smaller files
" This reduces churn and makes it easier to fork. See
" ~/.vim/config/ to edit them:
runtime ruby
runtime languages
runtime ansible
runtime git
runtime appearance
runtime textobjects
runtime search
runtime project
runtime vim-improvements

" The plugins listed in ~/.vim/.vundles.local will be added here to
" allow the user to add vim plugins to yadr without the need for a fork.
if filereadable(expand("~/.vim/.vundles.local"))
  source ~/.vim/.vundles.local
endif

"Filetype plugin indent on is required by vundle
call vundle#end()
filetype plugin indent on
