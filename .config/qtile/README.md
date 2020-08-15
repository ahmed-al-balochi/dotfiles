To get this qtile wm config working you need to:

1- download qtile using your package manager using the following command for debian/Ubuntu derivatives, sudo apt-get install qtile. 

The command for installing for Arch or an Arch derivative is, sudo pacman -S qtile


2- my congfig has some dependencies that you need to grab/install:

        the command for installing the dependencies for debian/Ubuntu is sudo apt-get install packagename.
        
        the command for installing the dependencies for Arch or an Arch drivitav is, sudo pacman -S packagename

        nitogen
        
        git
        
        conky
        
        nm-applet
        
        xfce4-power-manager
        
        blueberry-tray
        
        picom
        
        volumeicon
        
        variety
        
        rofi
   
3- git clone https://github.com/a7mad98ksa/dotfiles/tree/master/.config/qtile ~/.config/

to download my config and put it in your .config directory or folder.

PS: some of the dependencies might have a diffrent name in your distro of Linux, so if some is not found google the name and you will find it.
