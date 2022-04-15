#!/bin/sh

# Set Xressources
# {
	if [ -f ~/.Xresources ]
	then
		xrdb -load ~/.Xresources
		# xrdb -load ~/.Xresources
	fi

	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f

	if [ -f ~/.xmodmaprc ]
	then
		xmodmap ~/.xmodmaprc
	fi
# }

# # Auto Manage Dual Monitor
# # {
# 	SCREEN_ONE="eDP-1"
# 	DEFAULT_BRIGHTNESS="0.7"
# 	xrandr --auto
# 	if [ "X$(xrandr --listmonitors | grep -v Monitor | cut -d \  -f 6 | wc -l )" != "X1" ]
# 	then
# 		SCREEN_TWO=$(xrandr --listmonitors | grep -v Monitor | cut -d \  -f 6 | grep -v eDP-1)
# 		xrandr --output ${SCREEN_ONE} --primary
# 		xrandr --output ${SCREEN_TWO} --right-of ${SCREEN_ONE}
# 	fi
# # }

# exec awesome

# exec xautolock -detectsleep -time 3 -locker "i3lock -d -c 000070" -notify 30 -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'"
#
if [ ! -f ~/.config/mpd/pid ]
then
	mpd > /dev/null 2>&1 &
fi

if [ ! -f /tmp/vault_agent.pid ]
then
	vault agent -config=$HOME/works/vault_agent.hcl > /dev/null 2>&1 &
fi
 
urxvtd -q -o -f > /dev/null 2>&1 & # urxvt daemon
firefox > /dev/null 2>&1 &
chromium-browser > /dev/null 2>&1 &
slack > /dev/null 2>&1 &
syncthing > /dev/null 2>&1 &
urxvtc > /dev/null 2>&1 &
redshift > /dev/null 2>&1 &
xrandr --output HDMI-2 --left-of eDP-1
