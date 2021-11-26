local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    music = 'spotify',
    terminal = 'kitty',
    rofi = rofi_command,
    lock = 'i3lock-fancy-multimonitor',
    quake = 'terminator',
    screenshot = 'flameshot screen -p ~/Pictures',
    region_screenshot = 'flameshot gui -p ~/Pictures',
    browser = 'firefox',
    backup = "timeshift-launcher",
    editor = 'emacs', -- gui text editor
    social_1 = 'teams',
    social_2 = 'zoom',
    torrent = 'qbittorrent',
    audioControl = 'pavucontrol',
    writer = 'libreoffice',
    vifm = 'alacritty -e vifm',
    timeshift = 'timeshift-launcher',
    dolphin = 'dolphin',
    files = 'nemo',
    VM = "virt-manager",
    screenSetter = "arandr",
    calc = "gnome-calculator",
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    '(conky -c $HOME/.config/qtile/scripts/system-overview)',
    'parcellite', --clipboad application
    'csd-mouse',  --cinammon mouse app
    'optimus-manager-qt',  -- an app for switching between integrated gpu and nvidia gpu
    'picom --experimental-backends ',-- .. filesystem.get_configuration_dir() .. '~/.config/picom/picom.conf', --'/configuration/picom.conf',
    'compton ',-- .. filesystem.get_configuration_dir() .. '~/.config/picom/picom.conf', --'/configuration/picom.conf',
    'nm-applet --indicator', -- wifi
    'volumeicon', -- shows an audiocontrol applet in systray when installed.
    --'blueberry-tray', -- Bluetooth tray icon
    'numlockx on', -- enable numlock
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    'xfce4-power-manager', -- Power manager
     'flameshot',
    'nitrogen --restore',
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}
