#!/bin/bash

  #          /\          /\
  #         /  \        /  \    Ahmed Al Balochi AKA (AA) configs
  #        / -- \      / -- \   YouTube: https://bit.ly/2DpALov
  #       / ---- \    / ---- \  Github: https://github.com/Ahmed-Al-Balochi/dotfiles.git
  #      /        \  /        \


#starting utility applications at login time

#makes sure that no duplicate programs are running when reloading
killall parcellite nitrogen nm-applet xfce4-power-manager numlockx picom /usr/lib/xfce4/notifyd/xfce4-notifyd flameshot volumeicon

#Clipboard manager
parcellite &
#run wallpaper setter
nitrogen --restore &
#network manager
nm-applet --indicator &
#power manager
xfce4-power-manager &
#numlock program
numlockx on &
#compositor
picom &
#polkit "sudo for GUI"
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & # this for Arch
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & # this for Ubuntu
#notification manager
/usr/lib/xfce4/notifyd/xfce4-notifyd &
#/usr/lib/polkit-kde-authentication-agent-1 &
#screenshot program
flameshot &
#keyboard layout setter
ibus start &
#volume setter
volumeicon &
