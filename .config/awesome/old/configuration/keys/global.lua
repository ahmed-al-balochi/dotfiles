local awful = require('awful')
require('awful.autofocus')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local apps = require('configuration.apps')
-- Key bindings
local globalKeys =
  awful.util.table.join(
  -- Hotkeys
  awful.key({modkey}, 'F1', hotkeys_popup.show_help, {description = 'Show help', group = 'awesome'}),
  -- Tag browsing
  awful.key({modkey}, 'w', awful.tag.viewprev, {description = 'view previous', group = 'tag'}),
  awful.key({modkey}, 's', awful.tag.viewnext, {description = 'view next', group = 'tag'}),
  awful.key({altkey, 'Control'}, 'Up', awful.tag.viewprev, {description = 'view previous', group = 'tag'}),
  awful.key({altkey, 'Control'}, 'Down', awful.tag.viewnext, {description = 'view next', group = 'tag'}),
  awful.key({modkey}, 'Escape', awful.tag.history.restore, {description = 'go back', group = 'tag'}),
  -- Default client focus
  awful.key(
    {modkey, 'Shift'},
    'Return',
    function()
      awful.spawn('rofi -combi-modi window,drun -show combi -modi combi')
    end,
    {description = 'Show main menu', group = 'awesome'}
  ),
  awful.key(
    {modkey, altkey},
    's',
    function()
      _G.exit_screen_show()
    end,
    {description = 'Log Out Screen', group = 'awesome'}
  ),
  awful.key({modkey}, 'u', awful.client.urgent.jumpto, {description = 'jump to urgent client', group = 'client'}),
  awful.key(
    {modkey},
    'j',
    function()
      --awful.client.focus.history.previous()
      awful.client.focus.byidx(1)
      if _G.client.focus then
        _G.client.focus:raise()
      end
    end,
    {description = 'Switch to next window', group = 'client'}
  ),
  awful.key(
    {modkey},
    'k',
    function()
      --awful.client.focus.history.previous()
      awful.client.focus.byidx(-1)
      if _G.client.focus then
        _G.client.focus:raise()
      end
    end,
    {description = 'Switch to previous window', group = 'client'}
  ),
  -- Programms
  awful.key(
    {modkey,altkey},
    'l',
    function()
      awful.spawn(apps.default.lock)
    end,
    {description = 'Lock the screen', group = 'awesome'}
  ),
  awful.key(
    {},
    'Print',
    function()
      awful.util.spawn_with_shell(apps.default.screenshot)
    end,
    {description = 'Take a screenshot of your active monitor and copy it to clipboard', group = 'screenshots (clipboard)'}
  ),
  awful.key(
    {modkey, 'Shift'},
    's',
    function()
      awful.util.spawn_with_shell(apps.default.region_screenshot)
    end,
    {description = 'Mark an area and screenshot it to your clipboard', group = 'screenshots (clipboard)'}
  ),
  awful.key(
    {},
    'XF86Explorer',  -- a shortcut specific to my Keyboard
    function()
      awful.util.spawn("alacritty -e bpytop")  --awful.util.spawn(apps.default.terminal.."-e echo h")
    end,
    {description = 'Open the task manager', group = 'launcher'}
  ),
  awful.key(
    {},
    'XF86Calculator',  -- a shortcut specific to my Keyboard
    function()
      awful.util.spawn(apps.default.calc)
    end,
    {description = 'Open the calcualtor', group = 'launcher'}
  ),
  awful.key(
    {},
    'XF86Tools',  -- a shortcut specific to my Keyboard
    function()
      awful.util.spawn(apps.default.music)
    end,
    {description = 'Open the music player', group = 'launcher'}
  ),
  awful.key(
    {modkey,altkey},
    'm',
    function()
      awful.util.spawn(apps.default.music)
    end,
    {description = 'Open the music player', group = 'launcher'}
  ),
  awful.key(
    {modkey,altkey},
    'v',
    function()
      awful.util.spawn(apps.default.VM)
    end,
    {description = 'Open VM App', group = 'launcher'}
  ),
  awful.key(
    {modkey,altkey},
    'u',
    function()
      awful.util.spawn(apps.default.backup)
    end,
    {description = 'Open Backups App', group = 'launcher'}
  ),
  awful.key(
    {modkey,altkey},
    'e',
    function()
      awful.util.spawn(apps.default.editor)
    end,
    {description = 'Open a text/code editor', group = 'launcher'}
  ),
  awful.key(
    {modkey,altkey},
    'b',
    function()
      awful.util.spawn(apps.default.browser)
    end,
    {description = 'Open a browser', group = 'launcher'}
  ),
  awful.key(
    {modkey,altkey},
    'q',
    function()
      awful.util.spawn(apps.default.torrent)
    end,
    {description = 'Open a torrent', group = 'launcher'}
  ),
  awful.key(
    {modkey,altkey},
    'w',
    function()
      awful.util.spawn(apps.default.writer)
    end,
    {description = 'Open a writer', group = 'launcher'}
  ),
  awful.key(
    {modkey,altkey},
    't',
    function()
      awful.util.spawn(apps.default.social_1)
    end,
    {description = 'Open a social_1', group = 'launcher'}
  ),
  awful.key(
    {modkey,altkey},
    'z',
    function()
      awful.util.spawn(apps.default.social_2)
    end,
    {description = 'Open a social_2', group = 'launcher'}
  ),
  awful.key(
    {modkey,altkey},
    'p',
    function()
      awful.util.spawn(apps.default.audioControl)
    end,
    {description = 'Open a audioControl', group = 'launcher'}
  ),
  awful.key(
    {modkey,altkey},
    'f',
    function()
      awful.util.spawn(apps.default.vifm)
    end,
    {description = 'Open a vifm', group = 'launcher'}
  ),
  awful.key(
    {modkey,altkey},
    'd',
    function()
      awful.util.spawn(apps.default.dolphin)
    end,
    {description = 'Open a dolphin', group = 'launcher'}
  ),
  awful.key(
    {modkey,altkey},
    'u',
    function()
      awful.util.spawn(apps.default.timeshift)
    end,
    {description = 'Open a timeshift', group = 'launcher'}
  ),
  -- Standard program
  awful.key(
    {modkey},
    'x',
    function()
      awful.spawn(apps.default.terminal)
    end,
    {description = 'Open a terminal', group = 'launcher'}
  ),
  awful.key({modkey, 'Shift'}, 'r', _G.awesome.restart, {description = 'reload awesome', group = 'awesome'}),
  awful.key({modkey, 'Shift'}, 'q', _G.awesome.quit, {description = 'quit awesome', group = 'awesome'}),
  awful.key(
    {altkey, 'Shift'},
    'l',
    function()
      awful.tag.incmwfact(0.05)
    end,
    {description = 'Increase master width factor', group = 'layout'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'h',
    function()
      awful.tag.incmwfact(-0.05)
    end,
    {description = 'Decrease master width factor', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'j',
    function()
      awful.client.incwfact(0.05)
    end,
    {description = 'Decrease master height factor', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'k',
    function()
      awful.client.incwfact(-0.05)
    end,
    {description = 'Increase master height factor', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'h',
    function()
      awful.tag.incnmaster(1, nil, true)
    end,
    {description = 'Increase the number of master clients', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'l',
    function()
      awful.tag.incnmaster(-1, nil, true)
    end,
    {description = 'Decrease the number of master clients', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'h',
    function()
      awful.tag.incncol(1, nil, true)
    end,
    {description = 'increase the number of columns', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'l',
    function()
      awful.tag.incncol(-1, nil, true)
    end,
    {description = 'Decrease the number of columns', group = 'layout'}
  ),
  awful.key(
    {modkey},
    'space',
    function()
      awful.layout.inc(1)
    end,
    {description = 'Select next', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'space',
    function()
      awful.layout.inc(-1)
    end,
    {description = 'Select previous', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'n',
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        _G.client.focus = c
        c:raise()
      end
    end,
    {description = 'restore minimized', group = 'client'}
  ),
  -- Dropdown application
  awful.key(
    {modkey},
    'z',
    function()
      _G.toggle_quake()
    end,
    {description = 'dropdown application', group = 'launcher'}
  ),
  -- Widgets popups
  --[[awful.key(
    {altkey},
    'h',
    function()
      if beautiful.fs then
        beautiful.fs.show(7)
      end
    end,
    {description = 'Show filesystem', group = 'widgets'}
  ),
  awful.key(
    {altkey},
    'w',
    function()
      if beautiful.weather then
        beautiful.weather.show(7)
      end
    end,
    {description = 'Show weather', group = 'widgets'}
  ),--]]
  -- Brightness
  -- ALSA volume control
  awful.key(
    {},
    'XF86AudioRaiseVolume',
    function()
      awful.spawn('amixer -D pulse sset Master 5%+')
    end,
    {description = 'volume up', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioLowerVolume',
    function()
      awful.spawn('amixer -D pulse sset Master 5%-')
    end,
    {description = 'volume down', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioMute',
    function()
      awful.spawn('amixer -D pulse set Master 1+ toggle')
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioNext',
    function()
      --
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86PowerDown',
    function()
      --
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86PowerOff',
    function()
      _G.exit_screen_show()
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioPlay',
    function()
      awful.spawn('playerctl play-pause')
    end,
    {description = 'play-pause', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioNext',
    function()
      awful.spawn('playerctl next')
    end,
    {description = 'play-next', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioPrev',
    function()
      awful.spawn('playerctl previous')
    end,
    {description = 'play-prev', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioStop',
    function()
      awful.spawn('playerctl stop')
    end,
    {description = 'stop play', group = 'hotkeys'}
  ),
  -- Screen management
  awful.key(
    {modkey},
    '.',
    awful.client.movetoscreen,
    {description = 'move window to next screen', group = 'screen'}
  ),
  awful.key(
    { modkey },
    ",",
    function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
  -- Open default program for tag
  awful.key(
    {modkey},
    't',
    function()
      awful.spawn(
          awful.screen.focused().selected_tag.defaultApp,
          {
            tag = _G.mouse.screen.selected_tag,
            placement = awful.placement.bottom_right
          }
        )
    end,
    {description = 'Open default program for tag/workspace', group = 'tag'}
  ),
  -- Custom hotkeys
  -- vfio integration
  awful.key(
    {'Control',altkey},
    'space',
    function()
      awful.util.spawn_with_shell('vm-attach attach')
    end
  ),
  -- Lutris hotkey
  awful.key(
    {modkey},
    'g',
    function()
      awful.util.spawn_with_shell('lutris')
    end
  ),
  -- System Monitor hotkey
  awful.key(
    {modkey},
    'm',
    function()
      awful.util.spawn_with_shell('mate-system-monitor')
    end
  ),
  -- Kill VLC
  awful.key(
    {modkey},
    'v',
    function()
      awful.util.spawn_with_shell('killall -9 vlc')
    end
  ),
  -- File Manager
  awful.key(
    {modkey,altkey},
    'n',
    function()
      awful.util.spawn(apps.default.files)
    end,
    {description = 'filebrowser', group = 'hotkeys'}
  ),
  -- Emoji Picker
  awful.key(
    {modkey},
    'a',
    function()
      awful.util.spawn_with_shell('ibus emoji')
    end,
    {description = 'Open the ibus emoji picker to copy an emoji to your clipboard', group = 'hotkeys'}
  )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
  local descr_view, descr_toggle, descr_move, descr_toggle_focus
  if i == 1 or i == 9 then
    descr_view = {description = 'view tag #', group = 'tag'}
    descr_toggle = {description = 'toggle tag #', group = 'tag'}
    descr_move = {description = 'move focused client to tag #', group = 'tag'}
    descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'tag'}
  end
  globalKeys =
    awful.util.table.join(
    globalKeys,
    -- View tag only.
    awful.key(
      {modkey},
      '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      descr_view
    ),
    -- Toggle tag display.
    awful.key(
      {modkey, 'Control'},
      '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      descr_toggle
    ),
    -- Move client to tag.
    awful.key(
      {modkey, 'Shift'},
      '#' .. i + 9,
      function()
        if _G.client.focus then
          local tag = _G.client.focus.screen.tags[i]
          if tag then
            _G.client.focus:move_to_tag(tag)
          end
        end
      end,
      descr_move
    ),
    -- Toggle tag on focused client.
    awful.key(
      {modkey, 'Control', 'Shift'},
      '#' .. i + 9,
      function()
        if _G.client.focus then
          local tag = _G.client.focus.screen.tags[i]
          if tag then
            _G.client.focus:toggle_tag(tag)
          end
        end
      end,
      descr_toggle_focus
    )
  )
end

return globalKeys
