#!/usr/bin/env sh
SCRIPT="$(dirname $(readlink -f $0))"

for file in $(ls ${SCRIPT}/bashrc); do
   #if [ -e "${HOME}/.${file}" ]
   if [ -e "${HOME}/.${file}" ]
   then
      rm -fr ${HOME}/.${file}
   fi
   ln -s ${SCRIPT}/bashrc/${file} ${HOME}/.${file}
done

for file in $(ls ${SCRIPT}/vim); do
   #if [ -e "${HOME}/.${file}" ]
   if [ -e "${HOME}/.${file}" ]
   then
      rm -fr ${HOME}/.${file}
   fi
   ln -s ${SCRIPT}/vim/${file} ${HOME}/.${file}
done

for file in $(ls ${SCRIPT}/tmux); do
   #if [ -e "${HOME}/.${file}" ]
   if [ -e "${HOME}/.${file}" ]
   then
      rm -fr ${HOME}/.${file}
   fi
   ln -s ${SCRIPT}/tmux/${file} ${HOME}/.${file}
done
