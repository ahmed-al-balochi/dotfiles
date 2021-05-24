#!/bin/sh
printf "\n\t  #### Updating Pacman & AUR Packages ####\n\n"
paru -Syu -y
##printf "\n\t  #### Updating Flatpak Packages ####\n\n"
##echo " "
##flatpak update -y
printf "\n\t  #### Upgrading Doom Emacs  ####\n\n"
printf " Do you want to upgrade Doom Emacs? "
read input
y="y"
if [ $input = $y ]
  then
   printf " upgrading for Doom Emacs\n"
   ./.emacs.d/bin/doom upgrade
else
   printf " Canceled upgrade for Doom Emacs\n"
fi
