#!/bin/bash

  #          /\          /\
  #         /  \        /  \    Ahmed Al Balochi AKA (AA) configs
  #        / -- \      / -- \   YouTube: https://bit.ly/2DpALov
  #       / ---- \    / ---- \  Github: https://github.com/Ahmed-Al-Balochi/dotfiles.git
  #      /        \  /        \
# My bash config.

#starting utility applications at boot time
parcellite &
#run variety &
nitrogen --restore &
#nmcli c up Ahmed &
nm-applet --indicator &
#run pamac-tray &
#lxqt-powermanagement &
xfce4-power-manager &
#optimus-manager-qt &
#csd-mouse &
numlockx on &
#kdeconnect-indicator &
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
