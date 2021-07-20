local awful = require('awful')
local apps = require('configuration.apps')
local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local TaskList = require('widget.task-list')
local TagList = require('widget.tag-list')
local gears = require('gears')
local clickable_container = require('widget.material.clickable-container')
local mat_icon_button = require('widget.material.icon-button')
local mat_icon = require('widget.material.icon')
local dpi = require('beautiful').xresources.apply_dpi
local icons = require('theme.icons')
--local cpu = require('widget.ram.ram-meter')

-- Titus - Horizontal Tray
local systray = wibox.widget.systray()
  systray:set_horizontal(true)
  systray:set_base_size(20)
  systray.forced_height = 20

  -- Clock / Calendar 24h format
local textclock = wibox.widget.textclock('<span font="Mononoki 12">%d/%m/%Y %H:%M %p</span>')
-- Clock / Calendar 12AM/PM fornat
--local textclock = wibox.widget.textclock('<span font="Roboto Mono 12">%I:%M %p  %d/%m/%Y</span>')
-- textclock.forced_height = 36

-- Add a calendar (credits to kylekewley for the original code)
local month_calendar = awful.widget.calendar_popup.month({
  screen = s,
  start_sunday = false,
})
month_calendar:attach(textclock)

local clock_widget = wibox.container.margin(textclock, dpi(13), dpi(13), dpi(9), dpi(8))

local rofi_button = mat_icon_button(mat_icon(icons.menu, dpi(24)))
rofi_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
      awful.spawn('rofi -combi-modi window,drun -show combi -modi combi')
      end
    )
  )
)

local add_button = mat_icon_button(mat_icon(icons.plus, dpi(24)))
add_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        awful.spawn(
          awful.screen.focused().selected_tag.defaultApp,
          {
            tag = _G.mouse.screen.selected_tag,
            placement = awful.placement.bottom_right
          }
        )
      end
    )
  )
)

-- Create an imagebox widget which will contains an icon indicating which layout we're using.
-- We need one layoutbox per screen.
local LayoutBox = function(s)
  local layoutBox = clickable_container(awful.widget.layoutbox(s))
  layoutBox:buttons(
    awful.util.table.join(
      awful.button(
        {},
        1,
        function()
          awful.layout.inc(1)
        end
      ),
      awful.button(
        {},
        3,
        function()
          awful.layout.inc(-1)
        end
      ),
      awful.button(
        {},
        4,
        function()
          awful.layout.inc(1)
        end
      ),
      awful.button(
        {},
        5,
        function()
          awful.layout.inc(-1)
        end
      )
    )
  )
  return layoutBox
end

local TopPanel = function(s)
  
    local panel =
    awful.wibox(
    {
      ontop = true,
      screen = s,
      height = dpi(40),
      width = s.geometry.width,
      position = "bottom",
      --x = s.geometry.x,
      --y = s.geometry.y,
      stretch = false,
      bg = beautiful.background.hue_800,
      fg = beautiful.fg_normal,
      struts = {
        --top = dpi(35)
      }
    }
    )

    panel:struts(
      {
        --top = dpi(35)
      }
    )

    panel:setup {
      layout = wibox.layout.align.horizontal,
      {
        layout = wibox.layout.fixed.horizontal,
        -- Create a taglist widget
        rofi_button,
        TagList(s),
        TaskList(s),
        add_button
      },
      nil,
      {
        layout = wibox.layout.fixed.horizontal,
        wibox.container.margin(systray, dpi(3), dpi(3), dpi(6), dpi(3)),
        -- Clock
        clock_widget,
        -- Layout box
        LayoutBox(s),
        --CPU
        --cpu,
      }
    }

  return panel
end

return TopPanel
