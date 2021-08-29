#!/bin/sh


printf "\n\t  #### Downloading PKGs  ####\n\n"
printf " Do you want to Download the PKGs? "
read in
y="y"
if [ $in = $y ]
  then
   printf " Downloading PKGs\n"
yay -S rofi qtile awesome alacritty emacs neovim materia-gtk-theme materia-kde lxappearance shell-color-scripts picom nitrogen volumeicon network-manager-applet redshift exa flameshot vifm parcellite blueman xfce4-notifyd xfce4-power-manager pavucontrol cmatrix htop auto-cpufreq speedtest-cli optimus-manager acpi_call bbswitch flatpak zsh-syntax-highlighting autojump zsh-autosuggestions python-psutil python-iwlib ttf-mononoki papirus-icon-theme capitaine-cursors playerctl ibus chsh kdeconnect
#iBus is for keyboad layout switching
else
   printf " Canceled The Downloads\n"
fi

# virt-manager
printf "\n\t  #### Downloading and Setting up Virt-manager  ####\n\n"
printf " Do you want to Download and Set up Virt-manager? "
read input1
y1="y"
if [ $input1 = $y1 ]
  then
yay -S qemu virt-manager ebtables dnsmasq
sudo systemctl start libvirtd.service virtlogd.service
sudo systemctl enable libvirtd.service
sudo usermod -G libvirt -a ahmed
else
   printf " Canceled download for Virt-manager"
fi

# Flatpaks
#flatpak install flathub com.microsoft.Teams us.zoom.Zoom 

#Snaps
#sudo systemctl enable --now snapd.socket
#sudo snap install spotify joplin-desktop


### My dotfiles git bare repo
printf "\n\t  #### Downloading and Setting up dotfiles git bare repo  ####\n\n"
printf " Do you want to Download and Set up dotfiles git bare repo? "
read input2
y2="y"
if [ $input2 = $y2 ]
  then
   printf " Downloading and Setting up dotfiles git bare repo\n"
git clone --bare https://github.com/Ahmed-Al-Balochi/dotfiles.git
config config --local status.showUntrackedFiles no
else
   printf " Canceled the git bare repo\n"
fi

### Doom Emacs
printf "\n\t  #### Downloading and Setting up Doom Emacs  ####\n\n"
printf " Do you want to Download and Set up Doom Emacs? "
read input3
y3="y"
if [ $input3 = $y3 ]
  then
   printf " Downloading Doom Emacs\n"
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
else
   printf " Canceled the Download for Doom Emacs\n"
fi


### Zsh
printf "\n\t  #### Downloading and Setting up Zsh  ####\n\n"
printf " Do you want to Download and Set up Zsh? "
read input4
y4="y"
if [ $input4 = $y4 ]
  then
   printf " Setting Zsh\n"
touch "$HOME/.cache/zshhistory"
#-- Setup Alias in $HOME/zsh/aliasrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

#Finish the conversion by changing your user in /etc/passwd to /bin/zsh instead of /bin/bash
#or typing chsh $USER and entering /bin/zsh
chsh
echo "You should Reboot Now"

else
   printf " Canceled Setting up Zsh\n"
fi
