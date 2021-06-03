#!/bin/sh
sudo apt install rofi qtile awesome alacritty emacs neovim materia-gtk-theme materia-kde lxappearance nerd-fonts-mononoki shell-color-scripts picom nitrogen volumeicon network-manager-applet redshift exa flameshot vifm parcellite blueman xfce4-notifyd xfce4-power-manager python-psutil pavucontrol cmatrix htop auto-cpufreq speedtest-cli optimus-manager acpi_call bbswitch flatpak zsh-syntax-highlighting autojump zsh-autosuggestions python-psutil python-iwlib nerd-fonts-mononoki papirus-icon-theme capitaine-cursors playerctl ibus 
#iBus is for keyboad layout switching

# virt-manager
sudo apt install qemu virt-manager ebtables dnsmasq
sudo systemctl start libvirtd.service virtlogd.service
sudo systemctl enable libvirtd.service
sudo usermod -G libvirt -a ahmed

# Flatpaks
#flatpak install flathub com.microsoft.Teams us.zoom.Zoom 

#Snaps
#sudo systemctl enable --now snapd.socket
#sudo snap install spotify joplin-desktop


#git clone --bare https://github.com/Ahmed-Al-Balochi/dotfiles.git
#config config --local status.showUntrackedFiles no



git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

touch "$HOME/.cache/zshhistory"
#-- Setup Alias in $HOME/zsh/aliasrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

#Finish the conversion by changing your user in /etc/passwd to /bin/zsh instead of /bin/bash
#or typing chsh $USER and entering /bin/zsh

echo "You should Reboot Now"
