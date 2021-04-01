#!/bin/bash
paru -Syu -y
flatpak update -y
./.emacs.d/bin/doom upgrade
