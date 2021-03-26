# -*- coding: utf-8 -*-
#          /\          /\         
#         /  \        /  \    Ahmed Al Balochi AKA (AA) configs    
#        / -- \      / -- \   YouTube: https://bit.ly/2DpALov
#       / ---- \    / ---- \  Github: https://github.com/Ahmed-Al-Balochi/dotfiles.git  
#      /        \  /        \
# My Qtile Config.
# 
# The following comments are the copyright and licensing information from the default
# qtile config. Copyright (c) 2010 Aldo Cortesi, 2010, 2014 dequis, 2012 Randall Ma,
# 2012-2014 Tycho Andersen, 2012 Craig Barnes, 2013 horsik, 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this
# software and associated documentation files (the "Software"), to deal in the Software
# without restriction, including without limitation the rights to use, copy, modify,
# merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be included in all copies
# or substantial portions of the Software.

##### IMPORTS #####
import os
import re
import socket
import subprocess
from libqtile import qtile
from libqtile.config import Key, Screen, Group, Drag, Click, Match, Screen
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
from typing import List  # noqa: F401
import arcobattery

##### DEFINING SOME VARIABLES #####
myTerm = "alacritty"                             # My terminal of choice
browser = "firefox"
office = "libreoffice"
Music = "spotify"
fileManager = "nemo"
altFileManager = "dolphin"
torrent = "qbittorrent"
backup = "timeshift-launcher"
sound = "pavucontrol"
editor = "emacs"
screenShotApp = "flameshot gui"
lockscreen = "i3lock-fancy-multimonitor"
meetingApp1 = "com.microsoft.Teams"
meetingApp2 = "us.zoom.Zoom"
VM = "virt-manager"
### other important stuff
mod = "mod4"                                     # Sets mod key to SUPER/WINDOWS
mod2 = "mod2"                                     # Sets mod key to SUPER/WINDOWS
myConfig = "/home/ahmed/.config/qtile/config.py"    # The Qtile config file location
home = os.path.expanduser('~')

##### KEYBINDINGS #####
keys = [
         ### The essentials
         Key(
             [mod], "x",
             lazy.spawn(myTerm+ " -e zsh"),
             desc='Launches My Terminal With Zsh Shell'
             ),
         Key(
             [mod, "shift"], "Return",
             lazy.spawn("rofi -show run 'Run: '"),
             desc='rofi Run Launcher'
             ),
         Key(
             [mod], "Tab",
             lazy.next_layout(),
             desc='Toggle through layouts'
             ),
         Key(
             [mod], "q",
             lazy.window.kill(),
             desc='Kill active window'
             ),
         Key(
             []
             ,"Cancel", ## a shortcut specific to my Keyboard
             lazy.window.kill(),
             desc='Kill active window'
             ),
         Key(
             [mod, "shift"], "s",
             lazy.spawn("qt-logout"),
             desc='qt-logout'
             ),
        Key(
             [mod, "shift"], "r",
             lazy.restart(),
             desc='Restart Qtile'
             ),
         Key(
             [mod, "shift"], "q",
             lazy.shutdown(),
             desc='Shutdown Qtile'
             ),
         Key(
             [mod, "mod1"], "s",
             lazy.spawn(lockscreen),
             desc='lockscreen'
             ),
        # INCREASE/DECREASE/MUTE VOLUME
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 5%+")),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),

         ### Switch focus to specific monitor (out of three)
         Key([mod], "w",
             lazy.to_screen(0),
             desc='Keyboard focus to monitor 1'
             ),
         Key([mod], "e",
             lazy.to_screen(1),
             desc='Keyboard focus to monitor 2'
             ),
         Key([mod], "r",
             lazy.to_screen(2),
             desc='Keyboard focus to monitor 3'
             ),
         ### Switch focus of monitors
         Key([mod], "period",
             lazy.next_screen(),
             desc='Move focus to next monitor'
             ),
         Key([mod], "comma",
             lazy.prev_screen(),
             desc='Move focus to prev monitor'
             ),
         ### Treetab controls
         Key([mod, "control"], "k",
             lazy.layout.section_up(),
             desc='Move up a section in treetab'
             ),
         Key([mod, "control"], "j",
             lazy.layout.section_down(),
             desc='Move down a section in treetab'
             ),
         ### Window controls
         Key(
             [mod], "k",
             lazy.layout.down(),
             desc='Move focus down in current stack pane'
             ),
         Key(
             [mod], "j",
             lazy.layout.up(),
             desc='Move focus up in current stack pane'
             ),
         Key(
             [mod, "shift"], "k",
             lazy.layout.shuffle_down(),
             desc='Move windows down in current stack'
             ),
         Key(
             [mod, "shift"], "j",
             lazy.layout.shuffle_up(),
             desc='Move windows up in current stack'
             ),
         Key(
             [mod], "h",
             lazy.layout.grow(),
             lazy.layout.increase_nmaster(),
             desc='Expand window (MonadTall), increase number in master pane (Tile)'
             ),
         Key(
             [mod], "l",
             lazy.layout.shrink(),
             lazy.layout.decrease_nmaster(),
             desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
             ),
         Key(
             [mod], "n",
             lazy.layout.normalize(),
             desc='normalize window size ratios'
             ),
         Key(
             [mod], "m",
             lazy.layout.maximize(),
             desc='toggle window between minimum and maximum sizes'
             ),
         Key(
             [mod, "shift"], "f",
             lazy.window.toggle_floating(),
             desc='toggle floating'
             ),
         ### Stack controls
         Key(
             [mod, "shift"], "space",
             lazy.layout.rotate(),
             lazy.layout.flip(),
             desc='Switch which side main pane occupies (XmonadTall)'
             ),
         Key(
             [mod], "space",
             lazy.layout.next(),
             desc='Switch window focus to other pane(s) of stack'
             ),
         Key(
             [mod, "control"], "Return",
             lazy.layout.toggle_split(),
             desc='Toggle between split and unsplit sides of stack'
             ),
         ### Dmenu scripts launched with ALT + CTRL + KEY
         Key(
             ["mod1", "control"], "e",
             lazy.spawn("./.dmenu/dmenu-edit-configs.sh"),
             desc='Dmenu script for editing config files'
             ),
         Key(
             ["mod1", "control"], "m",
             lazy.spawn("./.dmenu/dmenu-sysmon.sh"),
             desc='Dmenu system monitor script'
             ),
         Key(
             ["mod1", "control"], "p",
             lazy.spawn("passmenu"),
             desc='Passmenu'
             ),
         Key(
             ["mod1", "control"], "r",
             lazy.spawn("./.dmenu/dmenu-reddio.sh"),
             desc='Dmenu reddio script'
             ),
         Key(
             ["mod1", "control"], "s",
             lazy.spawn("./.dmenu/dmenu-surfraw.sh"),
             desc='Dmenu surfraw script'
             ),
         Key(
             ["mod1", "control"], "t",
             lazy.spawn("./.dmenu/dmenu-trading.sh"),
             desc='Dmenu trading programs script'
             ),
         Key(
             ["mod1", "control"], "i",
             lazy.spawn("./.dmenu/dmenu-scrot.sh"),
             desc='Dmenu scrot script'
             ),
         ### My applications launched with SUPER + ALT + KEY
         Key(
             [mod, "mod1"], "v",
             lazy.spawn(VM),
             desc='Run VM manager'
             ),
         Key(
             []
             ,"XF86Mail", ## a shortcut specific to my Keyboard
             lazy.spawn(meetingApp1),
             desc='Run Meeting App 1'
             ),
         Key(
             []
             ,"XF86Tools", ## a shortcut specific to my Keyboard
             lazy.spawn(Music),
             desc='Run Music Player'
             ),
         Key(
             [mod, "mod1"], "m",
             lazy.spawn(Music),
             desc='Run Music Player'
             ),
         Key(
             [mod, "mod1"], "b",
             lazy.spawn(browser),
             desc='browser'
             ),
         Key(
             [mod, "mod1"], "d",
             lazy.spawn(altFileManager),
             desc='alt File Manager'
             ),
          Key(
             [mod, "mod1"], "q",
             lazy.spawn(torrent),
             desc='torrent'
             ),
          Key(
             [mod, "mod1"], "t",
             lazy.spawn(meetingApp1 ),
             desc='Meeting App 1'
             ),
          Key(
             [mod, "mod1"], "z",
             lazy.spawn(meetingApp2 ),
             desc='Meeting App 1'
             ),
         Key(
             [mod, "mod1"], "l",
             lazy.spawn(office),
             desc='Office'
             ),
         Key(
             [mod, "mod1"], "n",
             lazy.spawn(fileManager),
             desc='fileManager'
             ),
         Key(
             [mod, "mod1"], "e",
             lazy.spawn(editor ),
             desc='editor '
             ),
         Key(
             [mod, "mod1"], "p",
             lazy.spawn(sound),
             desc='sound'
             ),
         Key(
             [mod, "mod1"], "u",
             lazy.spawn(backup),
             desc='backup'
             ),
         Key(
             [], "Print",
             lazy.spawn(screenShotApp),
             desc='screen Shot App'
             ),
         Key(
             [mod, "mod1"], "f",
             lazy.spawn(myTerm+" -e sh ./.config/vifm/scripts/vifmrun"),
             desc='vifm'
             ),
         Key(
             [mod, "mod1"], "r",
             lazy.spawn(myTerm+" -e rtorrent"),
             desc='rtorrent'
             ),
         Key(
             [mod, "mod1"], "i",
             lazy.spawn(myTerm+" -e irssi"),
             desc='irssi'
             ),
         Key(
             [mod, "mod1"], "y",
             lazy.spawn(myTerm+" -e youtube-viewer"),
             desc='youtube-viewer'
             ),
         Key(
             [mod, "mod1"], "a",
             lazy.spawn(myTerm+" -e ncpamixer"),
             desc='ncpamixer'
             ),
]

##### GROUPS #####
group_names = [("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadwide'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group	

##### DEFAULT THEME SETTINGS FOR LAYOUTS #####
layout_theme = {"border_width": 3,
                "margin": 3,
                "border_focus": "007fdf",
                "border_normal": "1D2330"
                }

##### THE LAYOUTS #####
layouts = [
    #layout.Bsp(**layout_theme),
    #layout.Stack(stacks=2, **layout_theme),
    #layout.Columns(**layout_theme),
    #layout.RatioTile(**layout_theme),
    #layout.VerticalTile(**layout_theme),
    #layout.Matrix(**layout_theme),
    #layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Max(**layout_theme),
    layout.Tile(shift_windows=True, **layout_theme),
    layout.Stack(num_stacks=2),
    layout.TreeTab(
         font = "Roboto",
         fontsize = 10,
         sections = ["FIRST", "SECOND"],
         section_fontsize = 11,
         bg_color = "141414",
         active_bg = "90C435",
         active_fg = "000000",
         inactive_bg = "384323",
         inactive_fg = "a0a0a0",
         padding_y = 5,
         section_top = 10,
         panel_width = 320
         ),
    layout.Floating(**layout_theme)
]

##### COLORS #####
colors = [["#282a36", "#282a36"], #0 panel background
          ["#434758", "#434758"], #1 background for current screen tab
          ["#ffffff", "#ffffff"], #2 font color for group names
          ["#ff5555", "#ff5555"], #3 border line color for current tab
          ["#8d62a9", "#8d62a9"], #4 border line color for other tab and odd widgets
          ["#668bd7", "#668bd7"], #5 color for the even widgets
          ["#e1acff", "#e1acff"], #6 window name
          ["#ecbe7b", "#ecbe7b"], #7 CPU 
          ["#ff6c6b", "#ff6c6b"], #8 MEM
          ["#98be65", "#98be65"], #9 MEM
          ["#46d9ff", "#46d9ff"], #10 MEM
          ["#51afef", "#51afef"], #11 666699 88092E
          ["#696969", "#696969"]] #12 666699 88092E

GREY = "#222222"
DARK_GREY = "#111111"
BLUE = "#007fdf"
DARK_BLUE = "#002a4a"
ORANGE = "#dd6600"
DARK_ORANGE = "#371900"

##### PROMPT #####
prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font="Source Code Pro",
    fontsize = 12,
    padding = 2,
    background=colors[2]
)
extension_defaults = widget_defaults.copy()

##### WIDGETS #####

def init_widgets_list():
    prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
    widgets_list = [
              widget.Sep(
                        linewidth = 0,
                        padding = 6,
                        foreground = colors[2],
                        background = colors[1]
                        ),
               widget.TextBox(
                      text = "",
                      foreground = colors[2],
                      fontsize=19,
                      background = colors[1],
                      #filename = '~/.config/qtile/icons/150.png',
                      mouse_callbacks = {'Button1':lambda: qtile.cmd_spawn('rofi -show run')}
                      ),
               widget.GroupBox(font="FontAwesome",
                       fontsize = 12,
                        margin_y = 3,
                        margin_x = 0,
                        padding_y = 5,
                        padding_x = 3,
                        borderwidth = 3,
                        active = colors[2],
                        inactive = colors[0],
                        rounded = False,
                        highlight_color = colors[12],
                        highlight_method = "line",
                        this_screen_border=DARK_BLUE,
                        other_screen_border=DARK_ORANGE,
                        this_current_screen_border=BLUE,
                        other_current_screen_border=ORANGE,
                        foreground = colors[0],
                        background = colors[1]
                        ),
                 widget.Prompt(
                        prompt=prompt,
                        font="FontAwesome",
                        padding=10,
                        foreground = colors[3],
                        background = colors[1]
                        ),
              widget.TextBox(
                        text=" ",
                        foreground=colors[1],
                        background=colors[1],
                        fontsize = 57,
                        padding =-6
                        ),
              widget.TextBox(
                        text="◤",
                        foreground=colors[1],
                        background=colors[0],
                        fontsize = 57,
                        padding =-6
                        ),
               widget.WindowName(
                        fontsize = 12,
                        foreground = colors[2],
                        background = colors[0],
                        padding = 0
                        ),
             # widget.TextBox(
             #          text='',
             #          background = colors[8],
             #          foreground = colors[7],
             #          padding=0,
             #          fontsize=37
             #          ),
              widget.TextBox(
                        text="",
                        foreground=colors[1],
                        background=colors[0],
                        fontsize = 57,
                        padding =-5
                        ),
              widget.TextBox(
                        text="◤",
                        foreground=colors[0],
                        background=colors[1],
                        fontsize = 57,
                        padding =-6
                        ),
#              widget.TextBox(
#                        text="",
#                        foreground=colors[9],
#                        background=colors[1],
#                        padding = 0,
#                        fontsize=15
#                        ),
#             widget.GenPollText(update_interval=600, func=lambda: subprocess.check_output(os.path.expanduser("~/.bin/kernel")),
#                        foreground = colors[9], 
#                        background = colors[1]
#                        ),
                       widget.CPU(
                        format = ' {load_percent}%',
                        foreground = colors[8],
                        background = colors[1],
                        threshold = 90,
                        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('alacritty -e htop')},
                        padding = 5
                        ),
              widget.TextBox(
                        text="| ",
                        foreground=colors[1],
                        background=colors[1],
                        padding = 0
                        ),
               widget.TextBox(
                        text="",
                        foreground=colors[8],
                        background=colors[1],
                        padding = 0,
                        fontsize= 11
                        ),
               widget.Memory(
                        foreground = colors[8],
                        background = colors[1],
                        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('alacritty -e htop')},
                        padding = 5
                        ), 
              widget.TextBox(
                       text="🌡",
                       padding = 2,
                       foreground=colors[7],
                       background=colors[1],
                       fontsize=11
                       ),
              widget.ThermalSensor(
                       foreground=colors[7],
                       background=colors[1],
                       threshold = 90,
                       padding = 5
                       ),
              widget.TextBox(
                        text="|",
                        foreground=colors[1],
                        background=colors[1],
                        padding = 0
                        ),
         widget.TextBox(
                        text="",
                        padding = 2,
                        #foreground=colors[11],
                        background=colors[1],
                        fontsize=14
                        ),
               widget.CheckUpdates(
                        update_interval = 1600,
                        distro = "Arch_checkupdates",
                        foreground = colors[11],
                        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('alacritty -e paru')},
                        display_format = "{updates} Updates",
                        background = colors[1]
                        ),
              widget.TextBox(
                        text="|",
                        foreground=colors[1],
                        background=colors[1],
                        padding = 0
                        ),
              #widget.Net(
              #         interface = "wlp3s0",
              #         format = 'WIFI {down} ↓↑ {up}',
              #         foreground = colors[2],
              #         background = colors[8],
              #         padding = 5
              #         ),
               widget.Clock(
                        foreground=colors[11],
                        background=colors[1],
                        format="%A, %B %d [%H:%M] "
                        ),
              widget.TextBox(
                        text="◤",
                        foreground=colors[1],
                        background=colors[0],
                        fontsize = 57,
                        padding =-6
                        ),
              # widget.CurrentLayout(
              #          foreground = colors[2],
              #          background = colors[8],
              #          padding = 5
              #          ),              
             #  widget.TextBox(
             #           text='',
             #           background = colors[7],
             #           foreground = colors[8],
             #           padding=0,
             #           fontsize=37
             #           ),
#        arcobattery.BatteryIcon(
#                         padding=0,
#                         scale=0.9,
#                         y_poss=0,
#                         theme_path=home + "/.config/qtile/icons/battery_icons_horiz",
#                         update_interval = 5,
#                         foreground=colors[6],
#                         background=colors[0],
#                         ),
               widget.Systray(
                        foreground = colors[6],
                        background = colors[0],
                        icon_size=20,
                        padding = 4
                        ),
               widget.CurrentLayoutIcon(
                        custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                        foreground = colors[6],
                        background = colors[0],
                        padding = 2,
                        scale=0.7
                        ),
               widget.Sep(
                        linewidth = 0,
                        padding = 6,
                        foreground = colors[6],
                        background = colors[0]
                        ),
    #           widget.Image(
    #                  scale = True,
    #                  foreground = colors[6],
    #                  background = colors[0],
    #                  filename = '~/.config/qtile/icons/power-button.png',
    #                  mouse_callbacks = {'Button1': logout}
    #                   ),
    #                    widget.Sep(
    #                    linewidth = 0,
    #                    padding = 6,
    #                    foreground = colors[6],
    #                    background = colors[0]
    #                    ),
              ]
    return widgets_list

##### SCREENS ##### (TRIPLE MONITOR SETUP)

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    del widgets_screen1[7:8]               # Slicing removes unwanted widgets (systray) on Monitors 1,3
    return widgets_screen1

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2                 # Monitor 2 will display all widgets in widgets_list

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20))]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()

def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)

def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)

def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)

##### DRAG FLOATING WINDOWS #####
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

##### FLOATING WINDOWS #####
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    # default_float_rules include: utility, notification, toolbar, splash, dialog,
    # file_progress, confirm, download and error.
    *layout.Floating.default_float_rules,
    Match(wm_class='kdenlive'),  # kdenlive
    Match(title='Create Snapshot'),  # timeshift
])
auto_fullscreen = True
focus_on_window_activation = "smart"

##### STARTUP APPLICATIONS #####
@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/scripts/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
