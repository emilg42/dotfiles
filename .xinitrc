#!/bin/sh

###############################################################
# Resource locations
###############################################################
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

###############################################################
# Inititalize/merge resources
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
# Default programs
###############################################################
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

###############################################################
# Additional applications
###############################################################

# keyboard layout
setxkbmap de &

# composition/transparency
picom -co .6 -t -9 -l -9 -r 15 --no-fading-openclose --no-use-damage --xrender-sync-fence --vsync & 

# set background image
~/.fehbg &

# start statusbar
# dwmblocks &

# excute dwm
exec dwm
