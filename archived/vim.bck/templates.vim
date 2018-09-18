augroup templates
  au!
  let currentname = expand("<afile>")
  let currentext = expand("<afile>:e")
  " read Makefile in template files
  autocmd BufNewFile *.* execute '0r $HOME/.vim/templates/' . currentext . '/skeleton.Makefile'
  " parse special text in the templates after the read
  autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
  " Save file on current folder
  autocmd BufNewFile * :saveas! Makefile

  " read Dockerfile in template files
  autocmd BufNewFile * execute '0r $HOME/.vim/templates/' . currentext . '/skeleton.Dockerfile'
  " parse special text in the templates after the read
  autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
  " Save file on current folder
  autocmd BufNewFile * :saveas! Dockerfile

  
  autocmd BufNewFile * execute '1,$d'
  autocmd BufNewFile * execute 'saveas ' . currentname
augroup END
