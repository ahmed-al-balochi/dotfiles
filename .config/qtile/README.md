Installation

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


Keybindings


These are the keybindings for qtile.

  
A FEW IMPORTANT KEYBINDINGS
ASSOCIATED ACTION

MODKEY is the windows key on your keyboard.

RETURN is the Enter key on your keyboard.


MODKEY + x
opens terminal (alacritty is the terminal but can be easily changed)

  
MODKEY + SHIFT + RETURN
opens run launcher (dmenu is the run launcher but can be easily changed)

  
MODKEY + TAB
rotates through the available layouts

  
MODKEY + q
closes window with focus

  
MODKEY + SHIFT + r
restarts qtile

  
MODKEY + SHIFT + q
quits qtile

  
MODKEY + 1-9
switch focus to workspace (1-9)

  
MODKEY + SHIFT + 1-9
send focused window to workspace (1-9)

  
MODKEY + j
lazy layout up (switches focus between windows in the stack)

  
MODKEY + k
lazy layout down (switches focus between windows in the stack)

  
MODKEY + SHIFT + j
lazy layout shuffle_up (rotates the windows in the stack)

  
MODKEY + SHIFT + k
lazy layout shuffle_down (rotates the windows in the stack)

  
MODKEY + h
expand size of window (MondadTall layout)

  
MODKEY + l
shrink size of window (MondadTall layout)

  
MODKEY + w
switch focus to monitor 1

  
MODKEY + e
switch focus to monitor 2

  
MODKEY + r
switch focus to monitor 3

  
MODKEY + period
switch focus to next monitor

  
MODKEY + comma
switch focus to prev monitor
