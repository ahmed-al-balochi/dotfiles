#!/bin/sh

printf "\n\t  #### Setup ####\n\n"
printf " Do you want to start the setup? "
read setupInput
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
printf " Do you want to Download the PKGs? "
read in
y="y"
if [ $in = $y ]
  then
   printf " Downloading PKGs\n"
sudo dnf install rofi awesome kitty neovim materia-gtk-theme lxappearance nitrogen volumeicon network-manager-applet redshift flameshot vifm parcellite blueman xfce4-notifyd xfce4-power-manager pavucontrol cmatrix htop speedtest-cli zsh-syntax-highlighting autojump zsh-autosuggestions papirus-icon-theme playerctl ibus jetbrains-mono-fonts-all.noarch qbittorrent timeshift polkit-gnome 

echo "Installing Codium, Obsidian and Brave"
## Brave
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
## Codium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium brave-browser -y
flatpak install flathub md.obsidian.Obsidian -y
# Not available in apt ==> picom exa auto-cpufreq optimus-manager acpi_call bbswitch chsh ttf-joypixels ttf-all-the-icons
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
sudo dnf install qemu virt-manager ebtables dnsmasq
sudo systemctl start libvirtd.service virtlogd.service
sudo systemctl enable libvirtd.service
sudo usermod -G libvirt -a ahmed
else
   printf " Canceled download for Virt-manager"
fi

### My dotfiles git bare repo
printf "\n\t  #### Downloading and Setting up dotfiles git bare repo  ####\n\n"
printf " Do you want to Download and Set up dotfiles git bare repo? "
read input2
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
else
   printf " Canceled the git bare repo\n"
fi

### Video Production apps 
printf "\n\t  #### Video Production apps ####\n\n"
printf " Do you want to Download Video Production apps? " 
read input3
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
