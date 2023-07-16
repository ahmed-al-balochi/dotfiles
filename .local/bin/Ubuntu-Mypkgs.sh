#!/bin/sh

# Taking input first to finish the setup
printf " Do you want to Download the PKGs? "
read PKG_INPUT

printf " Do you want to Download and Set up Virt-manager? "
read VIRT_INPUT 

printf " Do you want to Download and Set up dotfiles git bare repo? "
read DOTFILES_INPUT

printf " Do you want to Download and Set up Zsh? "
read ZSH_INPUT 

# PKGs download and setup
PKG_ANSWER="y"
if [ $PKG_INPUT = $PKG_ANSWER ]
  then
   printf " Downloading PKGs\n"
sudo apt install rofi awesome kitty neovim materia-gtk-theme \
lxappearance nitrogen volumeicon-alsa network-manager-gnome  \
redshift flameshot vifm parcellite blueman xfce4-notifyd     \
xfce4-power-manager pavucontrol cmatrix htop speedtest-cli   \
zsh-syntax-highlighting autojump zsh-autosuggestions         \
papirus-icon-theme playerctl ibus fonts-jetbrains-mono       \
qbittorrent timeshift -y

#iBus is for keyboad layout switching

else
   printf " Canceled The Downloads\n"
fi

# virt-manager for QEMU management
VIRT_ANSWER="y"
if [ $VIRT_INPUT = $VIRT_ANSWER ]
  then
printf "\n\t  #### Downloading and Setting up Virt-manager  ####\n\n"
sudo apt install qemu virt-manager ebtables dnsmasq -y
sudo systemctl start libvirtd.service virtlogd.service
sudo systemctl enable libvirtd.service
sudo usermod -G libvirt -a ahmed
else
   printf " Canceled download for Virt-manager"
fi

# Flatpaks
#flatpak install flathub com.microsoft.Teams us.zoom.Zoom 


### My dotfiles git bare repo
DOTFILES_ANSWER="y"
if [ $DOTFILES_INPUT = $DOTFILES_ANSWER ]
  then
   printf " Downloading and Setting up dotfiles git bare repo\n"
git clone https://github.com/Ahmed-Al-Balochi/dotfiles.git ~/Downloads/dotfiles.git
cp -rf ~/Downloads/dotfiles.git/.* ~/
printf "Downloading and Setting up Git bare repo"
git clone --bare https://github.com/Ahmed-Al-Balochi/dotfiles.git ~/bareDotfiles
cd ~/bareDotfiles
echo "config config --local status.showUntrackedFiles no"
config add .bashrc .zshrc .config/awesome .config/alacritty \ 
.config/bspwm .config/kitty .config/nitrogen .config/picom  \ 
.config/picom .config/polybar .config/qtile .config/rofi    \
.config/sxhkd .local/bin/Arch-Mypkgs.sh                     \
.local/bin/Fedora-Mypkgs.sh .local/bin/Ubuntu-Mypkgs.sh     \
.local/bin/BSPWM-install.sh .local/bin/BSPWM-package-list.txt \
.local/bin/IosevkaTermNerdFontComplete.ttf .config/obs-studio \
README.md LICENSE

else
   printf " Canceled the git bare repo\n"
fi

### Zsh
ZSH_ANSWER="y"
if [ $ZSH_INPUT  = $ZSH_ANSWER ]
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
