#!/bin/bash

# Easy setup for testing
mkdir ~/.local/share/fonts
cp -R IosevkaTermNerdFontComplete.ttf ~/.local/share/fonts
sudo dnf install $(grep -vE "^\s*#" BSPWM-package-list.txt | tr "\n" " ")
sudo fc-cache -f -v
dbus-launch dconf load / < xed.dconf
