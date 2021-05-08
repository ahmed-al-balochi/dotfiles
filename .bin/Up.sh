#!/bin/sh
printf "\n\t  #### Updating Pacman & AUR Packages ####\n\n"
paru -Syu -y
printf "\n\t  #### Updating Flatpak Packages ####\n\n"
echo " "
flatpak update -y
printf "\n\t  #### Upgrading Doom Emacs  ####\n\n"
./.emacs.d/bin/doom upgrade
