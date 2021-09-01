#!/bin/sh

###############################################################
#                   Resource locations                        #
###############################################################

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

export GTK_THEME=Adwaita:dark

###############################################################
#               Inititalize/merge resources                   #
###############################################################

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

###############################################################
#                   Default programs                          #
###############################################################

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

###############################################################
#                   Additional setup                          #
###############################################################

setxkbmap de &           # keyboard layout (german)
start-pulseaudio-x11 &   # audio daemon
dunst &                  # notification manager
picom &                  # compositor
~/.fehbg &               # background image

# dwmblocks &            # statusbar
exec dwm                 # window-manager
