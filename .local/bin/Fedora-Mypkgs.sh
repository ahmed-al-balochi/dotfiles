#!/bin/sh

### input first ###
printf " Do you want to start the setup? "
read setupInput

printf " Do you want to Download the PKGs? "
read in

printf " Do you want to Download and Set up Virt-manager? "
read input1

printf " Do you want to Download and Set up dotfiles git bare repo? "
read input2

printf " Do you want to Download Video Production apps? " 
read input3

printf " Do you want to Download and Set up Zsh? "
read input4

printf "\n\t  #### Setup ####\n\n"
yes="y"
if [ $setupInput = $yes ]
  then
   printf " Setting up fastes mirrors...\n"
echo "fastestmirror=1" >> /etc/dnf/dnf.conf 
echo "Adding RPM free and nonfree repos... \n"
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
echo "Adding flatpak flathub... \n"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

else
   printf " Canceled Setup"
fi

printf "\n\t  #### Downloading PKGs  ####\n\n"
y="y"
if [ $in = $y ]
  then
   printf " Downloading PKGs\n"
sudo dnf install rofi awesome kitty neovim materia-gtk-theme lxappearance nitrogen volumeicon network-manager-applet redshift flameshot vifm parcellite blueman xfce4-notifyd xfce4-power-manager pavucontrol cmatrix htop speedtest-cli zsh-syntax-highlighting autojump zsh-autosuggestions papirus-icon-theme playerctl ibus jetbrains-mono-fonts-all.noarch qbittorrent timeshift polkit-gnome picom nvidia-xconfig exa

echo "Installing Codium, Obsidian and Brave"
flatpak install flathub md.obsidian.Obsidian -y
# Not available in apt ==> picom exa auto-cpufreq optimus-manager acpi_call bbswitch chsh ttf-joypixels ttf-all-the-icons
#iBus is for keyboad layout switching
else
   printf " Canceled The Downloads\n"
fi

# virt-manager
printf "\n\t  #### Downloading and Setting up Virt-manager  ####\n\n"
y1="y"
if [ $input1 = $y1 ]
  then
sudo dnf install qemu virt-manager ebtables dnsmasq
sudo systemctl start libvirtd.service virtlogd.service
sudo systemctl enable libvirtd.service
sudo usermod -G libvirt -a ahmed
else
   printf " Canceled download for Virt-manager"
fi

### My dotfiles git bare repo
printf "\n\t  #### Downloading and Setting up dotfiles git bare repo  ####\n\n"
y2="y"
if [ $input2 = $y2 ]
  then
   printf " Downloading and Setting up dotfiles git bare repo\n"
git clone https://github.com/Ahmed-Al-Balochi/dotfiles.git ~/Downloads/dotfiles.git
cp -rf ~/Downloads/dotfiles.git/.* ~/
printf "Downloading and Setting up Git bare repo"
git clone --bare https://github.com/Ahmed-Al-Balochi/dotfiles.git ~/bareDotfiles
cd ~/bareDotfiles
echo "config config --local status.showUntrackedFiles no"
config add .bashrc .zshrc .config/awesome .config/alacritty .config/bspwm .config/kitty .config/nitrogen .config/picom .config/picom .config/polybar .config/qtile .config/rofi .config/sxhkd .local/bin/Arch-Mypkgs.sh .local/bin/Fedora-Mypkgs.sh .local/bin/Ubuntu-Mypkgs.sh .local/bin/BSPWM-install.sh .local/bin/BSPWM-package-list.txt .local/bin/IosevkaTermNerdFontComplete.ttf .config/obs-studio README.md LICENSE
else
   printf " Canceled the git bare repo\n"
fi

### Video Production apps 
printf "\n\t  #### Video Production apps ####\n\n"
y3="y"
if [ $input3 = $y3 ]
  then
   printf " Downloading Video Production apps\n"
sudo dnf install kdenlive obs-studio
else
   printf " Canceled the Download for Video Production apps\n"
fi


### Zsh
printf "\n\t  #### Downloading and Setting up Zsh  ####\n\n"
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
