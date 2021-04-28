#!/bin/sh
echo "  #### Updating Pacman & AUR Packages ####"
echo " "
paru -Syu -y
echo "  #### Updating Flatpak Packages ####\n"
echo " "
flatpak update -y
echo "  #### Upgrading Doom Emacs  ####\n"
echo " "
./.emacs.d/bin/doom upgrade
