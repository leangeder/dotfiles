#!/usr/bin/bash
# common
LOCAL_PATH="/usr/local"
LOCAL_BIN="${LOCAL_PATH}/bin"

# package
sudo apt install -y vim ripgrep python3 python3-pip nodejs npm \
	tmux htop pass podman qemu qemu-kvm dmenu xdotool mpv \
	keepassxc awesome-extra lightdm pulseaudio pulsemixer \
	git software-properties-common gnupg2 curl ca-certificates \
	packer ansible apt-transport-https

# kind
sudo curl -Lo ${LOCAL_BIN}/kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
sudo chmod +x ${LOCAL_BIN}/kind

# fonts
mkdir -p ~/.local/share/fonts
curl -fLo "${HOME}/.local/share/fonts/Droid Sans Mono for Powerline Nerd Font Complete.otf" \
	"https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf"
fc-cache -fv
sudo fc-cache -fv
fc-match "DroidSansMono Nerd Font"
exit 0

# python3
python3 -m pip install --upgrade pixmaps
pip3 install virtualenv

# node
sudo npm install -g n
sudo npm install -g yarn

# pass
sudo ln -fs /usr/share/doc/pass/examples/dmenu/passmenu /usr/bin/passmenu

# awesome
sudo apt install -y amixer dmenu librewolf mpc mpd scrot unclutter xbacklight xsel slock
if [ -d ${HOME}/.config/awesome ]
then
	cd ${HOME}/.config/awesome
	git fetch
	git checkout -- ${HOME}/.config/awesome
	cd $HOME
else
	git clone --recurse-submodules --remote-submodules --depth 1 -j 2 https://github.com/lcpz/awesome-copycats.git ${HOME}/.config/awesome
fi
cp $HOME/.config/awesome/rc.lua.template $HOME/.config/awesome/rc.lua
sed -i "s/urxvtc/alacritty/g" $HOME/.config/awesome/rc.lua
sed -i "s/librewolf/vimb/g" $HOME/.config/awesome/rc.lua

# alacritty
sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
rm -rf /tmp/alacritty
git clone https://github.com/alacritty/alacritty.git /tmp/alacritty
cd /tmp/alacritty
cargo build --release --no-default-features --features=x11
sudo cp target/release/alacritty ${LOCAL_BIN}
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator ${LOCAL_BIN}/alacritty 50 --force
# sudo update-alternatives --config x-terminal-emulator
cd $HOME

# vimb
sudo apt install -y libgtk-3-dev libwebkit2gtk-4.0-dev
rm -rf /tmp/vimb
git clone https://github.com/fanglingsu/vimb.git /tmp/vimb
cd /tmp/vimb
make 
sudo make install
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser ${LOCAL_BIN}/vimb 30 --force
# sudo update-alternatives --config x-www-browser 
cd $HOME

# terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
