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

for file in $(ls ${SCRIPT}/ssh); do
   #if [ -e "${HOME}/.${file}" ]
   if [ -e "${HOME}/.ssh" ]
   then
      rm -fr ${HOME}/.ssh
   fi
   ln -s ${SCRIPT}/ssh ${HOME}/.ssh
done

for file in $(ls ${SCRIPT}/awesome); do
   #if [ -e "${HOME}/.config/${file}" ]
   if [ -e "${HOME}/.config/awesome" ]
   then
      rm -fr ${HOME}/.config/awesome
   fi
   ln -sf ${SCRIPT}/awesome ${HOME}/.config/awesome
done

for file in $(ls ${SCRIPT}/mpd); do
   #if [ -e "${HOME}/.config/${file}" ]
   if [ -e "${HOME}/.config/mpd" ]
   then
      rm -fr ${HOME}/.config/mpd
   fi
   ln -sf ${SCRIPT}/mpd ${HOME}/.config/mpd
done

for file in $(ls ${SCRIPT}/ncmpcpp); do
   #if [ -e "${HOME}/.config/${file}" ]
   if [ -e "${HOME}/.config/ncmpcpp" ]
   then
      rm -fr ${HOME}/.config/ncmpcpp
   fi
   ln -sf ${SCRIPT}/ncmpcpp ${HOME}/.config/ncmpcpp
done
