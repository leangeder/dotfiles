#!/bin/bash

if [ -f /opt/homebrew/bin/brew ]
then
  brew update
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew upgrade && brew cleanup

brew tap homebrew/cask-fonts
brew install --quiet --force --cask alacritty --no-quarantine
brew install --quiet --force --cask rancher font-hack-nerd-font
brew install --quiet --force skaffold kustomize kind vim curl git tmux bash \
  yarn npm python3 node nvm go rustup terraform packer rancher \
  gnupg bash-completion docker-completion

echo $(brew --prefix)/bin/bash | sudo tee -a /private/etc/shells
chpass -s $(brew --prefix)/bin/bash

if ! grep -qF 'source shared/projectx/project.bashrc' $bashrc_file; then
    echo "source shared/projectx/project.bashrc" >> $bashrc_file
fi

sudo mkdir -p /usr/local/bin
sudo chown $USER /usr/local/bin

python3 -m pip install --upgrade pip -q
pip3 install virtualenv

npm cache clean --force
npm install -g n --force
npm install -g yarn --force

# kustomize
kustomize completion bash > ./bashrc/bashrc.d/kustomize

# skaffold
skaffold completion bash > ./bashrc/bashrc.d/skaffold

# kind
kind completion bash > ./bashrc/bashrc.d/kind

# flux
flux completion bash > ./bashrc/bashrc.d/flux

# Command line are from rancher-desktop
# {
  # rancher-desktop
  rdctl completion bash > ./bashrc/bashrc.d/rancher-desktop
  # helm
  helm completion bash > ./bashrc/bashrc.d/helm
  # nerdctl
  nerdctl completion bash > ./bashrc/bashrc.d/nerdctl
# }
 
#
#curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
#
#sudo sh /tmp/get-docker.sh
#
#mkdir -p $HOME/.local/bin
#where=$HOME/.local/bin
#if [ -n "$2" ]; then
#  where=$2
#fi
#
#if [ -f $where/kustomize ]; then
#  echo "A file named $where/kustomize already exists (remove it first)."
#  exit 1
#fi
#
#tmpDir=`mktemp -d`
#if [[ ! "$tmpDir" || ! -d "$tmpDir" ]]; then
#  echo "Could not create temp dir."
#  exit 1
#fi
#
#function cleanup {
#  rm -rf "$tmpDir"
#}
#
#trap cleanup EXIT
#
#pushd $tmpDir >& /dev/null
#
#opsys=windows
#arch=amd64
#if [[ "$OSTYPE" == linux* ]]; then
#  opsys=linux
#elif [[ "$OSTYPE" == darwin* ]]; then
#  opsys=darwin
#fi
#
#curl -m $curl_timeout -s $release_url |\
#  grep browser_download.*${opsys}_${arch} |\
#  cut -d '"' -f 4 |\
#  sort -V | tail -n 1 |\
#  xargs curl -m $curl_timeout -sLO
#
#if [ -e ./kustomize_v*_${opsys}_amd64.tar.gz ]; then
#    tar xzf ./kustomize_v*_${opsys}_amd64.tar.gz
#else
#    echo "Error: kustomize binary with the version ${version#v} does not exist!"
#    exit 1
#fi
#
#curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-${opsys}-amd64
#chmod +x skaffold
#
## curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
## chmod +x kubectl
#
#curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-${opsys}-amd64
#chmod +x minikube
#
#./minikube config set driver docker
#./minikube config set insecure-registry "172.40.11.195"
#./minikube addons enable metrics-server
#./minikube addons enable ingress-dns
#./minikube addons enable default-storageclass
#./minikube addons enable storage-provisioner
#./minikube addons enable pod-security-policy
#./minikube config set kubernetes-version v1.20.7
#
#aws_access_key_id=$(grep "aws_access_key_id" ~/.aws/credentials | tr -d " " |cut -d "=" -f 2 | uniq)
#aws_secret_access_key=$(grep "aws_secret_access_key" ~/.aws/credentials | tr -d " " |cut -d "=" -f 2 | uniq)
#aws_region=$(grep "region" ~/.aws/credentials | tr -d " " |cut -d "=" -f 2 | uniq)
#
#cp ./kustomize $where
## mv ./kubectl $where
#mv skaffold $where
#mv minikube $where
#
#popd >& /dev/null
#export PATH="$HOME/.local/bin:$PATH"
#
#cat <<EOF> $HOME/.dev.sh
#if ! [[ "$PATH" =~ "$HOME/.local/bin:$PATH" ]]
#then
#    PATH="$HOME/.local/bin:$PATH"
#fi
#EOF
#
#
#isInFile=$(cat file.txt | grep -c "string")
#
#
#if [ $(cat $HOME/.bashrc | grep -c "source \$HOME/.dev.sh") -eq 0 ]; then
#   echo "source \$HOME/.dev.sh" >> $HOME/.bashrc
#   echo "alias kubectl=\"$where/minikube kubectl --\"" >> $HOME/.bashrc
#fi
#
#$where/minikube version
#$where/kustomize version
## $where/kubectl version
#$where/skaffold version
#
#echo minikube, kustomize, kubectl, skaffold installed to $where
