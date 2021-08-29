#!/bin/bash

  #          /\          /\
  #         /  \        /  \    Ahmed Al Balochi AKA (AA) configs
  #        / -- \      / -- \   YouTube: https://bit.ly/2DpALov
  #       / ---- \    / ---- \  Github: https://github.com/Ahmed-Al-Balochi/dotfiles.git
  #      /        \  /        \
# My bash config.

#Set your native resolution IF it does not exist in xrandr
#More info in the script
#run $HOME/.config/qtile/scripts/set-screen-resolution-in-virtualbox.sh

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS-0 --mode 1366x768 --output HDMI-0 --mode 1920x1080 --left-of LVDS-0
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off

## to restore my trackpad settings
#lxqt-config-input --load-touchpad

#Some ways to set your wallpaper besides variety or nitrogen
#feh --bg-fill ~/Pictures/wallpapers-master/981858.png &
#start the conky to learn the shortcuts
(conky -c $HOME/.config/qtile/scripts/system-overview) &

#starting utility applications at boot time
parcellite &
#run variety &
nitrogen --restore &
#nmcli c up Ahmed &
nm-applet --indicator &
#run pamac-tray &
#lxqt-powermanagement &
xfce4-power-manager &
optimus-manager-qt &
csd-mouse &
#numlockx on &
kdeconnect-indicator &
blueman-tray &
redshift &
i3lock-fancy-multimoniter &
xautolock &
## to have blur effects you need to install picom tryone from git
picom &
#picom --config $HOME/.config/qtile/scripts/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & # this for Arch
#/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & # this for Ubuntu
/usr/lib/xfce4/notifyd/xfce4-notifyd &
#/usr/lib/polkit-kde-authentication-agent-1 &
#starting user applications at boot time
volumeicon &
flameshot &
