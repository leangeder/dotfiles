#!/usr/bin/bash

osis()
{
	local n=0
	if [[ "$1" = "-n" ]]; then n=1;shift; fi

	# echo $OS|grep $1 -i >/dev/null
	uname -s |grep -i "$1" >/dev/null

  # alacritty
  if ! grep -qF "${n,,}.yml" ./alacritty/alacritty.yml; then
			echo -e "include:\n- ${n,,}.yml" >> ./alacritty/alacritty.yml
  fi

  return $(( $n ^ $? ))
}

osis Darwin &&
{
	# log_debug Detect mac osx
  ./setup-darwin.sh
}

osis Linux &&
{
	# log_debug Detect linux
  ./setup-linux.sh
}

# 
# osis -n Cygwin &&
# {
# 	log_debug Not Cygwin
# }

# gpgp
git config --global gpg.program $(command -v gpg)

# golang
mkdir -p /tmp/go
curl -OL https://golang.org/dl/go1.17.7.linux-amd64.tar.gz
tar -C /tmp/go -xvf go1.17.7.linux-amd64.tar.gz
mv /tmp/go/go ${HOME}/.go

# rustlang
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y

if [[ "$(grep ${HOME}/.bashrc.local $HOME/.bashrc)" == "" ]]
then
	# echo ". ${HOME}/.bashrc.local" >> ${HOME}/.bashrc
	# # source ${HOME}/.bashrc
fi
